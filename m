Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67198C43444
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:30:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC3E2087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IjvXhagj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN01m9ZN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FC3E2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDgoDDsARoO8DOlpIMS8s2a3DMHVYiDRCoQIkDXNJpA=; b=IjvXhagjMLdMHd
	MSDNsqVDfG0TuWjK+B+HsgAF6/deLTV8joHUF4iRFd3NlNMTIJzDz0dqKMoJMPqZAFWI+sg5Micyz
	3EY9G8/TsXVtAul1qK3+VWNhirOH74aaj50acbZQmOxcBf++AEioLzI9cIjKeUtRzBEeyCRt48AVm
	5x4OkDKJ1vRvYrBgf8NjugFaZuSOg/hCsOzCrSoUP1ihi0LQEyEI9heB0FwIcNLZkS5pr5hiBHPJS
	620LLnmw2VDOWT1MD+J8Sxs+fCrxG1RtTiAEDqdPUqc5GNP2YAX/u0iFxHdgk08ZRG8XxSMZsVTj+
	/fgZIyk9+WgMBPgFzhTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPXL-0007th-L0; Fri, 18 Jan 2019 08:29:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPXJ-0007tN-J5
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:29:58 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2377D20823;
 Fri, 18 Jan 2019 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547800197;
 bh=GgTgbns2eBfbuAhJFW8BVh1if6T7NrQ/79Ib8cLi7Jc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GN01m9ZNdfnMopO3lxIGSmJv7xE2mcBPox0kH63eosGeQFT+u56fB6vk0Uwfivyam
 MF8RoX2BORZW2M7lX3TM1ycmc+5tznUBB6RCoKlzix7UuaLE8gcGMTNnH9+tMIxIpB
 BhaVyuJemC3BK++4JKW+f7cP4DAJbxISUCro3wAI=
Date: Fri, 18 Jan 2019 09:29:45 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 5/8] mtd: rawnand: jz4780: Add ooblayout for the JZ4725B
Message-ID: <20190118092945.4ca0fef2@bbrezillon>
In-Reply-To: <20190118010634.27399-5-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
 <20190118010634.27399-5-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_002957_673932_8038657D 
X-CRM114-Status: GOOD (  20.54  )
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
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 James Hogan <jhogan@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 22:06:31 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
> NAND, so it makes sense to use this OOB layout unconditionally on this
> SoC.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/mtd/nand/raw/jz4780_nand.c | 40 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
> index cf24bf12884f..073b3da5c3f7 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -34,6 +34,7 @@ struct jz_soc_info {
>  	unsigned long data_offset;
>  	unsigned long addr_offset;
>  	unsigned long cmd_offset;
> +	const struct mtd_ooblayout_ops *oob_layout;
>  };
>  
>  struct jz4780_nand_cs {
> @@ -208,7 +209,7 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
>  		return -EINVAL;
>  	}
>  
> -	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
>  
>  	return 0;
>  }
> @@ -398,16 +399,53 @@ static int jz4780_nand_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				 struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section || !ecc->total)
> +		return -ERANGE;
> +
> +	oobregion->length = ecc->total;
> +	oobregion->offset = 3;
> +
> +	return 0;
> +}
> +
> +static int jz4725b_ooblayout_free(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = mtd->oobsize - ecc->total - 3;
> +	oobregion->offset = 3 + ecc->total;
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops jz4725b_ooblayout_ops = {
> +	.ecc = jz4725b_ooblayout_ecc,
> +	.free = jz4725b_ooblayout_free,
> +};
> +
>  static const struct jz_soc_info jz4725b_soc_info = {
>  	.data_offset = 0x00000000,
>  	.cmd_offset  = 0x00008000,
>  	.addr_offset = 0x00010000,
> +	.oob_layout  = &jz4725b_ooblayout_ops,
>  };
>  
>  static const struct jz_soc_info jz4780_soc_info = {
>  	.data_offset = 0x00000000,
>  	.cmd_offset  = 0x00400000,
>  	.addr_offset = 0x00800000,
> +	.oob_layout  = &nand_ooblayout_lp_ops,
>  };
>  
>  static const struct of_device_id jz4780_nand_dt_match[] = {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
