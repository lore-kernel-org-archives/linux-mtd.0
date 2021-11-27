Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FA5C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Nov 2021 23:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58vuU9id/HrTwbtnDL/60F6SSbWk/pSYVguogxQPlzI=; b=f8Zxcy6kUftwZt
	7vYY6tBnU4c5Zdb4mr6av8h/cWCgP85cSAt5fdT6Khmq4FFA2YpPhjaW3W5gyCDtkZxskvQEErAVT
	3mrvewpsoU7W52JdV3euogPkoUz6gHfR9jw8HRYlda08VRswpVbcbfikwRdFx2dgHP8Rx7r/DJAjM
	YIWQ3T2rIAYcjv37p1TmX+X0xzKhKpY2OzvW5enLrXYGeu831ARXURvS8Rt/pOoWUXkDmZHoWS27n
	k1aa2p6jmClALu5AUqroGKJsWwFwyfnguFc8vZUc7QsWe1aOefMw7mzSn3OhHjPqmUDy4h6QkLjl9
	/JP2CuvwKPbQAtnR1W6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr6sx-00Ebgb-Ji; Sat, 27 Nov 2021 23:13:35 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr6st-00EbgH-Hm
 for linux-mtd@lists.infradead.org; Sat, 27 Nov 2021 23:13:34 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so4446097ooj.5
 for <linux-mtd@lists.infradead.org>; Sat, 27 Nov 2021 15:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AiLjI93Eu3sOcwS1P/HWLihOe91I5wOHALC3t6inbz0=;
 b=4bOFoWYu15mEPlF1qaj/b7MsI4l0/DPoEDKm3dsh1S5tvkz9pNqWCVWyvFb6d3hNyS
 aBzgLgdgfYXNqlS14xVlhb23PLTYqCyaHt0MSYlkffXvEu8lgtFam1z1PNLj+QU4OTf9
 9gXJ4pHcpoteV03dP83yIkqdXqDvJ6H9nyyCLYaz7VQPNS9/d/5gZ95WHD0Bq/JOw6RP
 cZ4uThvQoG7Hm1n4BZZnckOD/JJuW1gsaXi7mJ2gxKpyUbM3lcN8Hvp+/KiSsYQaZzwu
 H7C5nQzQqk/4THxf1u656dzEWuFntWuVBglIOizxEILCi9GIKW7dhwES24z2FSo0p8A1
 pM1w==
X-Gm-Message-State: AOAM533JuToeJlJE8Do+hr2eWYWP3iKg+I6QTTC3p/PylM34cWu0PVyn
 gVhsDbyGs2PNM1N8rIJUeQ==
X-Google-Smtp-Source: ABdhPJy2uPv+3iug1ZxIO76MvQH3HaU551G0vMP0JEVCtdaaY5hsH5+GxzCm1BalZ3o43I4lH6vMkA==
X-Received: by 2002:a05:6820:30b:: with SMTP id
 l11mr26392796ooe.32.1638054809205; 
 Sat, 27 Nov 2021 15:13:29 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id v10sm1697508oor.33.2021.11.27.15.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 15:13:28 -0800 (PST)
Received: (nullmailer pid 1973549 invoked by uid 1000);
 Sat, 27 Nov 2021 23:13:22 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Jaime Liao <jaimeliao@mxic.com.tw>,
 Julien Su <juliensu@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>
In-Reply-To: <20211126113924.310459-4-miquel.raynal@bootlin.com>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
 <20211126113924.310459-4-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/20] dt-bindings: mtd: nand-chip: Create a NAND chip
 description
Date: Sat, 27 Nov 2021 16:13:22 -0700
Message-Id: <1638054802.158194.1973548.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_151331_645565_3C9B73B2 
X-CRM114-Status: GOOD (  12.86  )
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

On Fri, 26 Nov 2021 12:39:07 +0100, Miquel Raynal wrote:
> Move the NAND chip description out of the NAND controller file. Indeed,
> a subsequent part of the properties supported by a raw NAND chip are
> also supported by SPI-NAND chips. So let's create a generic NAND chip
> description which will be pulled by nand-controller.yaml and later by
> spi-nand.yaml as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-chip.yaml    | 71 +++++++++++++++++++
>  .../bindings/mtd/nand-controller.yaml         | 53 ++------------
>  2 files changed, 75 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-chip.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1560072


