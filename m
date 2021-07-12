Return-Path: <SRS0=7PWl=ME=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B04C07E99
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 14:53:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9216121E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 14:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9216121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nzvo9AglNMcGHlZy+tWvW1PS9Xocnd+AL884SydtqWo=; b=AL5XOl+X7Cq158
	0NP+0Qom5tEljVzj6u11g/CCcyTGiXlUlKfNd88UQo0i0NlM9CnmQijA4M2ju1iGytU8FpzngRdMY
	et6ffRTLa4EygmqE50FxhqozzfbxRpCorAG+ig5MHODemJD9qyHRTDWv8KIjaAMSCtriuODmqCuOq
	GcTHepi0Kc/yzLq7/vvJWJKemaSvjdnVVWkfptnAFYXyapjOzBkGXPPa1NcYUiqKU0v6QTcOfKtMM
	lHMXdVrPjacliIrkOePQYibV7VE6z19rjIJltfr4ojkIaEbG+W9wk2xSze7XAwjHw+25ZgHUBfa/i
	FGMD3GiQRPA4JjXSaPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2xIJ-007frj-O7; Mon, 12 Jul 2021 14:52:27 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2xIE-007fqC-Fy
 for linux-mtd@lists.infradead.org; Mon, 12 Jul 2021 14:52:25 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7F50840333; 
 Mon, 12 Jul 2021 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626101534;
 bh=6mChaTRrRo5NJxfSodjvtDgtiVHur+FmvKowXRGTUv4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=quluxzmNdNi2uCeQui6xbaakshfBlhRPDysfwhQycHbV0OoIJ4uDbIpki35krlu7A
 d0BvpjZfmzLldwOpelIqfdRFKUCRAyL7h7cmIsOemNS/jAfH3etyolNSXPpZK30PRq
 mY3t48FtzMNufTeF64IRcbhRZ97j7DeyXDVqqZIVo2Y2Abnk9FZXjg74rsYzcJKZxJ
 PzdrQo7uBXkE8dsY3TcLet0UWXNtNNh1d/keAZnlbtQm62xjv4I51mzVOYHBk5zXiH
 WFcfPzOsjRO10aAekG/M//H4qT9/BrQsbDjx7OyWaZWW2T9tHAW/GxrjC3WpIVyAMI
 DS2J0jB/u8p/Q==
From: Colin King <colin.king@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: devices: mchp48l640: Fix memory leak on cmd
Date: Mon, 12 Jul 2021 15:52:14 +0100
Message-Id: <20210712145214.101377-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_075222_709977_390E4C85 
X-CRM114-Status: GOOD (  11.22  )
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

From: Colin Ian King <colin.king@canonical.com>

The allocation for cmd is not being kfree'd on the return leading to
a memory leak. Fix this by kfree'ing it.

Addresses-Coverity: ("Resource leak")
Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/devices/mchp48l640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index efc2003bd13a..c0b1a7bb7d13 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -255,6 +255,7 @@ static int mchp48l640_read_page(struct mtd_info *mtd, loff_t from, size_t len,
 	if (!ret)
 		*retlen += len;
 
+	kfree(cmd);
 	return ret;
 
 fail:
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
