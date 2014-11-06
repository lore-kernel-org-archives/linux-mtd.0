Received: from mx0a-00158d01.pphosted.com ([208.84.65.189])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmOuh-0003EU-Tl
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 15:23:56 +0000
Received: from pps.filterd (m0043267.ppops.net [127.0.0.1])
 by mx0a-00158d01.pphosted.com (8.14.5/8.14.5) with SMTP id sA6FMI22032711
 for <linux-mtd@lists.infradead.org>; Thu, 6 Nov 2014 07:23:34 -0800
Received: from mx4.jdsu.com ([141.169.254.4])
 by mx0a-00158d01.pphosted.com with ESMTP id 1qfwgqtbgd-7
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2014 07:23:34 -0800
From: Fabien Proriol <Fabien.Proriol@jdsu.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: 0001-flashcp-Use-llu-to-print-filestat.st_size.patch
Date: Thu, 6 Nov 2014 15:13:08 +0000
Message-ID: <545B8FA4.5040801@jdsu.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9AB35ABB6669DB4F84C2FF6B5F17C204@jdsu.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

There is a display bug in flashcp.
In fact the problem is filestat.st_size can be 64 bits (in my case, Zynq=20
ARM platform).

With command:
flashcp -v IMG.img /dev/mtd0

Results lines are:

Erasing blocks: 40/40 (100%)
Writing data: 1670k/0k (2544%)

......
and at the end:

Erasing blocks: 40/40 (100%)
Writing data: 2544k/0k (100%))   <----- double parenthesis
Verifying data: 2544k/0k (100%))


I wrote a patch to solve this problem...
But I have another question about "written" and "size" variables...
The size_t type is potentially not the good type to store=20
filestat.st_size, off_t should be better...


Fabien Proriol

___________________________________________________________________________=
____

 From e65a012df12fa39ed0a6c5a71b5dc952b4c982fc Mon Sep 17 00:00:00 2001
From: Fabien Proriol <fabien.proriol@jdsu.com>
Date: Thu, 6 Nov 2014 15:54:20 +0100
Subject: [PATCH] flashcp: Use %llu to print filestat.st_size

filestat.st_size type is off_t.
For some paltforms, off_t can be 32 or 64bit but there is no C99 format=20
specifier for off_t.
The best way to print it with printf is to cast it to long long and=20
print with %llu

Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
---
  flashcp.c | 32 ++++++++++++++++----------------
  1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/flashcp.c b/flashcp.c
index d58c81b..04495bd 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -296,7 +296,7 @@ int main (int argc,char *argv[])
          * write the entire file to flash *
          **********************************/

-       if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data:=20
0k/%luk (0%%)",KB (filestat.st_size));
+       if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data:=20
0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
         size =3D filestat.st_size;
         i =3D BUFSIZE;
         written =3D 0;
@@ -304,10 +304,10 @@ int main (int argc,char *argv[])
         {
                 if (size < BUFSIZE) i =3D size;
                 if (flags & FLAG_VERBOSE)
-                       log_printf (LOG_NORMAL,"\rWriting data: %dk/%luk=20
(%lu%%)",
+                       log_printf (LOG_NORMAL,"\rWriting data:=20
%dk/%lluk (%llu%%)",
                                         KB (written + i),
-                                       KB (filestat.st_size),
-                                       PERCENTAGE (written +=20
i,filestat.st_size));
+                                       KB ((unsigned long=20
long)filestat.st_size),
+                                       PERCENTAGE (written +=20
i,(unsigned long long)filestat.st_size));

                 /* read from filename */
                 safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
@@ -325,8 +325,8 @@ int main (int argc,char *argv[])
                                 exit (EXIT_FAILURE);
                         }
                         log_printf (LOG_ERROR,
-                                       "Short write count returned=20
while writing to x%.8x-0x%.8x on %s: %d/%lu bytes written to flash\n",
-                                       written,written +=20
i,device,written + result,filestat.st_size);
+                                       "Short write count returned=20
while writing to x%.8x-0x%.8x on %s: %d/%llu bytes written to flash\n",
+                                       written,written +=20
i,device,written + result,(unsigned long long)filestat.st_size);
                         exit (EXIT_FAILURE);
                 }

@@ -335,10 +335,10 @@ int main (int argc,char *argv[])
         }
         if (flags & FLAG_VERBOSE)
                 log_printf (LOG_NORMAL,
-                               "\rWriting data: %luk/%luk (100%%)\n",
-                               KB (filestat.st_size),
-                               KB (filestat.st_size));
-       DEBUG("Wrote %d / %luk bytes\n",written,filestat.st_size);
+                               "\rWriting data: %lluk/%lluk (100%%)\n",
+                               KB ((unsigned long long)filestat.st_size),
+                               KB ((unsigned long long)filestat.st_size));
+       DEBUG("Wrote %d / %lluk bytes\n",written,(unsigned long=20
long)filestat.st_size);

         /**********************************
          * verify that flash =3D=3D file data *
@@ -349,16 +349,16 @@ int main (int argc,char *argv[])
         size =3D filestat.st_size;
         i =3D BUFSIZE;
         written =3D 0;
-       if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying=20
data: 0k/%luk (0%%)",KB (filestat.st_size));
+       if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying=20
data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
         while (size)
         {
                 if (size < BUFSIZE) i =3D size;
                 if (flags & FLAG_VERBOSE)
                         log_printf (LOG_NORMAL,
-                                       "\rVerifying data: %dk/%luk=20
(%lu%%)",
+                                       "\rVerifying data: %dk/%lluk=20
(%lu%%)",
                                         KB (written + i),
-                                       KB (filestat.st_size),
-                                       PERCENTAGE (written +=20
i,filestat.st_size));
+                                       KB ((unsigned long=20
long)filestat.st_size),
+                                       PERCENTAGE (written +=20
i,(unsigned long long)filestat.st_size));

                 /* read from filename */
                 safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
@@ -380,10 +380,10 @@ int main (int argc,char *argv[])
         }
         if (flags & FLAG_VERBOSE)
                 log_printf (LOG_NORMAL,
-                               "\rVerifying data: %luk/%luk (100%%)\n",
+                               "\rVerifying data: %lluk/%lluk (100%%)\n",
                                 KB (filestat.st_size),
                                 KB (filestat.st_size));
-       DEBUG("Verified %d / %luk bytes\n",written,filestat.st_size);
+       DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long=20
long)filestat.st_size);

         exit (EXIT_SUCCESS);
  }
--=20
2.0.4
