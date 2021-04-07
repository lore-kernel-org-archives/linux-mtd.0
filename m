Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD53C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 07:43:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F316139B
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 07:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37F316139B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NciqOhc1H7mMPQP+opkYzLZVgI8PFQYB4agsCdDKISk=; b=c7jAdTVQj12zSkYYbl4rE5JXm4
	c1xam+QKleOxchNiSQMbv35ajOAVchzV8R+Srcdq/3TWzQbnbU+UiuIRkCzIK0ffbHQVIVqcMEed3
	b/H2quZ2gwGOuQLwx14sTz0VVRCzEqn9xm6CBECNL0dQlPnA+bAOXYP6dUeew9xIsjmVSIEnR2CdQ
	ropjbIGQbydJ5P50oNCKGOC1X52Bftfwylj/Zo99wJUJK4R9AtnMpzEIDuLSQACZuq/g86jqdSBNm
	vb+Z4iEz4W1ZyWha4FVFKqxT5/K9SiHc2gRJLMDUbcTaHWOJrEsX7HhOKv408t3xu6VqQBhKyHS+Q
	ghXTPKsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU2pY-004QCD-LB; Wed, 07 Apr 2021 07:42:28 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU2m4-004Oc5-1J
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 07:38:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 06D941D8A
 for <linux-mtd@lists.infradead.org>; Wed,  7 Apr 2021 09:38:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOCjyEcPq3_2 for <linux-mtd@lists.infradead.org>;
 Wed,  7 Apr 2021 09:38:47 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id D97C23D13; Wed,  7 Apr 2021 09:38:47 +0200 (CEST)
Date: Wed, 7 Apr 2021 09:38:37 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 04/16] mtd: rawnand: onfi: Use the BIT() macro when
 possible
Message-ID: <YG1hfXwMqGTMy+XZ@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
 <20210402095145.254867-5-miquel.raynal@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20210402095145.254867-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_083853_392018_918EC893 
X-CRM114-Status: GOOD (  16.93  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hei hei,

Am Fri, Apr 02, 2021 at 11:51:33AM +0200 schrieb Miquel Raynal:
> Update the onfi.h header to use the BIT() macro.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/onfi.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
> index 339ac798568e..cf14474bc454 100644
> --- a/include/linux/mtd/onfi.h
> +++ b/include/linux/mtd/onfi.h
> @@ -24,17 +24,17 @@
>  #define ONFI_VERSION_4_0		BIT(9)
>  
>  /* ONFI features */
> -#define ONFI_FEATURE_16_BIT_BUS		(1 << 0)
> -#define ONFI_FEATURE_EXT_PARAM_PAGE	(1 << 7)
> +#define ONFI_FEATURE_16_BIT_BUS		BIT(0)
> +#define ONFI_FEATURE_EXT_PARAM_PAGE	BIT(7)
>  
>  /* ONFI timing mode, used in both asynchronous and synchronous mode */
> -#define ONFI_TIMING_MODE_0		(1 << 0)
> -#define ONFI_TIMING_MODE_1		(1 << 1)
> -#define ONFI_TIMING_MODE_2		(1 << 2)
> -#define ONFI_TIMING_MODE_3		(1 << 3)
> -#define ONFI_TIMING_MODE_4		(1 << 4)
> -#define ONFI_TIMING_MODE_5		(1 << 5)
> -#define ONFI_TIMING_MODE_UNKNOWN	(1 << 6)
> +#define ONFI_TIMING_MODE_0		BIT(0)
> +#define ONFI_TIMING_MODE_1		BIT(1)
> +#define ONFI_TIMING_MODE_2		BIT(2)
> +#define ONFI_TIMING_MODE_3		BIT(3)
> +#define ONFI_TIMING_MODE_4		BIT(4)
> +#define ONFI_TIMING_MODE_5		BIT(5)
> +#define ONFI_TIMING_MODE_UNKNOWN	BIT(6)
>  
>  /* ONFI feature number/address */
>  #define ONFI_FEATURE_NUMBER		256
> @@ -49,7 +49,7 @@
>  #define ONFI_SUBFEATURE_PARAM_LEN	4
>  
>  /* ONFI optional commands SET/GET FEATURES supported? */
> -#define ONFI_OPT_CMD_SET_GET_FEATURES	(1 << 2)
> +#define ONFI_OPT_CMD_SET_GET_FEATURES	BIT(2)

lgtm

Acked-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

>  
>  struct nand_onfi_params {
>  	/* rev info and features block */
> -- 
> 2.27.0
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
