Received: from moutng.kundenserver.de ([212.227.126.177] helo=moutng3.kundenserver.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Wv6f-0005jI-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Jul 2002 09:33:21 +0100
Received: from [212.227.126.155] (helo=mrelayng1.kundenserver.de)
	by moutng3.kundenserver.de with esmtp (Exim 3.35 #2)
	id 17Wv6c-0002o7-00
	for linux-mtd@lists.infradead.org; Tue, 23 Jul 2002 10:33:18 +0200
Received: from [80.134.12.7] (helo=[192.168.1.27])
	by mrelayng1.kundenserver.de with asmtp (Exim 3.35 #2)
	id 17Wv6c-0004LA-00
	for linux-mtd@lists.infradead.org; Tue, 23 Jul 2002 10:33:18 +0200
Subject: Formatting DoC at every boot-process
From: Jens Nixdorf <jens.nixdorf@embesso.com>
To: MTD Mailingliste <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 23 Jul 2002 10:36:02 +0200
Message-Id: <1027413363.1184.12.camel@pc11>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

now, with your help, my DoC is acknowledged by the system. But the next
problem is underway ;)
Every time the system is booting, it try to format the DoC. It has two
bad blocks, and therefore i think it starts over and over again. How can
i get rid of it? nftl_format from the mtd-utils still doesnt work, it
brings  still the message:

ioctl(MEMGETINFO): Inappropriate ioctl for device

Here is a part of my dmesg-output after a fresh boot:

NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip 2000
NFTL_setup
Formatting block 1964
Error erasing at 0x1eb0000
Error while formatting block 1964
Formatting block 6028
Error erasing at 0x5e30000
Error while formatting block 6028
Cannot calculate an NFTL geometry to match size of 0x853c0.
Using C:1003 H:16 S:34 (== 0x85360 sects)
 nftla:<6>NFTL_request
NFTL read request of 0x2 sectors @ 0 (req->nr_sectors == 8)
NFTL read request completed OK
NFTL_request
NFTL read request of 0x2 sectors @ 2 (req->nr_sectors == 6)
NFTL read request completed OK
NFTL_request
NFTL read request of 0x2 sectors @ 4 (req->nr_sectors == 4)
NFTL read request completed OK
NFTL_request
NFTL read request of 0x2 sectors @ 6 (req->nr_sectors == 2)
NFTL read request completed OK
 nftla1

Thanks in Advance, Jens
