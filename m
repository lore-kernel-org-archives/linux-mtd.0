Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE56C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 10:03:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C8C61428
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 10:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C8C61428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mky8T6ep3zhdgRer8QpwTELSgi1f1vgCqs5Exe9zJ6M=; b=IRWgnFCZYMnJfMPlK2ZooJJXWX
	iBUVKavoTwLxfWR7f8bbsO0giFCUZJKJQNqvRzCvZhWqNIFxh9F6rRfEpI8Y8Ib36CIK9/Cx/lW4d
	jH8Im/ov5/02ZayoEXc4mgS6rC/Pl6OLiH+nqhZDqpcAut6A2ysSe6S2QIpSCKyO5EsiqPYZC1Y6s
	Jm/LSH2NduerT+yMLdrcnBErqAqJSH7tn6FepnfIGXmZh3xYHdsyGn7yZY9KO7xJ89Scgzrz/VTbL
	deon+kXL0ykSKQ3NiL/PG8VvsALLoXut94ITjuKRwW5oFFzaqkfU9yNsmmrfXNrFphWrzEii6pdzM
	wRun9TJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbh1g-003FP2-Ps; Wed, 28 Apr 2021 10:02:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbh1d-003FOh-Bm
 for linux-mtd@desiato.infradead.org; Wed, 28 Apr 2021 10:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=E7bETbHtYP75m/X4AaA+oI4NtzS4fT7gq/ei6Z7g43w=; b=F0IzGMmacrlJTB+wct9d3GdDpX
 fCm/RzQLB8tggyTmCppsD8Ag4A/GKMxjnZWK2/1cmR0bqKWyE0Z/iVgdwupRZd3mIclNq66oY2USc
 lRF0XslvZaPFefn7AcKci8mzASDYpqphbzT95B/AOTjH3QHApcbMKXyHC15z6NPS9BtR2XtCrDJdq
 BD9aAEtrmZHgnMgd9TNByYVj9aMzbIfNcMdX/cZY77W3eFlyxNku/sWV8mJe8E7xg+imd68Obq+as
 P+yp2a0TW6bqhZkO1FOZN1HV4nQJ+AqVEBA+0X4zW3FlvrFp+xA7eQgS/HdIUuIPWM5ZWIfR9Ceiy
 8+gUXO9A==;
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbh1a-00HLAa-BC
 for linux-mtd@lists.infradead.org; Wed, 28 Apr 2021 10:02:32 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R251e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0UX3IHwS_1619604144; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UX3IHwS_1619604144) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 28 Apr 2021 18:02:26 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, nathan@kernel.org,
 ndesaulniers@google.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] mtd: tests: Remove redundant assignment to err
Date: Wed, 28 Apr 2021 18:02:22 +0800
Message-Id: <1619604142-119891-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_030230_577671_0343CA36 
X-CRM114-Status: UNSURE (   8.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Variable 'err' is set to 0 but this value is never read as it is
overwritten with a new value later on, hence it is a redundant
assignment and can be removed.

Cleans up the following clang-analyzer warning:

drivers/mtd/tests/torturetest.c:233:2: warning: Value stored to 'err' is
never read [clang-analyzer-deadcode.DeadStores]

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/mtd/tests/torturetest.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index 6787ac5..841689b 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -230,8 +230,6 @@ static int __init tort_init(void)
 	if (!bad_ebs)
 		goto out_check_buf;
 
-	err = 0;
-
 	/* Initialize patterns */
 	memset(patt_FF, 0xFF, mtd->erasesize);
 	for (i = 0; i < mtd->erasesize / pgsize; i++) {
-- 
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
