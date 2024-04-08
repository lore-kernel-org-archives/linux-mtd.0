Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66702CD1292
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2024 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/wcgLzZiVO44U5FrgxrGJRs8d1Q6pDeydjt99bRHNY=; b=tvb5g80xygP9ca
	I9Cdpp2QVuT3e7f6WaNOsmxnAFa68ERTrNUtpL3S+0ZZY6d1l61BgcFin2ip/tJECIx9N3BN0KRqS
	igI1sstIGgJw0WLqYzH4nnzcZAbmr0qR3tOnaE3HRf5cogVcnpcHhlXW6yTVtC1wzeT7Pk9ytO86H
	o3xAK6an0fXG7pbWrhMV6VJjvcP/5MzIDKla6qxC5bOM5+kCzoLmqcdV8Dw+A1BF+HSDMe/MT3czI
	3JD/vZZ3dUudUlDjSD+5tWv7eZfSzUHdnqLU2euCVrhgzVT5bFxfaijRYoLWIT2tFmdLiJcLKREDo
	peyCQvSDWL9kRangDZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtwUM-0000000Gt7x-1Gt3;
	Mon, 08 Apr 2024 21:25:14 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtwUJ-0000000Gt71-2l6O;
	Mon, 08 Apr 2024 21:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712611512; x=1744147512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OtkJqsDRqHxww8gYyHxYwH7UByWcNGjo62aiyrPX3lc=;
  b=gUrR+BWx6sHYgw13Tj6DVfy92uvlLyzRUKiFyiow5u5y5p8rbp/modDN
   N6kAVY2STms6Dfz2QVrh7kQ8LepOEwvRosutiszNzsxNFymlYQ01lutlc
   9R4Xph0NPnBEU3MS7TJEmyX4XK8tmbBRE0a9sMefB1oDbBhxW7okBWeD9
   rIGU/1fol11glVPdi7FhtYA5hEDrZ8vnaIbPbIrpRcMXhnwXyOnpGTRJS
   tmEEUfW7sEgOR0mh1zlHfMOKK8u9MPvRPazF/YiX3CLKpw5QAg2DzJvi5
   KL8ce4JwWSFa9DPBmi2/kp9kqbVQBT+Kiik40k8ySCV60c54MCwinyedO
   A==;
X-CSE-ConnectionGUID: iDM65sA5Tgm0mc2UCsUE9A==
X-CSE-MsgGUID: RfqBHIEYQVOSICredxW0CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="25354701"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="25354701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 14:25:10 -0700
X-CSE-ConnectionGUID: qrO58ha8RyqJHmBfNrQIag==
X-CSE-MsgGUID: cWAhHusrSreh0wQEs4Hnjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19879521"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2024 14:25:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtwU9-0005VC-2i;
	Mon, 08 Apr 2024 21:25:01 +0000
Date: Tue, 9 Apr 2024 05:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	oxffffaa@gmail.com, kernel@sberdevices.ru,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <202404090420.FyEkmAU9-lkp@intel.com>
References: <20240408085931.456337-2-avkrasnov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408085931.456337-2-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_142511_758696_BF1FCE35 
X-CRM114-Status: GOOD (  11.62  )
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

Hi Arseniy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes mtd/nand/next robh/for-next linus/master v6.9-rc3 next-20240408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Krasnov/dt-bindings-mtd-amlogic-meson-nand-support-fields-for-boot-ROM-code/20240408-171119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20240408085931.456337-2-avkrasnov%40salutedevices.com
patch subject: [PATCH v2 1/2] dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090420.FyEkmAU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090420.FyEkmAU9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml:84:61: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml:85:61: [warning] too few spaces after comma (commas)

vim +84 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

     8	
     9	allOf:
    10	  - $ref: nand-controller.yaml
    11	
    12	maintainers:
    13	  - liang.yang@amlogic.com
    14	
    15	properties:
    16	  compatible:
    17	    enum:
    18	      - amlogic,meson-gxl-nfc
    19	      - amlogic,meson-axg-nfc
    20	
    21	  reg:
    22	    maxItems: 2
    23	
    24	  reg-names:
    25	    items:
    26	      - const: nfc
    27	      - const: emmc
    28	
    29	  interrupts:
    30	    maxItems: 1
    31	
    32	  clocks:
    33	    minItems: 2
    34	
    35	  clock-names:
    36	    items:
    37	      - const: core
    38	      - const: device
    39	
    40	patternProperties:
    41	  "^nand@[0-7]$":
    42	    type: object
    43	    $ref: raw-nand-chip.yaml
    44	    properties:
    45	      reg:
    46	        minimum: 0
    47	        maximum: 1
    48	
    49	      nand-ecc-mode:
    50	        const: hw
    51	
    52	      nand-ecc-step-size:
    53	        enum: [512, 1024]
    54	
    55	      nand-ecc-strength:
    56	        enum: [8, 16, 24, 30, 40, 50, 60]
    57	        description: |
    58	          The ECC configurations that can be supported are as follows.
    59	            meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
    60	            meson-axg-nfc 8
    61	
    62	      nand-rb:
    63	        maxItems: 1
    64	        items:
    65	          maximum: 0
    66	
    67	      amlogic,boot-page-last:
    68	        $ref: /schemas/types.yaml#/definitions/uint32
    69	        description:
    70	          The NFC driver needs this information to select ECC
    71	          algorithms supported by the boot ROM.
    72	
    73	      amlogic,boot-page-step:
    74	        $ref: /schemas/types.yaml#/definitions/uint32
    75	        description:
    76	          The NFC driver needs this information to select ECC
    77	          algorithms supported by the boot ROM (in pages).
    78	
    79	    unevaluatedProperties: false
    80	
    81	    dependencies:
    82	      nand-ecc-strength: [nand-ecc-step-size]
    83	      nand-ecc-step-size: [nand-ecc-strength]
  > 84	      amlogic,boot-page-last: [nand-is-boot-medium, amlogic,boot-page-step]
    85	      amlogic,boot-page-step: [nand-is-boot-medium, amlogic,boot-page-last]
    86	
    87	
    88	required:
    89	  - compatible
    90	  - reg
    91	  - interrupts
    92	  - clocks
    93	  - clock-names
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
