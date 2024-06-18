Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB0CC2BA15
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wRLDoSKj8exotC+9vsOzHklArsK8xAxkd2oSiCwUZU=; b=ciGondMd1JI+hl
	fZPvlIbwFUqzIDiYbrrZaUhnyocq/bXleaKHGXMLwJEZ8Ym3e38gHMCHAgF6CvN/rC2CffiJAuV42
	ocU5AXzOU5L0PvkUMyX+1adBR8OeSTzaAbTij41pqEa2sbzjTRDoV88amT8R/77pgWWEnui6idxQA
	JBQFv3X3GrlSaBdo+lYj2HbvwdcdLwjoe/oBwttcNLf7szY7w2WQle0iUQwlYWRVIG7SJcAJXsNkU
	+tVbZrJ7X3kL3+TDVJu4cIlpgVny29ZDkHq68hQR2ePz/bqDyi/BxV7S61cO4awAFNxBMxrRUjjNg
	8n/ksExY1ZBNn+vyRcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW9b-0000000ENXe-2QlD;
	Tue, 18 Jun 2024 10:33:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW9V-0000000ENVS-1pHi
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jun 2024 10:33:26 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57cfe600cbeso436477a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2024 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706802; x=1719311602; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LrSWMgyFt1tGbnNO2P7UCfeEdrvDolnINBnHsaSNfo=;
        b=PKwR9uY3odG6WFbY3TyMDFDTKgaodRzToEjnxmE1X+bQMt50GounONzycFqdB9Yiy5
         i5DQRfxQjArXQeCDDwWbzGCmCFfvXZOFDWeGEUf6rbHemiTb6NAHdTkH1Wc035t5lwpD
         vhOZTyzZUko9iNgRkej5yCTmFyfkI4Qy5Bj2yIs8nFdmvIVR7U9FChGj3B4ScDxVhPYX
         d/C2vntf9GCLZs7KwSf2Zat88p+ahHRfmRenigQR7RSAyRl6B0pFK3+NYl/RQfzFOhSI
         WnNjxtHBSFdnyMRqRTyfHvHmeY8iO49rpFw4Cd6NDjHMKUL04ww2rsrzHbhMP0c++cni
         Z2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706802; x=1719311602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LrSWMgyFt1tGbnNO2P7UCfeEdrvDolnINBnHsaSNfo=;
        b=rIhlocjKSSs4YdxEoVTy3XQYXnBnTrrq6tD1u874ZweRLTA5DU1eRuAgAwsYObfFdn
         sXB+nAJ9GjLrWgy3ptWqzDIBqjkShQT6DpQU4H7SoObuUnhPYwKfkM58fcWg2c/wygb1
         qnHU0JA3JIOJBrJs+rv4fwtuT1x/ywrUk38nqFCnXGkxX1iddBBPUQCWaqYoLkPqKGGi
         9Igptt0+dRXcx/zGkov8vlGaILD46Bdb+GfU0iaYqG1GZxVIrCkPVjq2gmbp6q0fDLay
         WWAyvQSucqxHj+KJznbsdgWu8lZXU0mH3ZpdPRXs9j4Oy+CY03gejGyk1YdI3RYmSjuC
         uU2w==
X-Gm-Message-State: AOJu0YzIySI8tqjheBlCqOVgWD+2a0ST7XSMO8r8FgxDkZCNMRx1X124
	Nhl1jx1XuaMVFcgAOazunwR50vOj6vWxdzjHs9jG8rDMSV4e3AvxI11KbK3ZYsQ=
X-Google-Smtp-Source: AGHT+IEzJMrjAiuI3Fy97ZNQPTj97n9ZkgzQpZtU1gf7Kf7ZnduaPgCs6MOMVJ5nYE5CjVduo2rTjg==
X-Received: by 2002:a50:99d2:0:b0:57c:5637:b2ae with SMTP id 4fb4d7f45d1cf-57cbd69dc7emr7152005a12.12.1718706801663;
        Tue, 18 Jun 2024 03:33:21 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72ce12fsm7610410a12.7.2024.06.18.03.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 03:33:21 -0700 (PDT)
Message-ID: <76f8be4e-3050-4ae6-93b4-9524a0689022@linaro.org>
Date: Tue, 18 Jun 2024 11:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix w25q128 regression
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 e9hack <e9hack@gmail.com>
References: <20240610074809.2180535-1-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240610074809.2180535-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_033325_544269_6E65DE1A 
X-CRM114-Status: GOOD (  23.80  )
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



On 6/10/24 8:48 AM, Michael Walle wrote:
> Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")

That commit did:
-       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
-               NO_SFDP_FLAGS(SECT_4K) },
+       { "w25q128", INFO(0xef4018, 0, 0, 0)
+               PARSE_SFDP
+               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },

> removed the flags for non-SFDP devices. It was assumed that it wasn't in
> use anymore. This turned out to be wrong. Add the no_sfdp_flags as
> well as the size again.
> 
> Reported-by: e9hack <e9hack@gmail.com>
> Fixes: 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> Hartmut, Linus, could you please test it on your boards? Also, do
> you have a real name we should put in the Reported-by tag?
> 
> This will also need a manual backport to the stable kernels due to
> the new syntax. But that should be straight forward.
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index ca67bf2c46c3..6b6dec6f8faf 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] = {
>  	}, {
>  		.id = SNOR_ID(0xef, 0x40, 0x18),
>  		.name = "w25q128",
> +		.size = SZ_16M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

and here you add dual and quad to trigger SFDP parsing I guess. All fine
if the old flash supports dual and quad read. But please update the
commit message describing the intention. With that ACK. Would be good to
have this merged soon.

>  	}, {
>  		.id = SNOR_ID(0xef, 0x40, 0x19),
>  		.name = "w25q256",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
