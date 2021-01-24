Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB05C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 07:41:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7A522B48
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 07:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7A522B48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yXRj2gFtf2+jaZrj2pP8jbnJXUUTazgRJekmeYuwRjQ=; b=qGoOtgP0TSByE/XMxxDQVi+wJx
	YcZZn9A3AZIhtMg6slRKQDHJ88YP7cC/v+aqsHhT4wlUgtEiOhupxT/2A9J0ztrV856/3rbb3jzGg
	qP3CN7CdJmUOu0AH08yALk+6XmyQilYZhZ2quLs5VovnPL3YVa0XVZrJ5BKPy6X7u41A0yicdHcQy
	vkoY+RYIltQ6ogghPJcd2126kKV9bDKtw5+yHeK8g7hMEgevYEGfwtTb/WC3Y2acqBz5k18sWc2Ic
	S/7QntZuW+C+DM68rS+n5CdJv0wwoN5/4npSLXp80+V81vDixpZBBFnSR02Ip2qWXxzwISJuFFJzU
	R+KskWTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3a0G-0000p9-Ry; Sun, 24 Jan 2021 07:40:08 +0000
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3a0D-0000oY-Jk
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 07:40:06 +0000
Received: from localhost.localdomain ([92.131.99.25]) by mwinf5d58 with ME
 id LXfx2400C0Ys01Y03XfyzX; Sun, 24 Jan 2021 08:40:00 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 24 Jan 2021 08:40:00 +0100
X-ME-IP: 92.131.99.25
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 vadivel.muruganx.ramuthevar@linux.intel.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH] mtd: rawnand: Fix an error handling path in 'ebu_dma_start()'
Date: Sun, 24 Jan 2021 08:39:55 +0100
Message-Id: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_024005_831179_D61F4FAF 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If 'dmaengine_prep_slave_single()' fails, we must undo a previous
'dma_map_single()' call, as already done in all the other error handling
paths of this function.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index a304fda5d1fa..8b49fd56cf96 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -318,8 +318,10 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	}
 
 	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
-	if (!tx)
-		return -ENXIO;
+	if (!tx) {
+		ret = -ENXIO;
+		goto err_unmap;
+	}
 
 	tx->callback = callback;
 	tx->callback_param = ebu_host;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
