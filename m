Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885B5C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 19:55:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194A364E4B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 19:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194A364E4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dcyL4wo3kO+cL3fz9LY+y2nWLb4BGZcb7UgnRadog8=; b=eN6WykXeNBRgvtE+yJwqFWt6Bl
	dOTzbF6naXUGY/DeYXK8XsLS6owd9BzJm2QSU6INvU76g7Dqe4JMl2rlme5txv2F9ivoXu1OgnqTj
	OHZ0uxgQlQeOyruV8pB3GxNmsM8mP9oCTLUMlKJbBZT3b7EePfpUua4G509EfzlUJNtbjQszoUcJ8
	FHKE0nvugB/fETARb1zQkx9xG3UClKzcUx7E6T/xd624nAZwY6sW4JSQgBdvVKu5Y28uvl5pDHaiY
	4I8ofLoZ1En5ffu4EIhOZ9EU7DjlZzPeE+qd85jWFzaFbbTRsg9ZgwORU6oQ891Apnk30D7bq7ETb
	XhVn7g7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCSta-0005qy-Hm; Wed, 17 Feb 2021 19:53:58 +0000
Received: from mars.blocktrron.ovh ([2001:41d0:401:3000::cbd]
 helo=mail.blocktrron.ovh)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCStX-0005pv-60
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 19:53:56 +0000
Received: from localhost.localdomain
 (p200300e53f06860027b650f78fdb530b.dip0.t-ipconnect.de
 [IPv6:2003:e5:3f06:8600:27b6:50f7:8fdb:530b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id 35D0C23380;
 Wed, 17 Feb 2021 20:53:50 +0100 (CET)
From: David Bauer <mail@david-bauer.net>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: don't lock when recursively deleting partitions
Date: Wed, 17 Feb 2021 20:53:20 +0100
Message-Id: <20210217195320.893253-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_145355_347451_EDB74EA0 
X-CRM114-Status: GOOD (  12.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When recursively deleting partitions, don't acquire the masters
partition lock twice. Otherwise the process ends up in a deadlocked
state.

Fixes commit 46b5889cc2c5 ("mtd: implement proper partition handling")

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c3575b686f79..95d47422bbf2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -331,7 +331,7 @@ static int __del_mtd_partitions(struct mtd_info *mtd)
 
 	list_for_each_entry_safe(child, next, &mtd->partitions, part.node) {
 		if (mtd_has_partitions(child))
-			del_mtd_partitions(child);
+			__del_mtd_partitions(child);
 
 		pr_info("Deleting %s MTD partition\n", child->name);
 		ret = del_mtd_device(child);
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
