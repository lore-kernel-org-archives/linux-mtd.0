Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB65BC28B28
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Mar 2025 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfDepMDBT7wpPhfaXbcItPK3JzSwLlNfBC0fww4Epmc=; b=QaxXWsUWH5H0LB
	UWVm6iHFtTq4rmDLnfpGdwUWIyXTKDDRt41uxIcyU0nVNZXr3/wC3knLOhSfd5DfU/Bl0sYfpsHGz
	cwDo9NoJlsnLeqPPqS25xrV4Zl3itED0q9A8DlATQY629pqdwGNrH5ENf/4V5NC90qwgdTUfEyMn5
	duPNDAqFsse2m6iS2WBJHqHHEkdzoSM9DR091Ef6e0IqFTYGROUt5AWQeZnR8BCXy9Jr5d0NikVxV
	NVBoWhLLM5prGvK9beUxV39f4AiJNz6qAza0QYIiPkhgiV1VeS1RsasGI1OepTTXbKkjUn3jxINKx
	qO+8OuEMjE6J851fYZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIFn-00000007vzE-0Vuj;
	Wed, 12 Mar 2025 09:19:55 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIEo-00000007voy-1Ezj;
	Wed, 12 Mar 2025 09:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741771134; x=1773307134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QohO+qEryyUZNc5IxQGS+tP4cDEv1oyEh3/RIOphmwo=;
  b=Tig8wyE36l/hRLUjFVfJFImWh6FagIRPKatrOoBqsdcEh25ihdOCR3zh
   e3JdkvCkioUuIBeusn/s9SSwo2sTAnlV9Bkt187cwPQgwy/KBMirUBMpX
   T31ru0fJuVhZwOkiMTs+spFvVMX1Z9wBVb25l+PALU50a/TrWBmfSg3kR
   vFfXnkO8enq8mj/EzygQHamp3l/J18YDKJIs5WvA6f0qksWSKgbu/0Bj4
   +jWtipYarEsI4ft2gh9QCGvJGjNMCpSvUUHXPijkSfR+JW0HNeyIGuUjl
   XHnPsyVOLUDzNkN0YynoWK9B4bwmatwPjEDNPp0iWpzpJkQo535XCSQby
   Q==;
X-CSE-ConnectionGUID: Qv3Izcg5R4KdTvG1f68Ctg==
X-CSE-MsgGUID: /1/WL+5SQWOCLQChvocdwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46486846"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="46486846"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:18:52 -0700
X-CSE-ConnectionGUID: +8CO2PixQYSWJ8ZXPX6LEA==
X-CSE-MsgGUID: xnJrE98fRg6nZ98zAVfUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120801269"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2025 02:18:48 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsIEg-0008Jk-00;
	Wed, 12 Mar 2025 09:18:46 +0000
Date: Wed, 12 Mar 2025 17:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, krzysztof.kozlowski+dt@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, balamanikandan.gunasundar@microchip.com,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: atmel-nand: add legacy nand
 controllers
Message-ID: <202503121629.f5Hsa5Zy-lkp@intel.com>
References: <20250311122847.90081-4-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311122847.90081-4-balamanikandan.gunasundar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_021854_372441_93D38B68 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Balamanikandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes robh/for-next linus/master v6.14-rc6 next-20250311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Balamanikandan-Gunasundar/dt-bindings-mtd-microchip-nand-convert-txt-to-yaml/20250311-203706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20250311122847.90081-4-balamanikandan.gunasundar%40microchip.com
patch subject: [PATCH v2 3/3] dt-bindings: mtd: atmel-nand: add legacy nand controllers
reproduce: (https://download.01.org/0day-ci/archive/20250312/202503121629.f5Hsa5Zy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121629.f5Hsa5Zy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/atmel-nand.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
