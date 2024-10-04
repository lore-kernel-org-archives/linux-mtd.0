Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384B8CFA755
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McWxlicDiGmG2fm/aH3nm8rJf1SG310FAbT02rQ/dVI=; b=22TX64jFwt3dd0
	8Oqh65wjlYymtjicP7i5Yp3n+QvaoCjezx8R1BpVr1WNzkwxU2Rkg0ShPzYvAAMZYIaJyI2rL6DHC
	JuFF5QlSHj7qmLSAHaSOcEIWhB+cAQiGgysGROE/UVSGYRqBo3bVgO962BZlxOyIYKFsCk3nL+XP4
	SGeWBi0SDYhuDSlYKhgN9X3IsrzpBhFX/dK6g/tMo3Rd3LvNKvmKCKRWINw4h7ggPq6mbinyRnyGT
	/r1HowFdMoe6Kli2VGEL/hieLwUx7knrHHlQLFzBOX6r/pRFCbGjhGyCmNwooPjhI+08cw9hejjsO
	bwrfzxU2Yq+Vh/MiQs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swf5T-0000000Bjsf-41o9;
	Fri, 04 Oct 2024 09:59:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swf5Q-0000000Bjs3-0pgQ
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 09:59:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso17722575e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2024 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728035938; x=1728640738; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9D8jNEMTVQMfsSMYA6l2aONN4ZAr4dXC3Yqk6ph8dI=;
        b=Mw21DDCm8gZnmiWvvXOib4beQ8iikJ2tRk1WitTuOXyVNTdwtzG0LjKVy4+SQCvmRo
         AOAOy9gEl/Wfd4Qn4K0M2QdUULpXmoXV2R1WrWp4RoFSLQER2kCRrLICxfuj3p28uF5s
         u8mcdMHMK8qObHTwZxRexYTb8exAtKFo10IiTrlpbczkKGtfYP1+6LChcxGmNdnOaoc5
         b8rPsSJ74TLH2V7t3fYXMHyPsWBNnqeewcnD2C9tm5FYsB4S3NtTjYOKiOoYK6kQ09aR
         DuRdk98biBY2I8rzRP2rM4S1ZHwR7mQ9W+teGPxKCZyLvCmrzikgk18ok9CzpLdERnou
         IOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728035938; x=1728640738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9D8jNEMTVQMfsSMYA6l2aONN4ZAr4dXC3Yqk6ph8dI=;
        b=osKK+fjjNrsNla4v/smdUl2IJL3LKiu8fHqbEAG4hN1ROuhwkUjJrQB3gmTJtovBdg
         WqjOe1JUmis0cioI8IVLwEOOhwSknPJaCaCnEXB59RjKRFx0SZSHsufVsXJuRGYZOa4C
         qIPGvhFvyQTMnoo2Dm80YO0GSAdzx3kQoB4ztJ9WI+aqlWJbKQV8zlBF7KdT7Hnx29d7
         amtM2Zz1qWWSB1GDCKP+IRtW73Hl3oXal5BFssPrVRNr06xCBMZ7d+3rPV/YzVpVhon4
         PeQz2Cw4IqCNGWtx5h7+pKnG9oM0n6UI3B43tBOWvlD0shwSwicJhe32I3UrOyycNG9t
         5q0Q==
X-Gm-Message-State: AOJu0YwU7HGtUUylJputRRh0LhUJIeMWZtjShOAPnisq5BM++KPXZDET
	fyz3Zwrq76FJAbcyorLyQNwf6fOL5NwPuqJy2yWSA9RU2zzM9LRg6kakYsKcedk=
X-Google-Smtp-Source: AGHT+IFdSdIQpV9WBffhi5FeGlu8JU/86cb4ysbANQ/IIXys7W2HAz4tWStag33lEg4hOJ5EK9M/Qg==
X-Received: by 2002:a05:600c:20c:b0:42c:b826:a26c with SMTP id 5b1f17b1804b1-42f7df1e5damr39358705e9.8.1728035938272;
        Fri, 04 Oct 2024 02:58:58 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b1d5fesm11573295e9.24.2024.10.04.02.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 02:58:57 -0700 (PDT)
Message-ID: <890c1926-2778-41e3-bca6-d08a5a493708@linaro.org>
Date: Fri, 4 Oct 2024 10:58:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/6] mtd: spi-nor: add Octal DTR support for Macronix
 flash
To: Alvin Zhou <alvinzhou.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-2-alvinzhou.tw@gmail.com>
 <28ac1c39-5592-4e5c-8fce-53489e0135ee@linaro.org>
 <CAPhrvRQirexA9QJzBSqjfmPnbnF62-hzg-neQ-cZX2hnkP_Zwg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPhrvRQirexA9QJzBSqjfmPnbnF62-hzg-neQ-cZX2hnkP_Zwg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_025900_281506_64B286C1 
X-CRM114-Status: GOOD (  11.93  )
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



On 10/4/24 10:05 AM, Alvin Zhou wrote:
>>> +     /* Read flash ID to make sure the switch was successful. */
>>> +     ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
>> can we use nor->addr_nbytes for the second argument? Please test and
>> confirm. No need to resend for this, just confirm and I can amend when
>> applying.
> The following is the process of spi_nor_scan()
> int spi_nor_scan(...)
> {
> ......
> ret = spi_nor_init_params(nor);
> ......
> ret = spi_nor_setup(nor, hwcaps);
> ......
> }
> First, within the spi_nor_parse_sfdp() function inside
> spi_nor_init_params(): nor->params->addr_nbytes is set based on the
> SFDP, while nor->addr_nbytes is not available. Therefore, the second
> argument cannot use nor->addr_nbytes but can use
> nor->params->addr_nbytes. Additionally, For Macronix Octal NOR Flash


nor->addr_nbytes is set in spi_nor_setup().
spi_nor_set_octal_dtr() is called after spi_nor_setup(), thus you can
use nor->addr_nbytes.

> in Octal DDR mode, both the address and dummy cycles are fixed at 4
> in READID, so setting the second and third argument to 4 is also valid.

but we don't want magic numbers or states that are not tracked, so use
the parameters set

> Moreover, nor->addr_nbytes is set within the spi_nor_setup() function.

yep, use it then.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