nand-controller@112000: '#address-cells' is a required property
	arch/arm/boot/dts/imx6dl-aristainetos2_4.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos2_7.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos_4.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos_7.dt.yaml
	arch/arm/boot/dts/imx6dl-gw51xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw52xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw53xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw54xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw551x.dt.yaml
	arch/arm/boot/dts/imx6dl-gw552x.dt.yaml
	arch/arm/boot/dts/imx6dl-gw553x.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5907.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5910.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5912.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5913.dt.yaml
	arch/arm/boot/dts/imx6dl-icore.dt.yaml
	arch/arm/boot/dts/imx6dl-icore-mipi.dt.yaml
	arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6dl-phytec-pbab01.dt.yaml
	arch/arm/boot/dts/imx6dl-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6dl-comtft.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6s-8034.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6s-8034-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-801x.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-80xx-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-811x.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-cm-fx6.dt.yaml
	arch/arm/boot/dts/imx6q-evi.dt.yaml
	arch/arm/boot/dts/imx6q-gw51xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw52xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw53xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw54xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw551x.dt.yaml
	arch/arm/boot/dts/imx6q-gw552x.dt.yaml
	arch/arm/boot/dts/imx6q-gw553x.dt.yaml
	arch/arm/boot/dts/imx6q-gw5907.dt.yaml
	arch/arm/boot/dts/imx6q-gw5910.dt.yaml
	arch/arm/boot/dts/imx6q-gw5912.dt.yaml
	arch/arm/boot/dts/imx6q-gw5913.dt.yaml
	arch/arm/boot/dts/imx6q-icore.dt.yaml
	arch/arm/boot/dts/imx6q-icore-mipi.dt.yaml
	arch/arm/boot/dts/imx6q-icore-ofcap10.dt.yaml
	arch/arm/boot/dts/imx6q-icore-ofcap12.dt.yaml
	arch/arm/boot/dts/imx6q-logicpd.dt.yaml
	arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6q-phytec-pbab01.dt.yaml
	arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6qp-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6q-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-1010.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-10x0-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-1110.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-utilite-pro.dt.yaml

nand-controller@112000: '#size-cells' is a required property
	arch/arm/boot/dts/imx6dl-aristainetos2_4.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos2_7.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos_4.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos_7.dt.yaml
	arch/arm/boot/dts/imx6dl-gw51xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw52xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw53xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw54xx.dt.yaml
	arch/arm/boot/dts/imx6dl-gw551x.dt.yaml
	arch/arm/boot/dts/imx6dl-gw552x.dt.yaml
	arch/arm/boot/dts/imx6dl-gw553x.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5907.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5910.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5912.dt.yaml
	arch/arm/boot/dts/imx6dl-gw5913.dt.yaml
	arch/arm/boot/dts/imx6dl-icore.dt.yaml
	arch/arm/boot/dts/imx6dl-icore-mipi.dt.yaml
	arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6dl-phytec-pbab01.dt.yaml
	arch/arm/boot/dts/imx6dl-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6dl-comtft.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6s-8034.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6s-8034-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-801x.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-80xx-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-811x.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-cm-fx6.dt.yaml
	arch/arm/boot/dts/imx6q-evi.dt.yaml
	arch/arm/boot/dts/imx6q-gw51xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw52xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw53xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw54xx.dt.yaml
	arch/arm/boot/dts/imx6q-gw551x.dt.yaml
	arch/arm/boot/dts/imx6q-gw552x.dt.yaml
	arch/arm/boot/dts/imx6q-gw553x.dt.yaml
	arch/arm/boot/dts/imx6q-gw5907.dt.yaml
	arch/arm/boot/dts/imx6q-gw5910.dt.yaml
	arch/arm/boot/dts/imx6q-gw5912.dt.yaml
	arch/arm/boot/dts/imx6q-gw5913.dt.yaml
	arch/arm/boot/dts/imx6q-icore.dt.yaml
	arch/arm/boot/dts/imx6q-icore-mipi.dt.yaml
	arch/arm/boot/dts/imx6q-icore-ofcap10.dt.yaml
	arch/arm/boot/dts/imx6q-icore-ofcap12.dt.yaml
	arch/arm/boot/dts/imx6q-logicpd.dt.yaml
	arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6q-phytec-pbab01.dt.yaml
	arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6qp-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6q-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-1010.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-10x0-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-1110.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-utilite-pro.dt.yaml

