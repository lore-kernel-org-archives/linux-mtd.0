Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC08C43461
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:41:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 371DF60FE4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 371DF60FE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AOEeQSisYuZIyJ95+3JwbGqMkjVnGpmCDDuuiSjSf1c=; b=bgVmsBSkmecubGJr2Amu7i39d
	Xnbb0sv6TbojZAlrXAvcoMF29Y7yfzM3uR6CgubxwA0hEOh+S0ziWbe1m/RZwywvPqWNBWpmE09gD
	cUxy7WfstDBkP7TsFunmq3/46eBdtso+DYpfmZ4/8xDOFoanCgURzCaBK3/kLHehEvdTwZ1AeWD0A
	ylsrQZQoEgZw8MiX+bkinwTFcBJuNVjtQz8kzzxCZw+EoTwACBNaV3IHhk+1+JWBkVIGMDr1YofOB
	+zhgxgaoHR2O/z3P74QSmH18BwnoCCQeXJuhuoSO74YzjjLNPe35MIjovJsfKr/G5bfQQfB2JgCu4
	piXW9yAhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljR7q-004n8V-Oa; Wed, 19 May 2021 18:40:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuP-004lOl-8C
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=+SnD4GQW/uJuqcnop/vpjy6Dy/obQ36AExDtHBA9wac=; b=wblv0lqXif4QFcqGsJHOJ+dYD/
 znHhZ6H1XiaM7hVeYFEto5YbRxgS0v8yCPJSxW9umrPyF6JgNgygRPf4b+83BikRxbEFP1cFW5pyz
 vCNchTiiMbysCmNO7nfDoj+elI7iA3ulKnkIpwbgRxjchO++uV4FpPGrS18e13L2xeHSjg2kN41Pq
 OeWeTbf3gDdd0BAGEPGtRuvwzr0ooyv0HK0hqIU7WNYxRi0zZiVu1+dQMeo31q2BJmKfcF04q+FD0
 AKxDAo1IZ2MFr+aqqXsh4M1rTQTuL33xTXMkXYJLsbjo7Ria9wyrsn3mat7lGgJzicskZVDk6WW4/
 BzGcet/g==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuM-00Fh8a-Ol
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:27:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A8B86C0018;
 Wed, 19 May 2021 18:26:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 12/19] memory: pl353-smc: Rename goto labels
Date: Wed, 19 May 2021 20:26:29 +0200
Message-Id: <20210519182636.1110080-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112702_960338_12D00F9C 
X-CRM114-Status: GOOD (  10.96  )
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

Use the former working and really describe what the jump involves.

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
