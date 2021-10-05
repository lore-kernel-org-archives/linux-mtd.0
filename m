Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C290DC43217
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 12:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958B361507
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 12:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 958B361507
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsRMHda9UrphWbZOsQow8uetUHG80AsvErKjbvk19Lk=; b=1lWJZawSCVbQoE
	meycce4th0a4OcnZdAq/Oh3ONPpKnt/5NQPj2UxE0xM1UpdGDrJskAyTazD4y0fGZGSqZLpkwpoyD
	f4r2zBMF1sY1bCxz773IPlMRqtrbMlf2wXgzzru3R5HCEmJvmouLYR8rYbnQRKGrt2IO6uOztPjtn
	BhpFMTD2XcJJrWQlXeglgLrrp+ljHtvb7AvS0m22a/FARwUtta5Cz1h5UWFn0Vq19O8yK8JHIl5+N
	zwoEn7jil3o+DAwtOOa0+tm3danb3I+JIcOTnL0zYfiZBNifWhVuUo1qJ8ov/SLyoOi0fZL1Y9hUa
	3AQgXxum5uZ+p43qf4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXjXE-00APAk-0M; Tue, 05 Oct 2021 12:27:04 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXjWt-00AP0y-TX
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 12:26:47 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so25594821otj.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Oct 2021 05:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=cxP+osM9EjaTOrSYeyyf+G9A794irMHfcqvITsC9V74=;
 b=EoAxB8pr49YplfoAyN8mN+KO/hY/Jpw6WSg5wUIqu+nKoz2UrUqNi/T1zPB9FEzhwH
 wfvMG17HtbMjZTLm3/bFeit2Q9HOIxFCTmzIn5wJE4nUh3sVzrCVvtdCVjIT7ZOh67w8
 Rifx94dZ8oOg8+OaOrjx7FBxYYblEFnXBTNZSDB51tk1YkwRi7FfrhdL4QRqb4WBVFuX
 YNklu0tIFRObK9mJJWAAvziNfA+8hWqLa1ET4KDXMHQjB3+VlT7lnpwXni954QaL02zD
 RuASCm13e8ZDGVavJ7LVj8E0PVIXgxeRYowfO6iUAj/qVKvO0juHC+NuYbRR4iFHqxIS
 xWAw==
X-Gm-Message-State: AOAM530vTsPyPTeon0cdyDIFayWU+nBmSvJjsmsAUhQfCKF1hK9MP+wP
 U+N3zOhMHpiTro6yiZPUfuAvh34/Zg==
X-Google-Smtp-Source: ABdhPJztIpLfcXXqLpHFH2LZMH7KpYgrO/JDu6lmjB3aFdKNWE/zqBC8z38OCVUuS1QEun6pu0zJtg==
X-Received: by 2002:a9d:468a:: with SMTP id z10mr13242518ote.110.1633436801677; 
 Tue, 05 Oct 2021 05:26:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bj33sm3518455oib.31.2021.10.05.05.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 05:26:40 -0700 (PDT)
Received: (nullmailer pid 3226819 invoked by uid 1000);
 Tue, 05 Oct 2021 12:26:38 -0000
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <Alexander.Stein@tq-systems.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>
In-Reply-To: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
References: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add output-driver-strength
 property
Date: Tue, 05 Oct 2021 07:26:38 -0500
Message-Id: <1633436798.695084.3226817.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_052644_027691_7105D243 
X-CRM114-Status: GOOD (  15.23  )
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

On Mon, 04 Oct 2021 13:15:28 +0200, Alexander Stein wrote:
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> This property is for optimizing output voltage impedance and is
> specific to each board.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I checked Micron and Macronix datasheets. Both have similar but not
> identical supported values. Also the register locations are different.
> For those reasons I decided to specify the Ohms value directly and let
> the device specfic driver figure out if it is supported where to write
> it to.
> BTW: Are the Ohm values and the corresponding register bits standardized
> somewhere?
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1536062


firmware-flash@0: $nodename:0: 'firmware-flash@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/mmp3-dell-ariel.dt.yaml

Flash@0: $nodename:0: 'Flash@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml

flash@0: 'at91bootstrap@0', 'bootloader@40000', 'bootloaderenv@140000', 'bootloaderenvred@100000', 'dtb@180000', 'kernel@200000' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/at91-sam9x60ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d27_som1_ek.dt.yaml
	arch/arm/boot/dts/at91-sama5d2_icp.dt.yaml

