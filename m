Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IXCNM-0005za-9V
	for linux-mtd@lists.infradead.org; Mon, 17 Sep 2007 04:54:43 -0400
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 4826822472A
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Sep 2007 10:54:37 +0200 (CEST)
Received: from [192.168.2.103] (88-149-182-160.static.ngi.it [88.149.182.160])
	by smtp-auth.mnet-online.de (Postfix) with ESMTP id 1149A903B9
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Sep 2007 10:54:36 +0200 (CEST)
Message-ID: <46EE405C.7070701@babic.homelinux.org>
Date: Mon, 17 Sep 2007 10:52:44 +0200
From: stefano babic <stefano.babic@babic.homelinux.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Samsung K9F1G08 - bad block check
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have a system with a TI OMAP and the NAND Samsung K9F1G08. I have seen 
there is already an issue regarding this flash, but I think I have a 
different topic.

According to the Samsung datasheet, the initial invalid block(s) status 
is defined by the 1st byte in the spare area. However, in nand_bbt.c, 
for chips with a large page size (as this one,2KB), a 16-bit word is 
always checked:

if (!this->badblock_pattern) {
                         this->badblock_pattern = (mtd->writesize > 512) 
? &largepage_memorybased : &smallpage_memorybased;

And the len field in largepage_memorybased is set to 2.

This has the effect that blocks are declared "bad" even if they are not. 
  To load the bootloader, TI OMAP requires that the bootloader itself is 
stored using the OMAP-ECC schema in the first blocks. This uses bytes 
1-12 of OOB. The linux driver checks byte 1 and reports the block as 
bad, because this cannot be 0xFF.

It seems to me that the length to be checked is chip (or manufacturer..) 
specific and cannot be set as now with a static structure.

stefano

-- 
stefano <stefano.babic@babic.homelinux.org>
GPG Key: 0x55814DDE
Fingerprint 4E85 2A66 4CBA 497A 2A7B D3BF 5973 F216 5581 4DDE
