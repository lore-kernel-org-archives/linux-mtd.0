Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6986DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75ZRyBN2/a8+OIC5XZecUv62BsEeoAVe71sutNguzyE=; b=tq6kSPoA05qQIu
	Fl/lT+MYBHNQEKRsmJMdlZST/U452IiG5gBxgx/2aOBAiFCWzKLEiXSR/vXkMmFdYMsUxMPqJupw9
	rE1ZDMIpFN2fzcWQV7VSsq4gxxHiLoSieXVytxBwW4WJFHa6KFZVo5hX7tY2y5eXpm8bNWuxK9dbr
	rLzEgVKMFWZxSiRYxbzW77+SXU1fHoDTVCg5agNQpRxlZWu9/0xHrJoh3BGxEWJAtcEvNVzsoEE1d
	xKeVe0cfL45fs1d2NqjYAj3U0uX6EIr7beglhY/gEOQiJqUtu5WVCH9r1Lm/eWnMSNWDWcDOhRpAr
	VxIIAq0SU/TgXYmcoH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxxA4-007Sv8-Ep; Thu, 16 Dec 2021 20:15:32 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxx9x-007StX-EY
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 20:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639685725; x=1671221725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3t7tVPDq17Bs5oBsrsC18t2E5pFFYQnWPZs/51fi/T4=;
 b=YCraedoUsoO+N0Sykzl2lcewZcexX/E3nV3UsQde0FVlgoz/CcBv+nsa
 vCqV5TL/3JNs+KkZUkbXHNunywZMjByVfNRlkiliO4JE8rnGLZuFC42Y0
 d5pL6x/vW2NbJ/E1WTGZF9NnGx4SCCGzoVx9pDpXE/yWcRYzFAqU1tT5c
 5PAtTkv3CDY7BkIkCzps1FR/T/N2f5b6oFJMmw5rjIswnncrUsznljljM
 nKtMoznQzfGrXCMKSyUaCHOthX685RKJjplrwmM80ZTjteTqLtZ26/CqE
 InN/wJ/rN6Y3V0vDDGqzuTGwYN/HOq8c1ZkHxUyCIaKr5HcwMGwe4RLmQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239535909"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239535909"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 12:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="756228471"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2021 12:15:21 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxx9s-0003lH-V2; Thu, 16 Dec 2021 20:15:20 +0000
Date: Fri, 17 Dec 2021 04:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: kbuild-all@lists.01.org
Subject: [RFC PATCH] spi: spi-mem: cqspi_mem_caps can be static
Message-ID: <20211216201426.GA41877@ee91f2b6365d>
References: <20211216111654.238086-21-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_121525_569031_1E31686B 
X-CRM114-Status: GOOD (  12.32  )
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

drivers/spi/spi-cadence-quadspi.c:1592:38: warning: symbol 'cqspi_mem_caps' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 spi-cadence-quadspi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index bc7ae56fe565fb..ca05ab4d0c5923 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1589,7 +1589,7 @@ static const char *cqspi_get_name(struct spi_mem *mem)
 	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev), mem->spi->chip_select);
 }
 
-const struct spi_controller_mem_caps cqspi_mem_caps = {
+static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.dtr = true,
 };
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
