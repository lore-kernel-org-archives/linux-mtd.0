Received: from sproxy03.hi-ho.ne.jp ([202.224.159.198])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B77U9-0001eQ-6W
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 06:40:01 +0000
Received: from k7.kit.hi-ho.ne.jp (eaoskd-p9.hi-ho.ne.jp [202.224.170.137])
 by sproxy03.hi-ho.ne.jp (hi-ho Mail Server)
 with SMTP id <0HV800A8O2ILAA@sproxy03.hi-ho.ne.jp> for
 linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 15:39:58 +0900 (JST)
Date: Sat, 27 Mar 2004 15:39:59 +0900
From: Hideki IWAMOTO <h-iwamoto@kit.hi-ho.ne.jp>
In-reply-to: <200403261705.AA00890@k7.kit.hi-ho.ne.jp>
To: linux-mtd@lists.infradead.org
Message-id: <200403270639.AA00894@k7.kit.hi-ho.ne.jp>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
References: <200403261705.AA00890@k7.kit.hi-ho.ne.jp>
Subject: Re: [PATCH] fix integer overflow in util/fcp.c,  util/eraseall.c,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 27 Mar 2004 02:05:29 +0900, Hideki IWAMOTO wrote...
> eraseall and fcp print wrong progress message for large partition (>=41944KB).
> 

Sorry. Previous patch has problem in the handling small files.
This is corrected version.

? jffs2dump
Index: eraseall.c
===================================================================
RCS file: /home/cvs/mtd/util/eraseall.c,v
retrieving revision 1.12
diff -u -r1.12 eraseall.c
--- eraseall.c	2 May 2003 19:27:32 -0000	1.12
+++ eraseall.c	27 Mar 2004 06:28:40 -0000
@@ -93,7 +93,7 @@
 			printf
 			    ("\rErasing %d Kibyte @ %x -- %2d %% complete.",
 			     meminfo.erasesize / 1024, erase.start,
-			     erase.start * 100 / meminfo.size);
+			     (erase.start/meminfo.erasesize) * 100 / (meminfo.size/meminfo.erasesize));
 		}
 		fflush(stdout);
 
Index: fcp.c
===================================================================
RCS file: /home/cvs/mtd/util/fcp.c,v
retrieving revision 1.2
diff -u -r1.2 fcp.c
--- fcp.c	3 Apr 2003 11:43:37 -0000	1.2
+++ fcp.c	27 Mar 2004 06:28:40 -0000
@@ -59,7 +59,7 @@
 #endif
 
 #define KB(x) ((x) / 1024)
-#define PERCENTAGE(x,total) (((x) * 100) / (total))
+#define PERCENTAGE(x,total) ((x) <= 0xffffffff / 100 ? (x) * 100 / (total) : (x) / ((total) / 100))
 
 /* size of read/write buffer */
 #define BUFSIZE (10 * 1024)

----
Hideki IWAMOTO  h-iwamoto@kit.hi-ho.ne.jp
