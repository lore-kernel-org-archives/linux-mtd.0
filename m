Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsn7q-0000sc-Cy
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 05:23:23 +0000
Received: by mail-pa0-f43.google.com with SMTP id bj1so3950417pad.16
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 21:23:00 -0800 (PST)
Date: Mon, 16 Dec 2013 21:22:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131217052248.GD12034@norris-Latitude-E6410>
References: <20980858CB6D3A4BAE95CA194937D5E73EA53CF1@DBDE04.ent.ti.com>
 <20131211183710.GR27149@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA546AE@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA546AE@DBDE04.ent.ti.com>
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

Hi Pekon,

On Wed, Dec 11, 2013 at 08:54:03PM +0000, Pekon Gupta wrote:
> >From: Brian Norris
> >>On Wed, Dec 11, 2013 at 07:49:21AM +0000, Pekon Gupta wrote:
> >> >From: Brian Norris
> [...]
> 
> >> Do all Micron devices support this vendor-specific ONFI information ?
> >> - legacy device ?
> >> - SLC NAND ?
> >> If not then we might need more filters here ..
> >
> >We can look at the vendor_revision (as of the previous patch, this is in
> >p->vendor_revision). But the vendor block is really
> >backwards-compatible, since byte 180 (the micron->read_retries field)
> >defaulted to 0 on legacy and SLC Micron ONFI NAND. I'll summarize the
> >datasheets I'm referring to:
> >
> >Needs retry   Cell-type    Part number          Vendor revision    Byte 180
> >-----------   ---------    ----------------     ---------------    ------------
> >No            SLC          MT29F16G08ABABA      01h, 00h           Reserved (0)
> >No            MLC          MT29F32G08CBABA      01h, 00h           Reserved (0)
> >No            SLC          MT29F1G08AACWP       01h, 00h           0
> >Yes           MLC          MT29F32G08CBADA      01h, 00h           08h
> >Yes           MLC          MT29F64G08CBABA      02h, 00h           08h
> >
> >These datasheets range from 2008 to 2012, and they cover the range of
> >ONFI 1.0 to ONFI 2.3, so I think it's safe to say that all Micron
> >revisions support this vendor block "number of read retry modes" byte.
> >
> Yes, I have a Micron MLC data-sheet [1] which marks 'read_retry_options'
> Byte 180 as reserved (0x0). So asked this question..
> 
> 
> >At most, we chould check for:
> >
> >	if (le16_to_cpu(p->vendor_revision) < 0x0100)

BTW, I was doing the endian swapping wrong. This should be:

	if (le16_to_cpu(p->vendor_revision) < 1)

> >		return;
> >
> But, your above table shows that there are MLC NAND devices with
> Vendor_revision == 01h, 00h there are both types of 'read_retry_options'
> "Reserved(0)" and "08h".

The above check is probably not needed at all, but it's really only
there to rule out the possibility that somewhere there is an
incompatible vendor_revision 00h for Micron.

> So, I think it would be safe to check for below:
> @@nand_do_read_ops (..)
> +		if (mtd->ecc_stats.failed - ecc_failures) {
> +				if ((retry_mode + 1 < chip->read_retries) && 
> + ----->>>>				(!micron->read_retry_options)) {
> +			
> +		/* Then proceed with retry sequence */

No, this removes the abstraction that I intentionally placed there. See
my reasoning below.

> >> >diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> >> >@@ -518,6 +521,7 @@ struct nand_buffers {
> >> >  *			non 0 if ONFI supported.
> >> >  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
> >> >  *			supported, 0 otherwise.
> >> >+ * @read_retries:	[INTERN] the number of read retry modes supported
> >> >  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
> >> >  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
> >> >  * @bbt:		[INTERN] bad block table pointer
> >> >@@ -589,6 +593,8 @@ struct nand_chip {
> >> > 	int onfi_version;
> >> > 	struct nand_onfi_params	onfi_params;
> >> >
> >> >+	int read_retries;
> >> >+
> >> >
> >> I think we should not add new field 'read_retries' to 'struct nand_chip' bcoz
> >> - It's a vendor specific feature,
> >
> >I don't know that much about other vendor's read-retry support, but I
> >expect that they would have a similar parameter to control how many
> >times we retry. This is not intended to be vendor-specific, and we can
> >adapt if other vendors' approach is too different. (However, I suspect
> >that we can't do this very well for some vendors; they don't
> >standardize, and they are getting more and more difficult to support
> >reliably without deep knowledge of their quirks.)
> >
> >> - And also specifically for MLC NAND.
> >
> >Your point? Where do you propose to put MLC information?
> >
> >> Alternatively you can indirectly access this as part of onfi_params ..
> >> (struct nand_onfi_vendor_micron *) micron = chip->onfi_param->vendor
> >> And then micron->read_retries.
> >
> >We shouldn't be probing our vendor-specific properties on every
> >invocation of nand_do_read_ops(); it should either be in a field (like
> >my nand_chip.read_retries) or in a callback that we assign per-vendor,
> >like Huang suggested.
> >
> No, I'm not saying to probe it every time.
> 
> But I'm not getting one thing here that..
> (1) 'struct nand_onfi_param' is itself is packed into 'struct nand_chip'.
>   @@nand.h 	struct nand_onfi_params	onfi_params;
> (2) And 'vendor block' information is already part of 
>     'struct nand_onfi_params' marked as vendor[88].
> [Patch 2/4]
> -	u8 reserved5[90];
> +	__le16 vendor_revision;
> +	u8 vendor[88];
> 
> Then why do we need another field 'int read_retries' in nand_chip ?

It's called an abstraction: the property 'read_retries' is a general
property that could apply to many different chips, some of which are not
ONFI compatible.

> As 'read_retry_options' information is already packed in
> 'struct nand_chip' as part of 'onfi_param.vendor[]'. So all we just 
> need is to re-cast the u8 vendor[] array into meaningful fields.
> .. correct ? Am I missing something here ?

As Huang answered in this thread, other vendors indeed have a similar
property that (if someone wants to add support) can be represented in
the same field. Thus, the generic code (nand_do_read_ops) only has to
handle the abstract property (nand_chip.read_retries) rather than the
specifics for each vendor (i.e., casting the ONFI structure for Micron;
parsing from ID for Toshiba; etc.).

> So information in vendor[] is same as any other field in nand_chip,
> Then why do we need to duplicate this data.

Try to apply this question to the "minimum required ECC strength"
property. It is present in nand_onfi_params.ecc_bits (or in the EPP);
but because there is more than way to retrieve this info, we established
nand_chip.ecc_strength_ds as an abstraction.

Brian
