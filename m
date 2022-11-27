Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246B4C43217
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Nov 2022 18:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7Jw13IBUNJwnVlkkUp1a3jZNdloUcBJwKAJsdBEHhE=; b=e/VHBtNQVUJ6fx
	PTJ0XJzq+O6hNGDMQf7Bo0hYeBRZo+xF+jD5RPBUqErzamDsqljxGYvVwJZY3ocmtCMh99ugZxeTO
	ejUplIiLwnY4IW4+6FWT4tSQoV3Ihqvry8RqmOUx7KFydkwSmr7RQCMPN1bvCGVUXqtFwvwyBWEPm
	zMq1fp9qPUlXJtF7v/lm+HUMgs4i2//8S0pXT+RLaHOMtgkm8aMdEt4jG85QMN8NcAQvjmdchOwdA
	+kT4WWbfK1gqIxzJrXzmTNi7ly2gfncIXyHaOhs7Ei1esruUaLr6ovd0F77qsxWfR91FuDu/dRGq5
	+apMvk8BvO/C59sT+1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozMLn-00Cx0h-C7; Sun, 27 Nov 2022 18:25:59 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozMLh-00Cwyy-Ua; Sun, 27 Nov 2022 18:25:55 +0000
Received: by mail-io1-f46.google.com with SMTP id z3so6215047iof.3;
        Sun, 27 Nov 2022 10:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8bsHlpNOFcbCNV3S3KNbgx5jtrGlxhIxfZQJSXdiI8=;
        b=rddQIC1UUmstvyCyr7TEqSTxyUKiw/OGFFxI8mRNOEMx3ebFIsYOd0qJwOCxlj2B18
         Uyb/lxN/+rPqMrzamCSkncYQxrb0c/ZtCEtVrQi9UHre1/W5CnKByIcLoV7UPa1EvnfL
         STc39pkHxTEvsGHvGWvhoslomabqWBmOk9I6j8Uuo0Scv7L2vIxNEZUtUcqQjTHD/dLc
         JE+PBVQ7x6vYIFHxgK3Yb+I1SEtbgMUrbvnLD4YcG0hzWPdZ+KYlOCBOfDbHmAi4tzCr
         WlE51P29AgwNxib6qHoTg5OaOJ4lYKPOjYpv0aFMub/qC6mm2G1ZTMKYKr1inCmPWo5v
         cPrg==
X-Gm-Message-State: ANoB5pmOA/SZT441u9f6mUoyZpUdOYvQemNhNuGrhwex5dWJkv5EfZgF
	6uYWSzVXNzVe1Jnfo85RPA==
X-Google-Smtp-Source: AA0mqf4/UTMwRwnIlC+je7s+xyLV5H6yWYNsPoNaMuJssYdZ1JVl/+l7lHnKDkheQefibulNpQHtFg==
X-Received: by 2002:a05:6638:ca4:b0:389:dbc8:c058 with SMTP id x4-20020a0566380ca400b00389dbc8c058mr1463216jad.10.1669573552742;
        Sun, 27 Nov 2022 10:25:52 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80c1:3b80:81db:640f:ef27:c9e2])
        by smtp.gmail.com with ESMTPSA id e10-20020a92690a000000b00302e4c93a54sm3113081ilc.79.2022.11.27.10.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 10:25:52 -0800 (PST)
Received: (nullmailer pid 148616 invoked by uid 1000);
	Sun, 27 Nov 2022 18:25:52 -0000
Date: Sun, 27 Nov 2022 12:25:52 -0600
From: Rob Herring <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: qyousef@layalina.io, atishp@atishpatra.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, pratyush@kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, anup@brainfault.org, richard@nod.at, linux-crypto@vger.kernel.org, miquel.raynal@bootlin.com, nicolas.ferre@microchip.com, devicetree@vger.kernel.org, michael@walle.cc, herbert@gondor.apana.org.au, tkhai@ya.ru, baolin.wang@linux.alibaba.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org, arnd@arndb.de, linux-spi@vger.kernel.org, quic_abhinavk@quicinc.com, vasily.averin@linux.dev, colin.i.king@gmail.com
Subject: Re: [PATCH] MAINTAINERS: Update email of Tudor Ambarus
Message-ID: <166957354583.148471.5381866020763010078.robh@kernel.org>
References: <20221122125244.175295-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122125244.175295-1-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_102554_022226_0109F6E3 
X-CRM114-Status: GOOD (  11.23  )
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


On Tue, 22 Nov 2022 14:52:44 +0200, Tudor Ambarus wrote:
> My professional email will change and the microchip one will bounce after
> mid-november of 2022.
> 
> Update the MAINTAINERS file, the YAML bindings, MODULE_AUTHOR entries and
> author mentions, and add an entry in the .mailmap file.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  .mailmap                                               |  1 +
>  .../bindings/crypto/atmel,at91sam9g46-aes.yaml         |  2 +-
>  .../bindings/crypto/atmel,at91sam9g46-sha.yaml         |  2 +-
>  .../bindings/crypto/atmel,at91sam9g46-tdes.yaml        |  2 +-
>  .../devicetree/bindings/spi/atmel,at91rm9200-spi.yaml  |  2 +-
>  .../devicetree/bindings/spi/atmel,quadspi.yaml         |  2 +-
>  MAINTAINERS                                            | 10 +++++-----
>  drivers/crypto/atmel-ecc.c                             |  4 ++--
>  drivers/crypto/atmel-i2c.c                             |  4 ++--
>  drivers/crypto/atmel-i2c.h                             |  2 +-
>  10 files changed, 16 insertions(+), 15 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
