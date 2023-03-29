Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7822AC761A6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3u7eO4yi/md8rahZ3o+SI4BVJMF/ix0DpxFI8KLrYY=; b=dfUx96y1ZlE5xj
	lgZ5VmTGgA1rUcP2ztJnk4iHaUYjE9v3kEAiKimStdYPOA6ohfSzNj5aw9Jr7JoSwGBZqA/HLR4kX
	I4p1OKSX7e+ZqM83xkpOIX31/4DY6t4lCLx6T9esQI/mIAxJYHC31uHIFIDKHgx4mzavQz+PGe/ul
	k4NwolLlIceUpFb+1CxfEMhUKpcqHYYQY7ZBYC/Yn703SCdSq+her8/xrnYLQHD3VDjbuNebycA4o
	k5p15LColOfn7Nu7LhiXXJzNUyutw0GjDGRQraQgQifmloUYAWhXe0UVOB5YAabQl/W33CmdgtAwr
	jB9btebS5u7hzfE75Yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQs5-00H24k-0d;
	Wed, 29 Mar 2023 08:09:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQs1-00H21y-3D
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 08:09:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id l37so8355211wms.2
        for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2023 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680077362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLdWMB6a0VCi83xicLt30Ext28QYexvZbROoSpMQLRk=;
        b=dHX5ZUMs6uiCsDicCRaKfn2wiHQwaOjDICT1/hlsL55ZWpIG8mD40idT2wyzDpaNTe
         BTqNjgx2JHuH0Nnhe9t8YDo9Kg8lUdYRIX2mGVqZT5xPM8YndmgxS3DbfjjIh01etp1t
         2eAeTkCdAL9Y5i8VNHjWDpIBSfR7yY+xisq1zEFmyQ4BHxa9JYu31NhBWK8ytuKzACFT
         D5gcu2WobCXPYVm8A56imQq2KOzKCHmad7dIrg4HgK+lSzy8TL9qq8SsmtxQVx/AO3Kj
         rC2I4mnNwnybLo/L48S/65m28gCAweaphtcHCou0e0DpjG20BkWBEd0Fjs/anMUyGMLi
         f+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680077362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLdWMB6a0VCi83xicLt30Ext28QYexvZbROoSpMQLRk=;
        b=IVjI/l13iqAX5bHa6O4skegoHRu30A5oV0yvCe9+sv2yi4hC7PrBcbDEEZxiThxnF2
         bPwV+wNDj5FCmcChxfUlxUTg9ZLV5dPX2yFU9jjMuk3wlU9VrvciOI/18LchGazcE1pg
         7E+HKaDusDQyrEynRxybmLN/wazPHnnh+q2z+nkEqy1liWsI/FuOr3EzxaVPIWZU6PdR
         +1AlkWVUg70uUBOuztAHVKRqnfyntA7UahCRoQ0GM/T7JfKcAK5p/9UqmCBN+kN/sTDq
         CYcOi/pcQImvbuCKhTwibJLp/ZXzPkwEKjBdFZWSUhV7aRCW9ABpOOSwf1/xB9lDmzFv
         yvBA==
X-Gm-Message-State: AO0yUKVwlliTq6eLPCsHNhouKzD3kGT9YhGVy0rMCv7r4YuHitIIplcc
	Nopi8XDym7/ybxjpvtWaboPVmA==
X-Google-Smtp-Source: AK7set+yuUUNR2BqBBq1FLddiUCg9y0X+HaaE5ZzLogipqWdnk833lB7mY3jsoAlG/n1rT4XTP1w2Q==
X-Received: by 2002:a1c:4b1a:0:b0:3eb:37ce:4c3d with SMTP id y26-20020a1c4b1a000000b003eb37ce4c3dmr13865061wma.38.1680077362135;
        Wed, 29 Mar 2023 01:09:22 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b003ee8ab8d6cfsm1393756wmn.21.2023.03.29.01.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:09:21 -0700 (PDT)
Message-ID: <447abc1b-b4a3-5848-c99a-ecbff11486fe@linaro.org>
Date: Wed, 29 Mar 2023 09:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru, oxffffaa@gmail.com
References: <3794ffbf-dfea-e96f-1f97-fe235b005e19@sberdevices.ru>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3794ffbf-dfea-e96f-1f97-fe235b005e19@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_010926_035500_6CA00F54 
X-CRM114-Status: GOOD (  20.01  )
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



On 3/29/23 08:47, Arseniy Krasnov wrote:
> Valid mask is 0x3FFF, without this patch the following problems were
> found:
> 
> 1) [    0.938914] Could not find a valid ONFI parameter page, trying
>                   bit-wise majority to recover it
>    [    0.947384] ONFI parameter recovery failed, aborting
> 
> 2) Read with disabled ECC mode was broken.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index a28574c00900..074e14225c06 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -280,7 +280,7 @@ static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool dir,
>  
>  	if (raw) {
>  		len = mtd->writesize + mtd->oobsize;
> -		cmd = (len & GENMASK(5, 0)) | scrambler | DMA_DIR(dir);
> +		cmd = (len & GENMASK(13, 0)) | scrambler | DMA_DIR(dir);

What happens when len > GENMASK(13, 0)? Do you check this somewhere?

Please introduce a macro/field for GENMASK(13, 0), having such mask
scattered along the code looks hackish and doesn't help readability.
You'll get to use FIELD_PREP as well.

>  		writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  		return;
>  	}
> @@ -544,7 +544,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
>  	if (ret)
>  		goto out;
>  
> -	cmd = NFC_CMD_N2M | (len & GENMASK(5, 0));
> +	cmd = NFC_CMD_N2M | (len & GENMASK(13, 0));
>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  
>  	meson_nfc_drain_cmd(nfc);
> @@ -568,7 +568,7 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
>  	if (ret)
>  		return ret;
>  
> -	cmd = NFC_CMD_M2N | (len & GENMASK(5, 0));
> +	cmd = NFC_CMD_M2N | (len & GENMASK(13, 0));
>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  
>  	meson_nfc_drain_cmd(nfc);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
