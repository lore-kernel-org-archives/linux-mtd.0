Received: from smtpauth08.mail.atl.earthlink.net ([209.86.89.68])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FuuTs-0001JJ-52
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 13:02:43 -0400
Received: from [209.86.224.49] (helo=elwamui-sweet.atl.sa.earthlink.net)
	by smtpauth08.mail.atl.earthlink.net with asmtp (Exim 4.34)
	id 1FuuTm-0004Jr-1m
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 13:02:30 -0400
Message-ID: <26260868.1151341349996.JavaMail.root@elwamui-sweet.atl.sa.earthlink.net>
Date: Mon, 26 Jun 2006 10:02:29 -0700 (GMT-07:00)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Subject: Cannot erase nand flash
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>Date: Mon, 26 Jun 2006 10:52:43 +0200
>From: peter.hosten@rwth-aachen.de

> Unfortunately the mtd-util
>(flash_eraseall, mtd_debug) is not able to erase the NAND-Flash. I get the
>error  "./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error"
>(see below)

>I also dumped the NAND Flash ( see below); may it be possible that it does
>not work because of the OBB data ( OOB Data: 00 00 00 00 00 00 00 00 00 00
>00 00 00 00 00 00) ?

I have seen that error with some versions of mtd-utils when the partition contains a
bad block, and your dumped OOB would be interpreted as a bad block
(no 0xFF in byte 5). But, in fact, the flash may have been successfully erased, and Linux
works reasonably well with bad blocks, so you may be able to just ignore
the "error".

sf
