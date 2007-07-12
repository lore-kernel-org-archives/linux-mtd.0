Received: from wx-out-0506.google.com ([66.249.82.232])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8yV5-0002Ei-Tw
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 09:14:34 -0400
Received: by wx-out-0506.google.com with SMTP id s7so140378wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jul 2007 06:14:30 -0700 (PDT)
Message-ID: <cc5198fe0707120608u303a9959pc33c1c0b7bba956d@mail.gmail.com>
Date: Thu, 12 Jul 2007 16:08:10 +0300
From: "Alex Landau" <landau.alex@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: flash_erase.c: Skip bad blocks a-la flash_eraseall
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

flash_erase used to choke on the first bad block. This patch copies
the logic used to skip bad blocks in flash_eraseall to flash_erase.

Signed-off-by: Alex Landau <landau.alex@gmail.com>
---

P.S. I tried to make sure gmail does not word wrap the patch,
but I'm still not sure. Please be lenient.

diff --git a/flash_erase.c b/flash_erase.c
index fdf9918..a153cbf 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -3,6 +3,7 @@
  */

 #include <unistd.h>
+#include <errno.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <fcntl.h>
@@ -14,8 +15,17 @@

 int region_erase(int Fd, int start, int count, int unlock, int regcount)
 {
-    int i, j;
+    int i, j, isNAND;
     region_info_t * reginfo;
+    mtd_info_t meminfo;
+    int bbtest = 1;
+
+    if (ioctl(Fd,MEMGETINFO,&meminfo) < 0) {
+        perror("Unable to get MTD device infos");
+        close(Fd);
+        return 8;
+    }
+    isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;

     reginfo = calloc(regcount, sizeof(region_info_t));

@@ -52,30 +62,55 @@ int region_erase(int Fd, int start, int count, int
unlock, int regcount)

     for(j = 0; (j < count)&&(i < regcount); j++)
     {
+        int skip = 0;
         erase_info_t erase;
         region_info_t * r = &(reginfo[i]);

         erase.start = start;
         erase.length = r->erasesize;

-        if(unlock != 0)
-        { //Unlock the sector first.
-            if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
+        if (bbtest) {
+            loff_t offset = erase.start;
+            int ret = ioctl(Fd, MEMGETBADBLOCK, &offset);
+            if (ret > 0) {
+                printf ("\nSkipping bad block at 0x%08x\n", erase.start);
+                skip = 1;
+            } else if (ret < 0) {
+                if (errno == EOPNOTSUPP) {
+                    bbtest = 0;
+                    if (isNAND) {
+                        perror("\nBad block check not available");
+                        close(Fd);
+                        return 8;
+                    }
+                } else {
+                    perror("\nMTD get bad block failed");
+                    close(Fd);
+                    return 8;
+                }
+            }
+        }
+
+        if (!skip) {
+            if(unlock != 0)
+            { //Unlock the sector first.
+                if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
+                {
+                    perror("\nMTD Unlock failure");
+                    close(Fd);
+                    return 8;
+                }
+            }
+            printf("\rPerforming Flash Erase of length %u at offset 0x%x",
+                    erase.length, erase.start);
+            fflush(stdout);
+            if(ioctl(Fd, MEMERASE, &erase) != 0)
             {
-                perror("\nMTD Unlock failure");
+                perror("\nMTD Erase failure");
                 close(Fd);
                 return 8;
             }
         }
-        printf("\rPerforming Flash Erase of length %u at offset 0x%x",
-                erase.length, erase.start);
-        fflush(stdout);
-        if(ioctl(Fd, MEMERASE, &erase) != 0)
-        {
-            perror("\nMTD Erase failure");
-            close(Fd);
-            return 8;
-        }


         start += erase.length;
@@ -94,42 +129,67 @@ int region_erase(int Fd, int start, int count,
int unlock, int regcount)
 int non_region_erase(int Fd, int start, int count, int unlock)
 {
     mtd_info_t meminfo;
+    erase_info_t erase;
+    int isNAND;
+    int bbtest = 1;

-    if (ioctl(Fd,MEMGETINFO,&meminfo) == 0)
-    {
-        erase_info_t erase;
-
-        erase.start = start;
+    if (ioctl(Fd,MEMGETINFO,&meminfo) < 0) {
+        perror("Unable to get MTD device infos");
+        close(Fd);
+        return 8;
+    }
+    isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;

-        erase.length = meminfo.erasesize;
+    erase.start = start;
+    erase.length = meminfo.erasesize;

-        for (; count > 0; count--) {
-            printf("\rPerforming Flash Erase of length %u at offset 0x%x",
-                    erase.length, erase.start);
-            fflush(stdout);
+    for (; count > 0; count--, erase.start += meminfo.erasesize) {
+        printf("\rPerforming Flash Erase of length %u at offset 0x%x",
+                erase.length, erase.start);
+        fflush(stdout);

-            if(unlock != 0)
-            {
-                //Unlock the sector first.
-                printf("\rPerforming Flash unlock at offset 0x%x",erase.start);
-                if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
-                {
-                    perror("\nMTD Unlock failure");
+        if (bbtest) {
+            loff_t offset = erase.start;
+            int ret = ioctl(Fd, MEMGETBADBLOCK, &offset);
+            if (ret > 0) {
+                printf ("\nSkipping bad block at 0x%08x\n", erase.start);
+                continue;
+            } else if (ret < 0) {
+                if (errno == EOPNOTSUPP) {
+                    bbtest = 0;
+                    if (isNAND) {
+                        perror("\nBad block check not available");
+                        close(Fd);
+                        return 8;
+                    }
+                } else {
+                    perror("\nMTD get bad block failed");
                     close(Fd);
                     return 8;
                 }
             }
+        }

-            if (ioctl(Fd,MEMERASE,&erase) != 0)
+        if(unlock != 0)
+        {
+            //Unlock the sector first.
+            printf("\rPerforming Flash unlock at offset 0x%x",erase.start);
+            if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
             {
-                perror("\nMTD Erase failure");
+                perror("\nMTD Unlock failure");
                 close(Fd);
                 return 8;
             }
-            erase.start += meminfo.erasesize;
         }
-        printf(" done\n");
+
+        if (ioctl(Fd,MEMERASE,&erase) != 0)
+        {
+            perror("\nMTD Erase failure");
+            close(Fd);
+            return 8;
+        }
     }
+    printf(" done\n");
     return 0;
 }
