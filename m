Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23391C64E75
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:20:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2E832086A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Gh5pVGY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2E832086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs69wcDMBDoHMaldctSScxJUJKx61OZ89LI2mR0G404=; b=3Gh5pVGYr4e6QiL9ywA/tiXD9y
	pK5byRLLonDRPRZTCtP/IUzuSwHFana9QFRxPvg5/ASsqpxUEAFudxqK1OSAOWIsLf9BSsutJ2LWk
	93VDBhpZmOeCWVTwopN/FTz/9blxtkjXjwif9RYD5gNieRGVPNzl6frgDvX/baWsNZKu5Rm2fDTSa
	FGwdEeW1illkXZuOrO1Nc9YEF9NqjfF0N516hs4MjfeJqZ6fmV/mPI907L61Njidzdm2f6lpMoHp/
	YCDGMRvKzNNy8B91lqA5pBl/oXt2hpfRE4Ttlld+CoLwujFh34L2dEHXRntdNHXkyebHYGuiY1r7N
	HR4rbPJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khPnO-0004qg-K4; Tue, 24 Nov 2020 04:19:14 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khPnG-0004nR-Nd
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 04:19:07 +0000
IronPort-SDR: 7S46NSBGrk/d086DoR8tzx+Y6oIzA1Yw2/AwpyYjgY7kk6her0FE/ahbhmZBgI5OYj6+WjV+Pa
 gixxO8u2w/3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="159655728"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="159655728"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:19:06 -0800
IronPort-SDR: Ap4A08/c/032HNPRRtjG1PqASnlGzsy3DnNxUuOxpCr7oUn6v3h+PrKjSyu0BI/+DfNOC6NXjZ
 rAnQ6QAe01bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="343029901"
Received: from sgsxdev004.isng.phoenix.local (HELO localhost) ([10.226.81.179])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2020 20:19:03 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v9 5/5] dt-bindings: spi: cadence-qspi: Add support for Intel
 lgm-qspi
Date: Tue, 24 Nov 2020 12:18:40 +0800
Message-Id: <20201124041840.31066-6-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124041840.31066-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20201124041840.31066-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_231907_002733_E412BAA3 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: cheol.yong.kim@intel.com, vigneshr@ti.com,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org, qi-ming.wu@intel.com, p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add new vendor specific compatible string to check Intel's Lightning
Mountain(LGM) QSPI features enablement in cadence-quadspi driver.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/spi/cadence-quadspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt b/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
index 945be7d5b236..8ace832a2d80 100644
--- a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
@@ -5,6 +5,7 @@ Required properties:
 	Generic default - "cdns,qspi-nor".
 	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
 	For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
+	For Intel LGM SoC - "intel,lgm-qspi", "cdns,qspi-nor".
 - reg : Contains two entries, each of which is a tuple consisting of a
 	physical address and length. The first entry is the address and
 	length of the controller register set. The second entry is the
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
