Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C1C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFjRxqaShWnvFY+fhuZIB/DqM1gpEiMI86m+6wAa6Dc=; b=oboSRTRdosiaeM
	G3mDv/QY8/uBxOUjei7CLCJP537F5Ilq4yUsym2g0/OOvlI2mhsQJI+oIi85QUhrF8vnoXsM9wa/Q
	eB86NUjTyRFOLp3cra+dA09S2gUZrg/jqgoVKkE04KrogvX5JnL5wsyShCQbfD5oYc4GuJXsYbE7W
	fS27VYMcia1mtGHKOh4FLfHHFfop1yyQUCVav3W7DzrHa2meuG3JSYCtLqxrhvpVRYRmvlIcK/WyS
	8mBnlAYK29odB3jxwcCpsli5ikD2KSrdjfPAiOh5Ubi47v1ydlL5Mwjt0HE+Q52wjvVxIDAVyFoSa
	NnPH0kpWIc3AUK7xViBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCMCw-007cuW-6W; Fri, 15 Jul 2022 14:22:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCMCt-007crc-J6
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 14:22:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id g17so3350538plh.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2022 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=scD5Y6x8Dpii4wtV8lReK71mpwGJMxDbW8aqYBDgeNI=;
        b=P7YBPp4VxZafQR8wxDfEMTbszffEPaXUZfooPpzw1qP6Z/tBabiKR6Y/IYGtxXdoSm
         HXAtK0pa0mu8Mhm6YKeKNgVDA4QGY/dYMAFS8NKGGFKR7GsVKz42vNKVeYdosnkL067K
         JkTFwVvF8PrMOaHRLkrIq8ZKX4DkWpqpx6c3aoMgOp7wsaZhUPEWw9K1f+jYFLzEEqzd
         fIKa367VbsmEH3RbxlKciafYlSUr5nnhptjV7ZLP17UHGpmF/fXUp7TF/oUgmGgAYsQu
         D77jUOhomMXDQmKY2lWGtZr+bZUhxvU0LOuOIZXnvw1q5y2yp1mzYA3iLdxrcCtnGWao
         Q1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=scD5Y6x8Dpii4wtV8lReK71mpwGJMxDbW8aqYBDgeNI=;
        b=f1c9qWOMifaennQ2qlyGseEuBRDqssuZIJlo7Etk0kZb/9l9i2b7S0HjRIpNBC1FbZ
         inx/fstxDH/oK6qVw5hpzlzvI+xf1eK5BBv8FqdzMZVVDPtf5M0onZtIP0kAiRf9bYU8
         7yOgw3eicOYE5dUh1WZo+PioCOtxh6jBO2gkbZKtkmzyT9nU+P3i9vk66cAd3o3w2BWt
         tC4KVppP975RfzIeV3XIHVsfjTgXPnjKai17VwQ1O5CiOc4lhoQjMKoCbbxk7f7LqcdR
         UCa+sj+0u+tHRj8szUkXPbPZFP1Xghixg/tqGip3y4yJ64uwtsuRbHFXAAGXlh8C1M/v
         gLBA==
X-Gm-Message-State: AJIora/YaPn13eUs/GxRuAq3w24fOLYjbextP5w38YyTSny0lMfSJpvE
	UemSSSKR2QLQhIM29a1aOrw=
X-Google-Smtp-Source: AGRyM1s6txUyAuDdY9j0njA9GU/kwNRpimk3GXWtXzlwoE2/zj/C15RXSuCCW1nGjqoP7FNge9m7LA==
X-Received: by 2002:a17:90b:3b43:b0:1ef:d89b:3454 with SMTP id ot3-20020a17090b3b4300b001efd89b3454mr22310522pjb.87.1657894930959;
        Fri, 15 Jul 2022 07:22:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 200-20020a6304d1000000b004126fc7c986sm3312826pge.13.2022.07.15.07.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 07:22:10 -0700 (PDT)
Date: Fri, 15 Jul 2022 07:22:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>, kernel@pengutronix.de,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix setting busy timeout setting
Message-ID: <20220715142209.GA1688021@roeck-us.net>
References: <20220614083138.3455683-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614083138.3455683-1-s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_072215_652220_2DFF5E17 
X-CRM114-Status: GOOD (  25.67  )
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

On Tue, Jun 14, 2022 at 10:31:38AM +0200, Sascha Hauer wrote:
> The DEVICE_BUSY_TIMEOUT value is described in the Reference Manual as:
> 
> | Timeout waiting for NAND Ready/Busy or ATA IRQ. Used in WAIT_FOR_READY
> | mode. This value is the number of GPMI_CLK cycles multiplied by 4096.
> 
> So instead of multiplying the value in cycles with 4096, we have to
> divide it by that value. Use DIV_ROUND_UP to make sure we are on the
> safe side, especially when the calculated value in cycles is smaller
> than 4096 as typically the case.
> 
> This bug likely never triggered because any timeout != 0 usually will
> do. In my case the busy timeout in cycles was originally calculated as
> 2408, which multiplied with 4096 is 0x968000. The lower 16 bits were
> taken for the 16 bit wide register field, so the register value was
> 0x8000. With 2970bf5a32f0 ("mtd: rawnand: gpmi: fix controller timings
> setting") however the value in cycles became 2384, which multiplied
> with 4096 is 0x950000. The lower 16 bit are 0x0 now resulting in an
> intermediate timeout when reading from NAND.
> 
> Fixes: b1206122069aa ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

I see this patch was reverted in a set of rush stable releases,
but I still see it in the mainline kernel. Is it going to be reverted
there as well ?

Thanks,
Guenter

> ---
> 
> Just a resend with +Cc: stable@vger.kernel.org
> 
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 0b68d05846e18..889e403299568 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -890,7 +890,7 @@ static int gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
>  	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
>  		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
>  		      BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
> -	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles * 4096);
> +	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(DIV_ROUND_UP(busy_timeout_cycles, 4096));
>  
>  	/*
>  	 * Derive NFC ideal delay from {3}:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
