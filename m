Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHRzg-0004b3-VF
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 08:01:59 +0000
Date: Fri, 8 Jan 2016 09:01:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: computersforpeace@gmail.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, sboyd@codeaurora.org, linux-mtd@lists.infradead.org,
 dehrenberg@google.com, andy.gross@linaro.org
Subject: Re: [PATCH v5 2/3] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20160108090128.701baa7a@bbrezillon>
In-Reply-To: <568F5835.4090206@codeaurora.org>
References: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-3-git-send-email-architt@codeaurora.org>
 <20160106180544.281804eb@bbrezillon>
 <568F5835.4090206@codeaurora.org>
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

On Fri, 8 Jan 2016 12:03:25 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> Hi,
> 
> On 1/6/2016 10:35 PM, Boris Brezillon wrote:
> > Hi Archit,
> >
> > On Tue,  5 Jan 2016 10:55:00 +0530
> > Archit Taneja <architt@codeaurora.org> wrote:
> >
> >> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
> >> MDM9x15 series.
> >>
> >> It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
> >> and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
> >> broader interface for external slow peripheral devices such as LCD and
> >> NAND/NOR flash memory or SRAM like interfaces.
> >>
> >> We add support for the NAND controller found within EBI2. For the SoCs
> >> of our interest, we only use the NAND controller within EBI2. Therefore,
> >> it's safe for us to assume that the NAND controller is a standalone block
> >> within the SoC.
> >>
> >> The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit NAND
> >> flash devices. It contains a HW ECC block that supports BCH ECC (4, 8 and
> >> 16 bit correction/step) and RS ECC(4 bit correction/step) that covers main
> >> and spare data. The controller contains an internal 512 byte page buffer
> >> to which we read/write via DMA. The EBI2 type NAND controller uses ADM DMA
> >> for register read/write and data transfers. The controller performs page
> >> reads and writes at a codeword/step level of 512 bytes. It can support up
> >> to 2 external chips of different configurations.
> >>
> >> The driver prepares register read and write configuration descriptors for
> >> each codeword, followed by data descriptors to read or write data from the
> >> controller's internal buffer. It uses a single ADM DMA channel that we get
> >> via dmaengine API. The controller requires 2 ADM CRCIs for command and
> >> data flow control. These are passed via DT.
> >>
> >> The ecc layout used by the controller is syndrome like, but we can't use
> >> the standard syndrome ecc ops because of several reasons. First, the amount
> >> of data bytes covered by ecc isn't same in each step. Second, writing to
> >> free oob space requires us writing to the entire step in which the oob
> >> lies. This forces us to create our own ecc ops.
> >>
> >> One more difference is how the controller accesses the bad block marker.
> >> The controller ignores reading the marker when ECC is enabled. ECC needs
> >> to be explicity disabled to read or write to the bad block marker. The
> >> nand_bbt helpers library hence can't access BBMs for the controller.
> >> For now, we skip the creation of BBT and populate chip->block_bad and
> >> chip->block_markbad helpers instead.
> >>
> >> Reviewed-by: Andy Gross <agross@codeaurora.org>
> >> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> >> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> >> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> >> ---
> >> v5:
> >>    - split chip/controller structs
> >>    - simplify layout by considering reserved bytes as part of ECC
> >>    - create ecc layouts automatically
> >>    - implement block_bad and block_markbad chip ops instead of
> >>    - read_oob_raw/write_oob_raw ecc ops to access BBMs.
> >>    - Add NAND_SKIP_BBTSCAN flag until we get badblockbits support.
> >>    - misc clean ups
> >>
> >> v4:
> >>    - Shrink submit_descs
> >>    - add desc list node at the end of dma_prep_desc
> >>    - Endianness and warning fixes
> >>    - Add Stephen's Signed-off since he provided a patch to fix
> >>      endianness problems
> >>
> >> v3:
> >>    - Refactor dma functions for maximum reuse
> >>    - Use dma_slave_confing on stack
> >>    - optimize and clean upempty_page_fixup using memchr_inv
> >>    - ensure portability with dma register reads using le32_* funcs
> >>    - use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
> >>    - fix handling of return values of dmaengine funcs
> >>    - constify wherever possible
> >>    - Remove dependency on ADM DMA in Kconfig
> >>    - Misc fixes and clean ups
> >>
> >> v2:
> >>    - Use new BBT flag that allows us to read BBM in raw mode
> >>    - reduce memcpy-s in the driver
> >>    - some refactor and clean ups because of above changes
> >>
> >>   drivers/mtd/nand/Kconfig      |    7 +
> >>   drivers/mtd/nand/Makefile     |    1 +
> >>   drivers/mtd/nand/qcom_nandc.c | 1981 +++++++++++++++++++++++++++++++++++++++++
> >>   3 files changed, 1989 insertions(+)
> >>   create mode 100644 drivers/mtd/nand/qcom_nandc.c
> >>
> >> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >> index 95b8d2b..2fccdfb 100644
> >> --- a/drivers/mtd/nand/Kconfig
> >> +++ b/drivers/mtd/nand/Kconfig
> >> @@ -546,4 +546,11 @@ config MTD_NAND_HISI504
> >>   	help
> >>   	  Enables support for NAND controller on Hisilicon SoC Hip04.
> >>
> >> +config MTD_NAND_QCOM
> >> +	tristate "Support for NAND on QCOM SoCs"
> >> +	depends on ARCH_QCOM
> >> +	help
> >> +	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
> >> +	  controller. This controller is found on IPQ806x SoC.
> >> +
> >>   endif # MTD_NAND
> >> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> >> index 2c7f014..9450cdc 100644
> >> --- a/drivers/mtd/nand/Makefile
> >> +++ b/drivers/mtd/nand/Makefile
> >> @@ -55,5 +55,6 @@ obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
> >>   obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
> >>   obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
> >>   obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
> >> +obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
> >>
> >>   nand-objs := nand_base.o nand_bbt.o nand_timings.o
> >> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> >> new file mode 100644
> >> index 0000000..a4dd922
> >> --- /dev/null
> >> +++ b/drivers/mtd/nand/qcom_nandc.c

