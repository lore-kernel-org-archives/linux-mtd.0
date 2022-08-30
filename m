Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07675ECAAA1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNb0V9LuYhaGjbBwoOJfooP6YsyeENwAvIlMlqBC2Ow=; b=GMIkmVtzK9474W
	Q4ai/u6aNln/tFkdDOr3wsmUroeElRjqlwj0jlzRVRgXhMU2Y9sxtqDjFAzfNq/PID9CuYVzwOu2j
	XLmFh82GF9bXKqABslX8E/RmV3NFnQ2Srbv6QXholmEYBWufdlFewk9EjQJuyxeZAJ47yMytR27ff
	gbOCRAnmAB3Xspqlzp2LvWG3K1wRmfC2GuWg736+fUDEYeTNen30TQAMpz4uUGi33rwUSLWEsKxFl
	igNHilBqp8jvq+W1r79poh4CZva306aq8ZdTAaYg5v6RSUx1pCIYf/bhJpeGvx7QyIKs+bCEk5NJp
	JC4G/Y/cEBzHrYIbCK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxRL-00Fa2o-5c; Tue, 30 Aug 2022 09:21:47 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxRI-00Fa0V-JN
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 09:21:46 +0000
Received: by mail-lj1-x230.google.com with SMTP id x10so10674279ljq.4
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=t2+Vzdbmp1Zj1Ubn+bhI2XCo+Y34oD2vP1kC7goh3Bw=;
        b=X6FnQQTX10HojjPRr3B1zGRv1y5UZb7bIMt1siV1lv3+CH5P/DZcWxPMxp3IsdC6r9
         Of0mU8sRK/7nvVLEgEVukOLGijmUWq5Da4p7o7+3HLFtdQdjabb+/nHaMQ+lGLhLXcT3
         YnBVCRxnn+IhV6KPozHi3MO0S2nSSK/I6mEhc9QLI8Ct5NDUwSTqRzoqtXr0JOVFwhxP
         ybvsHs9QlUZIbtI2yU2gt5c7ihP1EI5dhuKr+lYwFNJVP88PyBR7KzZMROckPDjookf2
         N0UIcnIPbrmOGeCPdkML+QYXmSAT3s0/KT93n+bM2X+FirQmni8h6wAtX/n1QKvu3XXU
         8wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=t2+Vzdbmp1Zj1Ubn+bhI2XCo+Y34oD2vP1kC7goh3Bw=;
        b=Cg5330MyLOi+qYE0VlIEzwffwmqaj+drAMJBhr5u2DmO2UeRC8Knqocs5HJszmQQXb
         em4no6Ocyc+JEIIcjN7IlNs3T9VP70Yw7kYhtxxJd8WGl0D1m9pWMN/yA3duuXTJYwnQ
         DOFZTJDjraeoccDouTYUK91WH4MoSCjJNhoduCz0BeYQ9x2U0jJKbuofPDCv8c7pmTQL
         csQVDPQ4n9Q/iQztE2uluZvD5VtIiEXVws/sE7sdJmASvsqIl14PG1BM4YzRNBl4m/8t
         /2vu92AbgeS1nkXmTJgDLctptBi2pDTVh48J+IocVP01U37L3W4NmbFZzvd9ZsDvBTWo
         apMA==
X-Gm-Message-State: ACgBeo2dE85eWRxvAZHP9jYdtpAc6FXaKWrN4zpDGoUVxKQgJQF1nefc
	JjL0+UD+Q1OQP00Tx02ppUfqyA==
X-Google-Smtp-Source: AA6agR5zv64xIKhp5mngmPjgak7Swpb4ZKHAk+rW+baGQB1oMx+uhC/VI6E/0/k/pe8ZVO//UspI1Q==
X-Received: by 2002:a05:651c:2d0:b0:25e:6c94:59d5 with SMTP id f16-20020a05651c02d000b0025e6c9459d5mr7057524ljo.488.1661851302780;
        Tue, 30 Aug 2022 02:21:42 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id o14-20020ac25e2e000000b004946da0f075sm577821lfg.135.2022.08.30.02.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:21:42 -0700 (PDT)
Message-ID: <9a63271b-48c0-1b31-c450-5abc9eedbced@linaro.org>
Date: Tue, 30 Aug 2022 12:21:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios property
Content-Language: en-US
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20220829090528.21613-1-sai.krishna.potthuri@amd.com>
 <20220829090528.21613-2-sai.krishna.potthuri@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829090528.21613-2-sai.krishna.potthuri@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_022144_689104_CCC5F688 
X-CRM114-Status: GOOD (  17.90  )
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

On 29/08/2022 12:05, Sai Krishna Potthuri wrote:
> SPI-NOR flashes have RESET pin which can be toggled using GPIO
> controller, for those platforms reset-gpios property can be used to
> reset the flash device.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 7149784a36ac..d2fc8e9c787f 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -70,6 +70,12 @@ properties:
>        be used on such systems, to denote the absence of a reliable reset
>        mechanism.
>  
> +  reset-gpios:
> +    description:
> +      contains a GPIO specifier. 

Skip this part - obvious.

> The reset GPIO is asserted and then deasserted
> +      to perform device reset. If "broken-flash-reset" is present then having
> +      this property does not make any difference.

Isn't then broken-flash-reset conflicting with this one (e.g.
disallowing it)?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
