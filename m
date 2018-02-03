Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ei07p-0007ar-OQ
 for linux-mtd@lists.infradead.org; Sat, 03 Feb 2018 15:53:15 +0000
Date: Sat, 3 Feb 2018 16:51:28 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Punnaiah Choudary Kalluri
 <punnaia@xilinx.com>, Michal Simek <michals@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v9 2/2] mtd: nand: Add support for Arasan NAND Flash
 Controller
Message-ID: <20180203165128.415e9824@bbrezillon>
In-Reply-To: <20180203160504.7c91c25e@xps13>
References: <20171214134445.4985-1-nagasure@xilinx.com>
 <20171214134445.4985-3-nagasure@xilinx.com>
 <20171228215528.3ce15bd5@xps13>
 <BY2PR02MB14112FAB777449F1B303D85AAFEC0@BY2PR02MB1411.namprd02.prod.outlook.com>
 <20180203160504.7c91c25e@xps13>
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

On Sat, 3 Feb 2018 16:05:04 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> 
> > > > +}
> > > > +
> > > > +static int anfc_read_page_hwecc(struct mtd_info *mtd,
> > > > +				struct nand_chip *chip, uint8_t *buf,
> > > > +				int oob_required, int page)
> > > > +{
> > > > +	u32 val;
> > > > +	struct anfc *nfc = to_anfc(chip->controller);
> > > > +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> > > > +	u8 *ecc_code = chip->buffers->ecccode;
> > > > +	u8 *p = buf;
> > > > +	int eccsize = chip->ecc.size;
> > > > +	int eccbytes = chip->ecc.bytes;
> > > > +	int eccsteps = chip->ecc.steps;
> > > > +	int stat = 0, i;
> > > > +
> > > > +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDOUT,
> > > > NAND_CMD_RNDOUTSTART);
> > > > +	anfc_config_ecc(nfc, 1);
> > > > +
> > > > +	chip->read_buf(mtd, buf, mtd->writesize);
> > > > +
> > > > +	val = readl(nfc->base + ECC_ERR_CNT_OFST);
> > > > +	val = ((val & PAGE_ERR_CNT_MASK) >> 8);    
> > > 
> > > If I understand this correctly, there is no point doing the upper two lines out of
> > > the if statement?    
> > Yes, I will move this to if statement.  
> > >     
> > > > +	if (achip->bch) {
> > > > +		mtd->ecc_stats.corrected += val;    
> > > 
> > > This is strange that there is no handling of a failing situation when using BCH
> > > algorithm. You should probably add some logic here that either increments
> > > ecc_stats.corrected or ecc_stats.failed like it is done below.    
> > Yes, in case of BCH, upto 24 bit errors it will correct. After that it won't even detect the errors.

Duh! sounds like a broken design. What is true is that for a given
strength (let's call it S), BCH is able to correct S bitflits and is,
most of the time, able to detect up to S+1 bitflips. Sometime though, it
fails to detect that errors are uncorrectable, tries to fix things and
do worse. Anyway, assuming that BCH errors should never be
counted/reported is wrong.

> > Hence when BCH we are not updating errors.

When you know there is an error, it should be reported to the upper
layer. If the controller does not report ECC errors, it's broken and
should not be used. 

> 
> That's weird... Could you please double check this assumption? I find
> weird that you have no way to distinguish a "there was no bitflips"
> with a "there are too much bitflips so I can't even correct them".


> > >     
> > > > +
> > > > +	/*
> > > > +	 * If the controller is already in the same mode as flash
> > > > device
> > > > +	 * then no need to change the timing mode again.
> > > > +	 */
> > > > +	if (readl(nfc->base + DATA_INTERFACE_OFST) ==
> > > > achip->inftimeval)
> > > > +		return 0;
> > > > +
> > > > +	memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
> > > > +	/* Get nvddr timing modes */
> > > > +	mode = onfi_get_sync_timing_mode(chip) & 0xff;
> > > > +	if (!mode) {
> > > > +		mode = fls(onfi_get_async_timing_mode(chip)) - 1;
> > > > +		inftimeval = mode;
> > > > +		if (mode >= 2 && mode <= 5)
> > > > +			change_sdr_clk = true;
> > > > +	} else {
> > > > +		mode = fls(mode) - 1;
> > > > +		inftimeval = NVDDR_MODE | (mode <<
> > > > NVDDR_TIMING_MODE_SHIFT);
> > > > +		mode |= ONFI_DATA_INTERFACE_NVDDR;
> > > > +	}
> > > > +	feature[0] = mode;
> > > > +	chip->select_chip(mtd, achip->csnum);
> > > > +	err = chip->onfi_set_features(mtd, chip,
> > > > ONFI_FEATURE_ADDR_TIMING_MODE,
> > > > +		(uint8_t *)feature);
> > > > +	chip->select_chip(mtd, -1);
> > > > +	if (err)
> > > > +		return err;    
> > > 
> > > You should forget all the NAND chip related code here, the core already handles
> > > it, and then calls ->setup_data_interface() to tune timings on the controller side
> > > only.    
> > Since core doesn't have support for NVDDR, 
> > enum nand_data_interface_type {
> > 	NAND_SDR_IFACE,
> > };
> > we added this logic in setup_data_interface. To achieve the same
> > So what we are doing here is, 
> > When core calls setup_data_interface, the flash changes its operating mode to SDR.
> > And when flash supports NVDDR, we are changing the 
> > Flash operating mode to NVDDR.  
> 
> Not sure this is actually supported by the core. Maybe Boris could give
> us some clues?

It's not, but there's a good reason I defined an interface_type and the
sdr timings are put in a union ;-). So, if you want to support DDR
mode, add the relevant bits to the core (I think that's what Naga did
or is planning to do)

> 
> > Also the setup_data_interface call will happen during probe time, and at this time we don't have
> > Parameter page info, hence I added   
> 
> I sent a patch series to fix that. Let's keep it for now but soon this
> will have to be removed.
> 
> > if (!chip->onfi_version ||
> > 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> > 	    & ONFI_OPT_CMD_SET_GET_FEATURES))
> > 		return -EINVAL;  
> > >     
> > > > +	/*
> > > > +	 * SDR timing modes 2-5 will not work for the arasan nand
> > > > when
> > > > +	 * freq > 90 MHz, so reduce the freq in SDR modes 2-5 to <
> > > > 90Mhz
> > > > +	 */
> > > > +	if (change_sdr_clk) {
> > > > +		clk_disable_unprepare(nfc->clk_sys);
> > > > +		err = clk_set_rate(nfc->clk_sys,
> > > > SDR_MODE_DEFLT_FREQ);
> > > > +		if (err) {
> > > > +			dev_err(nfc->dev, "Can't set the clock
> > > > rate\n");
> > > > +			return err;
> > > > +		}
> > > > +		err = clk_prepare_enable(nfc->clk_sys);
> > > > +		if (err) {
> > > > +			dev_err(nfc->dev, "Unable to enable sys
> > > > clock.\n");
> > > > +			clk_disable_unprepare(nfc->clk_sys);
> > > > +			return err;
> > > > +		}    
> > > 
> > > You do this twice as it is already handled in ->setup_data_interface().    
> > Yes, we added it twice, once when core sends SDR info
> > And the second, because there is a HW bug in controller, i.e SDR timing modes 2-5 will not work, when freq > 90MHz.
> > Hence when Flash operates at SDR modes 2-5, we are changing the clock rate to below 90MHz  

I don't get it. When the timings are selected, you should know which
mode you're operating in, so you can change the frequency at this
specific time.

> 
> 1/ If you do it twice because of a HW bug: please add a comment.
> 2/ What if there are several NAND chips using different timing
> modes? You probably should handle this in ->select_chip() then.

Yep, multi-chip support requires that you move the rate-change logic in
->select_chip().