[...]

> >
> >> +
> >> +/*
> >> + * when using RS ECC, the NAND controller flags an error when reading an
> >> + * erased page. however, there are special characters at certain offsets when
> >> + * we read the erased page. we check here if the page is really empty. if so,
> >> + * we replace the magic characters with 0xffs
> >> + */
> >> +static bool empty_page_fixup(struct qcom_nand_host *host, u8 *data_buf)
> >> +{
> >> +	struct qcom_nand_controller *nandc = host->nandc;
> >> +	struct nand_chip *chip = &host->chip;
> >> +	struct mtd_info *mtd = nand_to_mtd(chip);
> >> +	int cwperpage = chip->ecc.steps;
> >> +	u8 orig1[MAX_NUM_STEPS], orig2[MAX_NUM_STEPS];
> >> +	int i, j;
> >> +
> >> +	/* if BCH is enabled, HW will take care of detecting erased pages */
> >> +	if (host->bch_enabled || !host->use_ecc)
> >> +		return false;
> >> +
> >> +	for (i = 0; i < cwperpage; i++) {
> >> +		u8 *empty1, *empty2;
> >> +		u32 flash_status = le32_to_cpu(nandc->reg_read_buf[3 * i]);
> >> +
> >> +		/*
> >> +		 * an erased page flags an error in NAND_FLASH_STATUS, check if
> >> +		 * the page is erased by looking for 0x54s at offsets 3 and 175
> >> +		 * from the beginning of each codeword
> >> +		 */
> >> +		if (!(flash_status & FS_OP_ERR))
> >> +			break;
> >> +
> >> +		empty1 = &data_buf[3 + i * host->cw_data];
> >> +		empty2 = &data_buf[175 + i * host->cw_data];
> >> +
> >> +		/*
> >> +		 * if the error wasn't because of an erased page, bail out and
> >> +		 * and let someone else do the error checking
> >> +		 */
> >> +		if ((*empty1 == 0x54 && *empty2 == 0xff) ||
> >> +				(*empty1 == 0xff && *empty2 == 0x54)) {
> >> +			orig1[i] = *empty1;
> >> +			orig2[i] = *empty2;
> >> +
> >> +			*empty1 = 0xff;
> >> +			*empty2 = 0xff;
> >> +		} else {
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >> +	if (i < cwperpage || memchr_inv(data_buf, 0xff, mtd->writesize))
> >> +		goto not_empty;
> >> +
> >> +	/*
> >> +	 * tell the caller that the page was empty and is fixed up, so that
> >> +	 * parse_read_errors() doesn't think it's an error
> >> +	 */
> >> +	return true;
> >> +
> >> +not_empty:
> >> +	/* restore original values if not empty*/
> >> +	for (j = 0; j < i; j++) {
> >> +		data_buf[3 + j * host->cw_data] = orig1[j];
> >> +		data_buf[175 + j * host->cw_data] = orig2[j];
> >> +	}
> >> +
> >> +	return false;
> >> +}
> >
> > This empty page detection seems a bit complicated to me. Could you
> > consider using nand_check_erased_ecc_chunk() to check is the chunk is
> > containing 0xff data instead of implementing your own logic?
> 
> We wouldn't be able to use nand_check_erased_ecc_chunk directly because
> there are certain bytes in each chunk that are intentionally not 0xffs.
> 
> But I could make it a two step process, where I first override those
> magic bytes with 0xffs, and then use nand_check_erased_ecc_chunk. That
> may not reduce tons of code, but would atleast consider possibility
> of bitflips in erased pages, which the driver currently doesn't do.

Too bad your ECC engines decides to fix some bits even when it cannot
fix all of them. Are you sure there's no flag to disable this behavior?
Usually ECC engines just flag the data chunk as uncorrectable and leave
its data untouched.

Anyway, are you sure your heuristic to detect erased pages is 100%
sure. What if you really have a lot of bitflips but the values @3 and
@175 are still 0x54 and 0xff because those are the bitflips the engine
decided to fix?

Actually, I don't know if you have any other option but to re-read the
page in raw mode and use nand_check_erased_ecc_chunk(). It adds a
considerable overhead, but at least you're sure to detect real empty
pages without any false positive.

> 
> >
> >
> > [...]
> >
> >> +
> >> +static int qcom_nand_host_setup(struct qcom_nand_host *host)
> >> +{
> >> +	struct qcom_nand_controller *nandc = host->nandc;
> >> +	struct nand_chip *chip = &host->chip;
> >> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> >> +	struct mtd_info *mtd = nand_to_mtd(chip);
> >> +	int cwperpage, spare_bytes, bbm_size, bad_block_byte;
> >> +	bool wide_bus;
> >> +	int ecc_mode = 1;
> >> +
> >> +	/*
> >> +	 * the controller requires each step consists of 512 bytes of data.
> >> +	 * bail out if DT has populated a wrong step size.
> >> +	 */
> >> +	if (ecc->size != NANDC_STEP_SIZE) {
> >> +		dev_err(nandc->dev, "invalid ecc size\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
> >> +
> >> +	if (ecc->strength >= 8) {
> >> +		/* 8 bit ECC defaults to BCH ECC on all platforms */
> >> +		host->bch_enabled = true;
> >> +		ecc_mode = 1;
> >> +
> >> +		if (wide_bus) {
> >> +			host->ecc_bytes_hw = 14;
> >> +			spare_bytes = 0;
> >> +			bbm_size = 2;
> >> +		} else {
> >> +			host->ecc_bytes_hw = 13;
> >> +			spare_bytes = 2;
> >> +			bbm_size = 1;
> >> +		}
> >> +	} else {
> >> +		/*
> >> +		 * if the controller supports BCH for 4 bit ECC, the controller
> >> +		 * uses lesser bytes for ECC. If RS is used, the ECC bytes is
> >> +		 * always 10 bytes
> >> +		 */
> >> +		if (nandc->ecc_modes & ECC_BCH_4BIT) {
> >> +			/* BCH */
> >> +			host->bch_enabled = true;
> >> +			ecc_mode = 0;
> >> +
> >> +			if (wide_bus) {
> >> +				host->ecc_bytes_hw = 8;
> >> +				spare_bytes = 2;
> >> +				bbm_size = 2;
> >> +			} else {
> >> +				host->ecc_bytes_hw = 7;
> >> +				spare_bytes = 4;
> >> +				bbm_size = 1;
> >> +			}
> >> +		} else {
> >> +			/* RS */
> >> +			host->ecc_bytes_hw = 10;
> >> +
> >> +			if (wide_bus) {
> >> +				spare_bytes = 0;
> >> +				bbm_size = 2;
> >> +			} else {
> >> +				spare_bytes = 1;
> >> +				bbm_size = 1;
> >> +			}
> >> +		}
> >> +	}
> >> +
> >> +	/*
> >> +	 * we consider ecc->bytes as the sum of all the non-data content in a
> >> +	 * step. It gives us a clean representation of the oob area (even if
> >> +	 * all the bytes aren't used for ECC).It is always 16 bytes for 8 bit
> >> +	 * ECC and 12 bytes for 4 bit ECC
> >> +	 */
> >> +	ecc->bytes = host->ecc_bytes_hw + spare_bytes + bbm_size;
> >
> > You should add the following check:
> >
> > 	if (ecc->bytes * (mtd->writesize / ecc->size) < mtd->oobsize) {
> > 		dev_err(nandc->dev, "ecc data do not fit in OOB
> > 	area\n");
> > 		return -EINVAL;
> > 	}
> 
> Should that be a '>' in the check?
> 

Absolutely.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
