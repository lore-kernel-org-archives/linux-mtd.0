Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A620AC678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8M6dDlwsw0uOiVKb5/u9GAiz2yhapmDLRBCSaiEYDBE=; b=rounVEz1KiXC7k
	8fWvrnvvhKn4Cs3lcwU7dVHGzzer/EQr2d03VZCIZ12Do8q2xOsT0aqPW9i/FdpyGVP6j9K0zk10X
	HkanBHSBfbZS/UWz9xg89yRRwI4WzynVTUUhTvljyL/pwvKrJs6ZKQd4tcV/tqBPmCgOdueUKwBWB
	FLm9e7r9OlXht6wn4zEly4aZFfK4ebeRaKs/nOgpAS6n0HNEWN8G4TCMPhHky6cYe9AFmIkh9qf32
	JLy1CNL8ZKdowzinxx2/jiJbrJsEMgDeDUxxO57X0LMremtgCwoQ257+57LrYW2WaZhYoBMZ1N1mC
	d1SERFONP4vvyOtsV+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcwQ-002F6T-TF; Tue, 07 Mar 2023 19:25:42 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcwO-002F3g-7Z
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:25:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3CD101BF206;
	Tue,  7 Mar 2023 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IS1Y6x7qZh1tetwkedgElE7y2M0VU+FVu3Oe9S/0SxY=;
	b=eHoIoBm1jPL+wRw4FchIVwwy8puixBWP733rYgouPbpZNbrRFYMbw+6RGR+/LTRUdZbplc
	cq7ed8DEs1B4FLdTi4CalbjGaeKBFEeCC+gWXagUGL7spxDd2gkK1tDGGJkiOp3qwJqdOs
	4eetbcuaByiev+6Ws6q5Gj916FR/vN2GyyOqmXmstpvTnNtx7pFZpO3kavZmT2mpG4iEb/
	KkAhTfxxVDCwrqlbzCsCy1A5TK2bRNFQolhdYDPh/70/bU4GRvoqI+6qGgxKC5S3n4Xq2t
	gTaxJtd21xOdMjsZjVQCw8tmbDeaWaS10yBqqo0jMH7D7MJBGWKp56WbsbsCJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: Avoid magic values
Date: Tue,  7 Mar 2023 20:25:36 +0100
Message-Id: <20230307192536.470997-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112540_422298_BC07A799 
X-CRM114-Status: UNSURE (   9.47  )
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

Nvmem producer config ID "-1" is actually defined, so use the definition
rather than hardcoding it with a magic value.

Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e4e102585021..3f6fc45be1d2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -519,7 +519,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	struct device_node *node = mtd_get_of_node(mtd);
 	struct nvmem_config config = {};
 
-	config.id = -1;
+	config.id = NVMEM_DEVID_NONE;
 	config.dev = &mtd->dev;
 	config.name = dev_name(&mtd->dev);
 	config.owner = THIS_MODULE;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
