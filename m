Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B802C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 09:43:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8830561996
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 09:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8830561996
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VltF+sDG9jxcHzajkCMgye6A7v+DK0YkpbZUOd45rh0=; b=il+nfPWsnyyxx4+DFeQsXIxA9
	473P8ytIkGMGdiCjIX+PWfNMsRS0PMseeQYo2sQwmMvSimwvQ1v2AKdK6a90m7IEXbsqZKJoa3tKE
	fk818nF6qIM6z9y84B61hhPjSFCTdmv7W3vDbb74ahyrZHjlJZgFA1cLw9YPHsRH+xSyjwvz5gk9b
	NtDTLpu/G3eUilahQpKjuEGY10jud+Lr98x4r95TuszgiNHQVd1mOpLg/4z9T4p0ElMk+Yb0cjYm4
	LUYwe1zMg8XaMistEpVbD3bi72aPDvFL06zoy+60T1pVVGHTWRS8E/m+xsMuxGF7awWwLoIPDIuVH
	SMFOeg9Ow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAtO-003GUV-Oz; Tue, 30 Mar 2021 09:42:34 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAtK-003GSR-DY
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 09:42:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id ap14so10703241ejc.0
 for <linux-mtd@lists.infradead.org>; Tue, 30 Mar 2021 02:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v6VbFOVaNZFibaVBnSDLK//9i3b0qySPXiFFUzfcK3I=;
 b=YhVn8HBZTxcElEmF6mQOYtRdRlfZ/mNqJVUXJYpdRnIWSNswD0Wt0mtAgdlnQSNmji
 9QMgFO+q2Kj1VR3shtlV5F89e2GOdCH0vd8pO0poV9Fk3OLlskF/f2Qi1jQ45vwngIt+
 ZUHPWt/j7Kvl/0E1Z1TsmUQHZn16Yy1sSfpyd/eebchaiDVEuCzY8ULeSVFhdKmJWeaP
 cuqQG2vz/N+K7IafzrXYEYSYwJLhk6tcmW4QYXNYxucEAcX1LQhjGFs49sme1f6taynM
 tHRDJthuqwxO6K9FxYVZT2j7N+KS8PiSFfeyWNR7u3A1+z5mdyqtn0KZU1alIm47KjgE
 d1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v6VbFOVaNZFibaVBnSDLK//9i3b0qySPXiFFUzfcK3I=;
 b=SbbcSWOhvIyopjS/SBRxuMZXlVEcn2b8JvipoHRVnXOGQPat5FW+oyCNI2/q7l1xAA
 QFXm1O3K35vUDnhvUfUIpwFUvhacDvkCb/FftMZEkdv21cBRszTiAzydxc8UlL+vcuLX
 JSl0LGhWa6+BVPmRqkkdi4mXh9HRCQYCOunR7GAm++JqRoZcgnDw5JbsGA8cqiq+mN3U
 cp/wOX5Ewvn/XJA+IMWsUjh5pj7NsaIQYvElyXN6BqQW/f/CA3Rzv6zNp1by2qfiiKN+
 FbeLmmDrOoVD4CJWfml2ToxtK2xufeDoETqO13buNmMvcglXFY8T4qZHK3uyGSEnuruI
 Y71Q==
X-Gm-Message-State: AOAM5300B0VrFl8UYIIdVB7RDkhLYsM3jEgs3+xaYeuyk0XaFBqD9/1p
 MduPEABRuyZZtDkVedXuo6tHb5eM8dx9Dg==
X-Google-Smtp-Source: ABdhPJwLRR/3EKdhrZYj144DyAFroQH65OuBeTtBKfOXrIgqAPJW4TQBTrI3jccJWYW2fmEFW7Jc1g==
X-Received: by 2002:a17:906:14d4:: with SMTP id
 y20mr32510201ejc.190.1617097348710; 
 Tue, 30 Mar 2021 02:42:28 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id v15sm10626830edw.28.2021.03.30.02.42.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:42:28 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] mtd: core: OTP nvmem provider support
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20210322181949.2805-1-michael@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ace5b308-d6ea-b301-0d2e-29f95b91fe8b@linaro.org>
Date: Tue, 30 Mar 2021 10:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210322181949.2805-1-michael@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_104230_652980_27036276 
X-CRM114-Status: GOOD (  23.68  )
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

Hi Michael,

On 22/03/2021 18:19, Michael Walle wrote:
> The goal is to fetch a (base) MAC address from the OTP region of a SPI NOR
> flash.
> 
> This is the first part, where I try to add the nvmem provider support to
> the MTD core.
> 
> I'm not sure about the device tree bindings. Consider the following two
> variants:
> 
> (1)
>      flash@0 {
>          ..
> 
>          otp {
>              compatible = "mtd-user-otp";
>              #address-cells = <1>;
>              #size-cells = <1>;
> 
>              serial-number@0 {
>                  reg = <0x0 0x8>;
>              };
>          };
>      };
> 
> (2)
>      flash@0 {
>          ..
> 
>          otp {
>              compatible = "mtd-user-otp";
>              #address-cells = <1>;
>              #size-cells = <1>;
> 
> 			some-useful-name {
>                  compatible = "nvmem-cells";
> 
>                  serial-number@0 {
>                      reg = <0x0 0x8>;
>                  };
> 			};
>          };
>      };
> 
> Both bindings use a subnode "opt[-N]". We cannot have the nvmem cells as
> children to the flash node because of the legacy partition binding.
> 
> (1) seems to be the form which is used almost everywhere in the kernel.
> That is, the nvmem cells are just children of the parent node.
> 
> (2) seem to be more natural, because there might also be other properties
> inside the otp subnode and might be more future-proof.
> 
> At the moment this patch implements (1).
> 


Have you looked at this series[1], are you both trying to do the same thing?

[1] 
https://lore.kernel.org/linux-mtd/20210312062830.20548-2-ansuelsmth@gmail.com/T/

--srini


> Michael Walle (4):
>    nvmem: core: allow specifying of_node
>    dt-bindings: mtd: add YAML schema for the generic MTD bindings
>    dt-bindings: mtd: add OTP bindings
>    mtd: core: add OTP nvmem provider support
> 
>   .../devicetree/bindings/mtd/common.txt        |  16 +-
>   .../devicetree/bindings/mtd/mtd.yaml          | 110 +++++++++++++
>   drivers/mtd/mtdcore.c                         | 149 ++++++++++++++++++
>   drivers/nvmem/core.c                          |   4 +-
>   include/linux/mtd/mtd.h                       |   2 +
>   include/linux/nvmem-provider.h                |   2 +
>   6 files changed, 267 insertions(+), 16 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/mtd/mtd.yaml
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
