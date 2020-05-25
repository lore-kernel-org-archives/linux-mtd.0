Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2B5C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 18:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D9FF2068D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 18:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJGf9CAB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D9FF2068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSsY+KEE46A78lM6gOAl+0Cep3aRlDBqHw2ZBC+09JQ=; b=NJGf9CABGvfs+c
	k9aS0fWr72Irn2UFFDGnvN3DuzVmp6fon3olDpCuIS2o6LKuEMF3rFomjW/5JVhuxpw+nJv3cIiAY
	sGtwxBsbqjOB/wGtUz+wvrpuiZwagfzkhj23DvIFHDRUBXIVoITONaFekUeXxvCTdd9f4ufoLRU36
	t9iMV9BSvCGSqvpw5vG2moMbHJZefHs5xxczHSN01aMT8MUXV8dAkEe/pMCSlBd/dQRCDW6GaMXmm
	fGM7s+AyJ6sBp0U2iA75PILJjx8BHeZPRm7AIHRlApgFTx6U/0SNagzexQ0NCT2oEk7Jd36CDTI0f
	mUdaQTEDDaOuJ3G9jmbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdIFs-000093-Tw; Mon, 25 May 2020 18:55:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdIFo-00008U-PZ
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 18:55:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id BEAF626CFD0
Date: Mon, 25 May 2020 20:55:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 06/19] mtd: rawnand: Reorganize the nand_chip structure
Message-ID: <20200525205335.15da52a4@collabora.com>
In-Reply-To: <20200525174239.11349-7-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-7-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_115517_094720_A360B7E1 
X-CRM114-Status: GOOD (  29.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 May 2020 19:42:26 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Reorder fields in this structure and pack entries by theme:
> * The main descriptive structures
> * The data interface details
> * Bad block information
> * The device layout
> * Extra buffers matching the device layout
> * Internal values
> * External objects like the ECC controller, the ECC engine and a
>   private data pointer.
> 
> While at it, adapt the documentation style.
> 
> I changed on purpose the description of @oob_poi which was weird.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Just like patch 1 and 2, I'm not opposed to this patch, but I feel we're
spending time on something that's expected to be removed soon.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/rawnand.h | 166 +++++++++++++++++-------------------
>  1 file changed, 76 insertions(+), 90 deletions(-)
> 
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 2a9b5d5b315b..622da6527a36 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1055,120 +1055,106 @@ struct nand_manufacturer {
>  
>  /**
>   * struct nand_chip - NAND Private Flash Chip Data
> - * @base:		Inherit from the generic NAND device
> - * @ops:		NAND chip operations
> - * @manufacturer:	Manufacturer information
> - * @legacy:		All legacy fields/hooks. If you develop a new driver,
> - *			don't even try to use any of these fields/hooks, and if
> - *			you're modifying an existing driver that is using those
> - *			fields/hooks, you should consider reworking the driver
> - *			avoid using them.
> - * @ecc:		[BOARDSPECIFIC] ECC control structure
> - * @buf_align:		minimum buffer alignment required by a platform
> - * @oob_poi:		"poison value buffer," used for laying out OOB data
> - *			before writing
> - * @page_shift:		[INTERN] number of address bits in a page (column
> - *			address bits).
> - * @phys_erase_shift:	[INTERN] number of address bits in a physical eraseblock
> - * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
> - * @chip_shift:		[INTERN] number of address bits in one chip
> - * @options:		[BOARDSPECIFIC] various chip options. They can partly
> - *			be set to inform nand_scan about special functionality.
> - *			See the defines for further explanation.
> - * @bbt_options:	[INTERN] bad block specific options. All options used
> - *			here must come from bbm.h. By default, these options
> - *			will be copied to the appropriate nand_bbt_descr's.
> - * @badblockpos:	[INTERN] position of the bad block marker in the oob
> - *			area.
> - * @badblockbits:	[INTERN] minimum number of set bits in a good block's
> - *			bad block marker position; i.e., BBM == 11110111b is
> - *			not bad when badblockbits == 7
> - * @onfi_timing_mode_default: [INTERN] default ONFI timing mode. This field is
> - *			      set to the actually used ONFI mode if the chip is
> - *			      ONFI compliant or deduced from the datasheet if
> - *			      the NAND chip is not ONFI compliant.
> - * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
> - * @data_buf:		[INTERN] buffer for data, size is (page size + oobsize).
> - * @pagecache:		Structure containing page cache related fields
> - * @pagecache.bitflips:	Number of bitflips of the cached page
> - * @pagecache.page:	Page number currently in the cache. -1 means no page is
> - *			currently cached
> - * @subpagesize:	[INTERN] holds the subpagesize
> - * @id:			[INTERN] holds NAND ID
> - * @parameters:		[INTERN] holds generic parameters under an easily
> - *			readable form.
> - * @data_interface:	[INTERN] NAND interface timing information
> - * @cur_cs:		currently selected target. -1 means no target selected,
> - *			otherwise we should always have cur_cs >= 0 &&
> - *			cur_cs < nanddev_ntargets(). NAND Controller drivers
> - *			should not modify this value, but they're allowed to
> - *			read it.
> - * @read_retries:	[INTERN] the number of read retry modes supported
> - * @lock:		lock protecting the suspended field. Also used to
> - *			serialize accesses to the NAND device.
> - * @suspended:		set to 1 when the device is suspended, 0 when it's not.
> - * @bbt:		[INTERN] bad block table pointer
> - * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
> - *			lookup.
> - * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
> - * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for initial
> - *			bad block scan.
> - * @controller:		[REPLACEABLE] a pointer to a hardware controller
> - *			structure which is shared among multiple independent
> - *			devices.
> - * @priv:		[OPTIONAL] pointer to private chip data
> + * @base: Inherit from the generic NAND device
> + * @id: Holds NAND ID
> + * @parameters: Holds generic parameters under an easily readable form
> + * @manufacturer: Manufacturer information
> + * @ops: NAND chip operations
> + * @legacy: All legacy fields/hooks. If you develop a new driver, don't even try
> + *          to use any of these fields/hooks, and if you're modifying an
> + *          existing driver that is using those fields/hooks, you should
> + *          consider reworking the driver and avoid using them.
> + * @options: Various chip options. They can partly be set to inform nand_scan
> + *           about special functionality. See the defines for further
> + *           explanation.
> + * @onfi_timing_mode_default: Default ONFI timing mode. This field is set to the
> + *			      actually used ONFI mode if the chip is ONFI
> + *			      compliant or deduced from the datasheet otherwise
> + * @data_interface: NAND interface timing information
> + * @bbt_erase_shift: Number of address bits in a bbt entry
> + * @bbt_options: Bad block table specific options. All options used here must
> + *               come from bbm.h. By default, these options will be copied to
> + *               the appropriate nand_bbt_descr's.
> + * @badblockpos: Bad block marker position in the oob area
> + * @badblockbits: Minimum number of set bits in a good block's bad block marker
> + *                position; i.e., BBM = 11110111b is good when badblockbits = 7
> + * @bbt_td: Bad block table descriptor for flash lookup
> + * @bbt_md: Bad block table mirror descriptor
> + * @badblock_pattern: Bad block scan pattern used for initial bad block scan
> + * @bbt: Bad block table pointer
> + * @page_shift: Number of address bits in a page (column address bits)
> + * @phys_erase_shift: Number of address bits in a physical eraseblock
> + * @chip_shift: Number of address bits in one chip
> + * @pagemask: Page number mask = number of (pages / chip) - 1
> + * @subpagesize: Holds the subpagesize
> + * @data_buf: Buffer for data, size is (page size + oobsize)
> + * @oob_poi: pointer on the OOB area covered by data_buf
> + * @pagecache: Structure containing page cache related fields
> + * @pagecache.bitflips: Number of bitflips of the cached page
> + * @pagecache.page: Page number currently in the cache. -1 means no page is
> + *                  currently cached
> + * @buf_align: Minimum buffer alignment required by a platform
> + * @lock: Lock protecting the suspended field. Also used to serialize accesses
> + *        to the NAND device
> + * @suspended: Set to 1 when the device is suspended, 0 when it's not
> + * @cur_cs: Currently selected target. -1 means no target selected, otherwise we
> + *          should always have cur_cs >= 0 && cur_cs < nanddev_ntargets().
> + *          NAND Controller drivers should not modify this value, but they're
> + *          allowed to read it.
> + * @read_retries: The number of read retry modes supported
> + * @controller: The hardware controller	structure which is shared among multiple
> + *              independent devices
> + * @ecc: The ECC controller structure
> + * @priv: Chip private data
>   */
> -
>  struct nand_chip {
>  	struct nand_device base;
> +	struct nand_id id;
> +	struct nand_parameters parameters;
>  	struct nand_manufacturer manufacturer;
>  	struct nand_chip_ops ops;
>  	struct nand_legacy legacy;
> -
>  	unsigned int options;
> +
> +	/* Data interface */
> +	int onfi_timing_mode_default;
> +	struct nand_data_interface data_interface;
> +
> +	/* Bad block information */
> +	unsigned int bbt_erase_shift;
>  	unsigned int bbt_options;
> +	unsigned int badblockpos;
> +	unsigned int badblockbits;
> +	struct nand_bbt_descr *bbt_td;
> +	struct nand_bbt_descr *bbt_md;
> +	struct nand_bbt_descr *badblock_pattern;
> +	u8 *bbt;
>  
> +	/* Device internal layout */
>  	unsigned int page_shift;
>  	unsigned int phys_erase_shift;
> -	unsigned int bbt_erase_shift;
>  	unsigned int chip_shift;
>  	unsigned int pagemask;
> +	unsigned int subpagesize;
> +
> +	/* Buffers */
>  	u8 *data_buf;
> -
> +	u8 *oob_poi;
>  	struct {
>  		unsigned int bitflips;
>  		int page;
>  	} pagecache;
> +	unsigned long buf_align;
>  
> -	unsigned int subpagesize;
> -	int onfi_timing_mode_default;
> -	unsigned int badblockpos;
> -	unsigned int badblockbits;
> -
> -	struct nand_id id;
> -	struct nand_parameters parameters;
> -
> -	struct nand_data_interface data_interface;
> -
> +	/* Internals */
> +	struct mutex lock;
> +	unsigned int suspended : 1;
>  	int cur_cs;
> -
>  	int read_retries;
>  
> -	struct mutex lock;
> -	unsigned int suspended : 1;
> -
> -	u8 *oob_poi;
> +	/* Externals */
>  	struct nand_controller *controller;
> -
>  	struct nand_ecc_ctrl ecc;
> -	unsigned long buf_align;
> -
> -	u8 *bbt;
> -	struct nand_bbt_descr *bbt_td;
> -	struct nand_bbt_descr *bbt_md;
> -
> -	struct nand_bbt_descr *badblock_pattern;
> -
>  	void *priv;
>  };
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
