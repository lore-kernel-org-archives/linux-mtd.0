Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBRnA-0006Vo-E4
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 21:17:35 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Steve deRosier <derosier@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, Tobi Wulff
 <Tobi.Wulff@alliedtelesis.co.nz>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Date: Wed, 25 Apr 2018 21:16:44 +0000
Message-ID: <8e8d8e830f1b4b6b808a602f845153bd@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
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

On 25/04/18 03:50, Steve deRosier wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Mon, Apr 23, 2018 at 10:31 PM, Chris Packham=0A=
> <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>> Hi,=0A=
>>=0A=
>> We're in the process of qualifying new NAND chips (Macronix=0A=
>> MX30LF2G18AC) for one of our Armada-385 based devices and we're=0A=
>> experiencing some long startup times on units with factory fresh NAND=0A=
>> chips. Anecdotally I think I've also seen this behaviour on the old=0A=
>> chips as well (Micron MT29F2G08ABAEAWP-ITX:E).=0A=
>>=0A=
>> On 4.17.0-rc2 with the newly re-written NAND infrastructure we see=0A=
>>=0A=
>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>> nand: Macronix MX30LF2G18AC=0A=
>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=
=0A=
>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)=0A=
>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)=0A=
>> Bad block table not found for chip 0=0A=
>> Bad block table not found for chip 0=0A=
>> Scanning device for bad blocks=0A=
>>=0A=
>> (nothing for some time)=0A=
=0A=
I should correct this. I left it overnight and it's still at this point =0A=
after >24hrs. My original statement was based on the fact that the old =0A=
driver would eventually complete.=0A=
=0A=
I can't be 100% sure that this is the same result as a factory fresh chip.=
=0A=
=0A=
>>=0A=
>> On an older kernel we see=0A=
>>=0A=
>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device=0A=
>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>> nand: Macronix MX30LF2G18AC=0A=
>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=
=0A=
>> pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 2048=0A=
>> Bad block table not found for chip 0=0A=
>> Bad block table not found for chip 0=0A=
>> Scanning device for bad blocks=0A=
>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>> ...=0A=
>> (time outs continue for some time)=0A=
>>=0A=
>> Presumably the new driver in 4.17.0-rc2 is experiencing the same wait=0A=
>> time out but just not complaining about it.=0A=
>>=0A=
>> If we leave the system running long enough (in the order of 30 minutes)=
=0A=
>> things seem to sort themselves out and bootup continues, the subsequent=
=0A=
>> boots are fine. If we run 'nand erase.chip' from u-boot on a fresh unit=
=0A=
>> and then boot into the kernel then things are also fine.=0A=
>>=0A=
>> If we run 'nand scrub.chip -y' from u-boot we are able to re-create the=
=0A=
>> problem.=0A=
>>=0A=
>> Our suspicion is that erased state of the chip is probably not agreeable=
=0A=
>> with either the ecc data or the bad block table location (or both). By=
=0A=
>> erasing it from u-boot this must fill in valid data in the expected=0A=
>> places and the kernel is happy.=0A=
>>=0A=
> =0A=
> During your very first boot, Linux can't find the bad-block table and=0A=
> thus does a full scan of the chip, each and every block, to find the=0A=
> manufacturer bad block marks and then constructs the table. =0A=
=0A=
That's what I assumed was going on.=0A=
=0A=
> I imagine=0A=
> you've got a parameter incorrect somewhere that's causing it to wait=0A=
> for timeouts at read points, instead of quickly able to read through=0A=
> the 2k or 4k blocks on that flash.  On subsequent boots, you don't see=0A=
> this issue because the BBT is found and Linux just uses that. Same=0A=
> deal if you do a `nand erase.chip`, because the BBT is itself marked=0A=
> with a bad-block marker and gets skipped during a normal erase.=0A=
=0A=
Any suggestion as to which setting I may have missed. I haven't adjusted =
=0A=
my board dts to use any of the new capabilities from the updated =0A=
framework but it does look pretty much the same as every other user of =0A=
this driver. It is just inheriting the setup from armada-38x.dtsi and =0A=
setting up the CS, BBT and ECC params. The final version looks something =
=0A=
like this=0A=
=0A=
   flash@d0000 {=0A=
           compatible =3D "marvell,armada370-nand";=0A=
           reg =3D <0xd0000 0x54>;=0A=
           #address-cells =3D <0x1>;=0A=
           #size-cells =3D <0x1>;=0A=
           interrupts =3D <0x0 0x54 0x4>;=0A=
           clocks =3D <0xe 0x0>;=0A=
           status =3D "okay";=0A=
           num-cs =3D <0x1>;=0A=
           nand-ecc-strength =3D <0x4>;=0A=
           nand-ecc-step-size =3D <0x200>;=0A=
           marvell,nand-enable-arbiter;=0A=
           nand-on-flash-bbt;=0A=
   };=0A=
=0A=
=0A=
> Now, I don't know if you're aware of this, but by doing the `nand=0A=
> scub.chip -y`, you've ruined the flash chip.  That device can not be=0A=
> relied upon anymore. A scrub will ignore the factory bad-block-marks=0A=
> and erase them. Unless you stored this information off-chip and=0A=
> rewrite the markers, you've now lost the bad-block information from=0A=
> the manufacturer's tests.  In any case, this erases the BBT, so your=0A=
> next boot triggers Linux to rebuild the BBT.=0A=
=0A=
I was aware and dumped out the BBT before scrubbing. These are sample =0A=
chips anyway so I'm fine with burning them.=0A=
=0A=
> =0A=
>> We could update our manufacturing procedures to run 'nand erase.chip'=0A=
>> before the first boot but this feels wrong. Some of our devices boot=0A=
>> over the network so the nand is not normally touched by the bootloader.=
=0A=
>> It seems that there is some unhandled error condition that is stopping=
=0A=
>> the kernel from seeing that the chip is completely blank and making=0A=
>> forward progress.=0A=
>>=0A=
> =0A=
> erase chip won't fix your issue. The BBT scan is going to happen=0A=
> anyway. There is however clearly some parameter that is setup=0A=
> incorrectly that's causing it to wait for the timeout instead of being=0A=
> able to quickly read pages. I don't see why that'd be unique to the=0A=
> BBT scan however, I'd expect you to see the problem on all reads, thus=0A=
> slowing down the system noticeably in general.=0A=
> =0A=
> Your hint is likely these lines:=0A=
>      " marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)=0A=
>        marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)"=0A=
> =0A=
> You can go look at that in the driver and compare with the relevant=0A=
> behavior in the datasheets. Sorry, but I can't help more specifically,=0A=
> I'd have to know your particular hardware and datasheets and spend=0A=
> some time looking at the code.=0A=
=0A=
Those messages seem to come out in both the "good" and "bad" cases. I've =
=0A=
been ignoring them up to now. I'll go take a closer look.=0A=
=0A=
