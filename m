Received: from mx0a-00158d01.pphosted.com ([208.84.65.189])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmjsK-0008W4-Ui
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 13:46:55 +0000
Received: from pps.filterd (m0043267.ppops.net [127.0.0.1])
 by mx0a-00158d01.pphosted.com (8.14.5/8.14.5) with SMTP id sA7Dk0Wl001180
 for <linux-mtd@lists.infradead.org>; Fri, 7 Nov 2014 05:46:32 -0800
Received: from mx4.jdsu.com ([141.169.254.4])
 by mx0a-00158d01.pphosted.com with ESMTP id 1qgguva0j1-1
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2014 05:46:31 -0800
From: Fabien Proriol <Fabien.Proriol@jdsu.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] Fix flashcp display
Date: Fri, 7 Nov 2014 13:46:28 +0000
Message-ID: <545CCCD3.6020006@jdsu.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FD69C9F60AC6A8449C952AB26E986EE4@jdsu.com>
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

>From e65a012df12fa39ed0a6c5a71b5dc952b4c982fc Mon Sep 17 00:00:00 2001
From: Fabien Proriol <fabien.proriol@jdsu.com>
Date: Thu, 6 Nov 2014 15:54:20 +0100
Subject: [PATCH] flashcp: Use %llu to print filestat.st_size

filestat.st_size type is off_t.
For some paltforms, off_t can be 32 or 64bit but there is no C99 format spe=
cifier for off_t.
The best way to print it with printf is to cast it to long long and print w=
ith %llu

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
=20
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%luk (=
0%%)",KB (filestat.st_size));
+	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%lluk =
(0%%)",KB ((unsigned long long)filestat.st_size));
 	size =3D filestat.st_size;
 	i =3D BUFSIZE;
 	written =3D 0;
@@ -304,10 +304,10 @@ int main (int argc,char *argv[])
 	{
 		if (size < BUFSIZE) i =3D size;
 		if (flags & FLAG_VERBOSE)
-			log_printf (LOG_NORMAL,"\rWriting data: %dk/%luk (%lu%%)",
+			log_printf (LOG_NORMAL,"\rWriting data: %dk/%lluk (%llu%%)",
 					KB (written + i),
-					KB (filestat.st_size),
-					PERCENTAGE (written + i,filestat.st_size));
+					KB ((unsigned long long)filestat.st_size),
+					PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
=20
 		/* read from filename */
 		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
@@ -325,8 +325,8 @@ int main (int argc,char *argv[])
 				exit (EXIT_FAILURE);
 			}
 			log_printf (LOG_ERROR,
-					"Short write count returned while writing to x%.8x-0x%.8x on %s: %d/%=
lu bytes written to flash\n",
-					written,written + i,device,written + result,filestat.st_size);
+					"Short write count returned while writing to x%.8x-0x%.8x on %s: %d/%=
llu bytes written to flash\n",
+					written,written + i,device,written + result,(unsigned long long)files=
tat.st_size);
 			exit (EXIT_FAILURE);
 		}
=20
@@ -335,10 +335,10 @@ int main (int argc,char *argv[])
 	}
 	if (flags & FLAG_VERBOSE)
 		log_printf (LOG_NORMAL,
-				"\rWriting data: %luk/%luk (100%%)\n",
-				KB (filestat.st_size),
-				KB (filestat.st_size));
-	DEBUG("Wrote %d / %luk bytes\n",written,filestat.st_size);
+				"\rWriting data: %lluk/%lluk (100%%)\n",
+				KB ((unsigned long long)filestat.st_size),
+				KB ((unsigned long long)filestat.st_size));
+	DEBUG("Wrote %d / %lluk bytes\n",written,(unsigned long long)filestat.st_=
size);
=20
 	/**********************************
 	 * verify that flash =3D=3D file data *
@@ -349,16 +349,16 @@ int main (int argc,char *argv[])
 	size =3D filestat.st_size;
 	i =3D BUFSIZE;
 	written =3D 0;
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%luk=
 (0%%)",KB (filestat.st_size));
+	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%llu=
k (0%%)",KB ((unsigned long long)filestat.st_size));
 	while (size)
 	{
 		if (size < BUFSIZE) i =3D size;
 		if (flags & FLAG_VERBOSE)
 			log_printf (LOG_NORMAL,
-					"\rVerifying data: %dk/%luk (%lu%%)",
+					"\rVerifying data: %dk/%lluk (%lu%%)",
 					KB (written + i),
-					KB (filestat.st_size),
-					PERCENTAGE (written + i,filestat.st_size));
+					KB ((unsigned long long)filestat.st_size),
+					PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
=20
 		/* read from filename */
 		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
@@ -380,10 +380,10 @@ int main (int argc,char *argv[])
 	}
 	if (flags & FLAG_VERBOSE)
 		log_printf (LOG_NORMAL,
-				"\rVerifying data: %luk/%luk (100%%)\n",
+				"\rVerifying data: %lluk/%lluk (100%%)\n",
 				KB (filestat.st_size),
 				KB (filestat.st_size));
-	DEBUG("Verified %d / %luk bytes\n",written,filestat.st_size);
+	DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long long)filestat.=
st_size);
=20
 	exit (EXIT_SUCCESS);
 }
--=20
2.0.4
