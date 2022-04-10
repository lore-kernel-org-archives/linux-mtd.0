Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C427C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Apr 2022 06:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gU0sNJYOu2NbebQW8Khwp8BqHrYfAuB9saAA8zpQYBY=; b=N7JSs5vrm3E2Ss
	e1nmahUxFjljt50/PhHVvxeTIAggSk6CPQz5yhUWUTMHFE6trS1J6kRPr+H/b7598uoL7m4XXCgXy
	hXzY36gYcRYitoLhN9ksSPQ8JO32+uuaJVLf404Wg0JAtTA4ZzVWVz+agG1VAC0pFMkaH0fsEvn78
	4oosKc5R04EAOazBMbXCNKc8BJb7Nj90X8Cbb2AXVL1rHWTXuVHLGlH3pw3mGCnAx7kKglW4T+aNZ
	u5FPvuHXCjeb0NgYzEaIX1El6XgvW6berA4Qk8yoniH0pJyQ4L6DLaewbFpkq9NpNpetSRFG20Byb
	LPsWfDmDpguKndD3l8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndRTD-004Lgo-IH; Sun, 10 Apr 2022 06:54:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndRT9-004LfX-Rp
 for linux-mtd@lists.infradead.org; Sun, 10 Apr 2022 06:54:45 +0000
Received: by mail-ej1-x629.google.com with SMTP id l7so19465511ejn.2
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 23:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zauW37hZKPQj0zCz4NalU8xu3JjPbiaaA2uRWNB22gE=;
 b=nnWkbWS3dszmsDv7aXEZLc+24lt3NcTuvsPM/VpE2pM2pyfGu8FkcqIEh1zz9poYcF
 uzce3Z0ZNf6mTXqlplma1Mvtz8l/NPnStp4q+xp8qBoHl2UF/3bzCgAkPANrnnZk2LNY
 URKv30tl+MhDqlGerhGd8ur5NBLIcd/E0qwM7wojZoqbyfVXQSwv+3pq6p3vQCrJ8npI
 q7Hj5hcZjvzBKwdkqFI5fwRBCsc2reuoukyFOAMN30/ugvfB+KsHkPP+0f1VXyHRXzUS
 RsOn3+scY6uukVR2vpMjhz7m6s0vXU16CK0gpc2frM/R4tfEgEVRDuhNdO/K+bWdnIc4
 A6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zauW37hZKPQj0zCz4NalU8xu3JjPbiaaA2uRWNB22gE=;
 b=NvTRJM4HOyVpGhdmjoS5MieejTgugQip6y6kvp3bRq095EYH0xKlApmE64MPQdJajv
 7UMLfVxLgll7MslUdTRXvE9gSQcfUgkNjiLPkJx4Eo8gM8Lc5XgP1qY6zKp6b7NAmlr2
 W5MVCYRT9Y32W5eOaSo4zr/lwwNCGNZb0f6lJGsm5GijT0NuNfYqEIrmHizEX4RsrDTc
 ywkOUs4TiWA9n5i4idyptZpWmBlysDbWczfd9ljK0qd2G1N5Umyj1ff9l/B/99j2NrIQ
 3W/kAp8osztA5zHdRwFaaA5fynLuMw9E4CZSt2z7mX4VJnauhOMpOakilUG2EAvMepPt
 UwtQ==
X-Gm-Message-State: AOAM5316yn98KZpcVCdVJQK8QGjuvASF0HQr/LHzNERvF5C2EZbWnmlu
 aCrcaNJ/8xteZdQPKO2KF+U=
X-Google-Smtp-Source: ABdhPJxnfdwJZ3HNLq21mnJgLRl21Pfs9epyk6/tcAjFMY+XD3RqknXCvsqQoBcWr6Zt8N8r9XsuGQ==
X-Received: by 2002:a17:907:62a2:b0:6e0:e201:b94e with SMTP id
 nd34-20020a17090762a200b006e0e201b94emr25255567ejc.730.1649573681824; 
 Sat, 09 Apr 2022 23:54:41 -0700 (PDT)
Received: from ?IPV6:2001:470:9898:9eac:f1cb:6e16:4fc0:c830?
 ([2a09:bac0:87::815:6e3d]) by smtp.gmail.com with ESMTPSA id
 m13-20020a50cc0d000000b0041d7329eaa2sm1229803edi.48.2022.04.09.23.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 23:54:41 -0700 (PDT)
Message-ID: <6738687b-eeb2-c4e3-90c8-ee3aaa73f576@gmail.com>
Date: Sun, 10 Apr 2022 09:54:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Karim <Karimdplay@gmail.com>, NOGUCHI Hiroshi <drvlabo@gmail.com>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <1649339427.653492.795407.nullmailer@robh.at.kernel.org>
 <9cf4e596-83d7-00cc-afcc-585309cb4852@gmail.com>
 <aea5e032-5cd0-7480-13c1-2af924237532@linaro.org>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <aea5e032-5cd0-7480-13c1-2af924237532@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_235443_974247_CF4DD980 
X-CRM114-Status: UNSURE (   8.59  )
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

On 4/9/2022 3:49 PM, Krzysztof Kozlowski wrote:

> One? Apart of broken compilation, there were other mistakes. When you
> run the tests, you will see all of them.

I checked the first version again. It was:
- One "FATAL ERROR" (missing '{' in dts example)
- 5 warning / errors (severity not specified) "From schema"

Fixed version is here (not a single warning):
https://lore.kernel.org/linux-mtd/20220406195557.1956-1-csharper2005@gmail.com/T/#ma43afb59fd1f0fab8899951005ae9ce011fbb0cc

Is it ok if I send it in PATCH v3?


> This is not related to dt_binding_check. if you ask about checkpatch,
> then no, this does not require fixing.


Yeah, it's about checkpatch. Thanks.

> Best regards,
> Krzysztof

 
Best regards,
Mikhail


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
