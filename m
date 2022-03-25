Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E211DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3pkmtQgnCEWNEuGnQXjETQENy/jrIO8xrkN7F3Ofbk=; b=26/5ZFqXFdi5+e
	VFmJGv12Xhi4Yg7FT1/z4aQw+X/QxQP0UBRGbEEY7xoDlDFJ70rtR18U0L5ZieOUvNxWmco99h5mz
	0d9znArJUtgAz7ucuDqIymkUFaidW25e+oc0mtGcSmmT+andQhJvG72KQbQt2AVkBOsyTSrzCT8V0
	O1IzATkM8ANXPegnUQQBIHJN9yA+VbywrTTE39y5XsgAS3v8sM8SHe7ZgbA/VphtT/zrAOAihTlNo
	DveAkhMsdPUpaVq+L20oi/i43qDJrD2hcogtQSBN6jFjBGu0lfg3a1H1NRH+w+/SxTfTFSUxEOu/l
	uIm4VhV2Xi1tdz4rzMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXmUh-002ZuS-Hh; Fri, 25 Mar 2022 16:08:55 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXmUe-002Zt3-AE
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 16:08:53 +0000
Received: by mail-oi1-f178.google.com with SMTP id t21so3738157oie.11
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2022 09:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=9sA/f970KDSavuw4PIMPXAbVVLqXCkGAUp+7iPzZPx0=;
 b=OjUktx4oOUbvVtFkjqA+sX7+gJHLinxfBl8gC+LqbWb9679uCzRHhyd/5NDVzCDQH1
 pXlr6jV9H0C4secWUcODFsFMAwZD3to2zHZngmgdyDu6fcOg4UYhAd2gzIci1wUcNxjL
 w2NgB5JZWE7G7p8QryXjHMggIHLb85qD0R0yQJafXGL+RcXrJVlE3bQbCUvjXoNorIaE
 ZOVqCdTNdpjk7HAJfshy8lw7NvbUSiWKBhYO1PNqOsDcbjUuUgiVx67NrWWIsUtqBKGC
 6TlGAFhsVScMk2BWcWs8aDPbNkJsIdLmmFJNFiX+mWLWsAPmnzQBdYkJkGR+G6Tk4BQ6
 QuSQ==
X-Gm-Message-State: AOAM530tdL0/wEfaxMyFcz79fXCQOmFJ7R4AkjZTm8f/RGH6T8QYFU40
 26C9zOmbkWOp/qcnyoJvoA==
X-Google-Smtp-Source: ABdhPJxF6ALjCXenejf52MCPlMm6FTUtmu7/0p4pfXpY9ef8Mc8C2iFjA8uk8ED3BfuODZKpfzHamQ==
X-Received: by 2002:a05:6808:1592:b0:2d9:fd1a:1a69 with SMTP id
 t18-20020a056808159200b002d9fd1a1a69mr10415399oiw.110.1648224530868; 
 Fri, 25 Mar 2022 09:08:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056870e50300b000d9be6436f1sm2708398oag.29.2022.03.25.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 09:08:50 -0700 (PDT)
Received: (nullmailer pid 4188975 invoked by uid 1000);
 Fri, 25 Mar 2022 16:08:48 -0000
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: nm@ti.com, vigneshr@ti.com, miquel.raynal@bootlin.com, kishon@ti.com,
 krzk@kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org, richard@nod.at
In-Reply-To: <20220325123707.22020-2-rogerq@kernel.org>
References: <20220325123707.22020-1-rogerq@kernel.org>
 <20220325123707.22020-2-rogerq@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Date: Fri, 25 Mar 2022 11:08:48 -0500
Message-Id: <1648224528.979879.4188974.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_090852_374548_ECF92CAF 
X-CRM114-Status: GOOD (  11.50  )
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

On Fri, 25 Mar 2022 14:37:05 +0200, Roger Quadros wrote:
> Convert elm.txt to ti,elm.yaml.
> 
> hwmod framework use is deprecated for new platforms
> so mark it so.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/elm.txt | 16 -------
>  .../devicetree/bindings/mtd/ti,elm.yaml       | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,elm.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1609419


elm@0: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am437x-cm-t43.dt.yaml
	arch/arm/boot/dts/am437x-gp-evm.dt.yaml
	arch/arm/boot/dts/am437x-idk-evm.dt.yaml
	arch/arm/boot/dts/am437x-sbc-t43.dt.yaml
	arch/arm/boot/dts/am437x-sk-evm.dt.yaml
	arch/arm/boot/dts/am43x-epos-evm.dt.yaml


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
