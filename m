Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8898CFA3741
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjuuXAdS8JGIEpY8OABOBJYShZZCEZ/OFSlGm4XVRLU=; b=ZbeLZUcROVEKkn
	KAdhEMsPihuj00NgWNN8/dNUAVXf1NyiiMiDiBuKXeX8ofeJ0vooq/IRIhhY5py5vd1qzQPUDA9Sp
	ATSTCAMRfLoDnZkO9DcrqGT5HpZ5wperMNYA9WO/ljZ+L/DU6hT6wk1jgpsAEYFCDcFhjFccuQLpJ
	oiM/dArZteSB9K2dqqYCNoFNG035T6InUr/V7ebEIswGMuIAG4dmpN6TUszrzsF5f/oO6bNJwx6Kw
	tAUfOaKjFXncDI4LiLSMlpYfzm+L8K7kwYfxJOwluR2fBm93o24AVcieR3ML1O3ibs2+KrYhr8f/F
	r14ITBKydgklV3SMuerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbt0-00FNNu-IM; Mon, 31 Oct 2022 20:59:58 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbso-00FNIX-0S; Mon, 31 Oct 2022 20:59:47 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1322d768ba7so14820758fac.5;
        Mon, 31 Oct 2022 13:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/c2XNU9qCi0/SIq7JxxxUeiJFklOM1fPVnjo5nHEOw=;
        b=M1ca44rB2uGlXK8EBoIuXq7mtzSlxRVB5V/UTM6nHiC7VAz5f+WQLJcRVLkf8hGJaM
         nVqVU0txy8v1UMmbjnErXu/CjqU5MuEH5KxIX7ahALEIzGB0TV5Mle93NGP/ckqMoIew
         x9CjYVowjPJonDYv6yKxvzXz34p8vKgrEcoK5uk5W6ch21b4q63kF/+2B1qLxSRflPGy
         9G3OuVUofylVoVSVXmWyuneOCaDW+ejzygbB4KP5n1PRE+fLljTONf8uKhB5r2tZXm/p
         YYZOWTBpr2vbgvyAAwHu8UfiMCuVIKT0rKpEJCROyxXZ0bfmmwJ/KsM6OqZGdC8vdi+O
         0EeQ==
X-Gm-Message-State: ACrzQf1B7m2u0vhh+JsWE7M/M+QH2T2zi4j4JWKfmuvpGiRwopL12iCd
	sCkVnPZtjq2AqgprcZvNtgimjNIp/w==
X-Google-Smtp-Source: AMsMyM7LswAnDKtLB5pnbZtOd1oJ1fXaUx7UPx0vVt58JL1FF2qxUk756+yv8MotVg8+NLv9lFOOTg==
X-Received: by 2002:a05:6870:2043:b0:13c:f48b:7ca8 with SMTP id l3-20020a056870204300b0013cf48b7ca8mr4428052oad.169.1667249983817;
        Mon, 31 Oct 2022 13:59:43 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y12-20020a4ae70c000000b00492f9f46aa4sm2746051oou.36.2022.10.31.13.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:59:43 -0700 (PDT)
Received: (nullmailer pid 3510647 invoked by uid 1000);
	Mon, 31 Oct 2022 20:59:44 -0000
Date: Mon, 31 Oct 2022 15:59:44 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Manivannan Sadhasivam <mani@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-sunxi@lists.linux.dev, Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH 10/12] dt-bindings: mtd: Drop object types when
 referencing other files
Message-ID: <166724998418.3510591.18309655417406556730.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-11-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-11-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_135946_072635_A7841378 
X-CRM114-Status: GOOD (  10.06  )
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


On Sat, 29 Oct 2022 01:59:31 +0200, Miquel Raynal wrote:
> Setting an object type is redundant when a reference is made, so drop
> these useless lines.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml             | 1 -
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 1 -
>  2 files changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