nand-controller@18028000: nand@0:nand-ecc-algo:0: 'hw' is not one of ['hamming', 'bch', 'rs']
	arch/arm/boot/dts/bcm53016-meraki-mr32.dt.yaml

nand-controller@1806000: #size-cells:0:0: 0 was expected
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dt.yaml
	arch/arm/boot/dts/imx6sx-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dt.yaml
	arch/arm/boot/dts/imx6ul-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcexpress.dt.yaml
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dt.yaml
	arch/arm/boot/dts/imx6ul-geam.dt.yaml
	arch/arm/boot/dts/imx6ul-isiot-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-isiot-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/imx6ull-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ul-liteboard.dt.yaml
	arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dt.yaml
	arch/arm/boot/dts/imx6ull-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-pi.dt.yaml
	arch/arm/boot/dts/imx6ul-prti6g.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0010.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0011.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dt.yaml
	arch/arm/boot/dts/imx6ulz-14x14-evk.dt.yaml

nand-controller@1b30000: nand@0:secure-regions: More than one condition true in oneOf schema:
	arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml
	arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dt.yaml

nand-controller@33002000: #size-cells:0:0: 0 was expected
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dt.yaml
	arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-meerkat96.dt.yaml
	arch/arm/boot/dts/imx7d-nitrogen7.dt.yaml
	arch/arm/boot/dts/imx7d-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx7d-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx7d-pico-nymph.dt.yaml
	arch/arm/boot/dts/imx7d-pico-pi.dt.yaml
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml
	arch/arm/boot/dts/imx7d-sbc-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-sdb.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-sht11.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rmu2.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rpu2.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7s-mba7.dt.yaml
	arch/arm/boot/dts/imx7s-warp.dt.yaml

nand-controller@8000c000: #size-cells:0:0: 0 was expected
	arch/arm/boot/dts/imx23-evk.dt.yaml
	arch/arm/boot/dts/imx23-olinuxino.dt.yaml
	arch/arm/boot/dts/imx23-sansa.dt.yaml
	arch/arm/boot/dts/imx23-stmp378x_devb.dt.yaml
	arch/arm/boot/dts/imx23-xfi3.dt.yaml
	arch/arm/boot/dts/imx28-apf28dev.dt.yaml
	arch/arm/boot/dts/imx28-apf28.dt.yaml
	arch/arm/boot/dts/imx28-apx4devkit.dt.yaml
	arch/arm/boot/dts/imx28-cfa10036.dt.yaml
	arch/arm/boot/dts/imx28-cfa10037.dt.yaml
	arch/arm/boot/dts/imx28-cfa10049.dt.yaml
	arch/arm/boot/dts/imx28-cfa10055.dt.yaml
	arch/arm/boot/dts/imx28-cfa10056.dt.yaml
	arch/arm/boot/dts/imx28-cfa10057.dt.yaml
	arch/arm/boot/dts/imx28-cfa10058.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-485.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-enocean.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-spi.dt.yaml
	arch/arm/boot/dts/imx28-duckbill.dt.yaml
	arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dt.yaml
	arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dt.yaml
	arch/arm/boot/dts/imx28-evk.dt.yaml
	arch/arm/boot/dts/imx28-m28cu3.dt.yaml
	arch/arm/boot/dts/imx28-m28evk.dt.yaml
	arch/arm/boot/dts/imx28-sps1.dt.yaml
	arch/arm/boot/dts/imx28-ts4600.dt.yaml
	arch/arm/boot/dts/imx28-tx28.dt.yaml
	arch/arm/boot/dts/imx28-xea.dt.yaml

