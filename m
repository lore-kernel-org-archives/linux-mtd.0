Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F23BC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:01:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D669D206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iFY6iUVc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SJls6Vzc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D669D206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxEasmqAWuQIC90G2Y35db/WHUEqivVpF9Hy52GNPaU=; b=iFY6iUVcNqfsrhl2efkWbAWEs
	GPxv4Tb6W5C1KmHdJu7sAsAWcSHEUjf0s8rlHGHWC8BKtOFyFHyELvNKWy2CThNvVGxea5WnlKMcS
	Zurtcj2Z6JdvaRN9yAn++zwOwdevhz3xyESNv7WbE7FaR2FHdBDVau3y6vLtSdFBuACgamBgWBC8e
	yLOFI+Lm6Jx1pqu3A5O3UkgaFIZDnaUfCv5NLpy9yCIXed8/aMXLp0v0H3U9sTC2R8nu8LSziFuoU
	cmAvme9kUcBIP59Mm3imWrf/sHnYAlVupVWF2ggROs6FAACXSF6eZnZH1MmU74XEe4emjLJqYqFfN
	QAhJyPHqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNCQV-0003yn-Tp; Tue, 29 Sep 2020 10:00:03 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNCQQ-0003wk-W2
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 10:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601373599; x=1632909599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPXm14u5SNjYaTf0lhMp9UJ1Oo88Rqt6DJtSqddXwAY=;
 b=SJls6VzcjZhPhtFr8XEbRKU6sBtuVfcaCUgCz+WDu5MdgjiEh7KtBwMW
 eefyLAWH9o2XnpSz9HoA7XP/KRyLzfCCWuwzz1dpwit8LKnZNTaAW405e
 h3VR/+dNt3yBM9/jG/dRBlrWeizwqT5TFnaUs70d+rxAXBvgmC4gYJ1bC
 zJSpNpm7TZLlxB/g28BU3Vpi4D0JgYX5mwMke+UenmoJGvcVk/s4GT5Di
 YbbO3nqcx66yEZSkt+RkiydVPJZR/TsHYWtksqaZHsSDhTQ+HaHIQdI8o
 S7QSWbSAf9MnD1NN/dTWO5duLrQegnWvtaohg/z3zXTpHbM3XEN4j0hbZ Q==;
IronPort-SDR: M4yci0kIqU+8eshpn+e6QPel3hH04NBLxed2FThMGZNV1o1FjB2udjyy4n0n0EnQBJsrgFUI5Y
 a5t9ykA350krzVdllYC8xmcKVKeOvM0A9FhES3DlnkUcnaNQ/jXkIrudfuPagRC92cv2rG8KH3
 HsYQ6z51pV4MinOIZCGBE40WQIMqcNaNUn6uKs/Pv8M2tysAzzB7Z629N5JqN9t8cXSg20hR+S
 XfB0gHU6WwwljOuZVuymsNmoy7e/K9Ls2jxz5JyKGbuyf5IUIpb+XLKSFItU0lyqzFzq3cDRK2
 0mE=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="92761626"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 02:59:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 02:59:45 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 29 Sep 2020 02:59:43 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: [RFC PATCH 0/3] mtd: spi-nor: Tackle stateful modes
Date: Tue, 29 Sep 2020 12:59:48 +0300
Message-ID: <20200929095951.1575658-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916124418.833-1-p.yadav@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_055959_169999_93F47D04 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

My biggest concern with Pratyush's patches is that the stateful modes case
(X-X-X modes that are entered via a non-volatile bit) is not handled.
This is an attempt to tackle this problem. Reasons and explanations in
the commit messages.

Tudor Ambarus (3):
  mtd: spi-nor: Introduce SNOR_F_IO_MODE_EN_VOLATILE
  mtd: spi-nor: Introduce MTD_SPI_NOR_ALLOW_STATEFUL_MODES
  mtd: spi-nor: Parse SFDP SCCR Map

 drivers/mtd/spi-nor/Kconfig | 10 +++++++
 drivers/mtd/spi-nor/core.c  |  8 ++++++
 drivers/mtd/spi-nor/core.h  |  6 +++++
 drivers/mtd/spi-nor/sfdp.c  | 52 +++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
