Received: from f136.pav2.hotmail.com ([64.4.37.136] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eJ1F-0004kO-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 18:30:18 +0100
From: "invictus rm" <invictus_rm@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: flash erase on 64 bit arch
Date: Mon, 12 Aug 2002 22:59:46 +0530
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F1366TwctPBjxPGsKsJ0000553f@hotmail.com>
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

hi,
i am facing a strange problem of flash erase/program of 2*16 intel strata 
flash.
When i configure my bootloader for 64 bit addressing scheme on 64 bit 
architecture and  try to erase the flash/program the flash , only the first 
word of the doubleword gets programmed/erased.
The same program/erase function was working when configures for 32 bit 
support .

here is the dump after flash erase at a particular block

>>dump  bc600000   <--- physical address of flash

FFFFFFFFBC600000: 3C1C8014FFFFFFFF 3C083000FFFFFFFF  <.......<.0.....
FFFFFFFFBC600010: 40886000FFFFFFFF 67BDFFE0FFFFFFFF  @.`.....g.......
FFFFFFFFBC600020: 40824800FFFFFFFF 40805800FFFFFFFF  @.H.....@.X.....
FFFFFFFFBC600030: 24040000FFFFFFFF 03E00008FFFFFFFF  $...............
FFFFFFFFBC600040: 03E00008FFFFFFFF 34880003FFFFFFFF  ........4.......
FFFFFFFFBC600050: 39080003FFFFFFFF 240A00FFFFFFFFFF  9.......$.......
FFFFFFFFBC600060: 012A5004FFFFFFFF C10B0000FFFFFFFF  .*P.............
FFFFFFFFBC600070: 15800006FFFFFFFF E10C0000FFFFFFFF  ................
FFFFFFFFBC600080: 00000000FFFFFFFF 24020001FFFFFFFF  ........$.......
FFFFFFFFBC600090: 24020000FFFFFFFF 1D000009FFFFFFFF  $...............
FFFFFFFFBC6000A0: 3C0A8000FFFFFFFF 012A5021FFFFFFFF  <........*P!....
FFFFFFFFBC6000B0: 40801000FFFFFFFF 40840000FFFFFFFF  @.......@.......
FFFFFFFFBC6000C0: 03E00008FFFFFFFF 4442F800FFFFFFFF  ........DB......
FFFFFFFFBC6000D0: 3C060003FFFFFFFF 00C23024FFFFFFFF  <.........0$....
FFFFFFFFBC6000E0: 24050F80FFFFFFFF 000529C2FFFFFFFF  $.........).....
FFFFFFFFBC6000F0: 00A72825FFFFFFFF 3C01FFFCFFFFFFFF  ..(%....<.......


It can be seen that only half the block is erased .
Can someone gimme some pointers in this regard.
Waiting for a reply

rgd
rm

_________________________________________________________________
Send and receive Hotmail on your mobile device: http://mobile.msn.com
