Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fB0Ur-0001BL-1t
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 16:08:51 +0000
Date: Tue, 24 Apr 2018 18:08:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Steve deRosier <derosier@gmail.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, Tobi Wulff
 <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Message-ID: <20180424180837.398957ba@xps13>
In-Reply-To: <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
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

Hi Steve, Chris,

On Tue, 24 Apr 2018 08:49:47 -0700, Steve deRosier <derosier@gmail.com>
wrote:

> Hi Chris,
>=20
> On Mon, Apr 23, 2018 at 10:31 PM, Chris Packham
> <Chris.Packham@alliedtelesis.co.nz> wrote:
> > Hi,
> >
> > We're in the process of qualifying new NAND chips (Macronix
> > MX30LF2G18AC) for one of our Armada-385 based devices and we're
> > experiencing some long startup times on units with factory fresh NAND
> > chips. Anecdotally I think I've also seen this behaviour on the old
> > chips as well (Micron MT29F2G08ABAEAWP-ITX:E).
> >
> > On 4.17.0-rc2 with the newly re-written NAND infrastructure we see
> >
> > nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> > nand: Macronix MX30LF2G18AC
> > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)
> > marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)
> > Bad block table not found for chip 0
> > Bad block table not found for chip 0
> > Scanning device for bad blocks
> >
> > (nothing for some time)
> >
> > On an older kernel we see
> >
> > pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device
> > nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> > nand: Macronix MX30LF2G18AC
> > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 2048
> > Bad block table not found for chip 0
> > Bad block table not found for chip 0
> > Scanning device for bad blocks
> > pxa3xx-nand f10d0000.flash: Wait time out!!!
> > pxa3xx-nand f10d0000.flash: Wait time out!!!
> > pxa3xx-nand f10d0000.flash: Wait time out!!!
> > pxa3xx-nand f10d0000.flash: Wait time out!!!
> > pxa3xx-nand f10d0000.flash: Wait time out!!!
> > ...
> > (time outs continue for some time)
> >
> > Presumably the new driver in 4.17.0-rc2 is experiencing the same wait
> > time out but just not complaining about it.
> >
> > If we leave the system running long enough (in the order of 30 minutes)
> > things seem to sort themselves out and bootup continues, the subsequent
> > boots are fine. If we run 'nand erase.chip' from u-boot on a fresh unit
> > and then boot into the kernel then things are also fine.
> >
> > If we run 'nand scrub.chip -y' from u-boot we are able to re-create the
> > problem.
> >
> > Our suspicion is that erased state of the chip is probably not agreeable
> > with either the ecc data or the bad block table location (or both). By
> > erasing it from u-boot this must fill in valid data in the expected
> > places and the kernel is happy.
> > =20
>=20
> During your very first boot, Linux can't find the bad-block table and
> thus does a full scan of the chip, each and every block, to find the
> manufacturer bad block marks and then constructs the table. I imagine
> you've got a parameter incorrect somewhere that's causing it to wait
> for timeouts at read points, instead of quickly able to read through
> the 2k or 4k blocks on that flash.  On subsequent boots, you don't see
> this issue because the BBT is found and Linux just uses that. Same
> deal if you do a `nand erase.chip`, because the BBT is itself marked
> with a bad-block marker and gets skipped during a normal erase.

I share Steve's thoughts on that, there is probably some
misconfiguration at some point, having a first long boot is not a
problem, but 30 minutes for a 256MiB chip... What I don't understand is
that you should have timeouts with the recent kernel too if there is
actually something wrong happening.

>=20
> Now, I don't know if you're aware of this, but by doing the `nand
> scub.chip -y`, you've ruined the flash chip.  That device can not be
> relied upon anymore. A scrub will ignore the factory bad-block-marks
> and erase them. Unless you stored this information off-chip and
> rewrite the markers, you've now lost the bad-block information from
> the manufacturer's tests.  In any case, this erases the BBT, so your
> next boot triggers Linux to rebuild the BBT.

I think U-Boot will do it automatically after the scrub. But the result
is still the same.

>=20
> > We could update our manufacturing procedures to run 'nand erase.chip'
> > before the first boot but this feels wrong. Some of our devices boot
> > over the network so the nand is not normally touched by the bootloader.
> > It seems that there is some unhandled error condition that is stopping
> > the kernel from seeing that the chip is completely blank and making
> > forward progress.
> > =20
>=20
> erase chip won't fix your issue. The BBT scan is going to happen
> anyway. There is however clearly some parameter that is setup
> incorrectly that's causing it to wait for the timeout instead of being
> able to quickly read pages. I don't see why that'd be unique to the
> BBT scan however, I'd expect you to see the problem on all reads, thus
> slowing down the system noticeably in general.
>=20
> Your hint is likely these lines:
>     " marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)
>       marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)"
>=20
> You can go look at that in the driver and compare with the relevant
> behavior in the datasheets. Sorry, but I can't help more specifically,
> I'd have to know your particular hardware and datasheets and spend
> some time looking at the code.

I also reproduce the problem on my Armada 38x, the two timeouts at boot
time (not specifically the first one) are suspicious, I'm going to look
into it.

Thanks,
Miqu=C3=A8l
