Received: from sproxy03.hi-ho.ne.jp ([202.224.159.198])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6ulz-0007sa-Rq
	for linux-mtd@lists.infradead.org; Fri, 26 Mar 2004 17:05:36 +0000
Received: from k7.kit.hi-ho.ne.jp (eaoskd-p9.hi-ho.ne.jp [202.224.170.137])
 by sproxy03.hi-ho.ne.jp (hi-ho Mail Server)
 with SMTP id <0HV700L1V0T3RY@sproxy03.hi-ho.ne.jp> for
 linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 02:05:28 +0900 (JST)
Date: Sat, 27 Mar 2004 02:05:29 +0900
From: Hideki IWAMOTO <h-iwamoto@kit.hi-ho.ne.jp>
To: linux-mtd@lists.infradead.org
Message-id: <200403261705.AA00890@k7.kit.hi-ho.ne.jp>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [PATCH] fix integer overflow in util/fcp.c,  util/eraseall.c,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

eraseall and fcp print wrong progress message for large partition (>=41944KB).


Index: eraseall.c
===================================================================
RCS file: /home/cvs/mtd/util/eraseall.c,v
retrieving revision 1.12
diff -u -r1.12 eraseall.c
--- eraseall.c	2 May 2003 19:27:32 -0000	1.12
+++ eraseall.c	26 Mar 2004 16:50:44 -0000
@@ -93,7 +93,7 @@
 			printf
 			    ("\rErasing %d Kibyte @ %x -- %2d %% complete.",
 			     meminfo.erasesize / 1024, erase.start,
-			     erase.start * 100 / meminfo.size);
+			     erase.start / (meminfo.size / 100));
 		}
 		fflush(stdout);
 
Index: fcp.c
===================================================================
RCS file: /home/cvs/mtd/util/fcp.c,v
retrieving revision 1.2
diff -u -r1.2 fcp.c
--- fcp.c	3 Apr 2003 11:43:37 -0000	1.2
+++ fcp.c	26 Mar 2004 16:50:45 -0000
@@ -59,7 +59,7 @@
 #endif
 
 #define KB(x) ((x) / 1024)
-#define PERCENTAGE(x,total) (((x) * 100) / (total))
+#define PERCENTAGE(x,total) ((x) / ((total) / 100))
 
 /* size of read/write buffer */
 #define BUFSIZE (10 * 1024)

----
Hideki IWAMOTO  h-iwamoto@kit.hi-ho.ne.jp