flash@0: 'at91bootstrap@0', 'bootloader@40000', 'bootloaderenv@140000', 'bootloaderenvred@100000', 'dtb@180000', 'kernel@200000', 'misc@800000' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/at91-sama5d2_xplained.dt.yaml

flash@0: 'cdns,block-size', 'cdns,page-size', 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml

flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/ti/k3-am642-evm.dt.yaml
	arch/arm64/boot/dts/ti/k3-am642-sk.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am654-base-board.dt.yaml
	arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dt.yaml
	arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dt.yaml
	arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dt.yaml

flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/ls1021a-tsn.dt.yaml

flash@0: 'm25p,default-addr-width' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/bcm953012hr.dt.yaml
	arch/arm/boot/dts/bcm953012k.dt.yaml

flash@0: 'mode' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/kirkwood-cloudbox.dt.yaml
	arch/arm/boot/dts/kirkwood-d2net.dt.yaml
	arch/arm/boot/dts/kirkwood-is2.dt.yaml
	arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dt.yaml
	arch/arm/boot/dts/kirkwood-nas2big.dt.yaml
	arch/arm/boot/dts/kirkwood-net2big.dt.yaml
	arch/arm/boot/dts/kirkwood-net5big.dt.yaml
	arch/arm/boot/dts/kirkwood-ns2.dt.yaml
	arch/arm/boot/dts/kirkwood-ns2lite.dt.yaml
	arch/arm/boot/dts/kirkwood-ns2max.dt.yaml
	arch/arm/boot/dts/kirkwood-ns2mini.dt.yaml
	arch/arm/boot/dts/kirkwood-t5325.dt.yaml

flash@0: 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dt.yaml
	arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml
	arch/arm/boot/dts/r8a7742-iwg21d-q7.dt.yaml
	arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dt.yaml
	arch/arm/boot/dts/r8a7743-iwg20d-q7.dt.yaml
	arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dt.yaml
	arch/arm/boot/dts/r8a7744-iwg20d-q7.dt.yaml
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dt.yaml
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dt.yaml
	arch/arm/boot/dts/r8a77470-iwg23s-sbc.dt.yaml
	arch/arm/boot/dts/r8a7790-lager.dt.yaml
	arch/arm/boot/dts/r8a7790-stout.dt.yaml
	arch/arm/boot/dts/r8a7791-koelsch.dt.yaml
	arch/arm/boot/dts/r8a7792-wheat.dt.yaml
	arch/arm/boot/dts/r8a7793-gose.dt.yaml
	arch/arm/boot/dts/r8a7794-alt.dt.yaml
	arch/arm/boot/dts/r8a7794-silk.dt.yaml

flash@0: 'ti,spi-wdelay' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/da850-lego-ev3.dt.yaml

flash@1: 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dt.yaml

flash@2: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dt.yaml

flash@2: 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dt.yaml
	arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dt.yaml

flash: 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/lpc4357-ea4357-devkit.dt.yaml
	arch/arm/boot/dts/lpc4357-myd-lpc4357.dt.yaml

m25p128@0: $nodename:0: 'm25p128@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/kirkwood-rd88f6192.dt.yaml
	arch/arm/boot/dts/kirkwood-ts219-6281.dt.yaml
	arch/arm/boot/dts/kirkwood-ts219-6282.dt.yaml
	arch/arm/boot/dts/kirkwood-ts419-6281.dt.yaml
	arch/arm/boot/dts/kirkwood-ts419-6282.dt.yaml

m25p128@0: 'mode' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/kirkwood-rd88f6192.dt.yaml
	arch/arm/boot/dts/kirkwood-ts219-6281.dt.yaml
	arch/arm/boot/dts/kirkwood-ts219-6282.dt.yaml
	arch/arm/boot/dts/kirkwood-ts419-6281.dt.yaml
	arch/arm/boot/dts/kirkwood-ts419-6282.dt.yaml

m25p16@0: $nodename:0: 'm25p16@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/kirkwood-b3.dt.yaml

m25p16@0: 'mode' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/kirkwood-b3.dt.yaml

m25p32@1: $nodename:0: 'm25p32@1' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/imx50-evk.dt.yaml
	arch/arm/boot/dts/imx53-smd.dt.yaml

