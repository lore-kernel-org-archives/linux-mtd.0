Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.49] helo=albatross.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GI2j-0008Oj-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 12:08:49 +0000
Subject: Re: mkfs.jffs2.c rework
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: andersen@codepoet.org
Cc: David Woodhouse <dwmw2@infradead.org>,
   Mtd
	 <linux-mtd@lists.infradead.org>
In-Reply-To: <20021125122110.GC18046@codepoet.org>
References: <20021125111843.GA17562@codepoet.org>
	<1319.1038224945@passion.cambridge.redhat.com>
	<20021125122110.GC18046@codepoet.org>
Content-Type: multipart/mixed; boundary="=-XW0WFkFo9FC4lWSslI6M"
Date: 25 Nov 2002 13:39:15 +0100
Message-Id: <1038227955.929.30.camel@spawn>
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

--=-XW0WFkFo9FC4lWSslI6M
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2002-11-25 at 13:21, Erik Andersen wrote:
> I've got these changes done.  Shall I check it in?  Adding
> support for cleanmarkers can be done soon (after I get a chance

Here is a patch I did for eraseall to add cleanmarker. Big endian system
only.


-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se


--=-XW0WFkFo9FC4lWSslI6M
Content-Disposition: attachment; filename=eraseall.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=eraseall.diff; charset=ANSI_X3.4-1968

--- /home/innkeon/src/mtd/mtd/util/eraseall.c	Wed Apr 25 09:11:19 2001
+++ eraseall.c	Mon Oct 14 14:50:43 2002
@@ -16,7 +16,7 @@
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, U=
SA =20
=20
-   $Id: eraseall.c,v 1.7 2001/04/25 07:11:19 ollie Exp $
+   $Id: eraseall.c,v 1.1 2002/10/14 12:50:43 innkeon Exp $
 */
 #include <unistd.h>
 #include <stdlib.h>
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

--=-XW0WFkFo9FC4lWSslI6M--
