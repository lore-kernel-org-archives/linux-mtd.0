Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBpc8-0000pT-Mb
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 22:43:47 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Steve deRosier <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Date: Thu, 26 Apr 2018 22:43:10 +0000
Message-ID: <7db679c90cc041c78a1eb1fadf505bcd@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
 <20180424180837.398957ba@xps13>
 <72ff5349ac6e48a9ab74986947572108@svr-chch-ex1.atlnz.lc>
 <7cd09dc2689643e9a8e0751e1cba3e11@svr-chch-ex1.atlnz.lc>
 <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
 <20180426090321.1a5dee5b@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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
On 26/04/18 19:03, Miquel Raynal wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Thu, 26 Apr 2018 05:16:57 +0000, Chris Packham=0A=
> <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> An update for the end of my working day.=0A=
>>=0A=
>> On 26/04/18 13:40, Chris Packham wrote:=0A=
>>> On 26/04/18 09:22, Chris Packham wrote:=0A=
>>>> Hi Miquel,=0A=
>>>>=0A=
>>>> On 25/04/18 04:08, Miquel Raynal wrote:=0A=
>>>>> Hi Steve, Chris,=0A=
>>>>>=0A=
>>>>> On Tue, 24 Apr 2018 08:49:47 -0700, Steve deRosier <derosier@gmail.co=
m>=0A=
>>>>> wrote:=0A=
>>>>>   =0A=
>>>>>> Hi Chris,=0A=
>>>>>>=0A=
>>>>>> On Mon, Apr 23, 2018 at 10:31 PM, Chris Packham=0A=
>>>>>> <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>>>>>> Hi,=0A=
>>>>>>>=0A=
>>>>>>> We're in the process of qualifying new NAND chips (Macronix=0A=
>>>>>>> MX30LF2G18AC) for one of our Armada-385 based devices and we're=0A=
>>>>>>> experiencing some long startup times on units with factory fresh NA=
ND=0A=
>>>>>>> chips. Anecdotally I think I've also seen this behaviour on the old=
=0A=
>>>>>>> chips as well (Micron MT29F2G08ABAEAWP-ITX:E).=0A=
>>>>>>>=0A=
>>>>>>> On 4.17.0-rc2 with the newly re-written NAND infrastructure we see=
=0A=
>>>>>>>=0A=
>>>>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>>>>>>> nand: Macronix MX30LF2G18AC=0A=
>>>>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size:=
 64=0A=
>>>>>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)=0A=
>>>>>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)=0A=
>>>>>>> Bad block table not found for chip 0=0A=
>>>>>>> Bad block table not found for chip 0=0A=
>>>>>>> Scanning device for bad blocks=0A=
>>>>>>>=0A=
>>>>>>> (nothing for some time)=0A=
>>>>>>>=0A=
>>>>>>> On an older kernel we see=0A=
>>>>>>>=0A=
>>>>>>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this devi=
ce=0A=
>>>>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>>>>>>> nand: Macronix MX30LF2G18AC=0A=
>>>>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size:=
 64=0A=
>>>>>>> pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 2048=0A=
>>>>>>> Bad block table not found for chip 0=0A=
>>>>>>> Bad block table not found for chip 0=0A=
>>>>>>> Scanning device for bad blocks=0A=
>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
>>>>>>> ...=0A=
>>>>>>> (time outs continue for some time)=0A=
>>>>>>>=0A=
>>>>>>> Presumably the new driver in 4.17.0-rc2 is experiencing the same wa=
it=0A=
>>>>>>> time out but just not complaining about it.=0A=
>>>>>>>=0A=
>>>>>>> If we leave the system running long enough (in the order of 30 minu=
tes)=0A=
>>>>>>> things seem to sort themselves out and bootup continues, the subseq=
uent=0A=
>>>>>>> boots are fine. If we run 'nand erase.chip' from u-boot on a fresh =
unit=0A=
>>>>>>> and then boot into the kernel then things are also fine.=0A=
>>>>>>>=0A=
>>>>>>> If we run 'nand scrub.chip -y' from u-boot we are able to re-create=
 the=0A=
>>>>>>> problem.=0A=
>>>>>>>=0A=
>>>>>>> Our suspicion is that erased state of the chip is probably not agre=
eable=0A=
>>>>>>> with either the ecc data or the bad block table location (or both).=
 By=0A=
