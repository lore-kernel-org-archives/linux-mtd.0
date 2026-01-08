Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A459D1D48D
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZYLEB5175tMz+mHL7uZh0YSum+LXzh9rPDIvQMycw8=; b=OlCdbtcs70YM9w
	rHveI5xUeXky/r9IbeqeJV/pfv6WHHvIlu0sQHjwSDDkeH6ID1mktF/53yfXfaVwvpNjXPuTsfSg0
	80YwgEv1ph+XcuqRZm+SUw0efEHaGuJOyA4qw84ohpCMTM6DLUxGYx0iQF75awxxpCmjflfiQbWPC
	AH7MgGa9eCa0ClKYLbxjabCRsBe5W5NMgV442jcjx2nWK1UJrCZvJP6veoPCcx9SSoSspoz39mcYY
	+/4WemBkpTtKnLeKr2kDVcC/Ocrab8F/wi+CEkAQLrl4O1e2mbnjcEO3REm6RmupDJNrM1eFjhiD+
	BmZbStGGoK5EUQNfwB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwSZ-00000000oP1-2gq4;
	Thu, 08 Jan 2026 20:18:19 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwSW-00000000oOG-310D;
	Thu, 08 Jan 2026 20:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767903497; x=1799439497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IaKwAwqUjEP/H4Uu8gktFLEcbWUv+03sgJ/aclvvRWs=;
  b=SsKB4duwqJt0YJZe0uVNcUrO0t+PNr2bAG+OY3CWZJ8995RX0pa2KDmn
   9JjQDPqX6gBHHKvtk5XWV25oK3wvaZBB/2Yt3hD/YU2eOzT9z0OYLuaLu
   7/u89599BVm4N6o9cvxKtuhAwWozKr0MOqNqGzTaynLEVug8RqI1/uWl0
   CE3iDqvd4VzApLJ4iWAgWQ0OmrHT1VG2BxVmDkNNOwGpEo2t4A6lLI6Xg
   8Ks9BZvRgarxDPA8xCLJ9gd5mdtU8mYTJJl9luTHI/AwD1/eNpOfS5OCW
   f87ZvukCtcNMNoxuRkJEBop+NwLPR2EJF46VVS8Y6zsx/ifJFiL8MDo+z
   g==;
X-CSE-ConnectionGUID: aBubOOVDSoCzS0x3ljuOyA==
X-CSE-MsgGUID: NWBn3WR9QKqDR1SbfweFNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="71864840"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="71864840"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 12:18:16 -0800
X-CSE-ConnectionGUID: 3/ip24gkROmaKTCQQTshdw==
X-CSE-MsgGUID: DuZ4Hk+7ThaHnBZosYVaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203354211"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Jan 2026 12:18:13 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdwSQ-000000001qi-0t5E;
	Thu, 08 Jan 2026 20:18:10 +0000
Date: Thu, 8 Jan 2026 21:17:19 +0100
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <202601082105.TThX0916-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_121816_791692_EB5FADDD 
X-CRM114-Status: GOOD (  10.51  )
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

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/of-reserved_mem-Fix-placement-of-__free-annotation/20260107-211455
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260107-mtd-memregion-v3-2-f9fc9107b992%40bootlin.com
patch subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries for memory-region
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260108/202601082105.TThX0916-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082105.TThX0916-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082105.TThX0916-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'
>> Warning: drivers/of/of_reserved_mem.c:902 expecting prototype for of_reserved_mem_region_count(). Prototype was for of_reserved_mem_region_total_count() instead
>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
