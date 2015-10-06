Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjONg-0002wr-TW
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 09:17:58 +0000
Received: by wiclk2 with SMTP id lk2so149802971wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2015 02:17:34 -0700 (PDT)
Date: Tue, 6 Oct 2015 10:17:29 +0100
From: Brian Norris <computersforpeace@gmail.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 dehrenberg@google.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 agross@codeaurora.org
Subject: Re: [PATCH v4 2/5] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20151006091729.GA23758@localhost>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-3-git-send-email-architt@codeaurora.org>
 <20151002030527.GD107187@google.com>
 <56121E0A.6040909@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56121E0A.6040909@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Archit,

On Mon, Oct 05, 2015 at 12:21:54PM +0530, Archit Taneja wrote:
> On 10/02/2015 08:35 AM, Brian Norris wrote:
> >On Wed, Aug 19, 2015 at 10:19:03AM +0530, Archit Taneja wrote:
> >>The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
> >>MDM9x15 series.
> >>
> >>It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
> >>and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
> >>broader interface for external slow peripheral devices such as LCD and
> >>NAND/NOR flash memory or SRAM like interfaces.
> >>
> >>We add support for the NAND controller found within EBI2. For the SoCs
> >>of our interest, we only use the NAND controller within EBI2. Therefore,
> >>it's safe for us to assume that the NAND controller is a standalone block
> >>within the SoC.
> >>
> >>The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit NAND
> >>flash devices. It contains a HW ECC block that supports BCH ECC (4, 8 and
> >>16 bit correction/step) and RS ECC(4 bit correction/step) that covers main
> >>and spare data. The controller contains an internal 512 byte page buffer
> >>to which we read/write via DMA. The EBI2 type NAND controller uses ADM DMA
> >>for register read/write and data transfers. The controller performs page
> >>reads and writes at a codeword/step level of 512 bytes. It can support up
> >>to 2 external chips of different configurations.
> >>
> >>The driver prepares register read and write configuration descriptors for
> >>each codeword, followed by data descriptors to read or write data from the
> >>controller's internal buffer. It uses a single ADM DMA channel that we get
> >>via dmaengine API. The controller requires 2 ADM CRCIs for command and
> >>data flow control. These are passed via DT.
> >>
> >>The ecc layout used by the controller is syndrome like, but we can't use
> >>the standard syndrome ecc ops because of several reasons. First, the amount
> >>of data bytes covered by ecc isn't same in each step. Second, writing to
> >>free oob space requires us writing to the entire step in which the oob
> >>lies. This forces us to create our own ecc ops.
> >>
> >>One more difference is how the controller accesses the bad block marker.
> >>The controller ignores reading the marker when ECC is enabled. ECC needs
> >>to be explicity disabled to read or write to the bad block marker. For
> >>this reason, we use the newly created flag NAND_BBT_ACCESS_BBM_RAW to
> >>read the factory provided bad block markers.
> >>
> >>v4:
> >>- Shrink submit_descs
> >>- add desc list node at the end of dma_prep_desc
> >>- Endianness and warning fixes
> >>
> >>Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> >
> >Where does this sign-off come into play? It's not grouped with yours.
> >Did Stephen have something to do with v4 only? Also, we typically trim
> >the change log from the commit message (and place it below the '---' to
> >do this automatically). Or did you intend for these changelogs to stay
> >in the git history? I suppose it's not really harmful to keep it in if
> >you'd like...
> 
> He'd corrected a piece of the code by sharing a patch with with me. You
> can place his sign-off once you and Stephen accept the final patch
> revision.

OK, thanks for the clarification.

> I don't have a problem with discarding the changelogs for the git
> history. I can incorporate some of the major changes in the main
> commit message above.

Whatever works for you. I'd like to incorporate any useful info in the
commit message, but changelog is sometimes noise.

> >>v3:
> >>- Refactor dma functions for maximum reuse
> >>- Use dma_slave_confing on stack
> >>- optimize and clean upempty_page_fixup using memchr_inv
> >>- ensure portability with dma register reads using le32_* funcs
> >>- use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
> >>- fix handling of return values of dmaengine funcs
> >>- constify wherever possible
> >>- Remove dependency on ADM DMA in Kconfig
> >>- Misc fixes and clean ups
> >>
> >>v2:
> >>- Use new BBT flag that allows us to read BBM in raw mode
> >>- reduce memcpy-s in the driver
> >>- some refactor and clean ups because of above changes
> >>
> >>Reviewed-by: Andy Gross <agross@codeaurora.org>
> >>Signed-off-by: Archit Taneja <architt@codeaurora.org>
> >
> >Has this driver been tested with drivers/mtd/tests/? Which ones? I'm
> >particularly interested in oobtest, since you attempted to handle both
> >ECC and raw OOB.
> 
> Yes. All the tests passed. Although, I couldn't figure out from the
> oobtest console output if it tested both the ECC and RAW oob.

