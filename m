Return-Path: <SRS0=aH78=MN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4525C12002
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 10:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8299460C40
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 10:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8299460C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iWc72B/YOPqrrXFVJpfO7jIuevrRzWI/ev2HYNh7Ng=; b=PA1ndbGcIhlPtA
	U61fPyCh5az6w9xJrNvrfAAyQT7dztHV8FNFjmXNkkCtPM7FwtC4VKXvNDCuh5gzFoacw0ToR8R7L
	p2+ZKNaLpG4V/F8veoKnexoWrFWgF4VhwMew9cO0wYCqoXFdfO0oZkLJKis7UBe52p5u1u3UCeQdm
	WeY3n0Buj2lhvwxah7Ka2Ye82Y3Z5MT2dHkBroxoFCgcVDEfWH5i7MdpLEbn5BkY2Nu7BMmgzomcc
	Gudv454Ma/qMnOtnk/EkbK8NXgmCXDZQoYSTpYx6VOymfcLqvXCfiK5D3Js7RmJshYg/zXgf4VR2E
	qmclc73iYfxWUSHs7q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m69JB-00FE3e-GA; Wed, 21 Jul 2021 10:18:33 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69J7-00FE2W-GY
 for linux-mtd@lists.infradead.org; Wed, 21 Jul 2021 10:18:31 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211409796"
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="211409796"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 03:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="432558915"
Received: from lkp-server01.sh.intel.com (HELO b8b92b2878b0) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2021 03:18:25 -0700
Received: from kbuild by b8b92b2878b0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m69J2-0000J4-8E; Wed, 21 Jul 2021 10:18:24 +0000
Date: Wed, 21 Jul 2021 18:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, Apurva Nandan <a-nandan@ti.com>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nand: Convert to DT schema format
Message-ID: <202107211818.sbizhVdd-lkp@intel.com>
References: <20210718004125.733-1-a-nandan@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210718004125.733-1-a-nandan@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_031829_651047_CD0BAD5F 
X-CRM114-Status: GOOD (  11.52  )
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

Hi Apurva,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes robh/for-next v5.14-rc2 next-20210720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Apurva-Nandan/dt-bindings-mtd-spi-nand-Convert-to-DT-schema-format/20210718-103130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
compiler: arm-linux-gnueabi-gcc (GCC) 10.3.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/simple-bus.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml: clock-controller@1800000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,gcc.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/rng@22000: failed to match any schema with compatible: ['qcom,prng']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/pinctrl@1000000: failed to match any schema with compatible: ['qcom,ipq4019-pinctrl']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml: usb-power: $nodename:0: 'usb-power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/sdhci@7824900: failed to match any schema with compatible: ['qcom,sdhci-msm-v4']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/dma@7884000: failed to match any schema with compatible: ['qcom,bam-v1.7.0']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/spi@78b5000: failed to match any schema with compatible: ['qcom,spi-qup-v2.2.1']
>> arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml: nand@1: $nodename:0: 'nand@1' does not match '^flash(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mtd/spi-nand.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/spi@78b6000: failed to match any schema with compatible: ['qcom,spi-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/i2c@78b7000: failed to match any schema with compatible: ['qcom,i2c-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/i2c@78b8000: failed to match any schema with compatible: ['qcom,i2c-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/dma@8e04000: failed to match any schema with compatible: ['qcom,bam-v1.7.0']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/crypto@8e3a000: failed to match any schema with compatible: ['qcom,crypto-v5.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/clock-controller@b088000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/clock-controller@b098000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/clock-controller@b0a8000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml:0:0: /soc/clock-controller@b0b8000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
--
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/simple-bus.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml: clock-controller@1800000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,gcc.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/rng@22000: failed to match any schema with compatible: ['qcom,prng']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/pinctrl@1000000: failed to match any schema with compatible: ['qcom,ipq4019-pinctrl']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml: usb-power: $nodename:0: 'usb-power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/sdhci@7824900: failed to match any schema with compatible: ['qcom,sdhci-msm-v4']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/dma@7884000: failed to match any schema with compatible: ['qcom,bam-v1.7.0']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/spi@78b5000: failed to match any schema with compatible: ['qcom,spi-qup-v2.2.1']
>> arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml: nand@1: $nodename:0: 'nand@1' does not match '^flash(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mtd/spi-nand.yaml
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/spi@78b6000: failed to match any schema with compatible: ['qcom,spi-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/i2c@78b7000: failed to match any schema with compatible: ['qcom,i2c-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/i2c@78b8000: failed to match any schema with compatible: ['qcom,i2c-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/dma@8e04000: failed to match any schema with compatible: ['qcom,bam-v1.7.0']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/crypto@8e3a000: failed to match any schema with compatible: ['qcom,crypto-v5.1']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/clock-controller@b088000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/clock-controller@b098000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/clock-controller@b0a8000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml:0:0: /soc/clock-controller@b0b8000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
--
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml: soc: pci@40000000:reg:0: [1073741824, 3869, 1073745696, 168, 524288, 8192, 1074790400, 4096] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/simple-bus.yaml
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml: clock-controller@1800000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,gcc.yaml
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/rng@22000: failed to match any schema with compatible: ['qcom,prng']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/pinctrl@1000000: failed to match any schema with compatible: ['qcom,ipq4019-pinctrl']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/sdhci@7824900: failed to match any schema with compatible: ['qcom,sdhci-msm-v4']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/dma@7884000: failed to match any schema with compatible: ['qcom,bam-v1.7.0']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/spi@78b5000: failed to match any schema with compatible: ['qcom,spi-qup-v2.2.1']
>> arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml: spi-nand@1: $nodename:0: 'spi-nand@1' does not match '^flash(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mtd/spi-nand.yaml
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/spi@78b6000: failed to match any schema with compatible: ['qcom,spi-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/i2c@78b7000: failed to match any schema with compatible: ['qcom,i2c-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/i2c@78b8000: failed to match any schema with compatible: ['qcom,i2c-qup-v2.2.1']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/dma@8e04000: failed to match any schema with compatible: ['qcom,bam-v1.7.0']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/crypto@8e3a000: failed to match any schema with compatible: ['qcom,crypto-v5.1']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/clock-controller@b088000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/clock-controller@b098000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/clock-controller@b0a8000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']
   arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml:0:0: /soc/clock-controller@b0b8000: failed to match any schema with compatible: ['qcom,kpss-acc-v2']

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
