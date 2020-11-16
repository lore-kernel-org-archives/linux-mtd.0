Return-Path: <SRS0=PjdO=EW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A973BC56202
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 03:11:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D498204EA
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 03:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfqUIK+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D498204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iT33u+GN43gY1P2TNh2kUaHjNlKcyLRIpccFUw9T6T0=; b=kfqUIK+fKJfC5gI3Ngh2HRupp+
	Zh5PlUwUfeVSR22kgqB95YPylWYwaK2nEoFEmeKh3ZOwgXM4KnJ/TDxHIBLh7sWqJD0eDbksEQgBg
	U2QNTfj+eDRS+cZGTic1Ua/kfc2oo1RojGDYOfKpV4oZtsyFxseOqWQpBEAO4j1sO31uviFGQP1k4
	bELpTFDZh+uJFBF349M0TPmha8n8XXrXkbBqF+CurXCvcgcBp01JmOrjLhN+C8KphM8K39bn/1iE4
	HoYS0Ghb+K4cb+cvxCMKZwMHrC47C91xv38S51cyY8HhI+8Z6zuyUVXh+2g/5kJekPctJhdgHNl66
	uevljJ9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keUuW-00079L-M0; Mon, 16 Nov 2020 03:10:32 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keUuR-000788-V4
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2020 03:10:29 +0000
IronPort-SDR: mlA0sxXsxRE1aSC1ZGgNq+QzECMwuEYc4udu+jWFl20UUwR8dlaAVvkzrwNsjUrEEJjcsVP61U
 kCx3IIpsjwvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="188738402"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="188738402"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 19:10:26 -0800
IronPort-SDR: pDnqq2EFW2KmzZ2wu3cJYhwXl1Iw7hrG7sKpqOc6Qxteli6kFAMWGJNMNrqC5rfY+jXtrdC40d
 EwT/Nv8o6W6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="475388292"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga004.jf.intel.com with ESMTP; 15 Nov 2020 19:10:23 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v7 4/6] spi: Move cadence-quadspi.txt to
 Documentation/devicetree/bindings/spi
Date: Mon, 16 Nov 2020 11:10:01 +0800
Message-Id: <20201116031003.19062-5-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201116031003.19062-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20201116031003.19062-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_221028_230181_0C2F18D1 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, qi-ming.wu@intel.com,
 p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Move the Documentation/devicetree/bindings/mtd/cadence-quadspi.txt to
Documentation/devicetree/bindings/spi/

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/{mtd => spi}/cadence-quadspi.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{mtd => spi}/cadence-quadspi.txt (100%)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
rename to Documentation/devicetree/bindings/spi/cadence-quadspi.txt
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
