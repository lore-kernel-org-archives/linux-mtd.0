Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B3C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:06:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1DD20721
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DrQzj13H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1DD20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgKPqiWZwejA/ebhkdb15J4QNCZa5Rc/6bC5NBNYWnY=; b=DrQzj13HIF5IDC
	ypqasiAiCZNZmyNVccV7OSPbcw6Zl6Iiav+GFz8WXyfoZFtF8LkXORVaD6aBV+6I2F5UbPeM6uIqF
	fkdq4+yssMpRP9oU3elDwhg8fzlNwyynkfWFAO6zii3QgfJ+LPbwkUnPFgqz+1JzT/Wiq9U+c0ZXF
	J3e68tYenG9za2fZ9tnobaHi8yjn0UpzDeC7cI9ry2+8fB1e2S9NdpWGWxHvqP2G1a7QvM4qi0ids
	x1h8JUJxBcz6pe3F7VlyQNn/9wcaTaWJr1hAZUlQ8uhsBIi4LTWVa6RgzFvuEVoCcToCRm1RpFteH
	252t/okD7UtAma9pjAsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJAj-0006oT-4o; Thu, 28 May 2020 14:06:13 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJAg-0006mp-6q
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 14:06:11 +0000
Received: by mail-il1-f195.google.com with SMTP id 18so202158iln.9
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2020 07:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1jidT3xKZRKULWJIwqa2tys07NIrxI3mybLQC/9d/ko=;
 b=PV/FE/1+bwoLYS2gINJ7nY6r6kCND4UPv2d0nRGVQhdwnCFs4mdrjE34x4/++kPc2x
 DsnHvPT5OWif09RxwwXZZna0d3VJ/f7FybGUkG0UM7tQVS7GlID70fSmUBB3f6ExrLhA
 Smwhf3lJHkcd3Vzgov2DD5Ot0wZEx8kBCc/rJ6A0HIn/ZOoDbduutTNdipYRXw5ahaGG
 FmUbN2zb3NLDMf95RMpVWIMuWRI7HRaQvkXJ0lzoWwDFO2CH+d9hQ0cNGcSQ39pBrcxu
 B3+mfUZYZCACRwS+YbvzybqUg6Oiq0Ws42MN6jb6RGWk8A1oq6YUnQAvhbrQVu4i9Tii
 7tgw==
X-Gm-Message-State: AOAM533HZdsaitfdP/freTnn0m0gdZU/FGafFZipGfAgQWUysAZlo1Vj
 AWHGrVTFIkP4g6rgchJw5w==
X-Google-Smtp-Source: ABdhPJwgyTHzsDhxjiIb8r+RbEwXO/nh2hiq7xZNTxCVYzX32CAooeVLqphtOftt4LjRzbfcNOdExw==
X-Received: by 2002:a92:d40a:: with SMTP id q10mr3051355ilm.87.1590674768954; 
 Thu, 28 May 2020 07:06:08 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id n25sm2574334ioa.29.2020.05.28.07.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 07:06:08 -0700 (PDT)
Received: (nullmailer pid 4174426 invoked by uid 1000);
 Thu, 28 May 2020 14:06:06 -0000
Date: Thu, 28 May 2020 08:06:06 -0600
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200528140606.GA4173978@bogus>
References: <20200528051211.3063-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528051211.3063-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528051211.3063-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_070610_250077_55BB2646 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com, masonccyang@mxic.com.tw,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 devicetree@vger.kernel.org, richard@nod.at, brendanhiggins@google.com,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, qi-ming.wu@intel.com,
 andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 28 May 2020 13:12:10 +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: '#address-cells', '#size-cells' do not match any of the regexes: '^nand@[a-f0-9]+$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1299399

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
