Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHUKi-0002QV-Sm
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 10:31:50 +0000
Date: Fri, 8 Jan 2016 11:31:26 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, cernekee@gmail.com, sboyd@codeaurora.org,
 linux-mtd@lists.infradead.org, dehrenberg@google.com,
 andy.gross@linaro.org, computersforpeace@gmail.com
Subject: Re: [PATCH v5 2/3] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20160108113126.56e772d8@bbrezillon>
In-Reply-To: <568F8E2F.7020903@codeaurora.org>
References: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-3-git-send-email-architt@codeaurora.org>
 <20160106180544.281804eb@bbrezillon>
 <568F5835.4090206@codeaurora.org>
 <20160108090128.701baa7a@bbrezillon>
 <568F8E2F.7020903@codeaurora.org>
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

On Fri, 8 Jan 2016 15:53:43 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> 
> 
> On 1/8/2016 1:31 PM, Boris Brezillon wrote:
> > On Fri, 8 Jan 2016 12:03:25 +0530
> > Archit Taneja <architt@codeaurora.org> wrote:
> >
> >> Hi,
> >>
> >> On 1/6/2016 10:35 PM, Boris Brezillon wrote:
> >>> Hi Archit,
> >>>
> >>> On Tue,  5 Jan 2016 10:55:00 +0530
> >>> Archit Taneja <architt@codeaurora.org> wrote:
> >>>
> >>>> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
> >>>> MDM9x15 series.
> >>>>
> >>>> It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
> >>>> and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
> >>>> broader interface for external slow peripheral devices such as LCD and
> >>>> NAND/NOR flash memory or SRAM like interfaces.
> >>>>
> >>>> We add support for the NAND controller found within EBI2. For the SoCs
> >>>> of our interest, we only use the NAND controller within EBI2. Therefore,
> >>>> it's safe for us to assume that the NAND controller is a standalone block
> >>>> within the SoC.
> >>>>
> >>>> The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit NAND
> >>>> flash devices. It contains a HW ECC block that supports BCH ECC (4, 8 and
> >>>> 16 bit correction/step) and RS ECC(4 bit correction/step) that covers main
> >>>> and spare data. The controller contains an internal 512 byte page buffer
> >>>> to which we read/write via DMA. The EBI2 type NAND controller uses ADM DMA
> >>>> for register read/write and data transfers. The controller performs page
> >>>> reads and writes at a codeword/step level of 512 bytes. It can support up
> >>>> to 2 external chips of different configurations.
> >>>>
> >>>> The driver prepares register read and write configuration descriptors for
> >>>> each codeword, followed by data descriptors to read or write data from the
> >>>> controller's internal buffer. It uses a single ADM DMA channel that we get
> >>>> via dmaengine API. The controller requires 2 ADM CRCIs for command and
> >>>> data flow control. These are passed via DT.
> >>>>
> >>>> The ecc layout used by the controller is syndrome like, but we can't use
> >>>> the standard syndrome ecc ops because of several reasons. First, the amount
> >>>> of data bytes covered by ecc isn't same in each step. Second, writing to
> >>>> free oob space requires us writing to the entire step in which the oob
> >>>> lies. This forces us to create our own ecc ops.
> >>>>
> >>>> One more difference is how the controller accesses the bad block marker.
> >>>> The controller ignores reading the marker when ECC is enabled. ECC needs
> >>>> to be explicity disabled to read or write to the bad block marker. The
> >>>> nand_bbt helpers library hence can't access BBMs for the controller.
> >>>> For now, we skip the creation of BBT and populate chip->block_bad and
> >>>> chip->block_markbad helpers instead.
> >>>>
> >>>> Reviewed-by: Andy Gross <agross@codeaurora.org>
> >>>> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> >>>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> >>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> >>>> ---
> >>>> v5:
> >>>>     - split chip/controller structs
> >>>>     - simplify layout by considering reserved bytes as part of ECC
> >>>>     - create ecc layouts automatically
> >>>>     - implement block_bad and block_markbad chip ops instead of
> >>>>     - read_oob_raw/write_oob_raw ecc ops to access BBMs.
> >>>>     - Add NAND_SKIP_BBTSCAN flag until we get badblockbits support.
> >>>>     - misc clean ups
> >>>>
> >>>> v4:
> >>>>     - Shrink submit_descs
> >>>>     - add desc list node at the end of dma_prep_desc
> >>>>     - Endianness and warning fixes
> >>>>     - Add Stephen's Signed-off since he provided a patch to fix
> >>>>       endianness problems
> >>>>
> >>>> v3:
> >>>>     - Refactor dma functions for maximum reuse
> >>>>     - Use dma_slave_confing on stack
> >>>>     - optimize and clean upempty_page_fixup using memchr_inv
> >>>>     - ensure portability with dma register reads using le32_* funcs
> >>>>     - use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
> >>>>     - fix handling of return values of dmaengine funcs
> >>>>     - constify wherever possible
> >>>>     - Remove dependency on ADM DMA in Kconfig
> >>>>     - Misc fixes and clean ups
> >>>>
> >>>> v2:
> >>>>     - Use new BBT flag that allows us to read BBM in raw mode
> >>>>     - reduce memcpy-s in the driver
> >>>>     - some refactor and clean ups because of above changes
> >>>>
> >>>>    drivers/mtd/nand/Kconfig      |    7 +
> >>>>    drivers/mtd/nand/Makefile     |    1 +
> >>>>    drivers/mtd/nand/qcom_nandc.c | 1981 +++++++++++++++++++++++++++++++++++++++++
> >>>>    3 files changed, 1989 insertions(+)
> >>>>    create mode 100644 drivers/mtd/nand/qcom_nandc.c
> >>>>
> >>>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >>>> index 95b8d2b..2fccdfb 100644
> >>>> --- a/drivers/mtd/nand/Kconfig
> >>>> +++ b/drivers/mtd/nand/Kconfig
> >>>> @@ -546,4 +546,11 @@ config MTD_NAND_HISI504
> >>>>    	help
> >>>>    	  Enables support for NAND controller on Hisilicon SoC Hip04.
> >>>>
> >>>> +config MTD_NAND_QCOM
> >>>> +	tristate "Support for NAND on QCOM SoCs"
> >>>> +	depends on ARCH_QCOM
> >>>> +	help
> >>>> +	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
> >>>> +	  controller. This controller is found on IPQ806x SoC.
> >>>> +
> >>>>    endif # MTD_NAND
> >>>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> >>>> index 2c7f014..9450cdc 100644
> >>>> --- a/drivers/mtd/nand/Makefile
> >>>> +++ b/drivers/mtd/nand/Makefile
> >>>> @@ -55,5 +55,6 @@ obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
> >>>>    obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
> >>>>    obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
> >>>>    obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
> >>>> +obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
> >>>>
> >>>>    nand-objs := nand_base.o nand_bbt.o nand_timings.o
> >>>> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> >>>> new file mode 100644
> >>>> index 0000000..a4dd922
> >>>> --- /dev/null
> >>>> +++ b/drivers/mtd/nand/qcom_nandc.c
> >
> > [...]
> >
> >>>
> >>>> +
> >>>> +/*
> >>>> + * when using RS ECC, the NAND controller flags an error when reading an
> >>>> + * erased page. however, there are special characters at certain offsets when
> >>>> + * we read the erased page. we check here if the page is really empty. if so,
> >>>> + * we replace the magic characters with 0xffs
> >>>> + */
> >>>> +static bool empty_page_fixup(struct qcom_nand_host *host, u8 *data_buf)
> >>>> +{
> >>>> +	struct qcom_nand_controller *nandc = host->nandc;
> >>>> +	struct nand_chip *chip = &host->chip;
> >>>> +	struct mtd_info *mtd = nand_to_mtd(chip);
> >>>> +	int cwperpage = chip->ecc.steps;
> >>>> +	u8 orig1[MAX_NUM_STEPS], orig2[MAX_NUM_STEPS];
> >>>> +	int i, j;
> >>>> +
> >>>> +	/* if BCH is enabled, HW will take care of detecting erased pages */
> >>>> +	if (host->bch_enabled || !host->use_ecc)
> >>>> +		return false;
> >>>> +
> >>>> +	for (i = 0; i < cwperpage; i++) {
> >>>> +		u8 *empty1, *empty2;
> >>>> +		u32 flash_status = le32_to_cpu(nandc->reg_read_buf[3 * i]);
> >>>> +
> >>>> +		/*
> >>>> +		 * an erased page flags an error in NAND_FLASH_STATUS, check if
> >>>> +		 * the page is erased by looking for 0x54s at offsets 3 and 175
> >>>> +		 * from the beginning of each codeword
> >>>> +		 */
> >>>> +		if (!(flash_status & FS_OP_ERR))
> >>>> +			break;
> >>>> +
> >>>> +		empty1 = &data_buf[3 + i * host->cw_data];
> >>>> +		empty2 = &data_buf[175 + i * host->cw_data];
> >>>> +
> >>>> +		/*
> >>>> +		 * if the error wasn't because of an erased page, bail out and
> >>>> +		 * and let someone else do the error checking
> >>>> +		 */
> >>>> +		if ((*empty1 == 0x54 && *empty2 == 0xff) ||
> >>>> +				(*empty1 == 0xff && *empty2 == 0x54)) {
> >>>> +			orig1[i] = *empty1;
> >>>> +			orig2[i] = *empty2;
> >>>> +
> >>>> +			*empty1 = 0xff;
> >>>> +			*empty2 = 0xff;
> >>>> +		} else {
> >>>> +			break;
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	if (i < cwperpage || memchr_inv(data_buf, 0xff, mtd->writesize))
> >>>> +		goto not_empty;
> >>>> +
> >>>> +	/*
> >>>> +	 * tell the caller that the page was empty and is fixed up, so that
> >>>> +	 * parse_read_errors() doesn't think it's an error
> >>>> +	 */
> >>>> +	return true;
> >>>> +
> >>>> +not_empty:
> >>>> +	/* restore original values if not empty*/
> >>>> +	for (j = 0; j < i; j++) {
> >>>> +		data_buf[3 + j * host->cw_data] = orig1[j];
> >>>> +		data_buf[175 + j * host->cw_data] = orig2[j];
> >>>> +	}
> >>>> +
> >>>> +	return false;
> >>>> +}
> >>>
> >>> This empty page detection seems a bit complicated to me. Could you
> >>> consider using nand_check_erased_ecc_chunk() to check is the chunk is
> >>> containing 0xff data instead of implementing your own logic?
> >>
> >> We wouldn't be able to use nand_check_erased_ecc_chunk directly because
> >> there are certain bytes in each chunk that are intentionally not 0xffs.
> >>
> >> But I could make it a two step process, where I first override those
> >> magic bytes with 0xffs, and then use nand_check_erased_ecc_chunk. That
> >> may not reduce tons of code, but would atleast consider possibility
> >> of bitflips in erased pages, which the driver currently doesn't do.
> >
> > Too bad your ECC engines decides to fix some bits even when it cannot
> > fix all of them. Are you sure there's no flag to disable this behavior?
> > Usually ECC engines just flag the data chunk as uncorrectable and leave
> > its data untouched.
> 
> I don't think the engine is actually writing to the chunk at any
> point when reading an erased chunk.
> 
> This whole method adopted by the engine is just a way of flagging
> to us that it read an erased chunk. Once it reads an erased chunk, it
> flags an error in one of the controller registers, and replaces
> offsets at 3 and 175 in its internal buffer.
> 
> I am not sure why the HW didn't just provide another bit field which
> notifies that it it read an erased page. This is what is done in the
> future version of this controller, and we don't need to any of this
> stuff.

Ok, if that's really the case, and those pattern are just a way to
notify the software that it has detected an empty page, then I'm fine
with this implementation.
Just add an extra nand_check_erased_ecc_chunk() call (as you suggested)
if this function returns false, so that you can handle bitflips in
erased pages.

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