No, it doesn't actually use raw OOB (which is possibly a flaw; we should
improve the test sometime). It just uses the auto-place mode, which is
more useful for something like JFFS2. I just wanted to make sure the
test passed, since it looks like you did put a little effort on OOB
support.

> >>---
[...]
> >>+/*
> >>+ * @cmd_crci:			ADM DMA CRCI for command flow control
> >>+ * @data_crci:			ADM DMA CRCI for data flow control
> >>+ * @list:			DMA descriptor list (list of desc_infos)
> >>+ * @data_buffer:		our local DMA buffer for page read/writes,
> >>+ *				used when we can't use the buffer provided
> >>+ *				by upper layers directly
> >>+ * @buf_size/count/start:	markers for chip->read_buf/write_buf functions
> >>+ * @reg_read_buf:		buffer for reading register data via DMA
> >>+ * @reg_read_pos:		marker for data read in reg_read_buf
> >>+ * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
> >>+ *				ecc/non-ecc mode for the current nand flash
> >>+ *				device
> >>+ * @regs:			a contiguous chunk of memory for DMA register
> >>+ *				writes
> >>+ * @ecc_strength:		4 bit or 8 bit ecc, received via DT
> >>+ * @bus_width:			8 bit or 16 bit NAND bus width, received via DT
> >>+ * @ecc_modes:			supported ECC modes by the current controller,
> >>+ *				initialized via DT match data
> >>+ * @cw_size:			the number of bytes in a single step/codeword
> >>+ *				of a page, consisting of all data, ecc, spare
> >>+ *				and reserved bytes
> >>+ * @cw_data:			the number of bytes within a codeword protected
> >>+ *				by ECC
> >>+ * @bch_enabled:		flag to tell whether BCH or RS ECC mode is used
> >>+ * @status:			value to be returned if NAND_CMD_STATUS command
> >>+ *				is executed
> >>+ */
> >>+struct qcom_nandc_data {
> >>+	struct platform_device *pdev;
> >
> >This field is only set once, but unused?
> 
> It is used in the driver remove (qcom_nandc_remove) to get a pointer to
> this data struct.

Are you sure? Doesn't look true to me. Maybe your driver has changed
over time?

> >
> >And it (and several others) aren't documented above.
> 
> The comments weren't meant to be a part of kernel docs. So, I left out
> some of the more obvious params.

Hmm, well it's probably nicer if you're consistent. pdev isn't so
important, but some of the others might be worth listing.

> >>+	struct device *dev;
> >>+
> >>+	void __iomem *base;
> >>+	struct resource *res;
> >>+
> >>+	struct clk *core_clk;
> >>+	struct clk *aon_clk;
> >>+
> >>+	/* DMA stuff */
> >>+	struct dma_chan *chan;
> >>+	struct dma_slave_config	slave_conf;
> >>+	unsigned int cmd_crci;
> >>+	unsigned int data_crci;
> >>+	struct list_head list;
> >>+
> >>+	/* MTD stuff */
> >>+	struct nand_chip chip;
> >>+	struct mtd_info mtd;
> >>+
> >>+	/* local data buffer and markers */
> >>+	u8		*data_buffer;
> >>+	int		buf_size;
> >>+	int		buf_count;
> >>+	int		buf_start;
> >>+
> >>+	/* local buffer to read back registers */
> >>+	__le32 *reg_read_buf;
> >>+	int reg_read_pos;
> >>+
> >>+	/* required configs */
> >>+	u32 cfg0, cfg1;
> >>+	u32 cfg0_raw, cfg1_raw;
> >>+	u32 ecc_buf_cfg;
> >>+	u32 ecc_bch_cfg;
> >>+	u32 clrflashstatus;
> >>+	u32 clrreadstatus;
> >>+	u32 sflashc_burst_cfg;
> >>+	u32 cmd1, vld;
> >>+
> >>+	/* register state */
> >>+	struct nandc_regs *regs;
> >>+
> >>+	/* things we get from DT */
> >>+	int ecc_strength;
> >>+	int bus_width;
> >>+
> >>+	u32 ecc_modes;
> >>+
> >>+	/* misc params */
> >>+	int cw_size;
> >>+	int cw_data;
> >>+	bool use_ecc;
> >>+	bool bch_enabled;
> >>+	u8 status;
> >>+	int last_command;
> >>+};
> >>+
[...]
> >>+/*
> >>+ * when using RS ECC, the NAND controller flags an error when reading an
> >>+ * erased page. however, there are special characters at certain offsets when
> >>+ * we read the erased page. we check here if the page is really empty. if so,
> >>+ * we replace the magic characters with 0xffs
> >>+ */
> >
> >What's the nature of this erased page flagging? Does it only detect
> >all-0xff pages? What about if the erased page experiences any bitflips?
> >A lot of drivers have been attempting to handle that case too (which is
> >becoming more common on modern MLC, and even on SLC), and most of the
> >times they do it poorly.
> 
> The hardware can raise an 'erased' flag per step, when all the bytes in
> the step are 0xff. The code below would consider the page as
> 'not erased' if any step doesn't report an erased flag.

