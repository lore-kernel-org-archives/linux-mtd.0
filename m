Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D67BC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B97F2082E
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OsYJNTfB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vt6nDFvj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B97F2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOPKCnQSEslqlgh6rWnepvxVpKRvXQGamBmoY5NLMyE=; b=OsYJNTfBQ45hXT
	0zTdA8nnOKWjVdn5zyi0xzbZo4zdHw7uxHHwCAUe2rPyL8Mfpf6MKDr33AKpZlDcQzwA8mJ29c6Jw
	gctP9wuv5YVFMKRcPogzaXm4koY3UlRZbBJpNkKY12GuvhKnirnPy8Psl9V6gk/K/yRutPuf7181Q
	UALQ1fm4p+xNCTTYz/glEX9YD4acT1AXAtzFmBKroReMjSbql+26PO2K0wnCfL6AJ6yq9Dq3EA1Qu
	Yomyze+1z89cOtaqeQUHpJ0uvFQTdawW/sD4eLvhyhmhuZUW6gMp4JQLDGtBKTYxEoCstQxf17e/x
	gx6urUXa57IBHlkV/kzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqCEP-0003BZ-Fy; Sun, 03 Feb 2019 07:30:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqCEL-0003BF-Tt
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 07:30:19 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 145EA2082E;
 Sun,  3 Feb 2019 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549179017;
 bh=ks2ipiHZO/uli19qRFyFeK4eQsVOw+M0yb9vwKcyKyU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vt6nDFvjM/1AJfkvoon46cXaIwEVMxEnXrDG4pAFEWPjSR1B+cTUWDpYRVjo7yMQ1
 GdpWKGgJ99PR4RCuyQ4X5Zi5zLQA5nn9wwYbFLT3g0z0hNLhmuf2a3D5o7g119EGtA
 +9x3wLZYs7w0t8RR2rR85VEG4X6tsqSkNiFrJIT4=
Date: Sun, 3 Feb 2019 08:30:04 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 6/9] mtd: rawnand: jz4780: Add ooblayout for the Qi
 Ben Nanonote
Message-ID: <20190203083004.390b96be@bbrezillon>
In-Reply-To: <20190202231926.2444-7-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-7-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_233017_999110_B62DD18C 
X-CRM114-Status: GOOD (  20.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  2 Feb 2019 20:19:23 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> The Ben Nanonote from Qi Hardware expects a specific OOB layout on its
> NAND. If the "ingenic,oob-layout" device property is set to "qi,lb60",
> this specific OOB layout is used.

I'm really not a big fan of this ingenic,oob-layout property, it
encourages people to use new custom layouts which is just a pain to
maintain. I understand that we don't have the choice for this board as
it's already upstream, but maybe we can avoid adding this prop and
check the root compat (which should contain the board name). 

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: New patch
> 
>  drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> index baebb9a5c7c8..4b304eceae8d 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> @@ -346,6 +346,41 @@ static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
>  	return 0;
>  }
>  
> +static int qi_lb60_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				 struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section || !ecc->total)
> +		return -ERANGE;
> +
> +	oobregion->length = ecc->total;
> +	oobregion->offset = 12;
> +
> +	return 0;
> +}
> +
> +static int qi_lb60_ooblayout_free(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = mtd->oobsize - ecc->total - 12;
> +	oobregion->offset = 12 + ecc->total;
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops qi_lb60_ooblayout_ops = {
> +	.ecc = qi_lb60_ooblayout_ecc,
> +	.free = qi_lb60_ooblayout_free,
> +};
> +
>  static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
>  				 struct mtd_oob_region *oobregion)
>  {
> @@ -409,6 +444,8 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	if (!ret) {
>  		if (!strcmp(layout, "ingenic,jz4725b")) {
>  			nfc->oob_layout  = &jz4725b_ooblayout_ops;
> +		} else if (!strcmp(layout, "qi,lb60")) {
> +			nfc->oob_layout = &qi_lb60_ooblayout_ops;
>  		} else {
>  			dev_err(dev, "Unrecognized OOB layout %s\n", layout);
>  			return -EINVAL;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
