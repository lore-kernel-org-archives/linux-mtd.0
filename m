Received: from avanto.org ([193.233.71.179])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CuAgi-0000Kw-OC
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 09:32:01 -0500
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.org with esmtp (Exim 3.36 #1 (Debian)) id 1CuAgb-0000ba-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2005 17:31:53 +0300
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Thu, 27 Jan 2005 17:31:46 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200501271731.46233.skorinkod@mosk.ru>
Subject: docboot + 2.4.x
Reply-To: skorinkod@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I know that 2.4.x is not supported by mtd team now. But I have many drivers 
that is wrote on 2.4.x and don't have time to rewrite them. Changes in mtd 
snapshot depended on 2.6 only is not very big and I have now 2.4 system with 
full working mtd/inftla layers. I have only one big problem and I hope 
anybode help me.
docboot + 2.6 = all is working
docboot + 2.4 = and I have:
INFTL: inftlcore.c .......
...
DiskOnchip found at 0xe0000
...
INFTL ..
INFTL ..
Partition check:
 inftla: inftla1
Creating 2 MTD partitions ...
....
VFS: Cannot open root device "inftla1" or 00:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 00:00

docboot options are:
root=/dev/inftla1 rootfstype=ext3 console=tty1,38400 disk=/dev/inftla 
sectors=32 heads=16 cylinders=997

Maybe reason is that devfs is disable? Does booting from flash depend on 
devfs? What booting depends on?

Thanks for all answers
Dmitry
