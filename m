Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A56CC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:55:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBBE613B6
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBBE613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hVNHK+bsYHovoojjmLKbJmZUYlxA4X/Cj9t1MOZvR7o=; b=kfX17oc5/2PiGPstOzwM8xbOd
	ATkT0AL5wNLMbaa9Gf28wxsCAilwoznMpm/z5z0g5fLU6LyPV7NVGQDC0p9Gnxebcbb2UG9PRHYlF
	jzze4/BdlHN1ekex7kN7ZqO6QhlDQLKtSEho30gefGkTGP4rUrFJPZq/pkw5U+sPRXjC3JC/gzTI8
	KbrIRiMktO2COc7GUoEEwNkJ3OT06Q7PK2/n0BJrMC1EKnReUJF3DRqcSHy/xidvY+1fFcPaw9MtB
	aCqjCLcLfT/ixndng1rzxDdIozGj0nezRvIHoDSabtBJwNDYZlt6EsO/1Ga5lwdm68HKAvsiD2rP6
	ySP+9miig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWIX5-009IY2-UZ; Tue, 13 Apr 2021 12:52:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIWI-009IT8-IT
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 12:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hV+sBSdg06uJCBSWfYclaLZtePK5lExXT9p5JLrGTeA=; b=Q6c3IFFkora5rbNZF0GGfU/jm2
 eG82EWUvkZBAk+Wf2PbRXP2KNUHdQI3mhEvyl2b78MX4DATRYY5NurksA+dfjBqaE9OFWpAOEHrr0
 mvc3GO0VGgzHBFzOW7GHJ6R/PFjtQvxGGHjv4AWK0vv/wjlla4BUBjbHYJGjh8TNIZae44QT/JgYZ
 Q858PSKW9T3qoBfeoL+y26XaH5BZg1hPS9ca3L9jIMW8e/BmEbwoY9sodFrvFG8XVp5AcbD3w/+EF
 D4o3iEaEWpuyHJziMcDAwMZxCwgRuXYqNFpIxEbzkYJD3VK23REGVb9eTWnBii2IM+q91BbH2+mbx
 o1iuyN/w==;
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIWG-0072Nw-2C
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 12:51:53 +0000
Received: by mail-il1-x133.google.com with SMTP id b17so13948031ilh.6
 for <linux-mtd@lists.infradead.org>; Tue, 13 Apr 2021 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hV+sBSdg06uJCBSWfYclaLZtePK5lExXT9p5JLrGTeA=;
 b=J7SpGs23XtsMueRKu661JyR+rccf1L793lTiEb89azxxpSOASDAxe4wv/9d95jqFJs
 PAW4qJw5K+F7QOKdtYH5eaadOWi4fZjFO57GkdfGc5CeHaRZg3lt1l8xnL8c5+5hsJM1
 IIsY+iDw84CMQwOhemz/YVnWE3I7RjaTQBG4MwM5PsZUGR37RqlbVa40Dnn8vEWdMLB4
 Rc/Zub12OuO8I2DrF98iIfdSVVuYkk2esPOAE3fsXxncpMHCJRUpI/ikQPDFaOQ2L/Jq
 l4Q+iracWLzebVu4Pe0LtOTPCKusT7Pxyrtb3pVX7nAuWJaGNDLf5Xqc2chIKbesMMxl
 Jx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hV+sBSdg06uJCBSWfYclaLZtePK5lExXT9p5JLrGTeA=;
 b=oOrWoU2Cr4Uje2VjaF+m6S9kkqSr0V+EdvKebL6wSwVPoc3H6vTZZ+Zb1N2nss86Fw
 O+HWnITVA1qa4ZY4ftKIC24SfgVEEV/vpVJSUGfYF+C3b7TMpRx0xedx6SEy6Y/4agI0
 +gOaURslG+KxVLsNaJqcjZeGubx7idxgiGm+uaWZb+WAOkuZFps3midGhJ3OyxYBNQRi
 AAk0/TbBQ/t44iTBiA5009/9Whm/cCxmgDAKPj6wb+if6ZSD/CoI3wmx35N0C6KjimQ8
 UjjuTM9b2Y5mmQF3Ief5Z1w8O6PZbOLO0ns3KsCNDcgpr2wWwvbwjyRSwe60hy1s3Mia
 M6nw==
