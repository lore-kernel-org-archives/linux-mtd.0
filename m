From: vishal@laser5.co.jp (Vishal)
Date: Wed, 12 Mar 2003 18:02:26 +0900
Subject: bootloader question for NAND flash boot from JFFS2
Message-ID: <3E6EF7A2.3060607@laser5.co.jp>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi all,
  I have written a bootloader for booting from a jffs partition on a 
NAND flash device for one of the boards i am working with. Currently, i 
am able to locate the inode for the zImage on the filesystem .i.e. in 
the flash emulation region i construct. i then generate a list of all 
the inodes related to the inode number for the zImage enetry. This list 
then becomes a input for my decompress routine which copies the 
decompressed data to the location in memory where the final jump will be 
made, and the kerenel will start booting...
  i am stuck with something i havent been able to identify...all the 
steps seem to go perfectly, and after thee jump to the starting memory 
 location of the kernel, i get a message:

Uncompressing Linux............................... done, booting the kernel.


but the system doesnt boot....any idea what can have caused this 
behaviour?do u think my decmpress routines need to be looked at again.
Please do help.
Thanking y'all in anticipation.
regards,
vishal
