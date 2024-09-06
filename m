Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657ADCE7B1E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHovVHkVdTZ8Dnh14iFHnkzpndiGegDt5WW9J2Dp59k=; b=DdSA+zIP7WoH1c
	KlUfc+27vCqB1FqqTjAoLa+sCBEdUen9KsVZmnhrXL71HaxMl+AO4cjMVfiF6cU257xM0Yqr576Il
	Ah/PWUuR9/zvongfmkgkyLmtKdiffIgkQqNAipid/eApJPcH9nl5nkPHE0iWPdlR4UoyanXpg9Zc5
	PRP8UG+LxI0Chs+KPWV9/GHHibHYCzXLhUeDPY+icrjKloyVAjOFBWvxvoPJeOtrp+i3twSg9uqAk
	waxu+nX+sM1nhhjUcxeFnz/EX2AiwsYz/o5oLyK8Nijp3vOD0nay6wzElGlWV5xzDt1j6Xy7jnfs8
	tR0jc6fqyfOwr3/u/IeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaTt-0000000CeaY-3wrC;
	Fri, 06 Sep 2024 15:02:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaSt-0000000CeUR-3Twu;
	Fri, 06 Sep 2024 15:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41B8DA4088A;
	Fri,  6 Sep 2024 15:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B325CC4CEC6;
	Fri,  6 Sep 2024 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725634894;
	bh=JGARBGQYM9rvnG+Ksz//Z9/ee+GWOmeS3mMhf6hzV6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jPmQml6H0BN2m2UCTbMkLVjYSKCV65CBR4t0dYZl5WfPlm+sg71F52PGKdaCTSPGo
	 cdHNA65YYU+TFzAQpCC8q7cQ+d8o0p+92i0aLrD3Qxv31oMrNgLCM03XEM5wvh5+SM
	 Mpw9ewKLQvvt7aj83RfJ/k7eRCqUE3tKJtLu9YDAtZexNe8VI6CBpAMEGarghrSjAO
	 9xficJaDv5sIN2Mj0fVHlIs0w9Zp/yozf2RS3ZGq2x+yi4M3iTZMK70be7Y2/aqRXr
	 OhQPrKJhjl9QFNmJTQIYx2NO0uk2IABCR2Yn4Dd5Fnm7GJvru+58g0dbpLUn1Fq8Tz
	 fft7cHsZxd6tA==
Message-ID: <3665154b-6794-4f65-bcd6-ca53f06d1422@kernel.org>
Date: Fri, 6 Sep 2024 17:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next 1/2] mtd: rawnand: mtk: Factorize out the logic
 cleaning mtk chips
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240826153019.67106-1-miquel.raynal@bootlin.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@kernel.org>
In-Reply-To: <20240826153019.67106-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080136_029901_C3D5A52E 
X-CRM114-Status: GOOD (  16.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/08/2024 17:30, Miquel Raynal wrote:
> There are some un-freed resources in one of the error path which would
> benefit from a helper going through all the registered mtk chips one by
> one and perform all the necessary cleanup. This is precisely what the
> remove path does, so let's extract the logic in a helper.
> 
> There is no functional change.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>

> ---
>   drivers/mtd/nand/raw/mtk_nand.c | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index d65e6371675b..bf845dd16737 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1429,6 +1429,23 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>   	return 0;
>   }
>   
> +static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
> +{
> +	struct mtk_nfc_nand_chip *mtk_chip;
> +	struct nand_chip *chip;
> +	int ret;
> +
> +	while (!list_empty(&nfc->chips)) {
> +		mtk_chip = list_first_entry(&nfc->chips,
> +					    struct mtk_nfc_nand_chip, node);
> +		chip = &mtk_chip->nand;
> +		ret = mtd_device_unregister(nand_to_mtd(chip));
> +		WARN_ON(ret);
> +		nand_cleanup(chip);
> +		list_del(&mtk_chip->node);
> +	}
> +}
> +
>   static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
>   {
>   	struct device_node *np = dev->of_node;
> @@ -1567,20 +1584,8 @@ static int mtk_nfc_probe(struct platform_device *pdev)
>   static void mtk_nfc_remove(struct platform_device *pdev)
>   {
>   	struct mtk_nfc *nfc = platform_get_drvdata(pdev);
> -	struct mtk_nfc_nand_chip *mtk_chip;
> -	struct nand_chip *chip;
> -	int ret;
> -
> -	while (!list_empty(&nfc->chips)) {
> -		mtk_chip = list_first_entry(&nfc->chips,
> -					    struct mtk_nfc_nand_chip, node);
> -		chip = &mtk_chip->nand;
> -		ret = mtd_device_unregister(nand_to_mtd(chip));
> -		WARN_ON(ret);
> -		nand_cleanup(chip);
> -		list_del(&mtk_chip->node);
> -	}
>   
> +	mtk_nfc_nand_chips_cleanup(nfc);
>   	mtk_ecc_release(nfc->ecc);
>   }
>   

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
