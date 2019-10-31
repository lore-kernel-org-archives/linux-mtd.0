Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB02CA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 07:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FDD520862
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 07:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uFIqyi+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FDD520862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xNiBSPhvITHWBmDijdDM6g3h9UHtTk9cBRz9R2sXp4=; b=uFIqyi+eZw/kN8
	PyIH7d0NlW5gcaloF0UEhuYLIwvOJTtUIiQFQMSXVHQplqpZ11UVpZLz6ug4Gc8+BNTGvsBqA11YK
	mY1ONM5Grx2Ior/Zd7QzVbjRZoN51IWFh4g4N0XPW6FQvfnPAP1ZHsCEUqrsG3O0Z83oRGDGqixHz
	eSDwa1GY0+l9blDCxcokh3ivwsICZ1hx+N1xwAq6s0puxCIegmZZdlvZOhRzJA/Jx51mQ6N0pCBbu
	9wndTfl4l/SFI5r+U3QRNi3HH8X45eq5ZlAq6MFYKEtzjzVkozxkpl2iUfVc2SkrbHfaxJMmb//Y5
	oiu1Alhwbu0yak6ZUGOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ51b-0003JN-28; Thu, 31 Oct 2019 07:37:43 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ51S-00039s-1I
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 07:37:35 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 00:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="230756445"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2019 00:37:30 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iQ51O-000Eiw-8i; Thu, 31 Oct 2019 15:37:30 +0800
Date: Thu, 31 Oct 2019 15:36:39 +0800
From: kbuild test robot <lkp@intel.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 4/4] mtd: rawnand: Add support Macronix deep power
 down mode
Message-ID: <201910311559.H7voj6qN%lkp@intel.com>
References: <1572256527-5074-5-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572256527-5074-5-git-send-email-masonccyang@mxic.com.tw>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_003734_112340_E1EA12CD 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: masonccyang@mxic.com.tw, kbuild-all@lists.01.org, vigneshr@ti.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mason,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.4-rc5 next-20191030]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Mason-Yang/mtd-rawnand-Add-support-Macronix-Block-Protection-deep-power-down-mode/20191030-071757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 23fdb198ae81f47a574296dab5167c5e136a02ba
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mtd/nand/raw/nand_macronix.c:142:5: sparse: sparse: symbol 'nand_power_down_op' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
