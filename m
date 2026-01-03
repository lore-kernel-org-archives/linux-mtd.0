Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0F1FC617C
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jan 2026 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juyQVQKWmy+p5ZXWbO+nh3LQg2ju9sE/wmAwBuHp0B0=; b=bP7KrLNQ1LnafS
	PpofP4KAHjmo3bsKsX6I8DAiJqqEZ1dnrClZmHKuyp3k3o2NMiXyY8dBksuQKqvPqe3hnpPyKftlK
	vbBJRrEE/oSdZF8OdvxEMJcJBc7QATBV0Z9K1VKxl+2sY0gdKxkNkg9p1fuCYHzTmS5RagekasbRm
	1BqVlcAeqZckWM5Q/sYpKhnUB6STeXadnocis55eh0hdn+qwPEVqZx9n8aZ/T230ut16OjDa/9fAE
	VbJEXSd2H4HxubF/Lrt5tD/wSVeMSseDbBkOqqqNZe4sycyK1yE7alJu5lW2Up0wTjP6FKLRxc33v
	CzmAzGxscla0yYwf33BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3se-00000009S5B-15Y5;
	Sat, 03 Jan 2026 15:49:28 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3sa-00000009S4l-40u0
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jan 2026 15:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767455365; x=1798991365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UdpQuAVYg3go+KFGqbG7KFffUg4tuMyA9VNoUN7RR3Y=;
  b=JDtExMVTyayUemWgg3FOmCEnWQQmRzoT8KI6odBHTEMS7WlA7c69bHJp
   zDV+kFG/OesZ8EjtdJmrujwXWVu8GDRnUbF81/6X/k1KsYB1Z39QTNRSw
   AKLy+U8HIs4eF3gXRqghx6MnVB97qzba6hj0/bMEcWoz1aip0/L2EOllV
   wxpg29sT7PcttujI7cYwhgM08hdszaBFbiNguleQRuW1AiVo61JMrNEHB
   ELlNsIJOiNRA0yMN9QazddC0Deuah0EUlmTUvt09TAXY9jpCASNzYZByZ
   mrwKEa6j6CjlNQG/bBhu0sMTycshKN3WeLrb5K3KMDbeQBs+bwEYuD+rZ
   A==;
X-CSE-ConnectionGUID: ahvTgseCQgOO0fQNG1XpAw==
X-CSE-MsgGUID: WRtbQHA2TAmEDrKc2T0F8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="91553965"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="91553965"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 07:49:23 -0800
X-CSE-ConnectionGUID: VXe0M/DUTV+IwoUHCnqyLA==
X-CSE-MsgGUID: J3J+DASXReGVxFLZ02U9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202033309"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Jan 2026 07:49:20 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc3sT-000000000j3-1173;
	Sat, 03 Jan 2026 15:49:17 +0000
Date: Sat, 3 Jan 2026 16:49:04 +0100
From: kernel test robot <lkp@intel.com>
To: Charan Pedumuru <charan.pedumuru@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <202601031603.9yKl8K9G-lkp@intel.com>
References: <20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_074925_067408_471C1431 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Charan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 43edce71d70c603d3f3f1b1c886f65cd02d80c24]

url:    https://github.com/intel-lab-lkp/linux/commits/Charan-Pedumuru/dt-bindings-mtd-nvidia-tegra20-nand-convert-to-DT-schema/20260103-131107
base:   43edce71d70c603d3f3f1b1c886f65cd02d80c24
patch link:    https://lore.kernel.org/r/20260103-nvidia-nand-v4-1-3156f46f3a5e%40gmail.com
patch subject: [PATCH v4] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20260103/202601031603.9yKl8K9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031603.9yKl8K9G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme
   ERROR: Cannot find file ./include/linux/pci.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
