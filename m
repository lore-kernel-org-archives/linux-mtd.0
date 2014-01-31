Received: from mail1.frequentis.com ([195.20.158.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9FYn-0002bF-Uq
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 14:59:15 +0000
From: BRUNMAYR Peter <Peter.BRUNMAYR@frequentis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PROBLEM] buffer write error (status timeout) due to unexpected
 behavior of P30 Micron flashes during state change "erase -> erase suspend"
Date: Fri, 31 Jan 2014 14:58:47 +0000
Message-ID: <5FAE9987B8383445A4ECA479C08AC4816BBBD81A@vie197nt>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are using two Micron P30 PC28F00AP30EFA flashes in parallel connected to=
 a P1022 PowerPC with Linux 3.4.61. During extensive erase/suspend/resume c=
ycles,
one of the flashes sometimes sends seemingly random data instead of the exp=
ected content of the status register. Due to a misinterpretation of the rec=
eived data,
the flash driver may issue the next command before the flash is actually re=
ady. In our setup this lead to buffer write errors.=20

The problem concerns the chip_ready() function in drivers/mtd/chips/cfi_cmd=
set_0001.c. In the case the flashes are currently erasing, the driver sends=
 0xB0 to
suspend the current operation and 0x70 to ensure "read status" mode. After =
that the driver polls the flashes until bit 7 in the status register is set=
 (device ready).
Our observations showed, that sometimes one of the flashes sends seemingly =
random data (e.g. 0x3ff0) right before it has finished suspending the erase=
 operation.
If bit 7 is accidentally set, the driver misinterprets this as the status "=
device ready" and aborts the loop to issue the next command. In our system,=
 the following buffer
write command was not recognized by the concerned flash, which further lead=
 to the aforementioned buffer write error.

(01) write: 0x00b000b0 @0xd1d800	erase suspend command
(02) write: 0x00700070 @0xd1d800	read status register command
(03) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
(04) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
(05) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
(06) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
(07) read:  @0xd1d800: 0x00400000	flash1: device busy, erase suspend in eff=
ect, flash2: device busy
(08) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in eff=
ect, flash2: device busy, erase suspend in effect
(09) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in eff=
ect, flash2: device busy, erase suspend in effect
(10) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in eff=
ect, flash2: device busy, erase suspend in effect
(11) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in eff=
ect, flash2: device busy, erase suspend in effect
(12) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in eff=
ect, flash2: device busy, erase suspend in effect
(13) read:  @0xd1d800: 0x00c03ff0	flash1: device ready, erase suspend in ef=
fect, flash2: not ready and sends garbage
(14) read:  @0xd1d800: 0x00c03ff0	flash1: device ready, erase suspend in ef=
fect, flash2: not ready and sends garbage
(15) read:  @0xd1d800: 0x00c000c0	flash1: device ready, erase suspend in ef=
fect, flash2: device ready, erase suspend in effect

=20
Did anyone observe a similar behavior with Micron flashes respectively does=
 anyone have an explanation for this behavior?=20

Thanks & best regards,
Peter
_____________________________________=20
Peter Brunmayr
FREQUENTIS AG

Innovationsstrasse 1, 1100 Vienna, Austria
Web www.frequentis.com
Handelsgericht Wien (Vienna Commercial Court): FN 72115 b
DVR 0364797, ATU 14715600
______________________________________=20