m25p32@1: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx53-smd.dt.yaml

m25p40@0: $nodename:0: 'm25p40@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/kirkwood-dreamplug.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lsqvl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lsvl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lswsxl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lswvl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lswxl.dt.yaml
	arch/arm/boot/dts/kirkwood-lschlv2.dt.yaml
	arch/arm/boot/dts/kirkwood-lsxhl.dt.yaml

m25p40@0: 'mode' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/kirkwood-dreamplug.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lsqvl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lsvl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lswsxl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lswvl.dt.yaml
	arch/arm/boot/dts/kirkwood-linkstation-lswxl.dt.yaml
	arch/arm/boot/dts/kirkwood-lschlv2.dt.yaml
	arch/arm/boot/dts/kirkwood-lsxhl.dt.yaml

m25p80@0: $nodename:0: 'm25p80@0' does not match '^flash(@.*)?$'
	arch/arm64/boot/dts/marvell/armada-3720-db.dt.yaml
	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml
	arch/arm/boot/dts/am335x-phycore-rdk.dt.yaml
	arch/arm/boot/dts/am335x-regor-rdk.dt.yaml
	arch/arm/boot/dts/am335x-wega-rdk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/at91-vinco.dt.yaml
	arch/arm/boot/dts/da850-evm.dt.yaml
	arch/arm/boot/dts/imx28-evk.dt.yaml
	arch/arm/boot/dts/imx28-m28evk.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos_4.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos_7.dt.yaml
	arch/arm/boot/dts/imx6dl-dfi-fs700-m60.dt.yaml
	arch/arm/boot/dts/imx6dl-nitrogen6x.dt.yaml
	arch/arm/boot/dts/imx6dl-rex-basic.dt.yaml
	arch/arm/boot/dts/imx6dl-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6dl-sabrelite.dt.yaml
	arch/arm/boot/dts/imx6dl-sabresd.dt.yaml
	arch/arm/boot/dts/imx6q-cm-fx6.dt.yaml
	arch/arm/boot/dts/imx6q-dfi-fs700-m60.dt.yaml
	arch/arm/boot/dts/imx6q-dmo-edmqmx6.dt.yaml
	arch/arm/boot/dts/imx6q-gw5400-a.dt.yaml
	arch/arm/boot/dts/imx6q-nitrogen6x.dt.yaml
	arch/arm/boot/dts/imx6qp-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6qp-sabresd.dt.yaml
	arch/arm/boot/dts/imx6q-rex-pro.dt.yaml
	arch/arm/boot/dts/imx6q-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6q-sabrelite.dt.yaml
	arch/arm/boot/dts/imx6q-sabresd.dt.yaml
	arch/arm/boot/dts/imx6q-utilite-pro.dt.yaml
	arch/arm/boot/dts/imx6sl-evk.dt.yaml
	arch/arm/boot/dts/keystone-k2g-evm.dt.yaml
	arch/arm/boot/dts/keystone-k2g-ice.dt.yaml
	arch/arm/boot/dts/kirkwood-dir665.dt.yaml
	arch/arm/boot/dts/kirkwood-ds109.dt.yaml
	arch/arm/boot/dts/kirkwood-ds110jv10.dt.yaml
	arch/arm/boot/dts/kirkwood-ds111.dt.yaml
	arch/arm/boot/dts/kirkwood-ds112.dt.yaml
	arch/arm/boot/dts/kirkwood-ds209.dt.yaml
	arch/arm/boot/dts/kirkwood-ds210.dt.yaml
	arch/arm/boot/dts/kirkwood-ds212.dt.yaml
	arch/arm/boot/dts/kirkwood-ds212j.dt.yaml
	arch/arm/boot/dts/kirkwood-ds409.dt.yaml
	arch/arm/boot/dts/kirkwood-ds409slim.dt.yaml
	arch/arm/boot/dts/kirkwood-ds411.dt.yaml
	arch/arm/boot/dts/kirkwood-ds411j.dt.yaml
	arch/arm/boot/dts/kirkwood-ds411slim.dt.yaml
	arch/arm/boot/dts/kirkwood-rs212.dt.yaml
	arch/arm/boot/dts/kirkwood-rs409.dt.yaml
	arch/arm/boot/dts/kirkwood-rs411.dt.yaml

