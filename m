Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTZfH-0004Y1-4h
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 13:16:20 +0000
Received: by bwz1 with SMTP id 1so4677181bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 06:16:17 -0700 (PDT)
Subject: Re: [PATCHv2 1/6] nand/denali: convert to dev_() printk helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1307097169-11744-2-git-send-email-jamie@jamieiles.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
	<1307097169-11744-2-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 16:11:55 +0300
Message-ID: <1307365915.3112.68.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 11:32 +0100, Jamie Iles wrote:
>  	if ((data_invalid - acc_clks * CLK_X) < 2)
> -		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
> -			__FILE__, __LINE__);
> +		dev_warn(denali->dev, "%s, Line %d: Warning!\n", __FILE__,
> +			 __LINE__);

Do you really need __FILE__ and __LINE__ here? And may be you could also
change the warning message? Just printing "warning!" is a bit silly.

>  
>  	addr_2_data = CEIL_DIV(Tadl[mode], CLK_X);
>  	re_2_we = CEIL_DIV(Trhw[mode], CLK_X);
> @@ -394,9 +393,8 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
>  		break;
>  	default:
>  		dev_warn(denali->dev,
> -			"Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
> -			"Will use default parameter values instead.\n",
> -			device_id);
> +			 "unknown Hynix NAND (Device ID: 0x%x). Will use default parameter values instead.\n",
> +			 device_id);

Would also be nice to remove the final dot while on it, as
Documentation/CodingStyle suggests in "Chapter 13: Printing kernel
messages".

