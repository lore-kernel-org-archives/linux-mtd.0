Received: from web61208.mail.yahoo.com ([216.155.196.132])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bty8J-0002xU-Hr
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2004 20:35:25 -0400
Message-ID: <20040809003522.55729.qmail@web61208.mail.yahoo.com>
Date: Sun, 8 Aug 2004 17:35:22 -0700 (PDT)
From: Gopi Palaniappan <gpalani1@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: MTD partition offset info via /proc/mtd & ioctl(MEMGETINFO)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Sorry to mail this again.. I corrected the diff output
in my previous mail

Why doesn't "struct mtd_info" expose partition offset
info so it can be displayed via /proc/mtd?
 
Mak had asked this qn earlier 
http://lists.infradead.org/pipermail/linux-mtd/2004-July/010062.html
 
perhaps his message was not clear... I think he was
asking why /proc/mtd does not display info on
partition offset for each mtd partition.
 
I made a small fix to struct mtd_info, mtdcore.c,
mtdpart.c that adds a new element "offset" to struct
mtd_info...exposing partion offset info from "struct
mtd_part" in mtdpart.c
 
I feel a better solution would be to move the "offset"
element in struct mtd_part into 
struct mtd_info and change all occurances of
"mtd_part->offset" to 
"mtdpart->mtd->offset"
 
Here's the patch I made... 
Please let me know if you have any
comments/suggestions on the patch...or my
suggestion above to move the "offset" element from
mtd_part to mtd_info...
 
===========================================================
 
diff -rc linux2.4.old/drivers/mtd/mtdcore.c
linux2.4/drivers/mtd/mtdcore.c
*** linux2.4.old/drivers/mtd/mtdcore.c  2004-08-08
19:05:05.000000000 -0500
--- linux2.4/drivers/mtd/mtdcore.c      2004-08-08
19:03:17.000000000 -0500
***************
*** 337,344 ****
  
        if (!this)
                return 0;
! 
!       return sprintf(buf, "mtd%d: %8.8x %8.8x
\"%s\"\n", i, this->size,
                       this->erasesize, this->name);
  }
  
--- 337,343 ----
  
        if (!this)
                return 0;
!       return sprintf(buf, "mtd%d: %8.8x %8.8x %8.8x
\"%s\"\n", i, this->offset, this->size,
                       this->erasesize, this->name);
  }
  
***************
*** 355,361 ****
  
        down(&mtd_table_mutex);
  
!       len = sprintf(page, "dev:    size   erasesize 
name\n");
          for (i=0; i< MAX_MTD_DEVICES; i++) {
  
                  l = mtd_proc_info(page + len, i);
--- 354,360 ----
  
        down(&mtd_table_mutex);
  
!       len = sprintf(page, "dev:  offset    size  
erasesize  name\n");
          for (i=0; i< MAX_MTD_DEVICES; i++) {
  
                  l = mtd_proc_info(page + len, i);
diff -rc linux2.4.old/drivers/mtd/mtdpart.c
linux2.4/drivers/mtd/mtdpart.c
*** linux2.4.old/drivers/mtd/mtdpart.c  2004-08-08
19:04:43.000000000 -0500
--- linux2.4/drivers/mtd/mtdpart.c      2004-08-08
19:05:46.000000000 -0500
***************
*** 320,325 ****
--- 320,326 ----
                slave->mtd.eccsize = master->eccsize;
  
                slave->mtd.name = parts[i].name;
+               slave->mtd.offset = parts[i].offset;
                slave->mtd.bank_size =
master->bank_size;
                slave->mtd.module = master->module;
  
diff -rc linux2.4.old/include/linux/mtd.h
linux2.4/include/linux/mtd.h
*** linux2.4.old/include/linux/mtd.h    2004-08-08
19:01:02.000000000 -0500
--- linux2.4/include/linux/mtd.h        2004-08-08
19:07:08.000000000 -0500
***************
*** 69,74 ****
--- 69,75 ----
  struct mtd_info_user {
        u_char type;
        u_int32_t flags;
+       u_int32_t offset;        // Offset to MTD
partition
        u_int32_t size;  // Total size of the MTD
        u_int32_t erasesize;
        u_int32_t oobblock;  // Size of OOB blocks
(e.g. 512)
***************
*** 137,142 ****
--- 138,144 ----
  struct mtd_info {
        u_char type;
        u_int32_t flags;
+       u_int32_t offset;        // Offset to MTD
partition
        u_int32_t size;  // Total size of the MTD
  
        /* "Major" erase size for the device. Nave
users may take this
============================================================
 
 
Thanks,
Gopi
 


---------------------------------
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
