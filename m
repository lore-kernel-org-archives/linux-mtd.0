From: soma@procsys.com (Somashekara DM)
Date: Thu, 06 Feb 2003 20:13:22 +0530
Subject: Two questions on mtds on x86 platform
Message-ID: <3E42748A.D1E17F2A@procsys.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

We want to mount jffs2 on two mtd partitions as a part of our project.
Our platform is x86 - kernel version 2.4.13.

1. We are using mtdram ("Test driver using RAM") and blkmtd ("MTD
emulation using block device")
    to create two mtd's. Our aim is to mount jffs2 on two different
mtds.

    Using mtdram and blkmtd at the same time is not successful.

    we could mount first mtd device (which ever we loaded first)
successfully but failed to mount second mtd.
    mount is giving error as "mount: fs type jffs2 not supported by
kernel".

Here are the steps we have followed.

Step1 :
    mknod /dev/mtd0 c 90 0
    mknod /dev/mtd2 c 90 2
    and
    mknod /dev/mtdblock0 b 31 0
    mknod /dev/mtdblock2 b 31 2

Step2 :
   load mtd driver for RAM and hard disk using 'mtdram' and 'blkmtd'
respectively.
   insmod mtdram
   insmod blkmtd device=/dev/hda7

Step3 :
   write jffs2 image on theses device

Step4 :
   mount jffs2 file system on these mtd's as follows

   mount -t jffs2 /dev/mtdblock0 /mnt/jffs2drive0    //successfully
mounted
   mount -t jffs2 /dev/mtdblock2 /mnt/jffs2drive2    //this mount fails
   error - "mount: fs type jffs2 not supported by kernel"

What is going wrong here? Is it possible to use mtdram and blkmtd at the
same time?
Can you give us the procedure for doing this?


2. Can we create multiple partitions on the 'mtdram'?
       Can you give us the procedure for that?

--DMS