> @@ -415,8 +413,8 @@ static void find_valid_banks(struct denali_nand_info *denali)
>  		index_addr_read_data(denali,
>  				(uint32_t)(MODE_11 | (i << 24) | 2), &id[i]);
>  
> -		dev_dbg(denali->dev,
> -			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
> +		dev_dbg(denali->dev, "Return 1st ID for bank[%d]: %x\n", i,
> +			id[i]);
>  
>  		if (i == 0) {
>  			if (!(id[i] & 0x0ff))
> @@ -436,13 +434,12 @@ static void find_valid_banks(struct denali_nand_info *denali)
>  		 */
>  		if (denali->total_used_banks != 1) {
>  			dev_err(denali->dev,
> -					"Sorry, Intel CE4100 only supports "
> -					"a single NAND device.\n");
> +				"Sorry, Intel CE4100 only supports a single NAND device.\n");
>  			BUG();

Just a suggestion for a separate patch - doing BUG() is really bad
practice - it is better to return and error up. But this is not related
to this patch...

>  	dev_info(denali->dev,
> -			"Dump timing register values:"
> -			"acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
> -			"we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
> -			"rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
> -			ioread32(denali->flash_reg + ACC_CLKS),
> -			ioread32(denali->flash_reg + RE_2_WE),
> -			ioread32(denali->flash_reg + RE_2_RE),
> -			ioread32(denali->flash_reg + WE_2_RE),
> -			ioread32(denali->flash_reg + ADDR_2_DATA),
> -			ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
> -			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
> -			ioread32(denali->flash_reg + CS_SETUP_CNT));
> +		 "Dump timing register values: acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
> +		 "we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
> +		 "rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
> +		 ioread32(denali->flash_reg + ACC_CLKS),
> +		 ioread32(denali->flash_reg + RE_2_WE),
> +		 ioread32(denali->flash_reg + RE_2_RE),
> +		 ioread32(denali->flash_reg + WE_2_RE),
> +		 ioread32(denali->flash_reg + ADDR_2_DATA),
> +		 ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
> +		 ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
> +		 ioread32(denali->flash_reg + CS_SETUP_CNT));

I really doubt (but not 100% sure) that multiple \n are handled
correctly. In the kernel all messages have to be prefixed with the
"print level", and the lines after \n will probably not have it. This is
why we have this "KERN_CONT" thing. I suggest you to re-write this print
and use multiple 'dev_info()' calls.

And BTW, why 'dev_info()'? I think it will not be compiled out when
debugging is disabled, and the above info does look like debugging
stuff, so it begs for 'dev_dbg()'.

>  static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
>  {
> @@ -699,8 +691,9 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
>  
>  	if (comp_res == 0) {
>  		/* timeout */
> -		printk(KERN_ERR "timeout occurred, status = 0x%x, mask = 0x%x\n",
> -				intr_status, irq_mask);
> +		dev_err(&denali->mtd.dev,
> +			"timeout occurred, status = 0x%x, mask = 0x%x\n",
> +			intr_status, irq_mask);

Could this fit 2 lines instead?

>  
>  		intr_status = 0;
>  	}
> @@ -785,9 +778,8 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
>  
>  			if (irq_status == 0) {
>  				dev_err(denali->dev,
> -						"cmd, page, addr on timeout "
> -						"(0x%x, 0x%x, 0x%x)\n",
> -						cmd, denali->page, addr);
> +					"cmd, page, addr on timeout (0x%x, 0x%x, 0x%x)\n",
> +					cmd, denali->page, addr);
>  				status = FAIL;
>  			} else {
>  				cmd = MODE_01 | addr;
> @@ -889,7 +881,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
>  
>  		if (irq_status == 0)
>  			dev_err(denali->dev, "page on OOB timeout %d\n",
> -					denali->page);
> +				denali->page);

Did not check, but looks like this can be onelinere, it does not fit 80
lines?

>  
>  		/* We set the device back to MAIN_ACCESS here as I observed
>  		 * instability with the controller if you do a block erase
> @@ -1065,9 +1057,8 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	irq_status = wait_for_irq(denali, irq_mask);
>  
>  	if (irq_status == 0) {
> -		dev_err(denali->dev,
> -				"timeout on write_page (type = %d)\n",
> -				raw_xfer);
> +		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
> +			raw_xfer);

And this looks like it could be a one-liner ... Could you please check
other messages WRT fitting less lines.

>  		denali->status =
>  			(irq_status & INTR_STATUS__PROGRAM_FAIL) ?
>  			NAND_STATUS_FAIL : PASS;
> @@ -1132,9 +1123,9 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	bool check_erased_page = false;
>  
>  	if (page != denali->page) {
> -		dev_err(denali->dev, "IN %s: page %d is not"
> -				" equal to denali->page %d, investigate!!",
> -				__func__, page, denali->page);
> +		dev_err(denali->dev,
> +			"IN %s: page %d is not equal to denali->page %d, investigate!!",
> +			__func__, page, denali->page);

I think this "IN" is not needed, and "investigate!!" sounds
"interesting" ... Not really sure we need __func__ here - it just blows
the code size, no?

>  		BUG();

Similar side-note about this BUG() statement...

>  	}
>  
> @@ -1182,9 +1173,8 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP;
>  
>  	if (page != denali->page) {
> -		dev_err(denali->dev, "IN %s: page %d is not"
> -				" equal to denali->page %d, investigate!!",
> -				__func__, page, denali->page);
> +		dev_err(denali->dev, "IN %s: page %d is not equal to denali->page %d, investigate!!",
> +			__func__, page, denali->page);

Ditto.

>  	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
>  	if (!denali->flash_mem) {
> -		printk(KERN_ERR "Spectra: ioremap_nocache failed!");
> +		dev_err(denali->dev, "Spectra: ioremap_nocache failed!");

For consistency with other messages, I'd removed the exclamation mark
here, in on some other messages.

> -		dev_err(&dev->dev, "Spectra: Failed to register MTD: %d\n",
> +		dev_err(denali->dev, "Spectra: Failed to register MTD: %d\n",
>  				ret);
One line?

>  		goto failed_req_irq;
>  	}
> @@ -1701,7 +1688,7 @@ static struct pci_driver denali_pci_driver = {
>  
>  static int __devinit denali_init(void)
>  {
> -	printk(KERN_INFO "Spectra MTD driver\n");
> +	pr_info(KERN_INFO "Spectra MTD driver\n");

Remove KERN_INFO please.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
