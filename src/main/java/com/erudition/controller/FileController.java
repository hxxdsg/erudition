package com.erudition.controller;

import com.erudition.bean.FilesEntity;
import com.erudition.dao.ResourcesDao;
import com.erudition.util.MultipartFileUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.monitor.FileEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.FileEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by sl on 16-5-3.
 */
@Controller
@RequestMapping("/file")
public class FileController {

    @Autowired
    @Qualifier("resourcesDao")
    ResourcesDao resourcesDao;



    @RequestMapping(value = "/upload" , method = RequestMethod.GET)
    public String  upload(){
        return "file/upload";
    }

    @RequestMapping(value = "/upload" , method = RequestMethod.POST)
    public String  upload(String fileName ,
                          MultipartFile file , HttpSession session){

//        String title = request.getParameter("title");
//            System.out.println("addResource : " + title);
//            System.out.println("cates : "+cate1+" "+cate2+" "+cate3);
//            System.out.println("video size : "+video.getSize());

            if(!file.isEmpty()){

                String filePath = session.getAttribute("uploadFilePath").toString();
//            String videoUrl = MultipartFileUtils.saveFile(video,filePath);
                String videoUrl = MultipartFileUtils.saveFile(file, "/usr/local/erudition/video");

            }

        return "file/upload";
    }


    @RequestMapping(value = "/download/{fid}" , method = RequestMethod.GET)
    public ResponseEntity download(@PathVariable("fid") int fid) throws IOException {
        FilesEntity file = resourcesDao.getById(fid);
        String dfileName = new String(file.getTitle().getBytes("gb2312"), "iso8859-1");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", dfileName);
        File fileReal = new File(file.getUrl());
        return new ResponseEntity(FileUtils.readFileToByteArray(fileReal), headers, HttpStatus.CREATED);
    }



}
