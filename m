Received: from 87.202.leased.lanck.net ([62.152.87.202] helo=mail.protei.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DLjsV-00074s-Mq
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 11:34:11 -0400
Received: from gw (localhost [127.0.0.1])
	by mail.protei.ru (Postfix) with SMTP id 8CA945004A4
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2005 19:34:05 +0400 (MSD)
Received: from lab111.protei (lab111 [192.168.101.2])
	by mail.protei.ru (Postfix) with ESMTP id 6C6D250051E
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2005 19:34:05 +0400 (MSD)
Received: from [192.168.100.182] (nickolay.protei [192.168.100.182])
	by lab111.protei (Postfix) with ESMTP id 411DD24093C5
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2005 19:34:04 +0400 (MSD)
Message-ID: <425D3BDF.9030505@protei.ru>
Date: Wed, 13 Apr 2005 19:33:51 +0400
From: Nickolay <nickolay@protei.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: K9F1G08U0M NAND support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hallo Guys!

I has IXDP425 board with K9F1G08U0M NAND flash as secondary flash(first 
flash - NOR for booting).
Kernel version: 2.4.20_mvl31

I get mtd from CVS and just replace originally 
linux-2.4.20_mvl31/drivers/mtd with mtd/drivers/mtd.
But when does make menuconfig, i can't select CONFIG_PPCHAMELEONEVB, 
because in drivers/mtd/nand/Config.in this code:

if [ "$CONFIG_PPCHAMELEONEVB" = "y" ]; then
    dep_tristate '  NAND Flash device on PPChameleonEVB board' 
CONFIG_MTD_NAND_PPCHAMELEONEVB $CONFIG_MTD_NAND
fi

But i build kernel for IXDP425, not for PPCHAMELEONEVB.
What i should does, for configure support for K9F1G08U0M NAND flash?
