Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50A0C88E77
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKpd0Ifja+GkqYVeR/fqew3kvq8gKo+vreFTfRMsTQg=; b=vD0qBw5iZNaDdM
	Am/j0qs3BxPNzuItPsuFFhcXbv5EiiZsDkwSh0hmT3Xhuh5ZyflCNx9NLFMQsBvvPDmptUL0//nfC
	XHBqk1jpas9YRl8QOgKauxQQEPZIGPc1bNqnDGu71oO+5anBCNnyOswXd9p1RnBBPGc4xIX21YgbF
	SNtGDbmF2NQSUW3ZkqnZAl9Oc5KGIkQMY+4BR/yTD1vxaq5GYpfAzzzp3rMyIKbUFfokwAAfxV56V
	bvo5xx3dQx2QocwCIoh92UpPI0w1hBHyV16tcaeUOxBwql9wwZIR4zC73K+NPuzm8/9dfLHR9cEYs
	36v8tf4PCV9Jt2ZMjR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mWU-00000008vvI-1vcB;
	Wed, 16 Sep 2026 10:05:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mWP-00000008vuj-1d2c
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 10:05:47 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so8130785e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2026 03:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789553143; x=1790157943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSLFVgXdU1ZjalH3c+5t4p/z9xUpz8ESSa4EgBQ9fIU=;
        b=lygz9FN+H1UJwDQkcEAFmVXazKEtexqDrMmuE0UwL/TiVCtkK3rRTJDFenUA8pGdPH
         CqmgN8kibPX6t93MBaW6YmCayXaNZMlfBEDi4jGiLczqoqjgXU0dJJgfGr/Pl/ulk791
         fpcaN6QFXmOYfYMXpFM2edvCf39vc0+QhgDlnNP2R1SdIQYgsuOtRF3jbH+Re86Pvot7
         8GMQZeye0a+bsFujU3HesNNMlpWDL1pbB6eo3JRNyFn0MBcq5UPccwvP9yR0MirzC5xB
         RwaJgo380K8zSpOtd12nksaYghuDCRawi/cqqjgwwx797/+6E0Sz5BSCex/VgBc/KNF4
         dSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553143; x=1790157943;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSLFVgXdU1ZjalH3c+5t4p/z9xUpz8ESSa4EgBQ9fIU=;
        b=PTVuKo3MXGBkK8WlR0Qyu+7NRvBQfGpSWWCW1eBBRrHRyOGZkTkeBM8uVenZK38nec
         cCltP69orj0eYMJ4hmnmLA2v9GO7pZNhFBEZKI6K8qmmtulMndKviTFxr+T8nTe7g6C8
         p+KryIQB/3JfNa1kvFRDvvW//tud/ozjCO7zfzutoo5bl6+paZNTOOlMkc5Q0zYca8IN
         QeJsAa6rpkdnNEeO83wjZ7VEGfUIODhgs0gV7pNVkjasCdrkCO0pz3t/cgNFNkSVOi6Y
         cF9+1iaynrvv4p0Dm/Dax6p0y2i514XOGt9pdKCyF6ejSU3kwZSTz+XrC/YjM5rUwE4B
         MBCA==
X-Forwarded-Encrypted: i=1; AKwUvBzNakb3E3nYvTbEjfIcZo9M7A3g8Bzq2lkyntL5iINRGfY6AL2wK2zeSfCarhdcoEDY4qISmJ5IRk0=@lists.infradead.org
X-Gm-Message-State: AFuF++kiHGBGv3k5Hsyuo187bjttOYZCX8LqrVUqpqZGLKgwflOALdgW
	LEaUuAlb8AE1a1/vk8WkV04AAIzCpUtWjxIWqutw2vtA+PCiMEhOIObA
X-Gm-Gg: AYBFou0k8UoC501UU/xgn8hExZgh5S7lUmXuiHrw3M3THr/eP2zWxKnTXgJnjMmxvjm
	mskQGJIQ2l7YezZR9wlOgV+14hPnpJ9ldt5DTbKlez6wzHj9cmDnGoB5So4gavoYXPig47WPmk2
	IkqvAtbg+0B7nUBmgxrD08FA/CAVDddh/xSLjZwSKAwUJg/BbIbCGblyv9WO/zu63GWtwec0wqp
	kJMH8S9UsJn52Pa81mk5bXL3LrrhvOTocJ09K0TftjedJbi7Kzso/0zDk+V+T2BM7258jxKSZFX
	Hj50YiNkpt/5KudYTOUjvq6na2Gzgb//1cybNd5/DYtViqVo/Sg1LJN4MV09RKx29xYgDBiNtVm
	mfJIuS8kU50mGlrKZlmqRHzWhH7iUDJw6eNQ6+c/alMTk3jyTtGr9+SwAMsn/XP8nLWvBeVkat6
	rOtUCG6itXiB028NUjBO03T55LbvJFC3Zgbd8vFbMf7RG5n9egdXUK1+pz36aPvmj55FFzLYH5E
	IHDA4gK9kqfEGrxWMLg1unYsLx6wEsU2LGp
X-Received: by 2002:a05:600c:3547:b0:49e:7423:687c with SMTP id 5b1f17b1804b1-49eac46377amr20615655e9.1.1789553143138;
        Wed, 16 Sep 2026 03:05:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fca640sm39034375e9.1.2026.09.16.03.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:05:42 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:05:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, HyeongJun An <sammiee5311@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Message-ID: <20260916110541.35d70289@pumpkin>
In-Reply-To: <20260915194203.3511147-1-arnd@kernel.org>
References: <20260915194203.3511147-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_030545_773556_29530AE0 
X-CRM114-Status: GOOD (  23.41  )
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

On Tue, 15 Sep 2026 21:40:31 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Two large spi_nor_flash_parameter structures on a function stack
> is really too much, and this can exceed an otherwise reasonable
> frame limit:
> 
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> Change one of them to a dynamic allocation to make this more reasonable.

It wouldn't be much more complicated to do a single kmalloc() for both.
Then replace then memcpy() with structure copies for type safety.

Might stop saskiko bleating as well.

David
 
> 
> Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c21a6953db96..5d0901074f50 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1520,7 +1520,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  {
>  	const struct sfdp_parameter_header *param_header, *bfpt_header;
>  	struct sfdp_parameter_header *param_headers = NULL;
> -	struct spi_nor_flash_parameter params, params2;
> +	struct spi_nor_flash_parameter __free(kfree) *params = NULL;
>  	struct sfdp_header header;
>  	struct device *dev = nor->dev;
>  	struct sfdp *sfdp;
> @@ -1532,7 +1532,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  	 * Get a backup of all the parameter to roll back to in case of an
>  	 * error.
>  	 */
> -	memcpy(&params, nor->params, sizeof(params));
> +	params = kmemdup(nor->params, sizeof(*params), GFP_KERNEL);
> +	if (!params)
> +		return -ENOMEM;
>  
>  	/* Get the SFDP header. */
>  	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
> @@ -1652,6 +1654,8 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  
>  	/* Parse optional parameter tables. */
>  	for (i = 0; i < header.nph; i++) {
> +		struct spi_nor_flash_parameter params2;
> +
>  		memcpy(&params2, nor->params, sizeof(params2));
>  		param_header = &param_headers[i];
>  
> @@ -1711,7 +1715,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  free_param_headers:
>  	kfree(param_headers);
>  	if (err)
> -		memcpy(nor->params, &params, sizeof(*nor->params));
> +		memcpy(nor->params, params, sizeof(*nor->params));
>  
>  	return err;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
