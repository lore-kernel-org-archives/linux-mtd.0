Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBwgU-0000vL-ET
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2018 06:16:45 +0000
Date: Fri, 27 Apr 2018 08:16:17 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Steve deRosier
 <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Tobi Wulff
 <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Message-ID: <20180427081617.7aacddc8@bbrezillon>
In-Reply-To: <f47f2762a08d4eae97755fbaca8656b6@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
 <20180424180837.398957ba@xps13>
 <72ff5349ac6e48a9ab74986947572108@svr-chch-ex1.atlnz.lc>
 <7cd09dc2689643e9a8e0751e1cba3e11@svr-chch-ex1.atlnz.lc>
 <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
 <20180426090321.1a5dee5b@xps13>
 <7db679c90cc041c78a1eb1fadf505bcd@svr-chch-ex1.atlnz.lc>
 <f47f2762a08d4eae97755fbaca8656b6@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Apr 2018 04:30:55 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi,
> 
> On 27/04/18 10:43, Chris Packham wrote:
> > Hi Miquel,
> > 
> > On 26/04/18 19:03, Miquel Raynal wrote:  
> >> Hi Chris,
> >>
> >> On Thu, 26 Apr 2018 05:16:57 +0000, Chris Packham
> >> <Chris.Packham@alliedtelesis.co.nz> wrote:
> >>  
> >>> An update for the end of my working day.
> >>>
> >>> On 26/04/18 13:40, Chris Packham wrote:  
> >>>> On 26/04/18 09:22, Chris Packham wrote:  
> >>>>> Hi Miquel,
> >>>>>
> >>>>> On 25/04/18 04:08, Miquel Raynal wrote:  
> >>>>>> Hi Steve, Chris,
> >>>>>>
> >>>>>> On Tue, 24 Apr 2018 08:49:47 -0700, Steve deRosier <derosier@gmail.com>
> >>>>>> wrote:
> >>>>>>      
> >>>>>>> Hi Chris,
> >>>>>>>
> >>>>>>> On Mon, Apr 23, 2018 at 10:31 PM, Chris Packham
> >>>>>>> <Chris.Packham@alliedtelesis.co.nz> wrote:  
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> We're in the process of qualifying new NAND chips (Macronix
> >>>>>>>> MX30LF2G18AC) for one of our Armada-385 based devices and we're
> >>>>>>>> experiencing some long startup times on units with factory fresh NAND
> >>>>>>>> chips. Anecdotally I think I've also seen this behaviour on the old
> >>>>>>>> chips as well (Micron MT29F2G08ABAEAWP-ITX:E).
> >>>>>>>>
> >>>>>>>> On 4.17.0-rc2 with the newly re-written NAND infrastructure we see
> >>>>>>>>
> >>>>>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> >>>>>>>> nand: Macronix MX30LF2G18AC
> >>>>>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> >>>>>>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)
> >>>>>>>> marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)
> >>>>>>>> Bad block table not found for chip 0
> >>>>>>>> Bad block table not found for chip 0
> >>>>>>>> Scanning device for bad blocks
> >>>>>>>>
> >>>>>>>> (nothing for some time)
> >>>>>>>>
> >>>>>>>> On an older kernel we see
> >>>>>>>>
> >>>>>>>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device
> >>>>>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> >>>>>>>> nand: Macronix MX30LF2G18AC
> >>>>>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> >>>>>>>> pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 2048
> >>>>>>>> Bad block table not found for chip 0
> >>>>>>>> Bad block table not found for chip 0
> >>>>>>>> Scanning device for bad blocks
> >>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>>>>> pxa3xx-nand f10d0000.flash: Wait time out!!!
> >>>>>>>> ...
> >>>>>>>> (time outs continue for some time)
> >>>>>>>>
> >>>>>>>> Presumably the new driver in 4.17.0-rc2 is experiencing the same wait
> >>>>>>>> time out but just not complaining about it.
> >>>>>>>>
> >>>>>>>> If we leave the system running long enough (in the order of 30 minutes)
> >>>>>>>> things seem to sort themselves out and bootup continues, the subsequent
> >>>>>>>> boots are fine. If we run 'nand erase.chip' from u-boot on a fresh unit
> >>>>>>>> and then boot into the kernel then things are also fine.
> >>>>>>>>
> >>>>>>>> If we run 'nand scrub.chip -y' from u-boot we are able to re-create the
> >>>>>>>> problem.
> >>>>>>>>
> >>>>>>>> Our suspicion is that erased state of the chip is probably not agreeable
> >>>>>>>> with either the ecc data or the bad block table location (or both). By
> >>>>>>>> erasing it from u-boot this must fill in valid data in the expected
> >>>>>>>> places and the kernel is happy.
> >>>>>>>>           
> >>>>>>>
> >>>>>>> During your very first boot, Linux can't find the bad-block table and
> >>>>>>> thus does a full scan of the chip, each and every block, to find the
> >>>>>>> manufacturer bad block marks and then constructs the table. I imagine
> >>>>>>> you've got a parameter incorrect somewhere that's causing it to wait
> >>>>>>> for timeouts at read points, instead of quickly able to read through
> >>>>>>> the 2k or 4k blocks on that flash.  On subsequent boots, you don't see
> >>>>>>> this issue because the BBT is found and Linux just uses that. Same
> >>>>>>> deal if you do a `nand erase.chip`, because the BBT is itself marked
> >>>>>>> with a bad-block marker and gets skipped during a normal erase.  
> >>>>>>
> >>>>>> I share Steve's thoughts on that, there is probably some
> >>>>>> misconfiguration at some point, having a first long boot is not a
> >>>>>> problem, but 30 minutes for a 256MiB chip... What I don't understand is
> >>>>>> that you should have timeouts with the recent kernel too if there is
> >>>>>> actually something wrong happening.  
> >>>>>
> >>>>> As I mentioned in my other reply I may have understated the time. It is
> >>>>> ~30mins with the old pxa3xx driver but the new one seems to block
> >>>>> indefinitely for me.
> >>>>>      
> >>>>>>>
> >>>>>>> Now, I don't know if you're aware of this, but by doing the `nand
> >>>>>>> scub.chip -y`, you've ruined the flash chip.  That device can not be
> >>>>>>> relied upon anymore. A scrub will ignore the factory bad-block-marks
> >>>>>>> and erase them. Unless you stored this information off-chip and
> >>>>>>> rewrite the markers, you've now lost the bad-block information from
> >>>>>>> the manufacturer's tests.  In any case, this erases the BBT, so your
> >>>>>>> next boot triggers Linux to rebuild the BBT.  
> >>>>>>
> >>>>>> I think U-Boot will do it automatically after the scrub. But the result
> >>>>>> is still the same.
> >>>>>>      
> >>>>>>>      
> >>>>>>>> We could update our manufacturing procedures to run 'nand erase.chip'
> >>>>>>>> before the first boot but this feels wrong. Some of our devices boot
> >>>>>>>> over the network so the nand is not normally touched by the bootloader.
> >>>>>>>> It seems that there is some unhandled error condition that is stopping
> >>>>>>>> the kernel from seeing that the chip is completely blank and making
> >>>>>>>> forward progress.
> >>>>>>>>           
> >>>>>>>
> >>>>>>> erase chip won't fix your issue. The BBT scan is going to happen
> >>>>>>> anyway. There is however clearly some parameter that is setup
> >>>>>>> incorrectly that's causing it to wait for the timeout instead of being
> >>>>>>> able to quickly read pages. I don't see why that'd be unique to the
> >>>>>>> BBT scan however, I'd expect you to see the problem on all reads, thus
> >>>>>>> slowing down the system noticeably in general.
> >>>>>>>
> >>>>>>> Your hint is likely these lines:
> >>>>>>>          " marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000080)
> >>>>>>>            marvell-nfc f10d0000.flash: Timeout on CMDD (NDSR: 0x00000280)"
> >>>>>>>
> >>>>>>> You can go look at that in the driver and compare with the relevant
> >>>>>>> behavior in the datasheets. Sorry, but I can't help more specifically,
> >>>>>>> I'd have to know your particular hardware and datasheets and spend
> >>>>>>> some time looking at the code.  
> >>>>>>
> >>>>>> I also reproduce the problem on my Armada 38x, the two timeouts at boot
> >>>>>> time (not specifically the first one) are suspicious, I'm going to look
> >>>>>> into it.  
> >>>>>
> >>>>> Thanks for leaping onto it. I'll keep investigating it here as well.
> >>>>>      
> >>>>
> >>>> When I add some debugging to marvell_nfc_wait_op I see
> >>>>
> >>>> marvell-nfc f10d0000.flash: timeout_ms = 250
> >>>> marvell-nfc f10d0000.flash: done
> >>>> marvell-nfc f10d0000.flash: timeout_ms = 1
> >>>> marvell-nfc f10d0000.flash: done
> >>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> >>>> nand: Macronix MX30LF2G18AC
> >>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> >>>> Bad block table not found for chip 0
> >>>> Bad block table not found for chip 0
> >>>> Scanning device for bad blocks
> >>>> marvell-nfc f10d0000.flash: timeout_ms = 4
> >>>> marvell-nfc f10d0000.flash: done
> >>>> marvell-nfc f10d0000.flash: timeout_ms = 600000000
> >>>>
> >>>> That last line looks quite odd. I think the problem might be related to
> >>>> this line from marvell_nfc_hw_ecc_bch_write_page()
> >>>>
> >>>>      ret = marvell_nfc_wait_op(chip,
> >>>>                                chip->data_interface.timings.sdr.tPROG_max);
> >>>>
> >>>> Based on the datasheet that number is 600 microseconds(us) not the
> >>>> milliseconds expected by marvell_nfc_wait_op().
> >>>>       
> >>>
> >>> So naturally throwing in some PSEC_TO_MSEC() calls stopped the really
> >>> long timeouts but then the probe would fail. It seems that I'm getting
> >>> some "page done" and "command done" interrupts indications (NDSR =
> >>> 0x0000500) while attempting to write the oob data.  
> >>
> >> My bad, I might have forgotten one of these. Can you send a patch or
> >> show me which delay was wrong?  
> > 
> > Here's the local change I have applied. Assuming my MUA doesn't mess up
> > the formatting. I'm not 100% sure this is correct. The older pxa driver
> > seemed to have a fixed 200ms delay for these operations.
> > 
> > --- 8< ---
> > Subject: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op
> > 
> > marvell_nfc_wait_op() expects the delay to be expressed in milliseconds
> > but nand_sdr_timings uses picoseconds. Use PSEC_TO_MSEC when passing
> > tPROG_max to marvell_nfc_wait_op().
> > 
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >    drivers/mtd/nand/raw/marvell_nand.c | 4 ++--
> >    1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/marvell_nand.c
> > b/drivers/mtd/nand/raw/marvell_nand.c
> > index 1d779a35ac8e..e4b964fd40d8 100644
> > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > @@ -1074,7 +1074,7 @@ static int
> > marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
> >    		return ret;
> > 
> >    	ret = marvell_nfc_wait_op(chip,
> > -				  chip->data_interface.timings.sdr.tPROG_max);
> > +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> >    	return ret;
> >    }
> > 
> > @@ -1494,7 +1494,7 @@ static int
> > marvell_nfc_hw_ecc_bch_write_page(struct mtd_info *mtd,
> >    	}
> > 
> >    	ret = marvell_nfc_wait_op(chip,
> > -				  chip->data_interface.timings.sdr.tPROG_max);
> > +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> > 
> >    	marvell_nfc_disable_hw_ecc(chip);
> > 
> > --- 8< ---
> >   
> >>
> >> Can you also add a dump_stack() in the error path of the timeout
> >> (probably *wait_cmdd()) and show the full boot log?
> >>  
> > 
> > It's actually *wait_op(). Here's the output with a small debug patch
> > applied on top of the delay changes above.
> > 
> > diff --git a/drivers/mtd/nand/raw/marvell_nand.c
> > b/drivers/mtd/nand/raw/marvell_nand.c
> > index e4b964fd40d8..5af28c7f4487 100644
> > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > @@ -627,6 +627,8 @@ static int marvell_nfc_wait_op(struct nand_chip
> > *chip, unsigned int timeout_ms)
> >           marvell_nfc_disable_int(nfc, NDCR_RDYM);
> >           marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));
> >           if (!ret) {
> > +               dev_info(nfc->dev, "NDSR %08x\n", readl(nfc->regs + NDSR));
> > +               dump_stack();
> >                   dev_err(nfc->dev, "Timeout waiting for RB signal\n");
> >                   return -ETIMEDOUT;
> >           }
> > marvell-nfc f10d0000.flash: NDSR 00000500
> > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc2-at1+ #3
> > Hardware name: Marvell Armada 380/385 (Device Tree)
> > [<80110f40>] (unwind_backtrace) from [<8010c350>] (show_stack+0x10/0x14)
> > [<8010c350>] (show_stack) from [<805c1274>] (dump_stack+0x88/0x9c)
> > [<805c1274>] (dump_stack) from [<803fdefc>] (marvell_nfc_wait_op+0xb0/0xc8)
> > [<803fdefc>] (marvell_nfc_wait_op) from [<803fe4e0>]
> > (marvell_nfc_hw_ecc_bch_write_page+0x264/0x2d8)
> > [<803fe4e0>] (marvell_nfc_hw_ecc_bch_write_page) from [<803f6c64>]
> > (nand_do_write_ops+0x328/0x438)
> > [<803f6c64>] (nand_do_write_ops) from [<803f6dc8>]
> > (nand_write_oob+0x54/0x84)
> > [<803f6dc8>] (nand_write_oob) from [<803fa7a8>] (write_bbt+0x31c/0x720)
> > [<803fa7a8>] (write_bbt) from [<803fb364>] (nand_default_bbt+0x314/0x6fc)
> > [<803fb364>] (nand_default_bbt) from [<803f5a84>]
> > (nand_scan_tail+0xa98/0xaf0)
> > [<803f5a84>] (nand_scan_tail) from [<803fed68>]
> > (marvell_nand_chip_init+0x6b8/0x8ec)
> > [<803fed68>] (marvell_nand_chip_init) from [<803ff2dc>]
> > (marvell_nfc_probe+0x340/0x38c)
> > [<803ff2dc>] (marvell_nfc_probe) from [<803bfdc8>]
> > (platform_drv_probe+0x34/0x70)
> > [<803bfdc8>] (platform_drv_probe) from [<803be724>]
> > (really_probe+0x230/0x2c8)
> > [<803be724>] (really_probe) from [<803be868>] (__driver_attach+0xac/0xbc)
> > [<803be868>] (__driver_attach) from [<803bcaa4>]
> > (bus_for_each_dev+0x68/0xb4)
> > [<803bcaa4>] (bus_for_each_dev) from [<803bdcec>]
> > (bus_add_driver+0x198/0x210)
> > [<803bdcec>] (bus_add_driver) from [<803bef78>] (driver_register+0x78/0xf8)
> > [<803bef78>] (driver_register) from [<80102ca4>]
> > (do_one_initcall+0x50/0x19c)
> > [<80102ca4>] (do_one_initcall) from [<80800e3c>]
> > (kernel_init_freeable+0x144/0x1e8)
> > [<80800e3c>] (kernel_init_freeable) from [<805d5300>]
> > (kernel_init+0x8/0x110)
> > [<805d5300>] (kernel_init) from [<801010e8>] (ret_from_fork+0x14/0x2c)
> > Exception stack(0xbc037fb0 to 0xbc037ff8)
> > 7fa0:                                     00000000 00000000 00000000
> > 00000000
> > 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 00000000
> > 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > marvell-nfc f10d0000.flash: Timeout waiting for RB signal
> > nand_bbt: error while writing BBT block -110
> >   
> >>>
> >>> I've also re-done some of my initial tests and it seems that 4.17-rc2
> >>> cannot mount this chip. The 4.16.4 kernel can.
> >>>
> >>> Even if I use the old kernel to create the ubi volumes the new kernel
> >>> seems to hang while mounting in a similar place to what I was seeing
> >>> with the BBT creation.  
> 
> I've now got access to 2 other systems so I now have to 3 different 
> configurations all using the Armada-385 SoC. Here's a quick breakdown of 
> the systems
> 
> Board               NAND Chip                 Size/Erase/Page/OOB
> -----               ---------                 -----------------------
> db-88f6820-amc [1]  Micron MT29F8G08ABACAWP   1024 MiB/256 KiB/4096/224
> x530 #1 [2]         Macronix MX30LF2G18AC     256 MiB/128 KiB/2048/64
> x530 #2             Micron MT29F2G08ABAEAWP   256 MiB/128 KiB/2048/64
> 
> [1] - Reference board from Marvell
> [2] - Our custom design
> 
> The db-88f6820-amc seems to be the best behaved if I configure 
> nand-ecc-strength = <4> and nand-ecc-step-size = <512>. I can detect the 
> chip, create a ubi volume and mount it. Files even stick around :).
> 
> The one problem it does have in this configuration is the familiar 
> "nand: WARNING: pxa3xx_nand-0: the ECC used on your system is too weak 
> compared to the one required by the NAND chip". From what I read in the 
> Marvell datasheet even though the chip requires 8-bits of ECC per 540 
> bytes of data the 16-bits per 2048 bytes of data implemented by the 
> controller should satisfy this.

No, it's not true. Well, it will work for some time, and then fail when
too many erase cycles have been done on a block. You should always try
to at least meet the chip requirements. Anyway, that's not really the
issue here.

> 
> If I set marvell,nand-keep-config or nand-ecc-strength = <8>. I get ECC 
> errors reported (probably due to the change in configuraiton) and 
> ultimately the mount fails "mount: mounting ubi0:user on /flash failed: 
> Invalid argument" I haven't really dug into where that's coming from.

For the ECC change, that's not surprising, since u-boot probably writes
things in the 4bit/512 config.

> 
> Both the x530 boards with the smaller chips fail in similar ways with 
> 4.17-rc2. Namely they either hang at mount time or if I've killed the 
> BBT they hang at startup.
> 
> The smaller page sizes are probably the main difference between the 
> custom boards and the reference board. That's possibly the source of the 
> PAGED interrupts, but then the old driver didn't explicitly do anything 
> to handle these.

Interesting. I guess the main difference with 2k pages is that write
operations are one in a single controller operation while with other
layout you have to do more that one.

> 
> All 3 systems seem fine running 4.16.4 with the pxa3xx_nand driver.

Oh, I thought you were testing 4.16 with the new driver. So finding the
regression might not be that simple here.