nand-controller: #address-cells:0:0: 1 was expected
	arch/arm/boot/dts/aks-cdu.dt.yaml
	arch/arm/boot/dts/animeo_ip.dt.yaml
	arch/arm/boot/dts/at91-ariag25.dt.yaml
	arch/arm/boot/dts/at91-ariettag25.dt.yaml
	arch/arm/boot/dts/at91-cosino_mega2560.dt.yaml
	arch/arm/boot/dts/at91-dvk_som60.dt.yaml
	arch/arm/boot/dts/at91-foxg20.dt.yaml
	arch/arm/boot/dts/at91-gatwick.dt.yaml
	arch/arm/boot/dts/at91-kizbox2-2.dt.yaml
	arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml
	arch/arm/boot/dts/at91-kizbox.dt.yaml
	arch/arm/boot/dts/at91-kizboxmini-base.dt.yaml
	arch/arm/boot/dts/at91-kizboxmini-mb.dt.yaml
	arch/arm/boot/dts/at91-kizboxmini-rd.dt.yaml
	arch/arm/boot/dts/at91-lmu5000.dt.yaml
	arch/arm/boot/dts/at91-nattis-2-natte-2.dt.yaml
	arch/arm/boot/dts/at91-q5xr5.dt.yaml
	arch/arm/boot/dts/at91-qil_a9260.dt.yaml
	arch/arm/boot/dts/at91sam9260ek.dt.yaml
	arch/arm/boot/dts/at91sam9261ek.dt.yaml
	arch/arm/boot/dts/at91sam9263ek.dt.yaml
	arch/arm/boot/dts/at91sam9263ek.dt.yaml
	arch/arm/boot/dts/at91sam9g15ek.dt.yaml
	arch/arm/boot/dts/at91sam9g20ek_2mmc.dt.yaml
	arch/arm/boot/dts/at91sam9g20ek.dt.yaml
	arch/arm/boot/dts/at91sam9g25ek.dt.yaml
	arch/arm/boot/dts/at91sam9g25-gardena-smart-gateway.dt.yaml
	arch/arm/boot/dts/at91sam9g35ek.dt.yaml
	arch/arm/boot/dts/at91-sam9_l9260.dt.yaml
	arch/arm/boot/dts/at91sam9m10g45ek.dt.yaml
	arch/arm/boot/dts/at91sam9n12ek.dt.yaml
	arch/arm/boot/dts/at91sam9rlek.dt.yaml
	arch/arm/boot/dts/at91sam9x25ek.dt.yaml
	arch/arm/boot/dts/at91sam9x35ek.dt.yaml
	arch/arm/boot/dts/at91-sam9x60ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d27_som1_ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d2_icp.dt.yaml
	arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d2_xplained.dt.yaml
	arch/arm/boot/dts/at91-sama5d3_xplained.dt.yaml
	arch/arm/boot/dts/at91-sama5d4ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dt.yaml
	arch/arm/boot/dts/at91-sama5d4_xplained.dt.yaml
	arch/arm/boot/dts/at91-smartkiz.dt.yaml
	arch/arm/boot/dts/at91-tse850-3.dt.yaml
	arch/arm/boot/dts/at91-vinco.dt.yaml
	arch/arm/boot/dts/at91-wb45n.dt.yaml
	arch/arm/boot/dts/at91-wb50n.dt.yaml
	arch/arm/boot/dts/ethernut5.dt.yaml
	arch/arm/boot/dts/evk-pro3.dt.yaml
	arch/arm/boot/dts/pm9g45.dt.yaml
	arch/arm/boot/dts/sama5d31ek.dt.yaml
	arch/arm/boot/dts/sama5d33ek.dt.yaml
	arch/arm/boot/dts/sama5d34ek.dt.yaml
	arch/arm/boot/dts/sama5d35ek.dt.yaml
	arch/arm/boot/dts/sama5d36ek_cmp.dt.yaml
	arch/arm/boot/dts/sama5d36ek.dt.yaml
	arch/arm/boot/dts/tny_a9260.dt.yaml
	arch/arm/boot/dts/tny_a9263.dt.yaml
	arch/arm/boot/dts/tny_a9263.dt.yaml
	arch/arm/boot/dts/tny_a9g20.dt.yaml
	arch/arm/boot/dts/usb_a9260.dt.yaml
	arch/arm/boot/dts/usb_a9263.dt.yaml
	arch/arm/boot/dts/usb_a9263.dt.yaml
	arch/arm/boot/dts/usb_a9g20.dt.yaml
	arch/arm/boot/dts/usb_a9g20_lpw.dt.yaml

nand-controller@d8000000: #size-cells:0:0: 0 was expected
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

