Return-Path: <SRS0=t8q+=FK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9829EC433FE
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Dec 2020 20:23:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4303F2310B
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Dec 2020 20:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4303F2310B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L1WAfs5BUSo3K3zAAdIO73oA90pJreMfSkz7DKV2T/g=; b=ch9LlSgImCE9kqfVJ7TP5yAB/P
	dImAw0GCqgIKHeQ/DP+w7cJUKl483akeXE+MECPXVU9dKcEPrG5TU4qMQRrfsJ+FUsEhHiBdLQz9o
	GvnqKzQHmDUaaaICiOA4Q72ZsolPJWxdmhkPFg2fCb4KVRmVhcjxawJbZ4VSSZngPTcEi8VQ4+1LC
	9t+hO5tCYR2gr3GlT9PXucEBennS4gKLC3yP/x/xqC2baBv9mo7zgUnnJVfzNTqtoBmNLtiPW709U
	ZENTajIsIkunhRv2Negwcibj8BVJnCQkOAAubKhVRJB4Q10SUlR22tGq8gS4y9qFLNQTZeVs/IC43
	e+DhB6kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1km0YI-0002lA-PU; Sun, 06 Dec 2020 20:22:38 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km0YG-0002kf-Os
 for linux-mtd@lists.infradead.org; Sun, 06 Dec 2020 20:22:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id D6C8C18172F00;
 Sun,  6 Dec 2020 21:22:32 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aAMwD0WYdS66; Sun,  6 Dec 2020 21:22:32 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OQctWJ3k0AqL; Sun,  6 Dec 2020 21:22:32 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miquel.raynal@bootlin.com
Subject: [PATCH] mtd: core: Fix refcounting for unpartitioned MTDs
Date: Sun,  6 Dec 2020 21:22:20 +0100
Message-Id: <20201206202220.27290-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_152236_914488_F4BDA710 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Apply changes to usecount also the the master partition.
Otherwise we have no refcounting at all if an MTD has no partitions.

Cc: stable@vger.kernel.org
Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdcore.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e9e163ae9d86..b07cbb0661fb 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -993,6 +993,8 @@ int __get_mtd_device(struct mtd_info *mtd)
 		}
 	}
 
+	master->usecount++;
+
 	while (mtd->parent) {
 		mtd->usecount++;
 		mtd = mtd->parent;
@@ -1059,6 +1061,8 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
+	master->usecount--;
+
 	if (master->_put_device)
 		master->_put_device(master);
 
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