X-Gm-Message-State: AOAM533aPbFcOhKlO3xKHFi449QPD8GRDQWcZxpzl5ZWrNO7jsl6o9Xl
 pWacIgwyDjK1WnHZ5XHNC5M=
X-Google-Smtp-Source: ABdhPJy//boO50IaEs92YipMfPwjULhXoBVu32sH975PxYZGVp6/C9f3yUp5+ldScxePbxtJj+OuWw==
X-Received: by 2002:a05:6e02:1a0b:: with SMTP id
 s11mr22315292ild.105.1618318310722; 
 Tue, 13 Apr 2021 05:51:50 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
 by smtp.gmail.com with ESMTPSA id g12sm6611292ile.71.2021.04.13.05.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:51:50 -0700 (PDT)
Date: Tue, 13 Apr 2021 08:51:48 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: lpc32xx_slc: Fix external use of SW
 Hamming ECC helper
Message-ID: <20210413125148.GB34377@localhost>
References: <20210413095916.330405-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413095916.330405-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_055152_126985_E62C76F4 
X-CRM114-Status: GOOD (  23.51  )
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

On Tue 2021-04-13 @ 11:59:16 AM, Miquel Raynal wrote:
> Since the Hamming software ECC engine has been updated to become a
> proper and independent ECC engine, it is now mandatory to either
> initialize the engine before using any one of his functions or use one
> of the bare helpers which only perform the calculations. As there is no
> actual need for a proper ECC initialization, let's just use the bare
> helper instead of the rawnand one.
> 
> Fixes: 19b2ce184b9f ("mtd: nand: ecc-hamming: Stop using raw NAND structures")
> Cc: stable@vger.kernel.org
> Reported-by: Trevor Woerner <twoerner@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Tested-by: Trevor Woerner <twoerner@gmail.com>

> ---
>  drivers/mtd/nand/raw/lpc32xx_slc.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
> index 6b7269cfb7d8..65663f5ba54f 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -27,6 +27,7 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/mtd/lpc32xx_slc.h>
> +#include <linux/mtd/nand-ecc-sw-hamming.h>
>  
>  #define LPC32XX_MODNAME		"lpc32xx-nand"
>  
> @@ -344,6 +345,18 @@ static int lpc32xx_nand_ecc_calculate(struct nand_chip *chip,
>  	return 0;
>  }
>  
> +/*
> + * Corrects the data
> + */
> +static int lpc32xx_nand_ecc_correct(struct nand_chip *chip,
> +				    unsigned char *buf,
> +				    unsigned char *read_ecc,
> +				    unsigned char *calc_ecc)
> +{
> +	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
> +				      chip->ecc.size, false);
> +}
> +
>  /*
>   * Read a single byte from NAND device
>   */
> @@ -802,7 +815,7 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
>  	chip->ecc.write_oob = lpc32xx_nand_write_oob_syndrome;
>  	chip->ecc.read_oob = lpc32xx_nand_read_oob_syndrome;
>  	chip->ecc.calculate = lpc32xx_nand_ecc_calculate;
> -	chip->ecc.correct = rawnand_sw_hamming_correct;
> +	chip->ecc.correct = lpc32xx_nand_ecc_correct;
>  	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
>  
>  	/*
> @@ -819,8 +832,14 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
>  	return 0;
>  }
>  
> +static void lpc32xx_nand_detach_chip(struct nand_chip *chip)
> +{
> +	rawnand_sw_hamming_cleanup(chip);
> +}
> +
>  static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
>  	.attach_chip = lpc32xx_nand_attach_chip,
> +	.detach_chip = lpc32xx_nand_detach_chip,
>  };
>  
>  /*
> -- 
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
