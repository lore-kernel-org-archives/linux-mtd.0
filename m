Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6641DC48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 09:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3132860230
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 09:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3132860230
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGeJ3JiWdI9GlkNrRHctbKP0s+380VDPtJHJ8b89d8Y=; b=ZCUhinc8J6/BGh
	dWfRPdRRmvsxoe91NkIK0EUigFkXu0F1NlkLLdKTqgRZiB73PWayWeciF6JeQP+Iw7MaxKsmwXctw
	jxfr0VJcYv0HqAdLaWzj5q3L8CY4D6D2osQwx+2aSVe8Gagb7bd65R+D5nGfUh3CFwmU43qclIvP/
	mBDoJxiYhaeDDsrmHRYYrkGjgs3vHy3YtxzYXRg3w2p/cIt2S+spK/IHaA+uUyigW1LS0VBuzm9Tb
	SSmc8M2+cGPTTnQnD+r+RGOl0ljKCVU4U71tlgCKDvRdMuu6tr7HOl9Lc0TSPBfgJ3zhCuUODm3uV
	qMckrVkz6IUE2E3bB12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luB8L-00DdTU-DM; Fri, 18 Jun 2021 09:49:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luB8H-00DdQD-MI
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 09:49:51 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15I9ngak043474;
 Fri, 18 Jun 2021 04:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1624009782;
 bh=iqV8NYyu2Z+wt7+T9yDBVD8D5iDgl5KwgdPNRoxTtgo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=yOYougPeo5VAzEsmWB+G1Hl7fHj/fdGGu6Y1MipvVb8K1FaRcih4/eOwoAj/VlGLc
 MSbXXHTcxsM+TTU27B5GiqcirYXOuKjoOLPAUJmAGbehah9QXrHejRbs8e1qC5+tgT
 qbRbS0OK7X0FJL1OlrHZiIJS5F2MjWBKTLJ+a7tc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15I9ngEW007211
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Jun 2021 04:49:42 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 04:49:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 18 Jun 2021 04:49:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15I9nfK3015641;
 Fri, 18 Jun 2021 04:49:41 -0500
Date: Fri, 18 Jun 2021 15:19:40 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Colin King <colin.king@canonical.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH]  mtd: spi-nor: remove redundant continue statement
Message-ID: <20210618094938.ev3awgs6lhzncg7a@ti.com>
References: <20210618093331.100006-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618093331.100006-1-colin.king@canonical.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_024949_813565_17E9C176 
X-CRM114-Status: GOOD (  15.74  )
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

On 18/06/21 10:33AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> invert the if expression and remove the continue.
> 
> Addresses-Coverity: ("Continue has no effect")

I haven't seen this tag used much before. I am not sure how useful it is.

Other than this,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>


> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/spi-nor/core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 970ed6e3f3ba..cc08bd707378 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1411,9 +1411,7 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  			continue;
>  
>  		spi_nor_div_by_erase_size(erase, addr, &rem);
> -		if (rem)
> -			continue;
> -		else
> +		if (!rem)
>  			return erase;
>  	}
>  

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
