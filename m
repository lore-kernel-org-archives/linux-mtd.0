Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094ADC6FA86
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Sep 2022 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6PGc0oci0hVYBFoYYC+6Wl4rABUFmpIysu54V+8cuo=; b=VnPI/hptSrjgpd
	xyXhTlfGH7M3WhpgEUqHnuYk9pXV3cD2yj/gWHPWI2s9RYsF016BRFUQkfmvxwsIemB8ziIT8L8ij
	0iyOtqWVV8uewhPrDk9mLfbIYzv+z2iakySeF2pfuqjtDAGzWO8lTYDqipTcfo8UImBl0G6jzjaQr
	o1F+GduKpEGit6a8qhkpEOzuJ+jKb5KqExVMgAlwLr3rfD0Nj4YPsppDLa6Ef11csdxdq9Cu+4gRR
	YKDl6QtZNl2u42hFw6sqy6zOWjC93XT5wXDniENiFZw37n8E32bUQXtWMAtPKd0GUT4rR6z3piirq
	UOq1JhioXlBmvr7TLwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYq3-00DvLf-R8; Tue, 06 Sep 2022 13:42:04 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYot-00DuXr-7i; Tue, 06 Sep 2022 13:40:53 +0000
Received: by mail-ot1-f52.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so8110949otk.0;
        Tue, 06 Sep 2022 06:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9O7PzS9icEWvflax/sDIyoRvTTpAWAalNbCvjy/7uKY=;
        b=mIEeo4oAwSGPao0XJuXzclspa4h7cgMu4utWGZS4jm4vop2u9vj1O00yYZoWybbLFm
         /41WVBPIlBAhrAPRotg7tj74rcq0M7VXsXUMHgIy9FjTXvKGV28cbXuzQmXLCHtOiBXW
         vbIDODZW0oxsRh/jYqgsI7S/RZTsIhLLv5LrScujDdM2jhQYZQ4zgx5KGlYH0MH7haSa
         mvkcjBGwq3eV6U/xvx105r4aGEhiY75gYmFjj+JITQTLYf315wqYNa4gSAGmBdhUXTNS
         Wqw5fMrRx47ZBqXiJHE1gzym3igCT8wpXkcwxLkCEvv9Xpv3ribszMfWmCdsVEBzGCsd
         J0Yg==
X-Gm-Message-State: ACgBeo1MpWH2uenfKbKxyvjJse+R/GBtYjwSAOlUAA/o5GoHNJyqgD+I
	wTtmNXXxYIgy6mHFjTFpgw==
X-Google-Smtp-Source: AA6agR7l+RC3By/UqrddRF5+IacRUXfeqCIuCYqKB3YKY7keBuvMZhDzLRaciOChnidIJTDSmhMq+w==
X-Received: by 2002:a05:6830:2aa4:b0:637:1824:80f3 with SMTP id s36-20020a0568302aa400b00637182480f3mr22420142otu.330.1662471646640;
        Tue, 06 Sep 2022 06:40:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l21-20020a9d7a95000000b00616d25dc933sm5852439otn.69.2022.09.06.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 06:40:46 -0700 (PDT)
Received: (nullmailer pid 360953 invoked by uid 1000);
	Tue, 06 Sep 2022 13:40:45 -0000
From: Rob Herring <robh@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, Richard Weinberger <richard@nod.at>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, BiChao Zheng <bichao.zheng@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, YongHui Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20220906060034.2528-5-liang.yang@amlogic.com>
References: <20220906060034.2528-1-liang.yang@amlogic.com> <20220906060034.2528-5-liang.yang@amlogic.com>
Subject: Re: [PATCH RESEND v8 4/5] dt-bindings: nand: meson: convert txt to yaml
Date: Tue, 06 Sep 2022 08:40:45 -0500
Message-Id: <1662471645.297810.360952.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_064051_324428_9C3D80DD 
X-CRM114-Status: GOOD (  10.30  )
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

On Tue, 06 Sep 2022 14:00:32 +0800, Liang Yang wrote:
> convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.txt       | 55 ------------
>  .../bindings/mtd/amlogic,meson-nand.yaml      | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.example.dtb: nand-controller@ffe07800: Unevaluated properties are not allowed ('reg-names' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

doc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt

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
