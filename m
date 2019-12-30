Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B692BC2D0C2
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 12:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB0F206DB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 12:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XsMxB9UQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AB0F206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lYQitQljLAkUbuuejVijIZbjBRcSkEnMz2bW+mlzUc=; b=XsMxB9UQbPQtpq
	Kf2Dskim9scfiwrDXIsQhGuRoXtDfJa6teewH8IQqYfpeYyo8Dgx1xUPJ/jyDkrEP6UZYCefwY6Z0
	ZsxqRutAoPof3wzY5MRtmh82d+cRGXsSkvDtTfA/1CiitRvGVCw06mdMMdxvBHS6ykzKAdziNLC+g
	jrdhPt96NMz61HH7Ifdmt1mxlVL2XPXLBOYrxdIWt2BtYoPK5wqxCNOyCNMxHjk5eEv5t0I4Mmi9b
	Sn2Y4PCI98i/BjANpx96jeunFcwwX2qxPvppJke7aT+AGs+i33rNwGExQUCV8VT+8xECnBcKox5KT
	5pKtW0/M6tF8ELEwxibQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iluJs-0001j4-I8; Mon, 30 Dec 2019 12:38:48 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iluJp-0001iH-58
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 12:38:46 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 04:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="368597928"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 30 Dec 2019 04:38:39 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iluJi-0007xD-M5; Mon, 30 Dec 2019 20:38:38 +0800
Date: Mon, 30 Dec 2019 20:37:58 +0800
From: kbuild test robot <lkp@intel.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mtd: rawnand: macronix: Use match_string() helper
 to simplify the code
Message-ID: <201912302029.5N9R0LjB%lkp@intel.com>
References: <20191230025217.30812-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191230025217.30812-1-yuehaibing@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_043845_240709_861971E8 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: kbuild-all@lists.01.org, vigneshr@ti.com, richard@nod.at,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi YueHaibing,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20191220]
[also build test WARNING on linus/master v5.5-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/YueHaibing/mtd-rawnand-macronix-Use-match_string-helper-to-simplify-the-code/20191230-111849
base:    7ddd09fc4b745fb1d8942f95389583e08412e0cd

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

smatch warnings:
drivers/mtd/nand/raw/nand_macronix.c:85 macronix_nand_fix_broken_get_timings() warn: unsigned 'i' is never less than zero.

vim +/i +85 drivers/mtd/nand/raw/nand_macronix.c

    54	
    55	/*
    56	 * Macronix AC series does not support using SET/GET_FEATURES to change
    57	 * the timings unlike what is declared in the parameter page. Unflag
    58	 * this feature to avoid unnecessary downturns.
    59	 */
    60	static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
    61	{
    62		unsigned int i;
    63		static const char * const broken_get_timings[] = {
    64			"MX30LF1G18AC",
    65			"MX30LF1G28AC",
    66			"MX30LF2G18AC",
    67			"MX30LF2G28AC",
    68			"MX30LF4G18AC",
    69			"MX30LF4G28AC",
    70			"MX60LF8G18AC",
    71			"MX30UF1G18AC",
    72			"MX30UF1G16AC",
    73			"MX30UF2G18AC",
    74			"MX30UF2G16AC",
    75			"MX30UF4G18AC",
    76			"MX30UF4G16AC",
    77			"MX30UF4G28AC",
    78		};
    79	
    80		if (!chip->parameters.supports_set_get_features)
    81			return;
    82	
    83		i = match_string(broken_get_timings, ARRAY_SIZE(broken_get_timings),
    84				 chip->parameters.model);
  > 85		if (i < 0)
    86			return;
    87	
    88		bitmap_clear(chip->parameters.get_feature_list,
    89			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
    90		bitmap_clear(chip->parameters.set_feature_list,
    91			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
    92	}
    93	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
