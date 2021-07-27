Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8767C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 16:14:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E96D61B7D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 16:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E96D61B7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6baV741Mhm/YQfr/bZranQAAtLINljtfu8MjnugPrQg=; b=mzIXkaLNBElVJf
	bV2gvnA9ij8u0w9sxpj+AzYUsEzlG9YXtao4o60S6V2ga1Q0Jgdpk9uzV4BF/yiaoJibl0Oo2oQ1o
	aN7A7t0DtqugJZ7FW4qTcnhZo9yF+P8VEkbZXpLlyTyE03cO3SyhchWHbOeSHiQ4kG7XO/IKuSnJw
	YUfFLfPDvWAIpD2XCTVcjhYeWdo2hx8+nw2b7AO/ivEMp/5D/4PvSZyVvVb3+J9EEGosTKN9RDdsi
	9ucMFWIo5P4B7ijJcWFMTi/33WoHBP/zPUteAY821Do8eAOy20+UpNpvc3tS5MTr5ZMv0g65p5a9q
	s2qIr+QlhBqcQv4RNZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8PiB-00FKEg-6G; Tue, 27 Jul 2021 16:13:43 +0000
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Pi7-00FK7u-DF
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 16:13:40 +0000
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
 (envelope-from <martin@viti.kaiser.cx>)
 id 1m8Phv-0007rV-0H; Tue, 27 Jul 2021 18:13:27 +0200
Date: Tue, 27 Jul 2021 18:13:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 boris.brezillon@collabora.com, tudor.ambarus@microchip.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH] mtd: rawnand: Fix probe failure due to
 of_get_nand_secure_regions()
Message-ID: <20210727161326.wozj23a3sblibwpk@viti.kaiser.cx>
References: <20210727062813.32619-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727062813.32619-1-manivannan.sadhasivam@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_091339_640119_015AA8BC 
X-CRM114-Status: GOOD (  22.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mani and all,

Thus wrote Manivannan Sadhasivam (manivannan.sadhasivam@linaro.org):

> Due to 14f97f0b8e2b, the rawnand platforms without "secure-regions"
> property defined in DT fails to probe. The issue is,
> of_get_nand_secure_regions() errors out if
> of_property_count_elems_of_size() returns a negative error code.

> If the "secure-regions" property is not present in DT, then also we'll
> get -EINVAL from of_property_count_elems_of_size() but it should not
> be treated as an error for platforms not declaring "secure-regions"
> in DT.

> So fix this behaviour by checking for the existence of that property in
> DT and return 0 if it is not present.

> Fixes: 14f97f0b8e2b ("mtd: rawnand: Add a check in of_get_nand_secure_regions()")
> Reported-by: Martin Kaiser <martin@kaiser.cx>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 6 ++++++
>  1 file changed, 6 insertions(+)

> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index cbba46432e39..3d6c6e880520 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5228,8 +5228,14 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
>  static int of_get_nand_secure_regions(struct nand_chip *chip)
>  {
>  	struct device_node *dn = nand_get_flash_node(chip);
> +	struct property *prop;
>  	int nr_elem, i, j;

> +	/* Only proceed if the "secure-regions" property is present in DT */
> +	prop = of_find_property(dn, "secure-regions", NULL);
> +	if (!prop)
> +		return 0;
> +
>  	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
>  	if (nr_elem <= 0)
>  		return nr_elem;
> -- 
> 2.25.1

not surprisingly, this fixes the issue for me.

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
Tested-by: Martin Kaiser <martin@kaiser.cx>

Still, I was wondering if the behaviour of of_property_count_elems_of_size
makes sense. Without a prior check, there's no chance for the caller to
distinguish between "property is absent" and "property is malformed". 

Thanks,
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
