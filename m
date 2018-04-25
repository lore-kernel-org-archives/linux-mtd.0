Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBRsW-0008KC-KV
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 21:23:07 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Steve deRosier
 <derosier@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, Tobi Wulff
 <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Date: Wed, 25 Apr 2018 21:22:45 +0000
Message-ID: <72ff5349ac6e48a9ab74986947572108@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
 <20180424180837.398957ba@xps13>
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

Hi Miquel,=0A=
=0A=
On 25/04/18 04:08, Miquel Raynal wrote:=0A=
> Hi Steve, Chris,=0A=
> =0A=
> On Tue, 24 Apr 2018 08:49:47 -0700, Steve deRosier <derosier@gmail.com>=
=0A=
> wrote:=0A=
> =0A=
>> Hi Chris,=0A=
>>=0A=
>> On Mon, Apr 23, 2018 at 10:31 PM, Chris Packham=0A=
>> <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> We're in the process of qualifying new NAND chips (Macronix=0A=
>>> MX30LF2G18AC) for one of our Armada-385 based devices and we're=0A=
>>> experiencing some long startup times on units with factory fresh NAND=
=0A=
>>> chips. Anecdotally I think I've also seen this behaviour on the old=0A=
>>> chips as well (Micron MT29F2G08ABAEAWP-ITX:E).=0A=
>>>=0A=
>>> On 4.17.0-rc2 with the newly re-written NAND infrastructure we see=0A=
>>>=0A=
>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>>> nand: Macronix MX30LF2G18AC=0A=
>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=
=0A=
>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)=0A=
>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)=0A=
>>> Bad block table not found for chip 0=0A=
>>> Bad block table not found for chip 0=0A=
>>> Scanning device for bad blocks=0A=
>>>=0A=
>>> (nothing for some time)=0A=
>>>=0A=
>>> On an older kernel we see=0A=
>>>=0A=
>>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device=
=0A=
>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>>> nand: Macronix MX30LF2G18AC=0A=
>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=
=0A=
>>> pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 2048=0A=
>>> Bad block table not found for chip 0=0A=
>>> Bad block table not found for chip 0=0A=
>>> Scanning device for bad blocks=0A=
>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>> ...=0A=
>>> (time outs continue for some time)=0A=
>>>=0A=
>>> Presumably the new driver in 4.17.0-rc2 is experiencing the same wait=
=0A=
>>> time out but just not complaining about it.=0A=
>>>=0A=
>>> If we leave the system running long enough (in the order of 30 minutes)=
=0A=
>>> things seem to sort themselves out and bootup continues, the subsequent=
=0A=
>>> boots are fine. If we run 'nand erase.chip' from u-boot on a fresh unit=
=0A=
>>> and then boot into the kernel then things are also fine.=0A=
>>>=0A=
>>> If we run 'nand scrub.chip -y' from u-boot we are able to re-create the=
=0A=
>>> problem.=0A=
>>>=0A=
>>> Our suspicion is that erased state of the chip is probably not agreeabl=
e=0A=
>>> with either the ecc data or the bad block table location (or both). By=
=0A=
>>> erasing it from u-boot this must fill in valid data in the expected=0A=
>>> places and the kernel is happy.=0A=
>>>   =0A=
>>=0A=
>> During your very first boot, Linux can't find the bad-block table and=0A=
>> thus does a full scan of the chip, each and every block, to find the=0A=
>> manufacturer bad block marks and then constructs the table. I imagine=0A=
>> you've got a parameter incorrect somewhere that's causing it to wait=0A=
>> for timeouts at read points, instead of quickly able to read through=0A=
>> the 2k or 4k blocks on that flash.  On subsequent boots, you don't see=
=0A=
>> this issue because the BBT is found and Linux just uses that. Same=0A=
>> deal if you do a `nand erase.chip`, because the BBT is itself marked=0A=
>> with a bad-block marker and gets skipped during a normal erase.=0A=
> =0A=
> I share Steve's thoughts on that, there is probably some=0A=
> misconfiguration at some point, having a first long boot is not a=0A=
> problem, but 30 minutes for a 256MiB chip... What I don't understand is=
=0A=
> that you should have timeouts with the recent kernel too if there is=0A=
> actually something wrong happening.=0A=
=0A=
As I mentioned in my other reply I may have understated the time. It is =0A=
~30mins with the old pxa3xx driver but the new one seems to block =0A=
indefinitely for me.=0A=
=0A=
>>=0A=
>> Now, I don't know if you're aware of this, but by doing the `nand=0A=
>> scub.chip -y`, you've ruined the flash chip.  That device can not be=0A=
>> relied upon anymore. A scrub will ignore the factory bad-block-marks=0A=
>> and erase them. Unless you stored this information off-chip and=0A=
>> rewrite the markers, you've now lost the bad-block information from=0A=
>> the manufacturer's tests.  In any case, this erases the BBT, so your=0A=
>> next boot triggers Linux to rebuild the BBT.=0A=
> =0A=
> I think U-Boot will do it automatically after the scrub. But the result=
=0A=
> is still the same.=0A=
> =0A=
>>=0A=
>>> We could update our manufacturing procedures to run 'nand erase.chip'=
=0A=
>>> before the first boot but this feels wrong. Some of our devices boot=0A=
>>> over the network so the nand is not normally touched by the bootloader.=
=0A=
>>> It seems that there is some unhandled error condition that is stopping=
=0A=
>>> the kernel from seeing that the chip is completely blank and making=0A=
>>> forward progress.=0A=
>>>   =0A=
>>=0A=
>> erase chip won't fix your issue. The BBT scan is going to happen=0A=
>> anyway. There is however clearly some parameter that is setup=0A=
>> incorrectly that's causing it to wait for the timeout instead of being=
=0A=
>> able to quickly read pages. I don't see why that'd be unique to the=0A=
>> BBT scan however, I'd expect you to see the problem on all reads, thus=
=0A=
>> slowing down the system noticeably in general.=0A=
>>=0A=
>> Your hint is likely these lines:=0A=
>>      " marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)=0A=
>>        marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)"=
=0A=
>>=0A=
>> You can go look at that in the driver and compare with the relevant=0A=
>> behavior in the datasheets. Sorry, but I can't help more specifically,=
=0A=
>> I'd have to know your particular hardware and datasheets and spend=0A=
>> some time looking at the code.=0A=
> =0A=
> I also reproduce the problem on my Armada 38x, the two timeouts at boot=
=0A=
> time (not specifically the first one) are suspicious, I'm going to look=
=0A=
> into it.=0A=
=0A=
Thanks for leaping onto it. I'll keep investigating it here as well.=0A=