nand-controller: #size-cells:0:0: 0 was expected
	arch/arm/boot/dts/aks-cdu.dt.yaml
	arch/arm/boot/dts/animeo_ip.dt.yaml
	arch/arm/boot/dts/at91-ariag25.dt.yaml
	arch/arm/boot/dts/at91-ariettag25.dt.yaml
	arch/arm/boot/dts/at91-cosino_mega2560.dt.yaml
	arch/arm/boot/dts/at91-dvk_som60.dt.yaml
	arch/arm/boot/dts/at91-foxg20.dt.yaml
	arch/arm/boot/dts/at91-gatwick.dt.yaml
	arch/arm/boot/dts/at91-kizbox2-2.dt.yaml
	arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml
	arch/arm/boot/dts/at91-kizbox.dt.yaml
	arch/arm/boot/dts/at91-kizboxmini-base.dt.yaml
	arch/arm/boot/dts/at91-kizboxmini-mb.dt.yaml
	arch/arm/boot/dts/at91-kizboxmini-rd.dt.yaml
	arch/arm/boot/dts/at91-lmu5000.dt.yaml
	arch/arm/boot/dts/at91-nattis-2-natte-2.dt.yaml
	arch/arm/boot/dts/at91-q5xr5.dt.yaml
	arch/arm/boot/dts/at91-qil_a9260.dt.yaml
	arch/arm/boot/dts/at91sam9260ek.dt.yaml
	arch/arm/boot/dts/at91sam9261ek.dt.yaml
	arch/arm/boot/dts/at91sam9263ek.dt.yaml
	arch/arm/boot/dts/at91sam9263ek.dt.yaml
	arch/arm/boot/dts/at91sam9g15ek.dt.yaml
	arch/arm/boot/dts/at91sam9g20ek_2mmc.dt.yaml
	arch/arm/boot/dts/at91sam9g20ek.dt.yaml
	arch/arm/boot/dts/at91sam9g25ek.dt.yaml
	arch/arm/boot/dts/at91sam9g25-gardena-smart-gateway.dt.yaml
	arch/arm/boot/dts/at91sam9g35ek.dt.yaml
	arch/arm/boot/dts/at91-sam9_l9260.dt.yaml
	arch/arm/boot/dts/at91sam9m10g45ek.dt.yaml
	arch/arm/boot/dts/at91sam9n12ek.dt.yaml
	arch/arm/boot/dts/at91sam9rlek.dt.yaml
	arch/arm/boot/dts/at91sam9x25ek.dt.yaml
	arch/arm/boot/dts/at91sam9x35ek.dt.yaml
	arch/arm/boot/dts/at91-sam9x60ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d27_som1_ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d2_icp.dt.yaml
	arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d2_xplained.dt.yaml
	arch/arm/boot/dts/at91-sama5d3_xplained.dt.yaml
	arch/arm/boot/dts/at91-sama5d4ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dt.yaml
	arch/arm/boot/dts/at91-sama5d4_xplained.dt.yaml
	arch/arm/boot/dts/at91-smartkiz.dt.yaml
	arch/arm/boot/dts/at91-tse850-3.dt.yaml
	arch/arm/boot/dts/at91-vinco.dt.yaml
	arch/arm/boot/dts/at91-wb45n.dt.yaml
	arch/arm/boot/dts/at91-wb50n.dt.yaml
	arch/arm/boot/dts/ethernut5.dt.yaml
	arch/arm/boot/dts/evk-pro3.dt.yaml
	arch/arm/boot/dts/pm9g45.dt.yaml
	arch/arm/boot/dts/sama5d31ek.dt.yaml
	arch/arm/boot/dts/sama5d33ek.dt.yaml
	arch/arm/boot/dts/sama5d34ek.dt.yaml
	arch/arm/boot/dts/sama5d35ek.dt.yaml
	arch/arm/boot/dts/sama5d36ek_cmp.dt.yaml
	arch/arm/boot/dts/sama5d36ek.dt.yaml
	arch/arm/boot/dts/tny_a9260.dt.yaml
	arch/arm/boot/dts/tny_a9263.dt.yaml
	arch/arm/boot/dts/tny_a9263.dt.yaml
	arch/arm/boot/dts/tny_a9g20.dt.yaml
	arch/arm/boot/dts/usb_a9260.dt.yaml
	arch/arm/boot/dts/usb_a9263.dt.yaml
	arch/arm/boot/dts/usb_a9263.dt.yaml
	arch/arm/boot/dts/usb_a9g20.dt.yaml
	arch/arm/boot/dts/usb_a9g20_lpw.dt.yaml


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
