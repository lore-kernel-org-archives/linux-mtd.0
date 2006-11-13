Received: from mtagate2.de.ibm.com ([195.212.29.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GjeUq-0001qC-Dh
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 16:17:24 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id kADGH6hL120636
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 16:17:06 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kADGKJTg3100792
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 17:20:19 +0100
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kADGH6uw021690
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 17:17:06 +0100
Subject: Re: number mtd partitions on 16 limits?
From: Timo Lindhorst <lindhors@vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1163418378.3925.36.camel@sauron>
References: <E1GjYhU-00007r-PL@www8.emo.freenet-rz.de>
	<455847FE.3080900@vnet.ibm.com>  <1163418378.3925.36.camel@sauron>
Content-Type: text/plain
Date: Mon, 13 Nov 2006 17:17:03 +0100
Message-Id: <1163434624.22960.12.camel@lindhors-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm sorry, I forgot to check my mail client first.
I have tested this one, so it should work.

Kind regards,
Timo

[PATCH] [MTD] increase MAX_MTD_DEVICES in mtd.h

Increas MAX_MTD_DEVICES from 16 to 64.

Signed-off-by: Timo Lindhost <lindhors@linux.vnet.ibm.com>
---
 include/linux/mtd/mtd.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- ubi-2.6.orig/include/linux/mtd/mtd.h
+++ ubi-2.6/include/linux/mtd/mtd.h
@@ -23,7 +23,7 @@
 
 #define MTD_CHAR_MAJOR 90
 #define MTD_BLOCK_MAJOR 31
-#define MAX_MTD_DEVICES 16
+#define MAX_MTD_DEVICES 64
 
 #define MTD_ERASE_PENDING      	0x01
 #define MTD_ERASING		0x02
