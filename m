Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAqYh-0007WW-NK
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 05:32:10 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>
Subject: NAND timeout issues with blank chip and Marvell NFC
Date: Tue, 24 Apr 2018 05:31:39 +0000
Message-ID: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
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

Hi,=0A=
=0A=
We're in the process of qualifying new NAND chips (Macronix =0A=
MX30LF2G18AC) for one of our Armada-385 based devices and we're =0A=
experiencing some long startup times on units with factory fresh NAND =0A=
chips. Anecdotally I think I've also seen this behaviour on the old =0A=
chips as well (Micron MT29F2G08ABAEAWP-ITX:E).=0A=
=0A=
On 4.17.0-rc2 with the newly re-written NAND infrastructure we see=0A=
=0A=
nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
nand: Macronix MX30LF2G18AC=0A=
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=0A=
marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)=0A=
marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)=0A=
Bad block table not found for chip 0=0A=
Bad block table not found for chip 0=0A=
Scanning device for bad blocks=0A=
=0A=
(nothing for some time)=0A=
=0A=
On an older kernel we see=0A=
=0A=
pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device=0A=
nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
nand: Macronix MX30LF2G18AC=0A=
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=0A=
pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 2048=0A=
Bad block table not found for chip 0=0A=
Bad block table not found for chip 0=0A=
Scanning device for bad blocks=0A=
pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
...=0A=
(time outs continue for some time)=0A=
=0A=
Presumably the new driver in 4.17.0-rc2 is experiencing the same wait =0A=
time out but just not complaining about it.=0A=
=0A=
If we leave the system running long enough (in the order of 30 minutes) =0A=
things seem to sort themselves out and bootup continues, the subsequent =0A=
boots are fine. If we run 'nand erase.chip' from u-boot on a fresh unit =0A=
and then boot into the kernel then things are also fine.=0A=
=0A=
If we run 'nand scrub.chip -y' from u-boot we are able to re-create the =0A=
problem.=0A=
=0A=
Our suspicion is that erased state of the chip is probably not agreeable =
=0A=
with either the ecc data or the bad block table location (or both). By =0A=
erasing it from u-boot this must fill in valid data in the expected =0A=
places and the kernel is happy.=0A=
=0A=
We could update our manufacturing procedures to run 'nand erase.chip' =0A=
before the first boot but this feels wrong. Some of our devices boot =0A=
over the network so the nand is not normally touched by the bootloader. =0A=
It seems that there is some unhandled error condition that is stopping =0A=
the kernel from seeing that the chip is completely blank and making =0A=
forward progress.=0A=
=0A=
Has anyone else seen something like this before? Any thoughts as to how =0A=
we can avoid the long delay?=0A=
=0A=
Thanks=0A=
Chris=0A=
