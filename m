Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE7E936F8
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 02:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26BD4V9EeNgK7gRiSB14VwiutwNStbsb1/CjT5kh6+U=; b=qsSiGqxB5lSQnF
	YY4UWQ8CzVmZtInFDUHiXI+aZA3DiH/sgzgjUiS+OZz1GlQokm5COYkHTgytf4odyBeC/ALRSY8oO
	N+hwvEeGZ0w/kPFFEBKBQY8PE3ZUke3JCitkF3SQpki15rf5+1FbF0BPxBWDpRzm9DwEXvhwCnD2R
	+ZD/PCeKK+ug7GzWNfFZRhkUbGdgZtISaQ50z/gwYFKIN7z3ZB6ueF9BXbYSRuFj/1VwcbFY9bR7x
	BK0n9nQc1jeZZxCYF72YXuYNEvilE1rcS1O4sJx1s2oiVOlZCEVBLISltmkXfefLBMuN/NBca2nwr
	b1bfHCIA43vkxdLJQCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoEER-001FWt-38;
	Thu, 05 Oct 2023 02:36:55 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoEEP-001FVv-1b
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 02:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696473413; x=1728009413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wCzJ4bq/A7WYAVJAq/Zir4st/tGC6jlHLq+4zYE7yrk=;
  b=SIvG7mEygioevSpv/EQt1lo+r9KB1Ygy6g2W5fGFQrm9VNxGOzm7QMbL
   tURU7l9F6pwdYT++OU6Ty/XZbjXBCYNr3Vlqeobokzqk7xF//7iqylaQ2
   /a8Gj+zd1bG2qYhmB98SQwBo1J5zq7bF+KQO8yGejL3z2JZcMUfouItMW
   UWoKii50EaiL4z/Yj44cl4JPGY5YBxgY4u5SN8Y0qT/dPw8TgoLfhbLk/
   SCbX4bPD7IZU8RQkDBKwy4g31hNddXLyFR6SmX2etIEXKORe+SNK0QD+p
   fsqQQWycjNDP0f7XoKAwcg8QLv9rO89mxCbsU/wYAKwEdcKqnyXaaCOYO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383282008"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="383282008"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 19:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842194633"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="842194633"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2023 19:36:40 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoEE9-000KtU-1S;
	Thu, 05 Oct 2023 02:36:37 +0000
Date: Thu, 5 Oct 2023 10:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: niravkumar.l.rabara@intel.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Message-ID: <202310051014.XuwY3fGK-lkp@intel.com>
References: <20231004061214.17176-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004061214.17176-1-niravkumar.l.rabara@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_193653_637463_DB3E319A 
X-CRM114-Status: GOOD (  13.73  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes robh/for-next linus/master v6.6-rc4 next-20231004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/niravkumar-l-rabara-intel-com/dt-bindings-mtd-cadence-convert-cadence-nand-controller-txt-to-yaml/20231004-141601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20231004061214.17176-1-niravkumar.l.rabara%40intel.com
patch subject: [PATCH] dt-bindings: mtd: cadence: convert cadence-nand-controller.txt to yaml
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051014.XuwY3fGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051014.XuwY3fGK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
