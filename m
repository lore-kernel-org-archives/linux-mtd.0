Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA5CC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 22:42:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5249264FC3
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 22:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5249264FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zw6oIdqPg2AHGAiEBSrORQuA55mnI8w8SqUU3Io5Vi8=; b=pgUgtPeSFm5K561Yf7LgZcUM0
	/2EGOfPjBMUNMpPHz8pdiqhIRNWy7YPPF8yrjNxWdMovXTDUJkpJNGZULowsQBhmVo7/CblsAY+X8
	0j8kDabkfvNn5ydGYbUvNossU0JAvatyi4c9K/U6OSWsih7pZs1fQGtu7X2lX3OrljFYVcoT9011g
	SyD54JTnp6SKRKue/1z30I6XwXOXy8kL75k5M0ZxiDlpPZo94oqZ0TTiwM7JsNbZVJsuiLFE8gFpQ
	hzQW4rM9vrfI9hm8hlgdUz4V59V5uqOibZFIO8yItssViGHjxgVHWoKkKJwGXNKlhFZkpidxGsWsd
	Kt8GN6yAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK7WK-007vIo-0L; Wed, 10 Mar 2021 22:41:36 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK7WE-007vIS-9S
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 22:41:32 +0000
Received: by mail-lj1-x22b.google.com with SMTP id e20so8704089ljn.6
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 14:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0QF4U1EjzeSFBBGGRg6Folsa6RnufGkB2larNXv6VrY=;
 b=KCA16+3bpcWUZAppOub6HxaIT0x2+IXvTUVF6jPnkizPkHKk3p/PUqlhjGZ+2G8zxZ
 7lTceSoHkk19ke+t03y2eVF2ufTcPeW4mwLle1nz6r6TJe5bua2BX7AFqZw4O2J3CQdw
 Ek95LlsiON8VngfODwWDoo6byZPsEmDdeMCf89t8ArxPNHgJXoIqq3if8WxgQUgzfPzO
 dZE8EXXkrHDLKVcRubxSGX7ji3bc7ORt6dGHBWYwR+9iMmlB9llBPsUsR0yBJF2Zez+2
 humu29V3GVRUJoSq0A154RjH4MgTLOddG14cy9YR6cq7FISx41cxl6nEkEv9+q+wqx6y
 Manw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0QF4U1EjzeSFBBGGRg6Folsa6RnufGkB2larNXv6VrY=;
 b=U9DxlqPUHeZCWQb6lbUbE1w1VdWx8iHO8atFgdJ6Jp2G8ONj1J2b5TppwcX1zrJEpN
 48PkX/tgxn3ce3GwuZ+L6DnDNpADjA0fy22ug6VGQeUCZwwQ60U2+e/IfGdUuUZPBN04
 wSq+tjkVUUyXMI+9UhGSmhOFD+MKO8O0TG/C4Rq9JRrfHLFgke73SbnrJaWAGM39rBT4
 vsz6UswyLeHRXpGhA7QIdz9R7VumkWZJrCG4F53dc9VCD5oVEbEBcI9QC5HGztr75l3a
 QgpYKQaKQh0fC2ogTsb4qd4Gq94m+Ut7UNEycb6/UuKn/TgFnvSF7YG0qDMjICxURIH+
 av2Q==
X-Gm-Message-State: AOAM532bPjTN+pl+pmwavPF3AFwhkwrUFfbJQzijM4oXf/RDlSRFMjpZ
 Q/m1MeY2QyFCC8kh1fgLun4=
X-Google-Smtp-Source: ABdhPJyV8prnjfdr7O/N86GIUgpIE/sjZlwQYIl+xENvrLMV8gDcJHtRiJm3vQfxrH8uxZp+jI2nzg==
X-Received: by 2002:a2e:a48b:: with SMTP id h11mr3002205lji.492.1615416088614; 
 Wed, 10 Mar 2021 14:41:28 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id v2sm296728ljg.89.2021.03.10.14.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 14:41:27 -0800 (PST)
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210310210812.8880-1-ansuelsmth@gmail.com>
 <20210310210812.8880-2-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <5d798266-3a18-d50d-9c3e-f91bc2460fe5@gmail.com>
Date: Wed, 10 Mar 2021 23:41:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210310210812.8880-2-ansuelsmth@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_224130_563552_1655309E 
X-CRM114-Status: GOOD (  20.70  )
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

See inline

On 10.03.2021 22:08, Ansuel Smith wrote:
> Document nvmem-cells compatible used to treat mtd partitions as a
> nvmem provider.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   .../bindings/mtd/partitions/nvmem-cells.yaml  | 96 +++++++++++++++++++
>   1 file changed, 96 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> new file mode 100644
> index 000000000000..f70d7597a6b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nvmem cells
> +
> +description: |
> +  Any partition containing the compatible "nvmem-cells" will register as a
> +  nvmem provider.
> +  Each direct subnodes represents a nvmem cell following the nvmem binding.
> +  Nvmem binding to declare nvmem-cells can be found in:
> +  Documentation/devicetree/bindings/nvmem/nvmem.yaml
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>

I think that when Rob wrote:

On 10.03.2021 03:58, Rob Herring wrote:
 > I think this should reference nvmem.yaml.

he meant you using:

allOf:
   - $ref: "nvmem.yaml#"

(you'll need to adjust binding path).

Please check how it's done in Documentation/devicetree/bindings/nvmem/*.yaml files


> +properties:
> +  compatible:
> +    const: nvmem-cells

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
