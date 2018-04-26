Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBawR-0000FT-FW
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 07:03:47 +0000
Date: Thu, 26 Apr 2018 09:03:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Steve deRosier <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Message-ID: <20180426090321.1a5dee5b@xps13>
In-Reply-To: <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
 <20180424180837.398957ba@xps13>
 <72ff5349ac6e48a9ab74986947572108@svr-chch-ex1.atlnz.lc>
 <7cd09dc2689643e9a8e0751e1cba3e11@svr-chch-ex1.atlnz.lc>
 <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
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

On Thu, 26 Apr 2018 05:16:57 +0000, Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> An update for the end of my working day.
>=20
> On 26/04/18 13:40, Chris Packham wrote:
> > On 26/04/18 09:22, Chris Packham wrote: =20
> >> Hi Miquel,
> >>
> >> On 25/04/18 04:08, Miquel Raynal wrote: =20
> >>> Hi Steve, Chris,
> >>>
> >>> On Tue, 24 Apr 2018 08:49:47 -0700, Steve deRosier <derosier@gmail.co=
m>
> >>> wrote:
> >>> =20
> >>>> Hi Chris,
> >>>>
> >>>> On Mon, Apr 23, 2018 at 10:31 PM, Chris Packham
> >>>> <Chris.Packham@alliedtelesis.co.nz> wrote: =20
> >>>>> Hi,
> >>>>>
> >>>>> We're in the process of qualifying new NAND chips (Macronix
> >>>>> MX30LF2G18AC) for one of our Armada-385 based devices and we're
> >>>>> experiencing some long startup times on units with factory fresh NA=
ND
> >>>>> chips. Anecdotally I think I've also seen this behaviour on the old
> >>>>> chips as well (Micron MT29F2G08ABAEAWP-ITX:E).
> >>>>>
> >>>>> On 4.17.0-rc2 with the newly re-written NAND infrastructure we see
> >>>>>
> >>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> >>>>> nand: Macronix MX30LF2G18AC
> >>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size:=
 64
> >>>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)
> >>>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)
> >>>>> Bad block table not found for chip 0
> >>>>> Bad block table not found for chip 0
> >>>>> Scanning device for bad blocks
> >>>>>
> >>>>> (nothing for some time)
> >>>>>
> >>>>> On an older kernel we see
> >>>>>
> >>>>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this devi=
ce
> >>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> >>>>> nand: Macronix MX30LF2G18AC
> >>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size:=
 64
> >>>>> pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 2048
> >>>>> Bad block table not found for chip 0
> >>>>> Bad block table not found for chip 0
> >>>>> Scanning device for bad blocks
> >>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>> ...
> >>>>> (time outs continue for some time)
> >>>>>
> >>>>> Presumably the new driver in 4.17.0-rc2 is experiencing the same wa=
it
> >>>>> time out but just not complaining about it.
> >>>>>
> >>>>> If we leave the system running long enough (in the order of 30 minu=
tes)
> >>>>> things seem to sort themselves out and bootup continues, the subseq=
uent
> >>>>> boots are fine. If we run 'nand erase.chip' from u-boot on a fresh =
unit
> >>>>> and then boot into the kernel then things are also fine.
> >>>>>
> >>>>> If we run 'nand scrub.chip -y' from u-boot we are able to re-create=
 the
> >>>>> problem.
> >>>>>
> >>>>> Our suspicion is that erased state of the chip is probably not agre=
eable
> >>>>> with either the ecc data or the bad block table location (or both).=
 By
