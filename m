Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E60EC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D92060EFE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D92060EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9vkLoADbI0NuRaELmPuml6Zyp3aFp0vrGmvhdhU2+Q=; b=gqJ5OuaAhQcl2q
	uJeGNuLfJ7WQgce/T/3b93GZsuN13/IclGI6QQcI1stTUIEL9dBe6Xa4R5CsXe8tts7v77+uZntMc
	mt7iyHRSzONPNiSoRAp9k3bgAQTbnKgRoXvQydNou7AoYJAFq1rJvusGcxUBb29YftPUiEWvmYQFX
	eqYrP4zTlA6mf/Z9IkJUlvrAgIRz/gG+9jsD0md7HHWjMUnSth+PMYeE9fqZ/vVAdd6EBWNDFwPLK
	/6VsroCeMqGIHP+Vi2Gb2Kf0pR9C3n+o+omv84++Lk9f+j+sY+2dK5xESd6bzlM55FtAVAESetWfE
	psct2jTuvUx7cLqmITww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiC9-0007QC-Ph; Mon, 16 Aug 2021 19:22:50 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiC3-0007Ne-Dq; Mon, 16 Aug 2021 19:22:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GJMMjG049049;
 Mon, 16 Aug 2021 14:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629141742;
 bh=dhRzYaiDJgR5lYmcJc+OPKDeFBw2bVpgNAuP9E4wIF8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=DQtjJSAhuMBYv/P0NSDGkOB6C4VEzXL+aE8bHtbZL4exIzv6it94rnwfG0yPwLY4V
 TcFStGY+j8p7V7ACQXdF0O8wnmTFcV16uSjiGdoWTxdWNa6Qn0bJR7VQibgI4CU+rw
 Ibvkww2U/ObXZy0hBkEOG2UcEgHtzuGFbEsnNoTw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GJMMrM072491
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 14:22:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 14:22:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 14:22:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GJMLO8010089;
 Mon, 16 Aug 2021 14:22:21 -0500
Date: Tue, 17 Aug 2021 00:52:20 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 14/35] mtd: spi-nor: spansion: Use manufacturer
 late_init()
Message-ID: <20210816192218.lv367at2tjeu2rpj@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-15-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-15-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_122243_626376_E167A5D0 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 07:52AM, Tudor Ambarus wrote:
> spansion_post_sfdp_fixups() was called regardless if the flash defined
> SFDP tables or not. A better place for this kind of parameters init is
> in manufacturer's late_init() hook. post_sfdp() should be called only
> when SFDP is defined. No functional change in this patch.
> 
> Instead of doing the 4b opcodes settings at manufacturer level, thus
> also for every flash that will be introduced, this should be done
> just where it is needed, per flash. I'll let this for other patch.

Yes, agreed.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/spansion.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index ee82dcd75310..aad7170768b4 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -276,7 +276,7 @@ static const struct flash_info spansion_parts[] = {
>  	},
>  };
>  
> -static void spansion_post_sfdp_fixups(struct spi_nor *nor)
> +static void spansion_late_init(struct spi_nor *nor)
>  {
>  	if (nor->params->size <= SZ_16M)
>  		return;
> @@ -287,13 +287,9 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
>  	nor->mtd.erasesize = nor->info->sector_size;
>  }
>  
> -static const struct spi_nor_fixups spansion_fixups = {
> -	.post_sfdp = spansion_post_sfdp_fixups,
> -};
> -
>  const struct spi_nor_manufacturer spi_nor_spansion = {
>  	.name = "spansion",
>  	.parts = spansion_parts,
>  	.nparts = ARRAY_SIZE(spansion_parts),
> -	.fixups = &spansion_fixups,
> +	.late_init = spansion_late_init,
>  };
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
