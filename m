Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFEBC61DD8
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 16:06:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2062820A8B
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 16:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOKUkXco"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2062820A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wqz/uRA0SZ8crMzPQILBm9oldHqglRkopinFI5Ud+Yo=; b=pOKUkXcoJYxMCdaMUxxTNPCYbE
	yKi86g+qfMfCBxTwoHgEzzFNfIYJSGKbQOo4v9/ZkeeC5rgvo4JSsT+wgJmxvF6DVIKVDR7/8qTGC
	0Q2G2P8ocQQFTMGsYNk6B7WyyS/zhZA3I9uCcOlWIJg0ry91wHvTrpyWqmvX9JF+qKZhKv9kVuWT8
	kQpIhfgUpMejLjrhUCJzruuECsOstx+5Ch5H5NeOmlNpWhadPtimKz+F4auQbrHurnUipI/lqRCpx
	f5O5iVdmu8ZBlXRsAYbxDi1Fx5lptDPRL+6Kbm/tbhnDVBXyx6TBgen5c0eJJUs35ZoSmAo46MjPK
	eL/Wm5gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdbaC-0001bz-IC; Fri, 13 Nov 2020 16:05:52 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdba9-0001bK-J7
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 16:05:50 +0000
Received: from localhost.localdomain (unknown [80.240.223.29])
 by mail.ispras.ru (Postfix) with ESMTPSA id 327B040A1DDF;
 Fri, 13 Nov 2020 16:05:41 +0000 (UTC)
From: Baskov Evgeiny <baskov@ispras.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd-ram: correctly free memory on error path in
 platram_probe()
Date: Fri, 13 Nov 2020 19:05:37 +0300
Message-Id: <20201113160537.899-1-baskov@ispras.ru>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_110549_773122_05A206A4 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: ldv-project@linuxtesting.org, Baskov Evgeiny <baskov@ispras.ru>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If an error happens in mtd_device_parse_register or mtd_device_register,
memory allocated for struct platram_info is leaked.

Make platram_probe() call platram_remove() on all error paths
after struct platram_info allocation to correctly free resources.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Baskov Evgeiny <baskov@ispras.ru>
---
 drivers/mtd/maps/plat-ram.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 311742c78155..0bec7c791d17 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -177,8 +177,12 @@ static int platram_probe(struct platform_device *pdev)
 	err = mtd_device_parse_register(info->mtd, pdata->probes, NULL,
 					pdata->partitions,
 					pdata->nr_partitions);
-	if (!err)
-		dev_info(&pdev->dev, "registered mtd device\n");
+	if (err) {
+		dev_err(&pdev->dev, "failed to register mtd device\n");
+		goto exit_free;
+	}
+
+	dev_info(&pdev->dev, "registered mtd device\n");
 
 	if (pdata->nr_partitions) {
 		/* add the whole device. */
@@ -186,10 +190,11 @@ static int platram_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(&pdev->dev,
 				"failed to register the entire device\n");
+			goto exit_free;
 		}
 	}
 
-	return err;
+	return 0;
 
  exit_free:
 	platram_remove(pdev);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
