Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lFyr-0007EL-00
	for mtd-list@infradead.org; Mon, 16 Oct 2000 20:31:29 +0100
Received: from cr934547-a.flfrd1.on.wave.home.com
	([24.112.247.163] helo=mokona.furryterror.org ident=mail)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lFyq-0007EF-00
	for mtd@infradead.org; Mon, 16 Oct 2000 20:31:28 +0100
From: jitvrlcw@umail.furryterror.org (Amy Fong)
Subject: typo in sbc_mediagx.c
Date: 16 Oct 2000 15:30:18 -0400
Message-ID: <8sfl0a$bh0$1@mokona.furryterror.org>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

afong@ifurita:~/mtd/2.2.18-test/mtd/kernel$ diff -uNr sbc_mediagx.c.orig
sbc_mediagx.c      
--- sbc_mediagx.c.orig  Mon Oct 16 14:57:44 2000
+++ sbc_mediagx.c       Mon Oct 16 14:52:52 2000
@@ -67,7 +67,7 @@
     { name: "SBC-MediaGX flash boot partition", 
       offset: 0, 
       size: 640*1024 },
-    { mame: "SBC-MediaGX flash partition 1", 
+    { name: "SBC-MediaGX flash partition 1", 
       offset: 640*1024, 
       size: 2*1024*1024-640*1024 },
     { name: "SBC-MediaGX flash partition 2", 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