>>>>>>> erasing it from u-boot this must fill in valid data in the expected=
=0A=
>>>>>>> places and the kernel is happy.=0A=
>>>>>>>        =0A=
>>>>>>=0A=
>>>>>> During your very first boot, Linux can't find the bad-block table an=
d=0A=
>>>>>> thus does a full scan of the chip, each and every block, to find the=
=0A=
>>>>>> manufacturer bad block marks and then constructs the table. I imagin=
e=0A=
>>>>>> you've got a parameter incorrect somewhere that's causing it to wait=
=0A=
>>>>>> for timeouts at read points, instead of quickly able to read through=
=0A=
>>>>>> the 2k or 4k blocks on that flash.  On subsequent boots, you don't s=
ee=0A=
>>>>>> this issue because the BBT is found and Linux just uses that. Same=
=0A=
>>>>>> deal if you do a `nand erase.chip`, because the BBT is itself marked=
=0A=
>>>>>> with a bad-block marker and gets skipped during a normal erase.=0A=
>>>>>=0A=
>>>>> I share Steve's thoughts on that, there is probably some=0A=
>>>>> misconfiguration at some point, having a first long boot is not a=0A=
>>>>> problem, but 30 minutes for a 256MiB chip... What I don't understand =
is=0A=
>>>>> that you should have timeouts with the recent kernel too if there is=
=0A=
>>>>> actually something wrong happening.=0A=
>>>>=0A=
>>>> As I mentioned in my other reply I may have understated the time. It i=
s=0A=
>>>> ~30mins with the old pxa3xx driver but the new one seems to block=0A=
>>>> indefinitely for me.=0A=
>>>>   =0A=
>>>>>>=0A=
>>>>>> Now, I don't know if you're aware of this, but by doing the `nand=0A=
>>>>>> scub.chip -y`, you've ruined the flash chip.  That device can not be=
=0A=
>>>>>> relied upon anymore. A scrub will ignore the factory bad-block-marks=
=0A=
>>>>>> and erase them. Unless you stored this information off-chip and=0A=
>>>>>> rewrite the markers, you've now lost the bad-block information from=
=0A=
>>>>>> the manufacturer's tests.  In any case, this erases the BBT, so your=
=0A=
>>>>>> next boot triggers Linux to rebuild the BBT.=0A=
>>>>>=0A=
>>>>> I think U-Boot will do it automatically after the scrub. But the resu=
lt=0A=
>>>>> is still the same.=0A=
>>>>>   =0A=
>>>>>>   =0A=
>>>>>>> We could update our manufacturing procedures to run 'nand erase.chi=
p'=0A=
>>>>>>> before the first boot but this feels wrong. Some of our devices boo=
t=0A=
>>>>>>> over the network so the nand is not normally touched by the bootloa=
der.=0A=
>>>>>>> It seems that there is some unhandled error condition that is stopp=
ing=0A=
>>>>>>> the kernel from seeing that the chip is completely blank and making=
=0A=
>>>>>>> forward progress.=0A=
>>>>>>>        =0A=
>>>>>>=0A=
>>>>>> erase chip won't fix your issue. The BBT scan is going to happen=0A=
>>>>>> anyway. There is however clearly some parameter that is setup=0A=
>>>>>> incorrectly that's causing it to wait for the timeout instead of bei=
ng=0A=
>>>>>> able to quickly read pages. I don't see why that'd be unique to the=
=0A=
>>>>>> BBT scan however, I'd expect you to see the problem on all reads, th=
us=0A=
>>>>>> slowing down the system noticeably in general.=0A=
>>>>>>=0A=
>>>>>> Your hint is likely these lines:=0A=
>>>>>>         " marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000=
080)=0A=
>>>>>>           marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000=
280)"=0A=
>>>>>>=0A=
>>>>>> You can go look at that in the driver and compare with the relevant=
=0A=
>>>>>> behavior in the datasheets. Sorry, but I can't help more specificall=
y,=0A=
>>>>>> I'd have to know your particular hardware and datasheets and spend=
=0A=
>>>>>> some time looking at the code.=0A=
>>>>>=0A=
>>>>> I also reproduce the problem on my Armada 38x, the two timeouts at bo=
ot=0A=
>>>>> time (not specifically the first one) are suspicious, I'm going to lo=
ok=0A=
>>>>> into it.=0A=
>>>>=0A=
>>>> Thanks for leaping onto it. I'll keep investigating it here as well.=
=0A=
>>>>   =0A=
>>>=0A=
>>> When I add some debugging to marvell_nfc_wait_op I see=0A=
>>>=0A=
>>> marvell-nfc f10d0000.flash: timeout_ms =3D 250=0A=
>>> marvell-nfc f10d0000.flash: done=0A=
>>> marvell-nfc f10d0000.flash: timeout_ms =3D 1=0A=
>>> marvell-nfc f10d0000.flash: done=0A=
>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>>> nand: Macronix MX30LF2G18AC=0A=
>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=
=0A=
>>> Bad block table not found for chip 0=0A=
>>> Bad block table not found for chip 0=0A=
>>> Scanning device for bad blocks=0A=
>>> marvell-nfc f10d0000.flash: timeout_ms =3D 4=0A=
>>> marvell-nfc f10d0000.flash: done=0A=
>>> marvell-nfc f10d0000.flash: timeout_ms =3D 600000000=0A=
>>>=0A=
>>> That last line looks quite odd. I think the problem might be related to=
=0A=
>>> this line from marvell_nfc_hw_ecc_bch_write_page()=0A=
>>>=0A=
>>>     ret =3D marvell_nfc_wait_op(chip,=0A=
>>>                               chip->data_interface.timings.sdr.tPROG_ma=
x);=0A=
>>>=0A=
>>> Based on the datasheet that number is 600 microseconds(us) not the=0A=
>>> milliseconds expected by marvell_nfc_wait_op().=0A=
>>>    =0A=
>>=0A=
>> So naturally throwing in some PSEC_TO_MSEC() calls stopped the really=0A=
>> long timeouts but then the probe would fail. It seems that I'm getting=
=0A=
>> some "page done" and "command done" interrupts indications (NDSR =3D=0A=
>> 0x0000500) while attempting to write the oob data.=0A=
> =0A=
> My bad, I might have forgotten one of these. Can you send a patch or=0A=
> show me which delay was wrong?=0A=
=0A=
Here's the local change I have applied. Assuming my MUA doesn't mess up =0A=
the formatting. I'm not 100% sure this is correct. The older pxa driver =0A=
seemed to have a fixed 200ms delay for these operations.=0A=
=0A=
--- 8< ---=0A=
Subject: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op=0A=
=0A=
marvell_nfc_wait_op() expects the delay to be expressed in milliseconds=0A=
but nand_sdr_timings uses picoseconds. Use PSEC_TO_MSEC when passing=0A=
tPROG_max to marvell_nfc_wait_op().=0A=
=0A=
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
---=0A=
  drivers/mtd/nand/raw/marvell_nand.c | 4 ++--=0A=
  1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/mtd/nand/raw/marvell_nand.c =0A=
