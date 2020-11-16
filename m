Return-Path: <SRS0=PjdO=EW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9593BC5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 15:59:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 513C220A8B
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 15:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LsNkBx5+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 513C220A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oZDxellgu8iuAc0nRXv1FkJoeK+8/U5PiW5muzozb3I=; b=LsNkBx5+A1NRgeKl/q+TASUSo
	kpJGL5JmTx822UGptMhWAmy1U+G6XS1mBhkRjsl1Iaze7rus7EqL+V0ozMiWvsiA/hlrAYLb5d6bH
	HGF5RIpTWo/TxyZevGKynh8k0yTLhFE2eVlg4oeaNaaoh3ZOsGHvyCQIsKbL4I2nO+796s/pxhOOa
	PUqSIUxDq2/zcfWitcTgK4ONbIg72CrbdwynI3ttZAmplo0Ps1eDI3vYtRZ7pPN/9C1lEPuthuwJ3
	SwPramYWE40gPOUuP1oucLMkPFjvCFZM1VQdwczdXMj5kDeylNo1MipS6x9+0hPhfpyWrqN0m65n3
	mKW7Bb/zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keguY-0003sy-Al; Mon, 16 Nov 2020 15:59:22 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keguW-0003sG-Dt
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2020 15:59:21 +0000
Received: by mail-oi1-f195.google.com with SMTP id m13so19294163oih.8
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2020 07:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SJJPyWX2YfUe3Oo/pSRmO63ep2/WK35OXd5bs3M2IcQ=;
 b=FTWCee+euhE09IcPCeOHo+zlQQnP+1b9+S/6Halcabbxn47KlzpYqQfd4fM+SxDrn0
 9z7chHHHF6L4AGqOsMRFaxV6S1to01ZaUC0gdujhDLnF4PqEal+yiCsP+GuAhjkAaCDE
 bmI/yzOBjWGZX0I43rlVu+GnuLmrYNwjkDrBUY5sRJufutN5VKWVDO1AlRG946qzKfOU
 LlQpFWvtG5jobHfhwb14bxlnkdJUT0mgEUHjCPKAqt0VCSrMQwaqKzK1QvAAZNdxZrtJ
 FC0MbuSaeSzyOPvSouokItXYX/pgXw+TuaenF3Yt9fQMw/qyiDqd8hYbLsaK67PS9B9Z
 NO+Q==
X-Gm-Message-State: AOAM530lh4NF++GqtPWTZvYdGQNNkfpBIjlyzUfk3gzhkQERjIQktxkD
 3ac8LUmzwHuatoK6ZvMrxA==
X-Google-Smtp-Source: ABdhPJzQVVlCe5JBQgZWAhVNGpgd/3mlIHTXO3Qh2MI/c+q0LPqR/euoc7LLgVnhVEWw5aDq2rcggQ==
X-Received: by 2002:aca:b156:: with SMTP id a83mr78786oif.150.1605542359327;
 Mon, 16 Nov 2020 07:59:19 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w22sm209679oie.49.2020.11.16.07.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 07:59:18 -0800 (PST)
Received: (nullmailer pid 1725008 invoked by uid 1000);
 Mon, 16 Nov 2020 15:59:17 -0000
Date: Mon, 16 Nov 2020 09:59:17 -0600
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v7 5/6] dt-bindings: spi: Convert cadence-quadspi.txt to
 cadence-quadspi.yaml
Message-ID: <20201116155917.GA1719083@bogus>
References: <20201116031003.19062-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201116031003.19062-6-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116031003.19062-6-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_105920_510993_974D0FD0 
X-CRM114-Status: GOOD (  16.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, qi-ming.wu@intel.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 11:10:02AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Convert the cadence-quadspi.txt documentation to cadence-quadspi.yaml
> remove the cadence-quadspi.txt from Documentation/devicetree/bindings/spi/
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/spi/cadence-quadspi.txt    |  67 ----------
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 147 +++++++++++++++++++++
>  2 files changed, 147 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/cadence-quadspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt b/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
> deleted file mode 100644
> index 945be7d5b236..000000000000
> --- a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -* Cadence Quad SPI controller
> -

WTF?

> -Required properties:
> -- compatible : should be one of the following:
> -	Generic default - "cdns,qspi-nor".
> -	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
> -	For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".


> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cdns,qspi-nor
> +          - ti,k2g-qspi
> +          - ti,am654-ospi


> +examples:
> +  - |
> +    qspi: spi@ff705000 {
> +      compatible = "cdns,qspi-nor";

I give up.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
