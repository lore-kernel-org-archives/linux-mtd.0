Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqofA-0004a8-M2
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 18:37:37 +0000
Received: by mail-ob0-f170.google.com with SMTP id wp18so7461418obc.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 10:37:15 -0800 (PST)
Date: Wed, 11 Dec 2013 10:37:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131211183710.GR27149@ld-irv-0074.broadcom.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA53CF1@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA53CF1@DBDE04.ent.ti.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 11, 2013 at 07:49:21AM +0000, Pekon Gupta wrote:
> >From: Brian Norris
>  [...]
> > /*
> >+ * Configure chip properties from Micron vendor-specific ONFI table
> >+ */
> >+static void nand_onfi_detect_micron(struct nand_chip *chip,
> >+		struct nand_onfi_params *p)
> >+{
> >+	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
> >+	chip->read_retries = micron->read_retry_options;
> >+}
> >
> This may not be needed. Refer comments below..
> 
> [...]
> 
> > static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> >@@ -3037,6 +3097,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> > 		pr_warn("Could not retrieve ONFI ECC requirements\n");
> > 	}
> >
> >+	if (p->jedec_id == NAND_MFR_MICRON)
> >+		nand_onfi_detect_micron(chip, p);
> >+
> >
> Do all Micron devices support this vendor-specific ONFI information ?
> - legacy device ?
> - SLC NAND ?
> If not then we might need more filters here ..

We can look at the vendor_revision (as of the previous patch, this is in
p->vendor_revision). But the vendor block is really
backwards-compatible, since byte 180 (the micron->read_retries field)
defaulted to 0 on legacy and SLC Micron ONFI NAND. I'll summarize the
datasheets I'm referring to:

Needs retry   Cell-type    Part number          Vendor revision    Byte 180
-----------   ---------    ----------------     ---------------    ------------
No            SLC          MT29F16G08ABABA      01h, 00h           Reserved (0)
No            MLC          MT29F32G08CBABA      01h, 00h           Reserved (0)
No            SLC          MT29F1G08AACWP       01h, 00h           0
Yes           MLC          MT29F32G08CBADA      01h, 00h           08h
Yes           MLC          MT29F64G08CBABA      02h, 00h           08h

These datasheets range from 2008 to 2012, and they cover the range of
ONFI 1.0 to ONFI 2.3, so I think it's safe to say that all Micron
revisions support this vendor block "number of read retry modes" byte.
At most, we chould check for:

	if (le16_to_cpu(p->vendor_revision) < 0x0100)
		return;

> [...]
> 
> >diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> >@@ -518,6 +521,7 @@ struct nand_buffers {
> >  *			non 0 if ONFI supported.
> >  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
> >  *			supported, 0 otherwise.
> >+ * @read_retries:	[INTERN] the number of read retry modes supported
> >  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
> >  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
> >  * @bbt:		[INTERN] bad block table pointer
> >@@ -589,6 +593,8 @@ struct nand_chip {
> > 	int onfi_version;
> > 	struct nand_onfi_params	onfi_params;
> >
> >+	int read_retries;
> >+
> >
> I think we should not add new field 'read_retries' to 'struct nand_chip' bcoz
> - It's a vendor specific feature,

I don't know that much about other vendor's read-retry support, but I
expect that they would have a similar parameter to control how many
times we retry. This is not intended to be vendor-specific, and we can
adapt if other vendors' approach is too different. (However, I suspect
that we can't do this very well for some vendors; they don't
standardize, and they are getting more and more difficult to support
reliably without deep knowledge of their quirks.)

> - And also specifically for MLC NAND.

Your point? Where do you propose to put MLC information?

> Alternatively you can indirectly access this as part of onfi_params ..
> (struct nand_onfi_vendor_micron *) micron = chip->onfi_param->vendor
> And then micron->read_retries.

We shouldn't be probing our vendor-specific properties on every
invocation of nand_do_read_ops(); it should either be in a field (like
my nand_chip.read_retries) or in a callback that we assign per-vendor,
like Huang suggested.

Brian