b/drivers/mtd/nand/raw/marvell_nand.c=0A=
index 1d779a35ac8e..e4b964fd40d8 100644=0A=
--- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
+++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
@@ -1074,7 +1074,7 @@ static int =0A=
marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,=0A=
  		return ret;=0A=
=0A=
  	ret =3D marvell_nfc_wait_op(chip,=0A=
-				  chip->data_interface.timings.sdr.tPROG_max);=0A=
+				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));=0A=
  	return ret;=0A=
  }=0A=
=0A=
@@ -1494,7 +1494,7 @@ static int =0A=
marvell_nfc_hw_ecc_bch_write_page(struct mtd_info *mtd,=0A=
  	}=0A=
=0A=
  	ret =3D marvell_nfc_wait_op(chip,=0A=
-				  chip->data_interface.timings.sdr.tPROG_max);=0A=
+				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));=0A=
=0A=
  	marvell_nfc_disable_hw_ecc(chip);=0A=
=0A=
--- 8< ---=0A=
=0A=
> =0A=
> Can you also add a dump_stack() in the error path of the timeout=0A=
> (probably *wait_cmdd()) and show the full boot log?=0A=
> =0A=
=0A=
It's actually *wait_op(). Here's the output with a small debug patch =0A=
applied on top of the delay changes above.=0A=
=0A=
diff --git a/drivers/mtd/nand/raw/marvell_nand.c =0A=
b/drivers/mtd/nand/raw/marvell_nand.c=0A=
index e4b964fd40d8..5af28c7f4487 100644=0A=
--- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
+++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
@@ -627,6 +627,8 @@ static int marvell_nfc_wait_op(struct nand_chip =0A=
*chip, unsigned int timeout_ms)=0A=
         marvell_nfc_disable_int(nfc, NDCR_RDYM);=0A=
         marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));=0A=
         if (!ret) {=0A=
+               dev_info(nfc->dev, "NDSR %08x\n", readl(nfc->regs + NDSR));=
=0A=
+               dump_stack();=0A=
                 dev_err(nfc->dev, "Timeout waiting for RB signal\n");=0A=
                 return -ETIMEDOUT;=0A=
         }=0A=