m25p80@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/keystone-k2g-evm.dt.yaml
	arch/arm/boot/dts/keystone-k2g-ice.dt.yaml

m25p80@0: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx6q-cm-fx6.dt.yaml
	arch/arm/boot/dts/imx6q-gw5400-a.dt.yaml
	arch/arm/boot/dts/imx6q-utilite-pro.dt.yaml

m25p80@0: 'mode' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/kirkwood-ds109.dt.yaml
	arch/arm/boot/dts/kirkwood-ds110jv10.dt.yaml
	arch/arm/boot/dts/kirkwood-ds111.dt.yaml
	arch/arm/boot/dts/kirkwood-ds112.dt.yaml
	arch/arm/boot/dts/kirkwood-ds209.dt.yaml
	arch/arm/boot/dts/kirkwood-ds210.dt.yaml
	arch/arm/boot/dts/kirkwood-ds212.dt.yaml
	arch/arm/boot/dts/kirkwood-ds212j.dt.yaml
	arch/arm/boot/dts/kirkwood-ds409.dt.yaml
	arch/arm/boot/dts/kirkwood-ds409slim.dt.yaml
	arch/arm/boot/dts/kirkwood-ds411.dt.yaml
	arch/arm/boot/dts/kirkwood-ds411j.dt.yaml
	arch/arm/boot/dts/kirkwood-ds411slim.dt.yaml
	arch/arm/boot/dts/kirkwood-rs212.dt.yaml
	arch/arm/boot/dts/kirkwood-rs409.dt.yaml
	arch/arm/boot/dts/kirkwood-rs411.dt.yaml

m25p80@1: $nodename:0: 'm25p80@1' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/imx6dl-aristainetos2_4.dt.yaml
	arch/arm/boot/dts/imx6dl-aristainetos2_7.dt.yaml

mx66l51235l@0: $nodename:0: 'mx66l51235l@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/stm32mp157c-ev1.dt.yaml

mx66l51235l@1: $nodename:0: 'mx66l51235l@1' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/stm32mp157c-ev1.dt.yaml

n25q032@0: $nodename:0: 'n25q032@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/imx6q-b450v3.dt.yaml
	arch/arm/boot/dts/imx6q-b650v3.dt.yaml
	arch/arm/boot/dts/imx6q-b850v3.dt.yaml
	arch/arm/boot/dts/imx6q-dms-ba16.dt.yaml

n25q256a@0: $nodename:0: 'n25q256a@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml
	arch/arm/boot/dts/imx6ul-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ull-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ulz-14x14-evk.dt.yaml

n25q256a@2: $nodename:0: 'n25q256a@2' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml

s25fl016k@0: $nodename:0: 's25fl016k@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/qcom-ipq8064-rb3011.dt.yaml

s25fl128s@0: $nodename:0: 's25fl128s@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml

s25fl128s@2: $nodename:0: 's25fl128s@2' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml

s25fl256@0: $nodename:0: 's25fl256@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/am3874-iceboard.dt.yaml

s25fl256@0: 'bootenv@2', 'fs@5', 'fsbl@0', 'ipmi@4', 'kernel@3', 'ssbl@1' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am3874-iceboard.dt.yaml

