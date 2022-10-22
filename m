Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77041C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 16:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJxnogPr5P27vbKURYfU2NWRc4CzUkA1+YGkxqy4sto=; b=hgc088nBbZ1aNZ
	venYxI1eTkgyTEVcXwVKdfuXa9mhdtJ0jtWb1UGUVawT1ciMx9zaiZtO8gdpZrElweTPV5oURkWD4
	61PkNjpd5yBTN0O08RuvBuex3gVnuIMZ9Ul4WXlpeZXqylsANwpeMogOdfl3DvrNtbjJJK8Wb0fJU
	ZEmkjaMkSIYlp3Rnlo2M2RSFxw965pGSHUPOU3Rck9NxEZI6WupmIQMBPfUYdvX1HdiNyeoxIJ1ok
	6sqYMUv0Cy37JQeuIoYoAQextodovPBhJY4liJvgP3F8qNHplOKpZhBxVWgKFtDDZOHObgs9kjXAO
	Gw+gHzzlGuE04XrUcscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHFJ-00DDfI-Te; Sat, 22 Oct 2022 16:21:13 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHFI-00DDdz-15
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 16:21:13 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1321a1e94b3so7258162fac.1
        for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2022 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1Al63W076jDkj8WpNZMYUiAhbLhcbuotAcSf3D7lGU=;
        b=rgbYmT2lH5OXpRmQ600zOpmN9g+NFdGkFM4zfjDPUetAWOyp3yZSBClOCbdCfQZzOw
         lNFsUBEoK6dU75k6JDg46PJpt/QRSk/iehjy06p4V4TejWFH9xxETNIZ/lPz6tfAwTXZ
         06T1H+FltsnKpb/tf5h+hMsTEhfeLDn0PrnqWgK5uw0wQKnYg3fCnAQfuInozJ9+/E8Z
         4lYmcWGm9arwyV3uzCOURc+9/g694PT6OMz9YhZRglFx//GaN+R2Rbjj+w4QMGAv4JXj
         Of6eGbeizkkFFIEMQCHR9nI11Q1ExQbChrXlgzmz4MO69aOfuW8DD1Yg7p88Bj3Sb5TN
         abOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1Al63W076jDkj8WpNZMYUiAhbLhcbuotAcSf3D7lGU=;
        b=fW0OxEWqNUnY0jBd34qzql7yt2MztNxzqnwYnhLQyymwzGNk2QUg/Bj62Fe4kqJpy5
         6Wett37hOkV97uAG3yZ5i7e86nxJhDZCZ9Q/P9lZxExwWfkVojxh9GBN3k3GOXjQTtqv
         WiDJXgyGTnA6MVneVzTrPz234Pe8zQuwjtiwlzbBPJJ9IZTaeDtQLqA2XXzVZEuYBZja
         ZspwJc1gU7+KIqwgJ240dDR6FPoJyhCrHHlWMNRfQF6TokB7LNVRBVHz5T2jYsqBGi5c
         8PrBe1IZEUmm+8lM9AvuEHCY3ZE7y86NiVO74QbTNfn01iv2ay8lYOTbPQnPai4sRSnn
         Lm2g==
X-Gm-Message-State: ACrzQf34/VWdZO6aBhuXVKqSHYp2n4vcZVTvXGfW3Ft1v2Gdigvlk4Vt
	jv55hLSoE075FjH5Zlm2/6cyVg==
X-Google-Smtp-Source: AMsMyM4lgxN81Bdg9UtMMFBkEJear9Fq+lfJJh3mNnqRnROYYU9eTzko7OsU+RY+0fHJK/So8NyAHg==
X-Received: by 2002:a05:6870:14c4:b0:132:c614:b0e3 with SMTP id l4-20020a05687014c400b00132c614b0e3mr33106688oab.204.1666455671097;
        Sat, 22 Oct 2022 09:21:11 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id v5-20020a056870310500b00136c20b1c59sm11595627oaa.43.2022.10.22.09.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:21:10 -0700 (PDT)
Message-ID: <5ef70149-5079-173f-ab6a-a9f0cc01f281@linaro.org>
Date: Sat, 22 Oct 2022 12:21:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Vadym Kochan <vadym.kochan@plvision.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Elad Nachman <enachman@marvell.com>
References: <20221022082628.23876-1-vadym.kochan@plvision.eu>
 <20221022082628.23876-2-vadym.kochan@plvision.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221022082628.23876-2-vadym.kochan@plvision.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_092112_095229_C010265F 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

On 22/10/2022 04:26, Vadym Kochan wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
> v2:
>   1) Fixed warning by yamllint with incorrect indentation for compatible list

I guess all my comments from v1 apply.

Did you test the bindings?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
