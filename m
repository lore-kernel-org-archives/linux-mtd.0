Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bQB0-0000gP-00
	for mtd-list@infradead.org; Fri, 09 Mar 2001 16:55:38 +0000
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bQAv-0000gJ-00
	for mtd@infradead.org; Fri, 09 Mar 2001 16:55:33 +0000
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-60460U3500L350S0V35) with ESMTP id is
          for <mtd@infradead.org>; Fri, 9 Mar 2001 16:55:29 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Fri, 9 Mar 2001 16:55:29 +0000
Date: Fri, 9 Mar 2001 16:54:23 +0000
To: mtd@infradead.org
Subject: Small patch
Message-ID: <20010309165423.A2340@BigTits.flaga>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
From: kd@flaga.is (Kári Davíðsson)
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I propose the following small patch so that the utils can acept arguments
int hexadecimal form, e.g. 
	erase device 0x1f0000
instead of erase device 2031616.

K.D.



--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="atoi.diff"

diff -ubr mtd/util/erase.c mtd-20010308/util/erase.c
--- mtd/util/erase.c	Thu Sep 21 22:00:07 2000
+++ mtd-20010308/util/erase.c	Fri Mar  9 16:38:55 2001
@@ -35,12 +35,12 @@
       printf("Erase Unit Size 0x%lx, ", meminfo.erasesize);
 
       if (argc > 2)
-	  erase.start = atoi(argv[2]);
+	  erase.start = strtol(argv[2], NULL, 0);
       else
 	  erase.start = 0;
 
       if (argc > 3)
-	  count = atoi(argv[3]);
+	  count = strtol(argv[3], NULL, 0);
       else
 	  count = 1;
 
diff -ubr mtd/util/mkfs.ffs2.c mtd-20010308/util/mkfs.ffs2.c
--- mtd/util/mkfs.ffs2.c	Tue Aug 17 19:04:42 1999
+++ mtd-20010308/util/mkfs.ffs2.c	Fri Mar  9 16:43:05 2001
@@ -65,11 +65,11 @@
       switch (Opt)
       {
 	 case 'b':
-	 BlockSize = atoi(optarg);
+	 BlockSize = strtol(optarg, NULL, 0);
 	 break;
 	 
 	 case 's':
-	 Start = atoi(optarg);
+	 Start = strtol(optarg,NULL,0);
 	 break;
 
 	 case '?':
diff -ubr mtd/util/mkfs.jffs.c mtd-20010308/util/mkfs.jffs.c
--- mtd/util/mkfs.jffs.c	Wed Jan 17 23:00:03 2001
+++ mtd-20010308/util/mkfs.jffs.c	Fri Mar  9 16:44:20 2001
@@ -698,7 +698,7 @@
       }
       break;
     case 'e':
-      MAX_CHUNK_SIZE = (atoi(optarg) / 2);
+      MAX_CHUNK_SIZE = (strtol(optarg,NULL,0) / 2);
       break;
     case 'h':
     case '?':
diff -ubr mtd/util/mkfs.jffs2.c mtd-20010308/util/mkfs.jffs2.c
--- mtd/util/mkfs.jffs2.c	Mon Feb 26 23:00:06 2001
+++ mtd-20010308/util/mkfs.jffs2.c	Fri Mar  9 16:43:52 2001
@@ -430,7 +430,7 @@
 	while ( (opt = getopt_long(argc, argv, "p:d:r:s:e:o:h?", long_options, &c) ) >= 0) {
 		switch(opt) {
 		case 'p':
-			pad_fs_size = atoi(optarg);
+			pad_fs_size = strtol(optarg, NULL, 0);
 			break;
 
 		case 'r':
@@ -447,11 +447,11 @@
 			break;
 
 		case 's':
-			page_size = atoi(optarg);
+			page_size = strtol(optarg,NULL,0);
 			break;
 
 		case 'e':
-			erase_block_size = atoi(optarg);
+			erase_block_size = strtol(optarg,NULL,0);
 			break;
 
 		case 'o':

--h31gzZEtNLTqOjlF--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
