Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7291CA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 07:37:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516C320862
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 07:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJiCJWPv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516C320862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsyHXGPqxOcPYDGKOr3i/MhRcdbkVw6tFq6nYQxRBGA=; b=iJiCJWPvDB4A/S
	Ne9y236V4u0F54jsdpL5DdyQxSnhVJgTuZLdYIe0j7ufrBP+C0YVVEbRK2lRsxUdyzGwrHSICehks
	vxXiudIC2T5Qb7hPFIerSyuTacmzDoHczl/iIxgaOvWxi2iAgMHlzFa/0+GVDMIKEEzxlo6VrIn3r
	LNoKIaSpjqrL01rEKyD8QOau/xpwsF9xwBtIpHm0m62NEKAEqdnFQRnGH9A7ZzOmrHkx88CvaQsGI
	TIw7A8ETsXCW7pkxpv/sNmCnsXtEp3tHCaa2Z7JVEWI6n6Z/5OVeMqXdNXOmrrHEHVTluKphq/fRm
	rP7R3ZkNoVrCBXG+F4kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ51T-0003Af-Tw; Thu, 31 Oct 2019 07:37:35 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ51R-00039r-Rc
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 07:37:35 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 00:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="211510776"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2019 00:37:30 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iQ51O-000Ej8-9x; Thu, 31 Oct 2019 15:37:30 +0800
Date: Thu, 31 Oct 2019 15:36:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: [RFC PATCH] mtd: rawnand: nand_power_down_op() can be static
Message-ID: <20191031073640.grosfnwqxbxt2r7i@4978f4969bb8>
References: <1572256527-5074-5-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572256527-5074-5-git-send-email-masonccyang@mxic.com.tw>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_003733_904412_ABE88FAB 
X-CRM114-Status: GOOD (  12.20  )
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


Fixes: 9dfaf23e330d ("mtd: rawnand: Add support Macronix deep power down mode")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 nand_macronix.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 3098bc09c25c7..adf81482937bc 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -139,7 +139,7 @@ static int mxic_nand_unlock(struct nand_chip *chip, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-int nand_power_down_op(struct nand_chip *chip)
+static int nand_power_down_op(struct nand_chip *chip)
 {
 	int ret;
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
