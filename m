Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D082C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 20:24:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13D86147F
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 20:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E13D86147F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a2gNev5DSOGp5j/dvmkC8bIs2FOYSQEjXFA0O8asQAA=; b=kQ8FEu8PA2mqNQsambMT02Y6t
	1Fnig1+g4s46aQ+BrUQiNp4u1yHHfTU9FQa3y8LR7YUlJbM2xzf5V7qwiXAcoMn25HDPDJs7Ky48q
	JllnW+EWzCs1eDHMs99r3TWpXTU0HG5gha8pNdXcZUbjuax9UkGT8Ju3Th1GS2xPVWfp/zuzjouMg
	dIgjWLvnlLfSUQNjdT7MtQBTR3xzhJfTaqn1TWD6W9Ju1fvSthXRC7c+7//3YD4DbfkTMfX2fiftM
	bLmyBWJ2kS/+oLnupS6rG3o7GigBRQi0d8nnYHByYVG2IU9mP7fW0HgXdP+9fx5kJjdIcWkukHqCZ
	GUqZiek6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgCRE-00FeeO-En; Mon, 10 May 2021 20:23:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCR0-00FecV-RW; Mon, 10 May 2021 20:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=/zh2qKj0wlhB14In1f+H+fqUjJiGKaYlhnHJZ6AKDhY=; b=PzKViJaatSBMIYY0fqviuDs5K+
 yvhXfHiJqCNsd4TcdeoaT0/Ch2DMzyMpSZSJEcSoUiigqaHMCx/9lxGsQmp7z73mgy+HlJmd/qpaE
 T+0oBIgjfFrRrNiiUwfa8Y3osgHFdrsDhvl/T9KrYJJNIvhXz678Wc705oA9O8owVTIQQp1IrWXPM
 /JsUwfQnnsV0+PQJs+rc+vQ5X79ggPjWwzlIrSoZ+jetC4OANRKv/zlwJj2nnhC0FgmOXZQQPqrFx
 YsqHzxGbjQZ7zweHRjFcH3CcuLny2SQnlq9kvIa2CJPloENLCXy0ZreH3REmximdwVVamklm4BgAS
 f1FSPGPw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCQy-0096Qy-8c; Mon, 10 May 2021 20:23:21 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5FFBF2222E;
 Mon, 10 May 2021 22:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620678198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zh2qKj0wlhB14In1f+H+fqUjJiGKaYlhnHJZ6AKDhY=;
 b=FEDZf539jsOWkamB0QjN96wz1YgV6LvkMeKWV1RwMcyQOEYpEST7cE2sN4ROXNocLlvA1L
 IxViAaqly5cZF/5EeMLRbPiVNqqVFZMnrwZWgQQrvKB4tJLs1inJ/ksUevyI6WZSe7z/jn
 bGPOBFH/HTGfLymQc2lIjkHCJ/q8cVY=
MIME-Version: 1.0
Date: Mon, 10 May 2021 22:23:18 +0200
From: Michael Walle <michael@walle.cc>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: spi-nor: Use SPI_MODE_X_MASK
In-Reply-To: <20210510141343.56805-1-andriy.shevchenko@linux.intel.com>
References: <20210510141343.56805-1-andriy.shevchenko@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8b280c0fc105ededc399ee22b940e671@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_132320_498222_EA067103 
X-CRM114-Status: GOOD (  11.87  )
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

Am 2021-05-10 16:13, schrieb Andy Shevchenko:
> Use SPI_MODE_X_MASK instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> index 5703e8313980..2635c80231bb 100644
> --- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> +++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> @@ -326,7 +326,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi 
> *spifi,
>  		ctrl |= SPIFI_CTRL_DUAL;
>  	}
> 
> -	switch (mode & (SPI_CPHA | SPI_CPOL)) {
> +	switch (mode & SPI_MODE_X_MASK) {
>  	case SPI_MODE_0:
>  		ctrl &= ~SPIFI_CTRL_MODE3;
>  		break;

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
