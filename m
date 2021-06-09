Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E994DC47095
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 08:25:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6FE6136D
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 08:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6FE6136D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYlQQDF5O8HkZSJ4C9OADBGdFDE7KP0WUl0iDVDVjDc=; b=vMEekkO3ZmHDvE
	FOrrZHC2uGkm/1YYsVsMtPy93pHSay/7L9AGCm/Bg8TdurLY6QPoJzrBWMXh2Ogsu+M6Q5QPB01z0
	q0EZ2dfQeOQ4oru25f21EEhmkP6kBYaT8ax9zeqtaOc3I9glKRKzwwqFrd5fZXm4N2IvM63S4vghX
	DewtEb4+So3XgmIk6C2ZllG0bWGOszqkWiFi+5yk4e+VX3ueu9Ke83es74ZEUf9GTp33CLs+uaKGs
	Hpu2IqXwu99XBsbvJBbJClD50FpvFmV+DEeiVqXXzhLhVSWlH6+WjOnjVFMsRa7WJ5CEa6VaNLubL
	qGHtTvUal56GmhnJvmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqtVl-00CMVF-0s; Wed, 09 Jun 2021 08:24:29 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqt9i-00CF2j-8C; Wed, 09 Jun 2021 08:01:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B26EA20001A;
 Wed,  9 Jun 2021 08:01:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v22 11/18] memory: pl353-smc: Rename goto labels
Date: Wed,  9 Jun 2021 10:01:05 +0200
Message-Id: <20210609080112.1753221-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_010142_498247_CB8F8733 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

A goto label is better named

        do_something:

than

        out_something_to_do:

Use the former wording and really describe what the jump involves.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/pl353-smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 2d20b1b2c0e3..14720430bf9e 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -388,7 +388,7 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
 	err = clk_prepare_enable(pl353_smc->memclk);
 	if (err) {
 		dev_err(&adev->dev, "Unable to enable memory clock.\n");
-		goto out_clk_dis_aper;
+		goto disable_axi_clk;
 	}
 
 	amba_set_drvdata(adev, pl353_smc);
@@ -408,7 +408,7 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 	if (!match) {
 		dev_err(&adev->dev, "no matching children\n");
-		goto out_clk_disable;
+		goto disable_mem_clk;
 	}
 
 	init = match->data;
@@ -418,9 +418,9 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
 
 	return 0;
 
-out_clk_disable:
+disable_mem_clk:
 	clk_disable_unprepare(pl353_smc->memclk);
-out_clk_dis_aper:
+disable_axi_clk:
 	clk_disable_unprepare(pl353_smc->aclk);
 
 	return err;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
