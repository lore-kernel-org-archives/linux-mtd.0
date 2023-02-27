Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA6C64ED8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Feb 2023 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pdbWqUR5ddaJTEtn3bpmGs+wGlTZ/Qpw0tdrXtlg9k=; b=kRZzytvUipYOqdbY4Hx9LQFmv6
	Xr5id2Dd1rWqI7HeeKqEScTErZHYw6OCieqLGn9A0xSKTrDLD5vH9qYpKtgquVKjjL8nWXmMzBmgb
	T/EygOeHKUt7AQPFDQZlR8vy8aQqRDL1bMNCaf1ChRb9h+//qcW6oHrh2GaI+DjezDAecA2wP4wFp
	DxxeJDFBQfWT8F9oAdHee2kUTb4LGiUPxVwnovJUgQyVf9y//XJGfwnJ89RaiIMRWIBIYEY4jFuBE
	ki/YTph4zJIX7HhjlHu6APEHHvJNYZz02lygYEPsi2/I8//IOTMDKd2zQU2WFDP8mi7BLiUU1vKs0
	EIMGTmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaPo-009AWL-3O; Mon, 27 Feb 2023 10:07:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaPb-009ARq-HE
	for linux-mtd@lists.infradead.org; Mon, 27 Feb 2023 10:07:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r18so5587685wrx.1
        for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2023 02:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsxevlo9XIw5q3mnw9u9AhqR6NTYzhuz0YftWRMvHew=;
        b=NDbGN3et9/mnN3haPMhulR5jj0TgVur9/HfZJLKx7RpqwVKMVvvLwPomFxtk+cWJLC
         cssqKGCjA8zKncQ62qTTjpCkO4OBFV+kJlkdXvXXwESMBt42loumc6GkOhQ2vClarTHc
         6pHKUg3pYLsLLtjy54+/NshA76eehGsBKnADO7QQslYp3bvtYtHwzE1S/AC9BLjGcVcD
         qM0LhMT4Q6kyV7v9ydTy7cb2VwJLCuv+alc2xihBR2BlhG8KORpNSyRAnSztaLiJ2epq
         W2jY30TnN8V9jJnbrLKKrcoKxIegOuA379zGwl9gtQtykZb0vQnM9iK/nIL8O7KkDwx9
         Bo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nsxevlo9XIw5q3mnw9u9AhqR6NTYzhuz0YftWRMvHew=;
        b=T5VamiBsiqG4yIJHnQRCrFYeuiN2k9fLadt4wrjA/HLOtZW6adIWZ2vO2gERMBt/7L
         GDa4pWWQiFhTMh/HsEwyZTfU/pJl8UiauO2xIqkkRL7yE1J4MYhD+92IiXdyLgaKgUcL
         BdEE8Uco23R4GMtX3C4E+9j4Ca3I5Noyce9ri1cwslOH02a3XE4a2FvLPZy5sBy+tbgI
         gc4Qbhus5jeNFxES2/SspnGL4Gw8lWg5p1IL4zhfR46Uz2PyWakgS0p2MPP2X+GSG4EA
         XxkHVtcCF4vWR+xxW0Yc0OMSHJ8iObl/+wd2swvkBFqptpb1RFqPYTzkVY0Yw96eqd72
         Osdg==
X-Gm-Message-State: AO0yUKVOV5YJXk1CcV+6hXEv6G3c/fvCDRtUJZGKURx19zEXp/NREuPC
	Gj2W1nFrdIjR51kH6LQa/LFrJA==
X-Google-Smtp-Source: AK7set/wJKbd9qt2mIOgNl6IK492UP4h+NstK+X13zcw/O3pvbJuLqEkrddz0dZwyZ2kvPGMTckXhg==
X-Received: by 2002:adf:dfce:0:b0:2c7:1b3e:362c with SMTP id q14-20020adfdfce000000b002c71b3e362cmr9316362wrn.42.1677492430808;
        Mon, 27 Feb 2023 02:07:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a200:b8a1:f5df:d07e? ([2a01:e0a:982:cbb0:a200:b8a1:f5df:d07e])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b002c54c8e70b1sm6908585wro.9.2023.02.27.02.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 02:07:10 -0800 (PST)
Message-ID: <c4803c08-c74e-ed04-3f21-aa63e6c2e734@linaro.org>
Date: Mon, 27 Feb 2023 11:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] mtd: rawnand: meson: initialize struct with zeroes
Content-Language: en-US
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru, oxffffaa@gmail.com
References: <20230227095906.754178-1-AVKrasnov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230227095906.754178-1-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_020715_783002_B6F13713 
X-CRM114-Status: GOOD (  18.56  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/02/2023 10:59, Arseniy Krasnov wrote:
> This structure must be zeroed, because it's field 'hw->core' is used as
> 'parent' in 'clk_core_fill_parent_index()', but it will be uninitialized.
> This happens, because when this struct is not zeroed, pointer 'hw' is
> "initialized" by garbage, which is valid pointer, but points to some
> garbage. So 'hw' will be dereferenced, but 'core' contains some random
> data which will be interpreted as a pointer. The following backtrace is
> result of dereference of such pointer:
> 
> [    1.081319]  __clk_register+0x414/0x820
> [    1.085113]  devm_clk_register+0x64/0xd0
> [    1.088995]  meson_nfc_probe+0x258/0x6ec
> [    1.092875]  platform_probe+0x70/0xf0
> [    1.096498]  really_probe+0xc8/0x3e0
> [    1.100034]  __driver_probe_device+0x84/0x190
> [    1.104346]  driver_probe_device+0x44/0x120
> [    1.108487]  __driver_attach+0xb4/0x220
> [    1.112282]  bus_for_each_dev+0x78/0xd0
> [    1.116077]  driver_attach+0x2c/0x40
> [    1.119613]  bus_add_driver+0x184/0x240
> [    1.123408]  driver_register+0x80/0x140
> [    1.127203]  __platform_driver_register+0x30/0x40
> [    1.131860]  meson_nfc_driver_init+0x24/0x30
> 
> Fixes: 1e4d3ba66888 ("mtd: rawnand: meson: fix the clock")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 5ee01231ac4c..30e326adabfc 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -991,7 +991,7 @@ static const struct mtd_ooblayout_ops meson_ooblayout_ops = {
>   
>   static int meson_nfc_clk_init(struct meson_nfc *nfc)
>   {
> -	struct clk_parent_data nfc_divider_parent_data[1];
> +	struct clk_parent_data nfc_divider_parent_data[1] = {0};
>   	struct clk_init_data init = {0};
>   	int ret;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