> >>>>> erasing it from u-boot this must fill in valid data in the expected
> >>>>> places and the kernel is happy.
> >>>>>      =20
> >>>>
> >>>> During your very first boot, Linux can't find the bad-block table and
> >>>> thus does a full scan of the chip, each and every block, to find the
> >>>> manufacturer bad block marks and then constructs the table. I imagine
> >>>> you've got a parameter incorrect somewhere that's causing it to wait
> >>>> for timeouts at read points, instead of quickly able to read through
> >>>> the 2k or 4k blocks on that flash.  On subsequent boots, you don't s=
ee
> >>>> this issue because the BBT is found and Linux just uses that. Same
> >>>> deal if you do a `nand erase.chip`, because the BBT is itself marked
> >>>> with a bad-block marker and gets skipped during a normal erase. =20
> >>>
> >>> I share Steve's thoughts on that, there is probably some
> >>> misconfiguration at some point, having a first long boot is not a
> >>> problem, but 30 minutes for a 256MiB chip... What I don't understand =
is
> >>> that you should have timeouts with the recent kernel too if there is
> >>> actually something wrong happening. =20
> >>
> >> As I mentioned in my other reply I may have understated the time. It is
> >> ~30mins with the old pxa3xx driver but the new one seems to block
> >> indefinitely for me.
> >> =20
> >>>>
> >>>> Now, I don't know if you're aware of this, but by doing the `nand
> >>>> scub.chip -y`, you've ruined the flash chip.  That device can not be
> >>>> relied upon anymore. A scrub will ignore the factory bad-block-marks
> >>>> and erase them. Unless you stored this information off-chip and
> >>>> rewrite the markers, you've now lost the bad-block information from
> >>>> the manufacturer's tests.  In any case, this erases the BBT, so your
> >>>> next boot triggers Linux to rebuild the BBT. =20
> >>>
> >>> I think U-Boot will do it automatically after the scrub. But the resu=
lt
> >>> is still the same.
> >>> =20
> >>>> =20
> >>>>> We could update our manufacturing procedures to run 'nand erase.chi=
p'
> >>>>> before the first boot but this feels wrong. Some of our devices boot
> >>>>> over the network so the nand is not normally touched by the bootloa=
der.
> >>>>> It seems that there is some unhandled error condition that is stopp=
ing
> >>>>> the kernel from seeing that the chip is completely blank and making
> >>>>> forward progress.
> >>>>>      =20
> >>>>
> >>>> erase chip won't fix your issue. The BBT scan is going to happen
> >>>> anyway. There is however clearly some parameter that is setup
> >>>> incorrectly that's causing it to wait for the timeout instead of bei=
ng
> >>>> able to quickly read pages. I don't see why that'd be unique to the
> >>>> BBT scan however, I'd expect you to see the problem on all reads, th=
us
> >>>> slowing down the system noticeably in general.
> >>>>
> >>>> Your hint is likely these lines:
> >>>>        " marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x000000=
80)
> >>>>          marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x000002=
80)"
> >>>>
> >>>> You can go look at that in the driver and compare with the relevant
> >>>> behavior in the datasheets. Sorry, but I can't help more specificall=
y,
> >>>> I'd have to know your particular hardware and datasheets and spend
> >>>> some time looking at the code. =20
> >>>
> >>> I also reproduce the problem on my Armada 38x, the two timeouts at bo=
ot
> >>> time (not specifically the first one) are suspicious, I'm going to lo=
ok
> >>> into it. =20
> >>
> >> Thanks for leaping onto it. I'll keep investigating it here as well.
> >> =20
> >=20
> > When I add some debugging to marvell_nfc_wait_op I see
> >=20
> > marvell-nfc f10d0000.flash: timeout_ms =3D 250
> > marvell-nfc f10d0000.flash: done
> > marvell-nfc f10d0000.flash: timeout_ms =3D 1
> > marvell-nfc f10d0000.flash: done
> > nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> > nand: Macronix MX30LF2G18AC
> > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > Bad block table not found for chip 0
> > Bad block table not found for chip 0
> > Scanning device for bad blocks
> > marvell-nfc f10d0000.flash: timeout_ms =3D 4
> > marvell-nfc f10d0000.flash: done
> > marvell-nfc f10d0000.flash: timeout_ms =3D 600000000
> >=20
> > That last line looks quite odd. I think the problem might be related to
> > this line from marvell_nfc_hw_ecc_bch_write_page()
> >=20
> >    ret =3D marvell_nfc_wait_op(chip,
> >                              chip->data_interface.timings.sdr.tPROG_max=
);
> >=20
> > Based on the datasheet that number is 600 microseconds(us) not the
> > milliseconds expected by marvell_nfc_wait_op().
> >  =20
>=20
> So naturally throwing in some PSEC_TO_MSEC() calls stopped the really=20
> long timeouts but then the probe would fail. It seems that I'm getting=20
> some "page done" and "command done" interrupts indications (NDSR =3D=20
> 0x0000500) while attempting to write the oob data.

My bad, I might have forgotten one of these. Can you send a patch or
show me which delay was wrong?

Can you also add a dump_stack() in the error path of the timeout
(probably *wait_cmdd()) and show the full boot log?

>=20
> I've also re-done some of my initial tests and it seems that 4.17-rc2=20
> cannot mount this chip. The 4.16.4 kernel can.
>=20
> Even if I use the old kernel to create the ubi volumes the new kernel=20
> seems to hang while mounting in a similar place to what I was seeing=20
> with the BBT creation.

Thanks for your time,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
