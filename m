Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cSpX-000201-Fg
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2003 17:39:07 +0100
Message-Id: <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
Date: Tue, 15 Jul 2003 18:39:12 +0200
To: linux-mtd@lists.infradead.org
From: llandre <r&d@wawnet.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Help to understand error messages (MTD on Samsung NAND chips)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've just intalled MTD on a Linux box equipped with the 2.4.21-pre5 kernel 
of the linuxppc_devel tree.
I have two NAND Flashes from Samsung (K9F5608U0B). I followed the 
istructions described in the "nand.html" documend released with the MTD 
source files. I statically linked the MTD drivers and the two chips are 
recognized correctly during boot:
----------------------------------------------------------------------------
NAND device: Manufacture ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MB 3,3V)
Using static partition definition
Creating 1 MTD partitions on "NAND 32MB 3,3V":
0x00000000-0x02000000 : "PPChameleon Nand Flash"
mtd: Giving out device 0 to PPChameleon Nand Flash
NAND device: Manufacture ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MB 3,3V)
Using static partition definition
Creating 1 MTD partitions on "NAND 32MB 3,3V":
0x00000000-0x02000000 : "PPChameleonEVB Nand Flash"
mtd: Giving out device 1 to PPChameleonEVB Nand Flash
----------------------------------------------------------------------------


When I try to erase the first one, I get these messages:
----------------------------------------------------------------------------
bash-2.05# eraseall /dev/mtd0
Erasing 16 Kibyte @ 0 --  0 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 4000 --  0 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 8000 --  0 % complete.
...
Erasing 16 Kibyte @ 158000 --  4 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 15c000 --  4 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 160000 --  4 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 164000 --  4 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 168000 --  4 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erased 32768 Kibyte @ 0 -- 100% complete.
bash-2.05#
----------------------------------------------------------------------------


Anybody can explain me the meaning of error messages?
Why do they occur only on the lowest addresses?


Many thanks in advance.


llandre
