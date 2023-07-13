Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACCDEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 03:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gv9Ee7lrIJ3k0E5GXJw3TJ48gGgkxdhwszi4UdbtV4Q=; b=FtVXl9zhjEB7It
	kIfyWPQPz1ldOgSDyaBNEw/eJzIlYGh+ndhotRUTLJi4zyG3H3vtlENghe7ljCXFz60FlEjVtSjGw
	aynSk9kVvBBZWpw82rt7Ku+9fYlWprDYkDwQob/AOKbxPwKgyW8PpGYYK6yZKvRYIddWazPIa5X5L
	XRFZLnr/u7TT4a1psJOS8JxKeedK13taaVe9HH2oVQuiKcfPclLPEzLNloGMvzklmy1+Z+072pXOU
	D8u9s8x8iHLyqEhmQ6bOF9t/6JLcLMWpGgWR/CLddGQU4P80NjGjrFNJws2ph3RAp0FVHV37zCiw5
	mD3UtloWyOspFF/hl3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnFN-001qBC-2B;
	Thu, 13 Jul 2023 03:44:05 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnFK-001qAm-1U
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 03:44:03 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b703d7ed3aso2504041fa.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 20:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689219840; x=1691811840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTbP1J/nwSjcXc7oGaL+bm/G4DKvNXMu7J3uatvOts8=;
        b=LzYjIz0eKJ+o/UWAmmsgfqVJOA1psg+NeklD99vZZrKysIsFzn7kvdqowRUo6DcKc8
         edsE3s4ux7XOtFXCHe6iGNbPOQXOpviCYf9ba9gNOY3tjtTpIqAMk+0Yz9D4ZMtYGdHQ
         3/3pFNYG7MN3Pp+HXRkwsmsnysEmH7DDCsNIOrR3E47JMQVoTsq92YbSeMfDKI+OvJDi
         yOVMeld5zffDEKOToL+LPrbxrPKO7K1MwQWNdiYeAdm6/hlZTWPeb8Ie/in7iEwzcSjx
         1+nyus0js/G7Y22WVKszxu/99xWQ1h0RAW2erUM7trr8mUQ4tdtE30h43TaKF2jPW8SY
         Ro+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689219840; x=1691811840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTbP1J/nwSjcXc7oGaL+bm/G4DKvNXMu7J3uatvOts8=;
        b=k71JdjgOr/9HG+zFm6JenqEbvnklYDA8cMi6WrMk5HGgt0YZFk/cxVHfnGFFmQ5kjl
         Th2jwEjT8vDQOsL67vPHPnLuS4jMeFmQuMgx46yKG6gz4LB5mllUK40C1M3rdobi6tqm
         wab6icezO2CY7S43KB14SBx2HHQ2xuECUmcbGOphxT8urPZEbXXKu4IEtlfBOjZTcqAO
         4mzWj5krf9tyS8LllNnfOkAkM/W3ZXfVIVqcAqiKJ9hLVyd2sU7pthejnH0ScAs33Hd2
         Qfm3qoHQvxel1CzXK+ObO49A/ZmRw2Rihe8A+PyI87YGvNTGfW3DrMhD4ZhfG4zUnolp
         lsRQ==
X-Gm-Message-State: ABy/qLaOb3rNBRAjcVVEBGz/HY/ONUnAnZrwK8z2fba9oMg2iyOXjtc5
	jO/9esqHzETuBcDBn+AmA/70aw==
X-Google-Smtp-Source: APBJJlGF7GVH8kjO6cwksonghpUEBQvgHWbMEBanqIT6DT7j1keMqjRkNlU4G/0MeBcxb7F0cr7aYg==
X-Received: by 2002:a2e:9a8a:0:b0:2b4:765b:f6ee with SMTP id p10-20020a2e9a8a000000b002b4765bf6eemr200703lji.41.1689219839633;
        Wed, 12 Jul 2023 20:43:59 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id v6-20020aa7cd46000000b0051e3385a395sm3690688edw.3.2023.07.12.20.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 20:43:59 -0700 (PDT)
Message-ID: <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
Date: Thu, 13 Jul 2023 06:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
To: Mamta Shukla <mamta.shukla@leica-geosystems.com>, pratyush@kernel.org,
 michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_204402_529898_25BB1542 
X-CRM114-Status: GOOD (  17.49  )
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



On 05.07.2023 18:49, Mamta Shukla wrote:
> mt25qu512a[1] supports locking/unlocking through BP bits in SR.
> 
> Tested using mtd-utils- flash_lock/flash_unlock for MT25QU512ABB8E12.
> 
> Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211
> Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
> ---
>  Changes in v2:
>  - add Link tag
>  - fix chip part number mt25ql512a->mt25qu512a
> 
>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 4b919756a205..08e94340ebaa 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -229,6 +229,8 @@ static const struct flash_info st_nor_parts[] = {
>  		MFR_FLAGS(USE_FSR)
>  	},
>  	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> +		      SPI_NOR_BP3_SR_BIT6)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		MFR_FLAGS(USE_FSR)

Can you try the following instead? We try to use SFDP parsing whenever
possible.
	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 0, 0)
		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
		SPI_NOR_BP3_SR_BIT6)
		PARSE_SFDP
		MFR_FLAGS(USE_FSR)

You then have to dump the SFDP tables and do a sanity check to make sure
everything's fine after your changes. You can an example on how to do
that on the commit message from
https://lore.kernel.org/linux-mtd/8b7d2420-26b6-405b-8ef7-75e0a0201402@linaro.org/T/#m3550973e0884ec4a288d344fabd4a9c3b64af46e

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
