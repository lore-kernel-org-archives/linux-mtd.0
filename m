Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7760EC43334
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qX8RckSOzqXipO+GzFi4WqKd2HTM2M8QXGHHzodg5I=; b=sIDws6soK3xfXx
	8t4OutGo1afp0WeOo2Z2UQQIIPpwb9cD1cHxJTsPhsY/fTs+2gOqkW0e8YsvgE1+vyVcRlRUtRFVn
	Ym5/6JWKeLbb+0zmb4YZWIKOsEtRpueOsHO0MRD0D5hkmBhsjh6mzHDVAp6XJiC+lBJIZbl3aTA4w
	tYRN6ZKOhJNv/pkM3w56wcvZb7+8h0rQqlNmxUsRxHLDCBIIW5I6Es9dqiAwVuGgXwWT1nDwGaGmg
	/Wf22XJGd9zDCmyi37vd9W3/jiw9euJF3XgEnWEoGM4kCDUkhrrXaA3daDY6EQxe8XewXDcpLtEVO
	ZUDUSdioFfiXR9/ksbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUND-000CxG-8g; Wed, 01 Jun 2022 19:51:19 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUN1-000Cts-5e; Wed, 01 Jun 2022 19:51:08 +0000
Received: by mail-oi1-f180.google.com with SMTP id k187so4037848oif.1;
        Wed, 01 Jun 2022 12:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gn5G0sk6V7ansC6nBxDu6+mXNt9uJIpkYkYkuE5zjDs=;
        b=0Vqy+klibrPHQJ11yES2PwoY4JmjQikA2/tVJGXGnIMOYLqI9L7jSG/pT66c74oy0t
         4YX6lMnnySR/uitt4umMYvsMRuEGgy92hlfcdG5U/vzw3PXM2mEYqAVsLJivpl/SjPOs
         Nd3rouTZsE7pnoiYyo9Da1NiOZp8K+kQc4T1SPEkSiJn/FhwgHD+8PM0QpyzW/BbLSON
         q/c4Kw18YZE+0Q4pUh3+y4EjUV1ptGyrNApx5GGJpX8CPH+QFAd6pUgGN6fgaBuyERgM
         kMQM3lF4eKL0OWOSzcWnLr/+FhaxU81rZf5prIq6L3crsonU9N5qmjpHg6rK1N5BDVn5
         lNog==
X-Gm-Message-State: AOAM531QMlMw2E+WXYyGE3ULe+W7T3nr4Ma+4y0lSijlABssirTmgHRZ
	Pp+TZ4erU3teOdsH0MjtJzhV2qd46w==
X-Google-Smtp-Source: ABdhPJwAJpzi0PcdaldTmKtUN95zZ7XXm0EePIpfGX5LC4bNAZ845Iwj0Rw0ZOPMk6mqDxpbS339oA==
X-Received: by 2002:aca:f143:0:b0:32b:dc40:c1c4 with SMTP id p64-20020acaf143000000b0032bdc40c1c4mr12678221oih.293.1654113065824;
        Wed, 01 Jun 2022 12:51:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bc32-20020a05682016a000b0035eb4e5a6dasm1361259oob.48.2022.06.01.12.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:51:05 -0700 (PDT)
Received: (nullmailer pid 320227 invoked by uid 1000);
	Wed, 01 Jun 2022 19:51:04 -0000
Date: Wed, 1 Jun 2022 14:51:04 -0500
From: Rob Herring <robh@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, XianWei Zhao <xianwei.zhao@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>, YongHui Yu <yonghui.yu@amlogic.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: nand: meson: fix meson nfc clock
Message-ID: <20220601195104.GA320194-robh@kernel.org>
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-2-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513123404.48513-2-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_125107_248686_F004A4AE 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, 13 May 2022 20:34:01 +0800, Liang Yang wrote:
> EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
> which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
> the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
> a common MMC and NAND sub-clock was discussed and planed to be implemented
> as NFC clock provider, but now this series of patches of a common MMC and
> NAND sub-clock are never being accepted and the current binding was never
> valid. the reasons are:
> 1. EMMC and NAND, which are mutually exclusive anyway
> 2. coupling the EMMC and NAND.
> 3. it seems that a common MMC and NAND sub-clock is over engineered.
> and let us see the link for more information:
> https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
> so The meson nfc can't work now, let us rework the clock.
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.txt       | 29 ++++++++-----------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
