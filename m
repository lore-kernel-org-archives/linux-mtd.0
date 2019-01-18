Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD5CC1B0FD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7867F20823
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TPeK8mHf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfOx9V2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7867F20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10eQg6R9D7h/qpz3rhHFc1osJafatxzfem7dOTAfCMY=; b=TPeK8mHfBW2wTS
	1ieFb+mJA3a6/Po2eCBmUFKPKlfLEYjHju9Ik0WNYlcxOjkwNj+nlEJnyMln9k0fXpXT4Oxz0a25O
	hB0Jgz8BG1EAWaqXjSF7icnjeW7oNZIV07ZSN/0yo/o2/hMnpHuqUCcpQgyPaCHLB0v6hvG8KgWCI
	AlepMA7QP9swx4gA8/oPL8j+T27BfYoooML79WSlIOTVrXN99pi6QA0QmyQNSoFudZ+1XuySUr133
	4ECiNnkfVlVEC4svlJFR8KrM0pBAQ3X6s3dXR1+UgVl73IIgq6C7XdK2YiJFAvColNuPcxBFqJZRK
	zZfNuZgsdRrc948w0gXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkcnq-0004Gq-6S; Fri, 18 Jan 2019 22:39:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkcnn-0004GG-NM
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 22:39:53 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 568E12054F;
 Fri, 18 Jan 2019 22:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547851191;
 bh=OvCZAyMTWbb2N0SWaYJiElg1HcyNvfQMeboMenXJYaE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XfOx9V2trskH3YGlf+3y99xklaYdEDxapfT3xa7m/LAnYTojZRNx0ojRLxGp3RSka
 WNmXMrRsgFFPREaj4jICX0MFeLuxGpGMFvN5usy6LE37soxLcPjAJxFehC950NTSA1
 M+lZRPC8Ziy2Q+9BQdrvdygMaBufIU4ZT4xa0c08=
Date: Fri, 18 Jan 2019 23:39:43 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190118233943.5f003eef@bbrezillon>
In-Reply-To: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_143951_816118_792A4D3C 
X-CRM114-Status: GOOD (  26.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Subject prefix should be "mtd: rawnand: " not "mtd: core: "

On Fri, 18 Jan 2019 22:12:04 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> On some legacy planar 2D Micron NAND devices when a
> block erase command is issued, occasionally even
> though a block erase operation successfully completes
> and returns a pass status, the flash block may not be
> completely erased. Subsequent operations to this block
> on very rare cases can result in subtle failures or
> corruption. These extremely rare cases should nevertheless
> be considered.
> 
> These rare occurrences have been observed on partially
> written blocks. Partially written blocks are not uncommon
> with UBI/UBIFS.
> 
> To avoid this rare occurrence, we make sure that at least
> 15 pages have been programmed to a block before it is erased.
> In case we find that less than 15 pages have been programmed,
> additional pages are programmed in the block. The observation
> is that additional pages rarely need to be written and most of
> the time UBI/UBIFS erases blocks that contain more programmed
> pages.
> 
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> Reviewed-by: ZOLTAN SZUBBOCSEV <zszubbocsev@micron.com>
> ---
>  drivers/mtd/nand/raw/nand_micron.c | 119 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index b85e1c1..f52e072 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -541,8 +541,127 @@ static void micron_fixup_onfi_param_page(struct nand_chip *chip,
>  		p->revision = cpu_to_le16(ONFI_VERSION_1_0);
>  }
>  
> +static int check_page_if_emtpy(struct nand_chip *chip, char *data)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int ret, i;
> +	void *databuf, *eccbuf;
> +	int max_bitflips;
> +	struct mtd_oob_region oobregion;
> +
> +	mtd_ooblayout_ecc(mtd, 0, &oobregion);
> +	eccbuf = chip->oob_poi + oobregion.offset;
> +	databuf = data;
> +	max_bitflips = 0;
> +
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		ret = nand_check_erased_ecc_chunk(data,
> +						  chip->ecc.size,
> +						  eccbuf,
> +						  chip->ecc.bytes,
> +						  NULL, 0,
> +						  chip->ecc.strength);
> +		if (ret >= 0)
> +			max_bitflips = max(ret, max_bitflips);
> +		else
> +			return false;
> +
> +		databuf += chip->ecc.size;
> +		eccbuf += chip->ecc.bytes;
> +
> +	}
> +	/*
> +	 * As for the empty/erased page, bitflips number should be zero or
> +	 * at least less than the bitflip_threshold.
> +	 */
> +	if (max_bitflips > mtd->bitflip_threshold)
> +		return false;
> +	else
> +		return true;
> +}
> +
> +#define LAST_CHECKPU_PAGE 13
> +
> +static int before_erase_checkup(struct nand_chip *chip, int page)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	u8 *data_buf;
> +	int ret;
> +	uint32_t empty_page_mask = 0;
> +
> +	 /* Only for legacy planar 2D parallels NAND. */
> +	if ((mtd->type != MTD_NANDFLASH) || (chip->bits_per_cell != 1))
> +		return 0;

