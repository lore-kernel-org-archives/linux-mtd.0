Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB1C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWakGYozi0GR1kU1Ef+rHp4byA3rXdSxFOUJc4t/JVc=; b=3DUaDHdlTuvtmC
	qePxF2NqtfeapQtMuBOYy9XIvqiQhYmscGOqShSaAXqohSb1ccuaZ7387tl3H/RqrYxk0yBxdvq/B
	zZqMSkeznk21fNVeHEd7s0X8DJkO3Q4L4a0FZTE5S62/M4CQcDxAlddjBKOtKgeQpejr8WZldi5CX
	gfw05QQ1x02Y11+zD0f4mz9T9/Hee1kSgaKmu4Eduvvylr0XlVdA9PxD/LIIxCP0hE1auhqP/svAh
	6e9altLf/0XlURCA0ltlHME9OpREpz01kMeIkQX2IETsQydf3AGo9alYfKLgy1Tdprp5ddgR0AgkD
	omkC1/Zrj2R+5Upg84Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW1O3-002WVr-2s;
	Tue, 15 Aug 2023 21:15:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW1O0-002WTE-0X
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 21:15:33 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c93638322so1211932166b.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 14:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692134126; x=1692738926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFaPUM6OGKjL7heKdSNW4ylbvnWM2Tax9xH36Ej8xmI=;
        b=p8e0jbjVH5XAqy90r+q8Ggo5ZQbgRA90aMDTQVbJCe93sdd5qbcoKqLTjOAPzJkI2c
         f+VFUkJUG1dt981Sa2W1qtnfXf800u/TYahnWDh1VZNMRXDbwWvku/2asYWJ6Trw5dxW
         aPtQqUf4Y7+FapIjLVG4FzEMSCH0j5Z4YuM3RHgcMKTvjC9zuVJzltVruWCKtc7VSeAQ
         VZkLFVKgAakXLRcmDdPbPAr5gBwAwrYm7Myb0WROFW06va0c7MiWlX/fF2ehgnRfiBrV
         WPGSqwOttNcPiWHE7C6HFDkFNDPuw4t+IwRRIuCvRwtAEqIqHm8weao9A1xH+CL9lTFa
         KJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692134126; x=1692738926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFaPUM6OGKjL7heKdSNW4ylbvnWM2Tax9xH36Ej8xmI=;
        b=apEXvSGEwjLj+H7GzW3TbENo0SK7AbKl0DfdNogYfSnPy55zwkelNc+AukYPyDP6g+
         lYqaueISxaiomZG0bu4Ym8g8iqRxvsj4SY07TT47KJA0DmBycF1k83TE33XYeNIFG+jC
         3hfAo2btlO8v8ANyvdPcCKJdh+uQLap74Sw1lAGIe8snWFo9I6iqACW7bICNbxYnsL92
         7No9KkzmDDc9DXPS3cwjaIa+ALSylPREFkzTibIp1GFsN9zDhBb+Y+4TeodLW0jEQEOV
         aoQQ/pbTW7+z3kSI9nMMMwro7LQDDtZmLlLnRQO0tlXN3YFXmKp8Xh+QIvkmoHbH5wes
         KbZg==
X-Gm-Message-State: AOJu0Yw5QeLZ9WKRP6OqbjhmCcqxtyZIEtiUkKME5QFvsuvyRTsQTvPH
	CoJT74sUDC8RYQiSxGXSCcmVzA==
X-Google-Smtp-Source: AGHT+IFabPaVP5DLcR7BtAD/7NeRP9lI+iUrNDDK9QJZ/8aQeCjq4VfiMHtSwPjZfUeGEMTtx/nJFw==
X-Received: by 2002:a17:907:96a0:b0:99c:c8eb:51b2 with SMTP id hd32-20020a17090796a000b0099cc8eb51b2mr3483869ejc.2.1692134125829;
        Tue, 15 Aug 2023 14:15:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s10-20020a1709064d8a00b0099364d9f0e6sm7441940eju.117.2023.08.15.14.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 14:15:25 -0700 (PDT)
Message-ID: <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
Date: Tue, 15 Aug 2023 23:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
To: Justin Stitt <justinstitt@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_141532_255611_05297282 
X-CRM114-Status: GOOD (  14.81  )
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

On 15/08/2023 23:11, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
> |               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;
> 
> This is due to the fact that `devid->data` is a void* while `enum
> versatile_flashprot` has the size of an int. This leads to truncation
> and possible data loss.

Cast does not solve truncation. This part of commit msg suggests that
you actually fix real issue... and that is an issue, because then
AUTOSEL will grab it. This is just compiler warning silencing and rather
coding standard correctness, no real fix, so please drop the sentence.

> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: There is likely no data loss occurring here due to the fact that
> `enum versatile_flashprot` has only a few enumerated fields, none of
> which are large enough to cause data loss. 

If there is a data loss, cast does not solve it.

> Nonetheless, this patch helps
> towards the goal of eventually enabling this warning for more builds.
> 
> Signed-off-by: Justin Stitt <justinstitt@google.com>


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