OK, so (if the HW is implemented as you say) that looks like a correct
test. But it's not sufficient for some modern cases. You might want to
consider whether you need to adopt some additional checks after your
driver gets merged.

> >See nand_check_erased_ecc_chunk() (in linux-next.git) as an example of a
> >brute force helper to assist for cases where HW ECC is not sufficient.
> 
> I'll have a look. Thanks.
> 
> >
[...]
> >>+static int qcom_nandc_init(struct qcom_nandc_data *this)
> >>+{
> >>+	struct mtd_info *mtd = &this->mtd;
> >>+	struct nand_chip *chip = &this->chip;
> >>+	struct device_node *np = this->dev->of_node;
> >>+	struct mtd_part_parser_data ppdata = { .of_node = np };
> >>+	int r;
> >>+
> >>+	mtd->priv = chip;
> >>+	mtd->name = "qcom-nandc";
> >>+	mtd->owner = THIS_MODULE;
> >>+
> >>+	chip->priv = this;
> >>+
> >>+	chip->cmdfunc		= qcom_nandc_command;
> >>+	chip->select_chip	= qcom_nandc_select_chip;
> >>+	chip->read_byte		= qcom_nandc_read_byte;
> >>+	chip->read_buf		= qcom_nandc_read_buf;
> >>+	chip->write_buf		= qcom_nandc_write_buf;
> >>+
> >>+	chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER;
> >>+	if (this->bus_width == 16)
> >>+		chip->options |= NAND_BUSWIDTH_16;
> >>+
> >>+	chip->bbt_options = NAND_BBT_ACCESS_BBM_RAW;
> >>+	if (of_get_nand_on_flash_bbt(np))
> >
> >Can you use nand_dt_init()? i.e., fill out chip->flash_node and let
> >nand_scan_ident() take care of most of the common DT parsing. You can
> >then clean up afterward with something like:
> >
> >	if (chip->bbt_options & NAND_BBT_USE_FLASH)
> >		chip->bbt_options |= NAND_BBT_NO_OOB;
> >
> >Similar for the bus width, ECC strength, and ECC step size parameters.
> 
> Okay. I was a bit unsure about this.
> 
> The step size is fixed (512 bytes) for the controller hardware, but the
> hardware supports 4 bit and 8 bit ECC. I didn't use nand_dt_init()
> because it makes it necessary to mention both strength and step size
> parameters.
> 
> Is it wrong to specify only what strength to use for the flash chip in
> DT and not specify step size?

There are certainly cases where it can be sufficient to specify just a
strength (e.g., when your HW ECC only supports a single sector size),
but there have been some problems already with other drivers that
assumed at first they only need to support a single sector size, then
they later support new modes (either through new chip revisions, or
simply added driver support for features that were previously unused).
So we kinda decided to require both parameters. In fact, a strength by
itself is not really very descriptive; an ECC algorithm is (roughly)
defined by both the number or errors it can correct *and* the region
over which it acts. So a proper hardware description should probably
cover both.

Long story short: yes, please include both properties (in your DT
binding; or point to nand.txt -- and in your DTS source).

Brian
