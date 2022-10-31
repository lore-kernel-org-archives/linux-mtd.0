Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C8AECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSwI1e/e40BmTkcDVdG5gM1IWNRfwLBseP2euDf1GLk=; b=nQPAjom0zq8fNX
	YBm/YcM/Pb6SlHPamW8DZvD5c5Q77xVqskZkrjjmFXZv1SbIzgeTYgYU6s5tFCR13hdhafCdzBb82
	ZxfKuJ/9jgmGIYeHq1jb1CFiQcGlsH3KIOAcbPVHMMTz82d47xGsmMCXCMccY6MzHGxK6UnI87p0g
	nzhYIfrp/ClXQgKZq9astkbLvX9OxrC4N9yFNMxD/OB96LJhJl2fxj1XmANOcSnUNpu+Te8MDlAMs
	zo+phYmJIjv41jfzE9DcgZagqqp12WtEPnR7ivAGE/GiI8OEryMfQal6Ut0F7V0cmz44m35Os+4mf
	4w7F3dRyBKwSDNkjgcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbq5-00FM5O-Sb; Mon, 31 Oct 2022 20:56:57 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbpo-00FLxl-Ja; Mon, 31 Oct 2022 20:56:42 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-13bd19c3b68so14780778fac.7;
        Mon, 31 Oct 2022 13:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvegeEey9KZKQoiJGj9a9K6oNOkm96buyBFBJMatGTs=;
        b=g1c3hECnnE8ezpstXG55/2bEZA9qyUyxO7vCxGwMQ14t/W4RzNTQk8W+Unh5BcpzEQ
         lRToHHZFkyuzhZMZI4GiJQqRtLSBi6Qms/FzzeGzm5nX/SFXf+gr2DQl1+NitdpcZK+r
         DmLhsoEDZCi8Drv3MLI8y+hJlVmMB5u+4c9raoZexqUjcHFhn4U8JjsK/4jso0vpmTTo
         hB6ZDlc7LpuQQPUPfO5iMwn0/xl5josb1sNFxFM6Nz0xXKiPwhsegsdUE8hfErNXeWcM
         uDCYmaWVRnNKDG83PS4gjL8gaTjaK172Rwx5trcoOcOK9YoE30u7tcEMN6Nxgn/liAV/
         RlwA==
X-Gm-Message-State: ACrzQf3ejezL8fGRNLksWEcA8g8NAOv7wyBqgUrUuuv2QN/AamF60OGh
	ZyAlcwFIYIYbScyFIFWpSg==
X-Google-Smtp-Source: AMsMyM7ot7WGQL5vQT/Scg5o+2DDdPD1reviquzBu+AauCzEoG/H14929Ca5tYII/jDSRqJizgiilw==
X-Received: by 2002:a05:6870:e30e:b0:132:e934:5c0a with SMTP id z14-20020a056870e30e00b00132e9345c0amr8424541oad.202.1667249798893;
        Mon, 31 Oct 2022 13:56:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870148600b0011f00b027bdsm3526141oab.45.2022.10.31.13.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:56:38 -0700 (PDT)
Received: (nullmailer pid 3507196 invoked by uid 1000);
	Mon, 31 Oct 2022 20:56:39 -0000
Date: Mon, 31 Oct 2022 15:56:39 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Michael Walle <michael@walle.cc>, linux-sunxi@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Pratyush Yadav <p.yadav@ti.com>, Rob Herring <robh+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 08/12] dt-bindings: mtd: spi-nor: Drop common properties
Message-ID: <166724979937.3507124.10435048977508140792.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_135640_675597_1038BCE6 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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


On Sat, 29 Oct 2022 01:59:29 +0200, Miquel Raynal wrote:
> When redefining common properties does not bring any additional
> information, just drop them from the SPI-NOR bindings because these
> properties already are definied in mtd.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml     | 14 --------------
>  1 file changed, 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
