Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sK32-00072i-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 08:49:16 +0100
Received: from fw.crossnet.co.jp ([210.254.215.158] helo=cirrus.crossnet.co.jp)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sK30-00072c-00
	for mtd@infradead.org; Wed, 25 Apr 2001 08:49:14 +0100
Received: from crossnet.co.jp (nimbus [192.168.77.96])
	by cirrus.crossnet.co.jp (8.9.3+3.2W/8.9.3) with ESMTP id QAA25652
	for <mtd@infradead.org>; Wed, 25 Apr 2001 16:49:27 +0900
Message-ID: <3AE68917.88DE6614@crossnet.co.jp>
Date: Wed, 25 Apr 2001 17:21:43 +0900
From: Masami Komiya <mkomiya@crossnet.co.jp>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Strange addr_unlock denitions
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I think cfi_probe_chip() in cfi_probe.c should be changed
as attached patch. What do you say about this ?

Masami Komiya

diff -c cfi_probe.c.org cfi_probe.c    
*** cfi_probe.c.org     Wed Apr 18 17:26:35 2001
--- cfi_probe.c Mon Apr 23 19:47:25 2001
***************
*** 198,209 ****
  
        switch (cfi->device_type) {
        case CFI_DEVICETYPE_X8:
-               cfi->addr_unlock1=0x555; 
-               cfi->addr_unlock2=0x2aa; 
-               break;
-       case CFI_DEVICETYPE_X16:
                cfi->addr_unlock1=0xaaa; 
                cfi->addr_unlock2=0x555; 
                break;
        case CFI_DEVICETYPE_X32:
                cfi->addr_unlock1=0x1555; 
--- 198,209 ----
  
        switch (cfi->device_type) {
        case CFI_DEVICETYPE_X8:
                cfi->addr_unlock1=0xaaa; 
                cfi->addr_unlock2=0x555; 
+               break;
+       case CFI_DEVICETYPE_X16:
+               cfi->addr_unlock1=0x555; 
+               cfi->addr_unlock2=0x2aa; 
                break;
        case CFI_DEVICETYPE_X32:
                cfi->addr_unlock1=0x1555;


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