spi-flash@0: $nodename:0: 'spi-flash@0' does not match '^flash(@.*)?$'
	arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dt.yaml
	arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dt.yaml
	arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml
	arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dt.yaml
	arch/arm64/boot/dts/marvell/armada-7040-db.dt.yaml
	arch/arm64/boot/dts/marvell/armada-7040-db.dt.yaml
	arch/arm64/boot/dts/marvell/armada-8040-db.dt.yaml
	arch/arm64/boot/dts/marvell/armada-8040-db.dt.yaml
	arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dt.yaml
	arch/arm64/boot/dts/marvell/cn9130-crb-A.dt.yaml
	arch/arm64/boot/dts/marvell/cn9130-crb-B.dt.yaml
	arch/arm64/boot/dts/marvell/cn9130-db-B.dt.yaml
	arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml
	arch/arm64/boot/dts/marvell/cn9131-db-B.dt.yaml
	arch/arm64/boot/dts/marvell/cn9131-db-B.dt.yaml
	arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml
	arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml
	arch/arm64/boot/dts/marvell/cn9132-db-B.dt.yaml
	arch/arm64/boot/dts/marvell/cn9132-db-B.dt.yaml
	arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml
	arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml
	arch/arm/boot/dts/armada-370-db.dt.yaml
	arch/arm/boot/dts/armada-370-seagate-personal-cloud-2bay.dt.yaml
	arch/arm/boot/dts/armada-370-seagate-personal-cloud.dt.yaml
	arch/arm/boot/dts/armada-370-synology-ds213j.dt.yaml
	arch/arm/boot/dts/armada-375-db.dt.yaml
	arch/arm/boot/dts/armada-385-clearfog-gtr-l8.dt.yaml
	arch/arm/boot/dts/armada-385-clearfog-gtr-s4.dt.yaml
	arch/arm/boot/dts/armada-385-db-88f6820-amc.dt.yaml
	arch/arm/boot/dts/armada-385-db-ap.dt.yaml
	arch/arm/boot/dts/armada-385-synology-ds116.dt.yaml
	arch/arm/boot/dts/armada-388-clearfog-base.dt.yaml
	arch/arm/boot/dts/armada-388-clearfog.dt.yaml
	arch/arm/boot/dts/armada-388-clearfog-pro.dt.yaml
	arch/arm/boot/dts/armada-388-db.dt.yaml
	arch/arm/boot/dts/armada-388-gp.dt.yaml
	arch/arm/boot/dts/armada-388-helios4.dt.yaml
	arch/arm/boot/dts/armada-388-rd.dt.yaml
	arch/arm/boot/dts/armada-398-db.dt.yaml
	arch/arm/boot/dts/armada-xp-axpwifiap.dt.yaml
	arch/arm/boot/dts/armada-xp-crs305-1g-4s-bit.dt.yaml
	arch/arm/boot/dts/armada-xp-crs305-1g-4s.dt.yaml
	arch/arm/boot/dts/armada-xp-crs326-24g-2s-bit.dt.yaml
	arch/arm/boot/dts/armada-xp-crs326-24g-2s.dt.yaml
	arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s-bit.dt.yaml
	arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dt.yaml
	arch/arm/boot/dts/armada-xp-db.dt.yaml
	arch/arm/boot/dts/armada-xp-gp.dt.yaml
	arch/arm/boot/dts/armada-xp-synology-ds414.dt.yaml
	arch/arm/boot/dts/at91-dvk_som60.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/sun8i-v3-sl631-imx179.dt.yaml
	arch/arm/boot/dts/tegra114-dalmore.dt.yaml
	arch/arm/boot/dts/tegra124-jetson-tk1.dt.yaml
	arch/arm/boot/dts/tegra124-venice2.dt.yaml
	arch/arm/boot/dts/tegra20-trimslice.dt.yaml

spi_flash@0: $nodename:0: 'spi_flash@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dt.yaml

spiflash@0: $nodename:0: 'spiflash@0' does not match '^flash(@.*)?$'
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-it.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml

spi_flash@0: 'at91bootstrap@0', 'bootloader@40000', 'bootloaderenv@140000', 'bootloaderenvred@100000', 'dtb@180000', 'kernel@200000' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dt.yaml

spi-flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/armada-370-db.dt.yaml

spi-flash@1: $nodename:0: 'spi-flash@1' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/armada-385-atl-x530.dt.yaml
	arch/arm/boot/dts/tegra30-beaver.dt.yaml
	arch/arm/boot/dts/tegra30-cardhu-a02.dt.yaml
	arch/arm/boot/dts/tegra30-cardhu-a04.dt.yaml

spi-flash@9: $nodename:0: 'spi-flash@9' does not match '^flash(@.*)?$'
	arch/arm64/boot/dts/microchip/sparx5_pcb125.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml

spi-nor@0: $nodename:0: 'spi-nor@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/armada-385-turris-omnia.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

spi-nor@0: 'partitions@80000000' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

spi-nor@0: 'partitions@A0000000' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

spi-nor@1: $nodename:0: 'spi-nor@1' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

spi-nor@1: 'npcm,fiu-rx-bus-width', 'partitions@88000000' do not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

spi-nor@1: 'partitions@88000000' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml

w25q64cvzpig@0: $nodename:0: 'w25q64cvzpig@0' does not match '^flash(@.*)?$'
	arch/arm/boot/dts/am437x-cm-t43.dt.yaml
	arch/arm/boot/dts/am437x-sbc-t43.dt.yaml


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
