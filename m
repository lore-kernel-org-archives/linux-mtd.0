Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B12C19F28
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 03:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:To:Subject:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXoujfRWwwWzaVNfZGDh7ztkQ0Mb1Icu8zl9TsntI5w=; b=2shJnnBjwkI32S
	lLab0XwgaYfjDP3RaZsLmZG8RMb21NfWy6Muhj8iGZff4WuqYrSs+2BzowiKq7KipJ1QV4Wv0ZYRy
	x4eORpMGWuQMUcHCUuVbnPYof4phLQ+hEoiynyXt8avxmAZX+OoIwgQ1Mf0mFtl3Od8holr6qsXIA
	izgrYk6CEVaN0DD6IO20f1LOcmsgqWn9gaE4yFcLZZKGsdBi6uyw3zgrOqct5QLoNUu3WyfZXH+1o
	aQuehpE4BOU/l8E75bS2TtxjjfJVYLZWR9ShnMlnD6u6j6Unq3nugvRAUYNJkCIToS3lEPp5noYEl
	0YOBoJeukbGE0zsjXwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuLy-003gXw-V0; Thu, 28 Jul 2022 03:38:26 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuLv-003gQM-FZ
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 03:38:25 +0000
Received: from [192.168.1.107] (87-97-28-73.pool.digikabel.hu [87.97.28.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E1C1B83010;
	Thu, 28 Jul 2022 05:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1658979497;
	bh=/cS9TPU5+rXkX+J5Jkln5vvjln8emRqorhd/BraAqbU=;
	h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
	b=sAUx4q81Hb1k4UrxcPIM8ByjmJ9sKdXUtAhOl02E0bk/WDWrzNT+9zQx16jwS9mDT
	 nX/d35ryiZbjkOuxs5CK5c/HlPS2m+CbdH3c+GGbDE9E6iNz4lo3wyMNdz/9Fd1lXx
	 ceRBfwvgLGJsDBF8VIlEJmRYI2h4yevlzMk1H9oMojpatMQEAeYVTm/wgrLqp7piPI
	 EPugZspBPyg1PdPre10qfT2LqbzXCuuJMbwa+EzueEpu3jmMv8izXtTem1ZtjBatj7
	 14S9qXflcxlJQJvjAAGpF0p3cTknD2UrWiCxOdqtQ6xeJj2alY9PZaGwPtZlou5GZq
	 uug7cBm6z32Fw==
Subject: Re: [PATCH] dt-bindings: mtd: microchip,mchp48l640: use
 spi-peripheral-props.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220727164148.385476-1-krzysztof.kozlowski@linaro.org>
From: Heiko Schocher <hs@denx.de>
Message-ID: <316239d0-1661-0430-1adb-e7faeff66144@denx.de>
Date: Thu, 28 Jul 2022 05:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220727164148.385476-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_203823_804379_E3CB0B09 
X-CRM114-Status: GOOD (  19.71  )
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On 27.07.22 18:41, Krzysztof Kozlowski wrote:
> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
> 
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
> 
> While changing additionalProperties->unevaluatedProperties, put it in
> typical place, just before example DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Technically, this depends on [1] merged to SPI tree, if we want to
> preserve existing behavior of not allowing SPI CPHA and CPOL in each of
> schemas in this patch.
> 
> If this patch comes independently via different tree, the SPI CPHA and
> CPOL will be allowed for brief period of time, before [1] is merged.
> This will not have negative impact, just DT schema checks will be
> loosened for that period.
> 
> [1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
> ---
>  .../devicetree/bindings/mtd/microchip,mchp48l640.yaml      | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Heiko Schocher <hs@denx.de>

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
