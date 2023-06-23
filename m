Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B485DEB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 23:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukzLq03ewiJzaVB1MpNuFFkw5Yi3Y1uKN+EL/vyYd/k=; b=MwEsJfLGXQlWMy
	m+iwnc274XGyuRSmj0YNvpRiTSEhy0kjnmNeODMMgexfE8hXm1pUZ8Uqnw2Mp0JXdBwkoEA0c3S3Y
	Paq7s18zB9yl9sHsNKpvBd69WqCfanEW4zc8vzvYfv/SV2ElP5Hkedl+sFcIr7bwDZ2SNb1cYvMYR
	UvwE9g/LB9jSB/ANhAIBDSLN956hub7jDACO8f+CsPJElWRh0YJOrPajgGY7+/36NptZiUIKbl9ep
	RDG0gojRczHaHO+u/Fb+8o2QntJASeplRYuanNchV6JOA61qJU2vL9rWcrRX2Y5vSIiBWsCO2CfeG
	lhn+ByPO1cisEu9hxz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqQy-004qu1-2D;
	Fri, 23 Jun 2023 23:43:20 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqQv-004qtd-2l;
	Fri, 23 Jun 2023 23:43:19 +0000
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-78333585d28so32790239f.1;
        Fri, 23 Jun 2023 16:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687563796; x=1690155796;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTiyezCl+ncjMsIOOS0sUB9bYyrGCDjIJOvndxohyZs=;
        b=i2NcsKIYmzrVQHhAfd3g+OPMmPJujPuvUZb29G81ViySG4X2PgEQK8hJDNbMlrM5X8
         8+t8MdEOIaidRzhPqp4cvm9On+pDJckfomngyM/OLzuzlGWhr0UuxGBz6AjKPurTqPYq
         UOIMAVv8X/mrOX9t1QRxcy5R5pMj/eY8fx8X9i86dMdfojKCOyVw1unH0bcJ+aP+onGx
         e+fYdElj4/r9iX2MQbl2ySdshbofInbJsn5RJb7j4Uo1XQ/k9e8tJyYciwqZuEUAOiJ6
         9KcJMuzVclBPlkOdHIQquuGD79nKFNWmjDvIUvuIvh4+0IgVfuBxrhJp4pqjJImsA6rC
         Xjgg==
X-Gm-Message-State: AC+VfDwIoCyvaeezgRDZTSKFVHnWainmMGraWGy+IvP25IHGPZtVU5/d
	YR5Qfp/OZLr3URMCUzaHaA==
X-Google-Smtp-Source: ACHHUZ704nUo/Qe+1L5BBq/vh9K03eeZluxsw6d51akGW3mbLVGxB1UGHdSEiXEdc5xMZV7l5fDOHg==
X-Received: by 2002:a5d:9483:0:b0:760:e308:107e with SMTP id v3-20020a5d9483000000b00760e308107emr15001057ioj.0.1687563796356;
        Fri, 23 Jun 2023 16:43:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r27-20020a02c85b000000b0041407c67451sm72416jao.165.2023.06.23.16.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 16:43:15 -0700 (PDT)
Received: (nullmailer pid 1606691 invoked by uid 1000);
	Fri, 23 Jun 2023 23:43:09 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ulf.hansson@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	edumazet@google.com, broonie@kernel.org, arnd@arndb.de, maz@kernel.org, 
	lgirdwood@gmail.com, alexandre.belloni@bootlin.com, alain.volmat@foss.st.com, 
	p.zabel@pengutronix.de, mihai.sain@microchip.com, soc@kernel.org, 
	linux-mtd@lists.infradead.org, cristian.birsan@microchip.com, 
	jerry.ray@microchip.com, tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, 
	richard@nod.at, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	balamanikandan.gunasundar@microchip.com, lee@kernel.org, olivia@selenic.com, 
	sboyd@kernel.org, mturquette@baylibre.com, kuba@kernel.org, 
	Hari.PrasathGE@microchip.com, linux-kernel@vger.kernel.org, 
	balakrishnan.s@microchip.com, alsa-devel@alsa-project.org, 
	durai.manickamkr@microchip.com, sre@kernel.org, vkoul@kernel.org, 
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, andrew@lunn.ch, 
	devicetree@vger.kernel.org, nayabbasha.sayed@microchip.com, 
	linux-gpio@vger.kernel.org, nicolas.ferre@microchip.com, davem@davemloft.net, 
	pabeni@redhat.com, linux-arm-kernel@lists.infradead.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, tglx@linutronix.de, horatiu.vultur@microchip.com, 
	radu_nicolae.pirea@upb.ro, dharma.b@microchip.com, a.zummo@towertech.it, 
	linux-mmc@vger.kernel.org, richard.genoud@gmail.com, 
	claudiu.beznea@microchip.com, linus.walleij@linaro.org, conor+dt@kernel.org, 
	herbert@gondor.apana.org.au, eugen.hristev@collabora.com, 
	dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux@armlinux.org.uk, linux-watchdog@vger.kernel.org, 
	linux-pm@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org, 
	linux-crypto@vger.kernel.org, neil.armstrong@linaro.org, vigneshr@ti.com, 
	manikandan.m@microchip.com, linux-clk@vger.kernel.org, olof@lixom.net
In-Reply-To: <20230623203056.689705-32-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-32-varshini.rajendran@microchip.com>
Message-Id: <168756378936.1606652.14221929175769628362.robh@kernel.org>
Subject: Re: [PATCH v2 31/45] dt-bindings: atmel-classd: add sam9x7
 compatible
Date: Fri, 23 Jun 2023 17:43:09 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_164317_897473_CC9E706B 
X-CRM114-Status: GOOD (  10.98  )
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


On Sat, 24 Jun 2023 02:00:42 +0530, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.example.dtb: sound@fc048000: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,sama5d2-classd'] is too short
	from schema $id: http://devicetree.org/schemas/sound/atmel,sama5d2-classd.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230623203056.689705-32-varshini.rajendran@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
