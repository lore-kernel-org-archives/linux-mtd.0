Received: from thoth.sbs.de ([192.35.17.2])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jynr-0002F0-Vt
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 11:12:28 +0100
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.11.7/8.11.7) with ESMTP id h75ACAn19137
	for <linux-mtd@lists.infradead.org>;
	Tue, 5 Aug 2003 12:12:10 +0200 (MEST)
Received: from blues.mchh.siemens.de (blues.mchh.siemens.de [139.21.204.206])
	by mail3.siemens.de (8.11.7/8.11.7) with ESMTP id h75AC9G12103
	for <linux-mtd@lists.infradead.org>;
	Tue, 5 Aug 2003 12:12:09 +0200 (MEST)
Received: from demchh2msx.icn.siemens.de (ss-aladin.mchh.siemens.de
	[139.21.149.125])
	by blues.mchh.siemens.de (8.9.3/8.9.1) with ESMTP id MAA14160
	for <linux-mtd@lists.infradead.org>;
	Tue, 5 Aug 2003 12:10:58 +0200 (MET DST)
From: Stefano Babic <stefano.babic@siemens.com>
To: linux-mtd@lists.infradead.org
Date: 05 Aug 2003 12:12:08 +0200
Message-Id: <1060078328.1717.233.camel@mhw42463>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Concurrency erase/write on the same AMD chip with not aligned words
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have seen a problem when I am writing not-aligned words on AMD chips
while on the same chip another process starts an erase procedure for
other sectors or a different MTD device. 

I have tested with the cfi_cmdset_0002.c v.1.75 and I have found the
problem in the cfi_amstd_write() function.

In fact, when we want to write less that CFIDEV_BUSWIDTH bytes, the
function performs a read/modify/write on the flash with the
instructions:

        if (ofs & (CFIDEV_BUSWIDTH-1)) {
		.............
                map->copy_from(map, tmp_buf, ....

The flash is directly read using the copy_from() function. However, if
another process is currently erasing the same chip (even if it erases on
a different MTD device), we are not allowed to read from flash because
we are reading only the status of the internal state machine (DQ7, DQ6,
DQ5). The resulting read value is wrong and then the write function has
no success (a wrong value is written).

I set the check with the cfi status before the copy_from() as usual with
(mutex omissis):

        if (cfi->chips[chipnum].state != FL_READY) {
		.....

to be sure that the chip is not in FL_ERASING and everything is working
fine. 

Has anybody had the same problem ? 


stefano

-- 