Are you implying that all your SLC chips are impacted by this issue,
really?

> +
> +	data_buf =  kmalloc(mtd->writesize, GFP_KERNEL);
> +	if (!data_buf)
> +		return -ENOMEM;
> +
> +	memset(data_buf, 0xFF, mtd->writesize);
> +	/*
> +	 * pgs[] contains pages need to be checked. We firstly check
> +	 * page13,because, for the most of cases, PEB being erased is
> +	 * not partially programmed. If page13 contains data, we directly
> +	 * return since it is not a partially programmed PEB.

So now you say the minimum amount of written pages is 14 not 15? In
your previous patch, the magic number was 15 (and the commit log
says 15 too). 

> Otherwise,
> +	 * then we check page0. And if page0 is programmed, and page13
> +	 * is not programmed, then we start to check from page11, page9,
> +	 * page7, page5, page3 respectively since the pages of PEB are
> +	 * programmed sequentially.

Looks overly complex for only a small gain. Did you try writing X (X
being 14 in this case) pages all the time? If you did, how does it
compare to this version (perf-wise). I suspect that reading pages
before potentially overwriting them will actually take more time than
blindly overwriting 14 pages with 0x00.

> We olny check odd page.

Why?!

> +	 */
> +
> +	char pgs[] = {13, 0, 11, 9, 7, 5, 3};
> +	int  c = ARRAY_SIZE(pgs) - 1;
> +	int i;
> +
> +	for (i = 0 ; i <=  c; i++) {
> +		ret = nand_read_page_raw(chip, data_buf, 1, page + pgs[i]);
> +		if (ret)
> +			continue; /* Read error, we just skip it now. */
> +		if (check_page_if_emtpy(chip, data_buf) == true) {
> +			if (pgs[i] == 0)
> +			/* page0 is not programmed. */
> +				goto free_buf;
> +
> +			/* Mark page need to program later */
> +			empty_page_mask |= (1 << pgs[i]);
> +		} else {
> +			if (pgs[i] == LAST_CHECKPU_PAGE)
> +			/*
> +			 * If page13 is programmed, this block has
> +			 * met the requirement of robust erase.
> +			 */
> +				goto free_buf;
> +		}
> +	}
> +	/* Corrupt page0 and page1, in order to simulate an
> +	 * uncompleted eraseing scenario. Just for case of
> +	 * power loss hits while below programming. in this
> +	 * way, the PEB will be re-erased again.

Looks like the "erase the first 2 pages" thing is here to corrupt
UBI's VID and EC headers. Is this really needed? We should definitely
not assume the NAND user is UBI, and that's exactly what you're doing
here.

> +	 */
> +	empty_page_mask |= 0x3;
> +	memset(data_buf, 0xAA,  mtd->writesize);
> +
> +	for (i = 0; i <= LAST_CHECKPU_PAGE; ) {
> +
> +	/* Start to program empty page, we only program the odd page. */
> +		if (empty_page_mask & (1 << i))
> +			nand_write_page_raw(chip, data_buf, 1, page + i);
> +
> +
> +		if (i == 0)
> +			i = 1;
> +		else
> +			i += 2;
> +	}
> +
> +free_buf:
> +	kfree(data_buf);
> +	return 0;
> +}
> +
>  const struct nand_manufacturer_ops micron_nand_manuf_ops = {
>  	.init = micron_nand_init,
>  	.cleanup = micron_nand_cleanup,
>  	.fixup_onfi_param_page = micron_fixup_onfi_param_page,
> +	.erase_pre = before_erase_checkup,
>  };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
