Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47] helo=penguin.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tswv-0001FQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 17:54:14 +0100
Received: from switchboard.ericsson.se (kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
	by penguin.wise.edt.ericsson.se (8.12.1/8.12.1/WIREfire-1.4) with ESMTP id g8OGsDOW017337
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 18:54:13 +0200 (MEST)
Subject: [PATCH] mkfs.jffs2 format option
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: Mtd <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary="=-98A/LCX+/0AX9rgmh92h"
Date: 24 Sep 2002 18:54:13 +0200
Message-Id: <1032886453.1600.13.camel@spawn>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--=-98A/LCX+/0AX9rgmh92h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This adds an option to eraseall that formats the block for jffs2.
This avoids the double erase that happens if you directly mount the
erased partition without first copying a jffs2 image to it.
 
-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se


--=-98A/LCX+/0AX9rgmh92h
Content-Disposition: attachment; filename=erasall.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=erasall.patch; charset=ANSI_X3.4-1968

--- mtd/util/eraseall.c	Wed Apr 25 09:11:19 2001
+++ ppc-20020923/util/eraseall.c	Tue Sep 24 18:47:16 2002
@@ -32,8 +32,10 @@
 #include <linux/mtd/mtd.h>
=20
 #define PROGRAM "eraseall"
-#define VERSION "0.1.0"
+#define VERSION "0.2.0"
=20
+static char cleanmarker[]=3D{0x19,0x85,0x20,0x03,0x00,0x00,0x00,0x0c,0xf0,=
0x60,0xdc,0x98};
+static int jffs2_format;
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet; /* true -- don't output progress */
@@ -68,7 +70,7 @@
 	erase.start +=3D meminfo.erasesize) {
       =20
        if( !quiet ) {
-	   printf( "\rErasing %ld Kibyte @ %lx -- %2ld %% complete.",=20
+	   printf( "\rErasing %d Kibyte @ %x -- %2d %% complete.",=20
 		   meminfo.erasesize/1024, erase.start,
 		   erase.start*100/meminfo.size );
        }
@@ -80,9 +82,15 @@
 			mtd_device, strerror( errno) );
 	       //exit( 1 );
        }
+       if(jffs2_format){
+	       if(erase.start !=3D lseek(fd,erase.start,SEEK_SET))
+		       fprintf( stderr, "Could not seek to pos %x on %s",erase.start,mtd=
_device);
+	       write(fd,cleanmarker,sizeof(cleanmarker));
+       }
+
    }
    if( !quiet ) {
-       printf( "\rErased %ld Kibyte @ %lx -- 100%% complete.       \n",
+       printf( "\rErased %d Kibyte @ %lx -- 100%% complete.       \n",
 	       meminfo.size/1024, 0L );
    }
   =20
@@ -98,10 +106,11 @@
=20
     for(;;) {
         int option_index =3D 0;
-        static const char* short_options=3D"q";
+        static const char* short_options=3D"qf";
         static const struct option long_options[] =3D {
             {"help", no_argument, 0, 0},
             {"version", no_argument, 0, 0},
+	    {"format", no_argument, 0, 'f'},
 	    {"quiet", no_argument, 0, 'q'},
 	    {"silent", no_argument, 0, 'q'},
=20
@@ -126,8 +135,11 @@
             }
             break;
 	case 'q' :
-	    quiet=3D1;
+	   quiet=3D1;
 	    break;
+	case 'f' :
+	   jffs2_format=3D1;
+	   break;
         case '?' :
             error=3D1;
             break;
@@ -151,6 +163,7 @@
     printf( "Usage: %s [OPTION] MTD_DEVICE\n"
             "Erases all of the specified MTD device.\n"
             "\n"
+            "  -f, --format   write cleanmarker for jffs2\n"
             "  -q, --quiet    don't display progress messages\n"
 	    "      --silent   same as --quiet\n"
             "      --help     display this help and exit\n"

--=-98A/LCX+/0AX9rgmh92h--
