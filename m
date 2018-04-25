Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBKXq-0005Ga-Oy
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 13:33:17 +0000
Date: Wed, 25 Apr 2018 15:32:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Tobi
 Wulff <Tobi.Wulff@alliedtelesis.co.nz>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Message-ID: <20180425153252.210a0b1e@xps13>
In-Reply-To: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,

On Tue, 24 Apr 2018 05:31:39 +0000, Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi,
>=20
> We're in the process of qualifying new NAND chips (Macronix=20
> MX30LF2G18AC) for one of our Armada-385 based devices and we're=20
> experiencing some long startup times on units with factory fresh NAND=20
> chips. Anecdotally I think I've also seen this behaviour on the old=20
> chips as well (Micron MT29F2G08ABAEAWP-ITX:E).
>=20
> On 4.17.0-rc2 with the newly re-written NAND infrastructure we see
>=20
> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> nand: Macronix MX30LF2G18AC
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)
> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)

I just sent a patch (and forgot to add you in copy) [1]. This should
remove these two timeouts. I don't think it will improve your (first)
boot time though.

The patch is within a short series fixing various portion of the same
chunk of code, I suggest you to take them all.

[1] http://lists.infradead.org/pipermail/linux-mtd/2018-April/080537.html

Regards,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
