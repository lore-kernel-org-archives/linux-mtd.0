Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrNI1-000186-SM
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 08:40:34 +0000
From: bpqw <bpqw@micron.com>
To: Brian Norris <computersforpeace@gmail.com>, "arnaud.mouiche@invoxia.com"
 <arnaud.mouiche@invoxia.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
Date: Thu, 20 Nov 2014 08:39:54 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A7713208B@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "ezequiel.garcia@imgtec.com" <ezequiel.garcia@imgtec.com>,
 "ionela.voinescu@imgtec.com" <ionela.voinescu@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, Arnaud:
> If we are going to a specific spinand framework, my advice would be to=20
> read again the spi nor framework carefully first, and do something=20
> similar (especially for latests work on quad spi)

I think above idea is good.=20
SPI NAND interface and command protocol are similar with SPI NOR, we can=20
create a SPI NAND folder with similar framework with SPI NOR. But need to d=
uplicate=20
nand_bbt and nand_bch code into this folder due to SPI NAND still need BBM =
and ECC.
How do you think?

I ever compared the SPI NAND command protocol with different vendor, result=
 is same
with Ionela's answer. =20

" As far as I've seen from the datasheets I have available (SPI NAND
GigaDevice 1Gb/2Gb/4Gb, Micron 1Gb/2Gb/4Gb), the command sequencing
is the same for read/write/erase operations (read: enable ECC, read to cach=
e,
wait, read from cache, check for errors, disable ECC; write: enable ECC,
write enable, program load, program execute, wait, verify, disable ECC;
erase: write enable, erase block, verify).

Regarding the stream of bytes for each command, the problematic
commands are the read from cache ones (read, fast read, read x2,
read x4, read dual read quad) that have different command format
(additional dummy bytes, a plane select bit to be set).
Other differences are in the structure of the protection and status registe=
rs
(some of them use more ECC and protection bits according to the size
of the chip). Also, each has a different ECC layout "

If you need my detail comparison table, please let me know.

I already set up platform to support SPI NAND now, if you think the framewo=
rk I mentioned=20
above is reasonable, I can start to work on this.

Thanks

Qi Wang
