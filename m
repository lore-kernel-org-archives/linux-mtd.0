Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E7BC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNw+is5Gj334wt4WAyal2IQRR5HwsVo0PkiQSy6y96w=; b=vsGOeARRzAhRBW
	kXORIsLN4I6dyP8lACHEWQlo1KGqMjRRKO44MwTqmw9J6TObzOp+MxpApz+a6o98s8dKmB/n/rsXc
	tyQpwLj6FZCINTmMKdeOEkVt5Qn14DeTf2IPSHfriO0d8YOZJPaaO/j0plwuyVp/0wn7Z6h3LGm55
	7ki+uBHHPRgrwRAz+3GcGsTlxBdSKEnyHlJ5ScAjWcihSZnAvw6PCUPGCZ18J7OQGXPYwe3zNp4pf
	NVKKGLef05dhAGWIhsMffnk3ecazsDJdWeDKca1XddFpt3WLE5fkazw1p5m8Q5qdoeBTc68g3L0S7
	OuuQAcMUKXRlVQB7Qimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0FP-00A8sz-Tc; Fri, 21 Oct 2022 22:12:11 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0FN-00A8sV-95; Fri, 21 Oct 2022 22:12:10 +0000
Received: by mail-oo1-f42.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so629221ooi.5;
        Fri, 21 Oct 2022 15:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7kJ8nWws4CdYxlh1B9Atp5y9g2i8sKYiDiGJZXRmEI=;
        b=SgdaT67lpXD6JOyCi415kR4lh7AXTSQb8ZCSOf/oVnGcGFNjpm+szlszQSu2S71u4j
         JNSUgCdL0Tk9//sk+npYAtN3DYeRkWgoUu9/F7ZDvPcjvDap4qGp6qEiwL3xJwWU11Ad
         KQN4dutVTEY9WKhzsEDYlVsr03sBjrfCKe4wC9TmhnjDgpZHnUH4CImuvLzNUken7Hkl
         dZN9TsJHOS9siHpHOzThiK1MQo8kDUPPNnKnsyDotOC4TsDTMfSaJitsrzxezq1RwuLg
         QEKTKGjxlqkerBD3SBpCZuS1WLg1WhXUsBF9DrKVeniuNASmG2rI02rWzV8cTD6yfUD/
         FeqQ==
X-Gm-Message-State: ACrzQf0DvMmPKFmFEda6knzpxlwjchwJGhEKACa9IgbkWTWjRZJdDGCO
	udmRmGA7uGwFeCXP1qveZg==
X-Google-Smtp-Source: AMsMyM44mYEduOCve2TkVYfwaNjYyUW48/ORzqaTp28KfbVGQNZ7AEpDcq9TzSF6OK3JoocFYxlbxw==
X-Received: by 2002:a05:6820:168b:b0:476:2e4c:6cf1 with SMTP id bc11-20020a056820168b00b004762e4c6cf1mr10032684oob.69.1666390327919;
        Fri, 21 Oct 2022 15:12:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j3-20020acab903000000b0035179b87ba5sm1595444oif.20.2022.10.21.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:12:07 -0700 (PDT)
Received: (nullmailer pid 516244 invoked by uid 1000);
	Fri, 21 Oct 2022 22:12:08 -0000
From: Rob Herring <robh@kernel.org>
To: Vadym Kochan <vadym.kochan@plvision.eu>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew@lunn.ch>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Elad Nachman <enachman@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>
In-Reply-To: <20221021194552.683-2-vadym.kochan@plvision.eu>
References: <20221021194552.683-1-vadym.kochan@plvision.eu> <20221021194552.683-2-vadym.kochan@plvision.eu>
Message-Id: <166639031801.513906.6752849188940196302.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme
Date: Fri, 21 Oct 2022 17:12:08 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_151209_340290_5A3442AB 
X-CRM114-Status: GOOD (  11.48  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 21 Oct 2022 22:45:49 +0300, Vadym Kochan wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
>  .../bindings/mtd/marvell,nand-controller.yaml | 199 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 -----------
>  2 files changed, 199 insertions(+), 126 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml:17:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/mtd/marvell-nand.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
