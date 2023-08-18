Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936C3C05052
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJzWHotGvCGmPMVYoBJESTqjdQO4IdQ745lgji3/DJU=; b=nrZLa4bdIyIAsEElKMBxfPAlqH
	G3PU4/MGmEmMj2Gu7+sYrgl0mPtUtyQ2wyvLJojNJrbo5p7R7t0RWqatcZyFWG7KGqaawzJC0Ay0g
	TmqpKByYPaY1AS3XPeXp5vq9m0vvGkJg3GcPu1YlMmKJiBv9cg5rC56h5FD7Fk+4qG+Eb/rjOFqcw
	qRaMqPbmLNqoUDTvDS5S+5vUEnvD2q5/qmvF+sqTKOoe9Lc0Tw04tDrhq6dfR4QIJP3fCj7xLtQAH
	1HE1Sdwf2rAwsgNM7BHdYHS/U7IsRVE9+y/S5lhMwvayVHlqSpO8GL/yKmNL+ooHj1+4TLk3bkbDK
	37/HDNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWtiK-007r6D-0k;
	Fri, 18 Aug 2023 07:16:08 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWtiA-007r5o-2d
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 07:16:06 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 83A02957;
	Fri, 18 Aug 2023 09:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692342953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Be1l9jlqDSr/+Vna3fROrPkK+Sce6tQqng+uemlZghY=;
	b=rH0DK2crq7R5+CGkVPumDVriL8K/DDyC54D3vIkceS50ytbr0635qyMrW+/YG1EHKmqSJD
	3cQugFqvvN52MjSJ6mPmE01yIsscLXSvbaQcBdr2QEVNAfwwnyF6eTl9bTPpHHpjQN6xSl
	G5FPy3PXbt0WUJrnOwLZT5tpgvaIfZIAEpx71tBWri2tqCRm4SOk3K0oODFyLN5sS7BAU1
	0SO8CVuJcDXsK1pyzZfbIR/81rWKyYn1kVMhgUv0pYfbCWrwUyBxPPINtbOzxlwUxsP6+i
	TiaaWS6jyLyMb/h2AaFLBi1PCm1WB3klbbrfVdblIJHMsGxoigLBfoaDc1lpOw==
MIME-Version: 1.0
Date: Fri, 18 Aug 2023 09:15:53 +0200
From: Michael Walle <michael@walle.cc>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: Check bus width while setting QE bit
In-Reply-To: <20230818064524.1229100-2-hsinyi@chromium.org>
References: <20230818064524.1229100-2-hsinyi@chromium.org>
Message-ID: <e8a6f1962bac27032838382663eea7e1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_001559_026519_AA8E71EE 
X-CRM114-Status: GOOD (  15.97  )
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

> spi_nor_write_16bit_sr_and_check() should also check if bus width is
> 4 before setting QE bit.
> 
> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on 
> lock()/unlock()")
> Suggested-by: Michael Walle <michael@walle.cc>
> Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

I'm not sure if the comment beneath needs an update, too.

In any case:
Reviewed-by: Michael Walle <michael@walle.cc>

> ---
> v2: 
> https://lore.kernel.org/lkml/20230816104245.2676965-1-hsinyi@chromium.org/
> ---
>  drivers/mtd/spi-nor/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 614960c7d22cc..1328128dfe65c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -870,7 +870,9 @@ static int spi_nor_write_16bit_sr_and_check(struct 
> spi_nor *nor, u8 sr1)
>  		ret = spi_nor_read_cr(nor, &sr_cr[1]);
>  		if (ret)
>  			return ret;
> -	} else if (nor->params->quad_enable) {
> +	} else if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
> +		   spi_nor_get_protocol_width(nor->write_proto) == 4 &&
> +		   nor->params->quad_enable) {
>  		/*
>  		 * If the Status Register 2 Read command (35h) is not
>  		 * supported, we should at least be sure we don't

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