marvell-nfc f10d0000.flash: NDSR 00000500=0A=
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc2-at1+ #3=0A=
Hardware name: Marvell Armada 380/385 (Device Tree)=0A=
[<80110f40>] (unwind_backtrace) from [<8010c350>] (show_stack+0x10/0x14)=0A=
[<8010c350>] (show_stack) from [<805c1274>] (dump_stack+0x88/0x9c)=0A=
[<805c1274>] (dump_stack) from [<803fdefc>] (marvell_nfc_wait_op+0xb0/0xc8)=
=0A=
[<803fdefc>] (marvell_nfc_wait_op) from [<803fe4e0>] =0A=
(marvell_nfc_hw_ecc_bch_write_page+0x264/0x2d8)=0A=
[<803fe4e0>] (marvell_nfc_hw_ecc_bch_write_page) from [<803f6c64>] =0A=
(nand_do_write_ops+0x328/0x438)=0A=
[<803f6c64>] (nand_do_write_ops) from [<803f6dc8>] =0A=
(nand_write_oob+0x54/0x84)=0A=
[<803f6dc8>] (nand_write_oob) from [<803fa7a8>] (write_bbt+0x31c/0x720)=0A=
[<803fa7a8>] (write_bbt) from [<803fb364>] (nand_default_bbt+0x314/0x6fc)=
=0A=
[<803fb364>] (nand_default_bbt) from [<803f5a84>] =0A=
(nand_scan_tail+0xa98/0xaf0)=0A=
[<803f5a84>] (nand_scan_tail) from [<803fed68>] =0A=
(marvell_nand_chip_init+0x6b8/0x8ec)=0A=
[<803fed68>] (marvell_nand_chip_init) from [<803ff2dc>] =0A=
(marvell_nfc_probe+0x340/0x38c)=0A=
[<803ff2dc>] (marvell_nfc_probe) from [<803bfdc8>] =0A=
(platform_drv_probe+0x34/0x70)=0A=
[<803bfdc8>] (platform_drv_probe) from [<803be724>] =0A=
(really_probe+0x230/0x2c8)=0A=
[<803be724>] (really_probe) from [<803be868>] (__driver_attach+0xac/0xbc)=
=0A=
[<803be868>] (__driver_attach) from [<803bcaa4>] =0A=
(bus_for_each_dev+0x68/0xb4)=0A=
[<803bcaa4>] (bus_for_each_dev) from [<803bdcec>] =0A=
(bus_add_driver+0x198/0x210)=0A=
[<803bdcec>] (bus_add_driver) from [<803bef78>] (driver_register+0x78/0xf8)=
=0A=
[<803bef78>] (driver_register) from [<80102ca4>] =0A=
(do_one_initcall+0x50/0x19c)=0A=
[<80102ca4>] (do_one_initcall) from [<80800e3c>] =0A=
(kernel_init_freeable+0x144/0x1e8)=0A=
[<80800e3c>] (kernel_init_freeable) from [<805d5300>] =0A=
(kernel_init+0x8/0x110)=0A=
[<805d5300>] (kernel_init) from [<801010e8>] (ret_from_fork+0x14/0x2c)=0A=
Exception stack(0xbc037fb0 to 0xbc037ff8)=0A=
7fa0:                                     00000000 00000000 00000000 =0A=
00000000=0A=
7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =0A=
00000000=0A=
7fe0: 00000000 00000000 00000000 00000000 00000013 00000000=0A=
marvell-nfc f10d0000.flash: Timeout waiting for RB signal=0A=
nand_bbt: error while writing BBT block -110=0A=
=0A=
>>=0A=
>> I've also re-done some of my initial tests and it seems that 4.17-rc2=0A=
>> cannot mount this chip. The 4.16.4 kernel can.=0A=
>>=0A=
>> Even if I use the old kernel to create the ubi volumes the new kernel=0A=
>> seems to hang while mounting in a similar place to what I was seeing=0A=
>> with the BBT creation.=0A=
> =0A=
> Thanks for your time,=0A=
> Miqu=E8l=0A=
> =0A=
=0A=
