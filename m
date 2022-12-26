Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603FFC46467
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 08:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/ZJ39c6irbXTob0eMajC9xDAOigfq15MENJ5qTeV3Q=; b=gDNaSUwXGcgjwy
	zq6Rhzm5iHPCC5ciJBrEU1zRZ14nwpRuk0ir5EV0DqW6XLP2xgZme3PYXOh04sSheJYr9g/cHmeI0
	2F7Rk6p7kVpiS3iUI5S0VS3KGk5nEum1b9oVBbluUAuEsbA3xt80hOpwqedpp3hlmJI7cPGdCfOKy
	DddrVIifWjpNVQE3+GE58nRZqGQIcBHVPuRrV3Jwx1H062zilb42oztrf2wLLh3QitT2+jVMb/gg1
	/CamQtWp50G/SSo1tFIwGGeNbicKDTRqsly9dDXjwlr+XqY1pQFBI2lvGCUD6oYiV4m9j6cneQKCH
	eUk9Hs31zOme/ZBmLzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ibD-002dGk-4F; Mon, 26 Dec 2022 08:12:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ib9-002dFr-U1
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 08:12:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id h12so5899496wmq.0
        for <linux-mtd@lists.infradead.org>; Mon, 26 Dec 2022 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=js3TL2/kH+RzQ+7Oe4DwrXCAreJ1aNAmnn2LZazzYwo=;
        b=PHdhoPdZtHYI2ghJY6uGIZywGaGEMzyqhtRWz40QquY8smrCoTYirmYRyVu8NQ3+5H
         TrZ/hD+Ol5ko06NlaWeenllzBjW+VfC58WO84kLQmqibQLoxXsl00/Jy43s+//aJHAIa
         YKLWeTYqdDJjrmst4sp9n303Q1XYsWU/htHYglV4HEVc0HJJbBmDH7U7CL4N8q2xVdlc
         e2OG/RIXEq8tOkulZ22fPfxLxEzA6MNE64k4IEymX8ebkkPbsFITZosdM6xUHmc9K+7H
         Zj/rbzKaaaf2Gsi36GlDNaEFuC3FL/rCT0CxZ9THd6SYSRJYq1lJYj7JsOkHIPT7l0ol
         B3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=js3TL2/kH+RzQ+7Oe4DwrXCAreJ1aNAmnn2LZazzYwo=;
        b=GgFyLeK36EHy+TbytooOHMuVWNRXKn0DH7nMkjY+yORAafw2npsT1fb+hu4YL7PKb9
         LYuHLY/f6hH/wU+RPN/A6gZ0FqOZ3A0AFfqXtepd9pjfyocVwKnDxpsWMtKNZWZYM0SP
         yWutmhW2Y9JcsCDooswgu6GyYuJlF6VZtOrp+2bLIiVOc8vtzVy+CropNL38PSLNIBTn
         dF+kSkQRsIBTmHqnDZXWrTY8W/bzghDX+IE/O/dMdlwarlBqfxPQKUQwUXRkVf7746+N
         9d0Hpl1BLMBEehaBByNzOBFmhRmdwJrepO+40dePhsDQ5jERz906KFj1sIfc7nJttncq
         x3QA==
X-Gm-Message-State: AFqh2kqY9tNHL2jmhwm60l3qVjr4IFDucl7UjbB7Gj0Tn8k9MJ2VzN68
	pAQhOKB06Qoc1raBVqjHvfqZ7Q==
X-Google-Smtp-Source: AMrXdXsA+uuMJEwFKRlNagP34/tJNyQWWRlvs8dMhh/8qVYj99EBXMb7AI5f3rCsUW6ZK6Coke+epQ==
X-Received: by 2002:a05:600c:1d98:b0:3d3:48f4:7a69 with SMTP id p24-20020a05600c1d9800b003d348f47a69mr14559450wms.17.1672042357994;
        Mon, 26 Dec 2022 00:12:37 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm14553916wmb.13.2022.12.26.00.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 00:12:37 -0800 (PST)
Message-ID: <590af263-8278-5fb3-10c1-341b609a77ec@linaro.org>
Date: Mon, 26 Dec 2022 10:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/3] mtd: spi-nor: Extend SFDP 4byte address
 instruction lookup table with new octal modes as per JEDEC JESD216F
Content-Language: en-US
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-2-nathan.morrison@timesys.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221202135539.271936-2-nathan.morrison@timesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_001239_997402_A7B23A43 
X-CRM114-Status: GOOD (  14.78  )
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

Looks good.

On 02.12.2022 15:55, Nathan Barrett-Morrison wrote:
> This adds the new bit fields for
> reading: 1S-1S-8S, 1S-8S-8S, 1D-8D-8D
> programming: 1S-1S-8S, 1S-8S-8S
> 

We usually aim to have ~60 chars for the subject line and 75 chars per
line for the commit message. If you want to reword both, fine, otherwise
I'll do it when applying.

> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> ---
>   drivers/mtd/spi-nor/sfdp.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 2257f1b4c2e2..e4e87815ba94 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -953,11 +953,16 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
>   		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
>   		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
> +		{ SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
> +		{ SNOR_HWCAPS_READ_1_8_8,       BIT(21) },
> +		{ SNOR_HWCAPS_READ_1_8_8_DTR,   BIT(22) },
>   	};
>   	static const struct sfdp_4bait programs[] = {
>   		{ SNOR_HWCAPS_PP,		BIT(6) },
>   		{ SNOR_HWCAPS_PP_1_1_4,		BIT(7) },
>   		{ SNOR_HWCAPS_PP_1_4_4,		BIT(8) },
> +		{ SNOR_HWCAPS_PP_1_1_8,         BIT(23) },
> +		{ SNOR_HWCAPS_PP_1_8_8,         BIT(24) },
>   	};
>   	static const struct sfdp_4bait erases[SNOR_ERASE_TYPE_MAX] = {
>   		{ 0u /* not used */,		BIT(9) },

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
