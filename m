Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40CAC07E96
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B611E6101D
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B611E6101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VoVa+4ivCjf3XaC9Na1pOgR6195CsF+wQE5KlSjZVA=; b=mOQ9wqGkgtCDX3
	O3753YwVeZJf+cA7jc2iv9jer3JMYK2nAW2PduQFAXLjgRWhIW082hfcPtp75ZpuVdXD3d2NkERuM
	Ke4TuY0xO4eFd+aLP8KSnSuh6qONzAD5mN6ON2daVcPdA/T4Udn8VzZQnoyOxkkN7cmHBXT5+MdTS
	y+KP9ib2KN1yu7ZtZ259W4d99C1aRnjKz44VXLb1j1RjwVVm0M5SV88ZTHIH67dWe4yojqUKVgQ9Y
	rwssaCAOBzEeV7nF895cBN6+xOcbyEeVBcNyuEdKXBU7G1SGmTuj8jFCRCsr1god+womHYBf+exUq
	FaVtGwbDlBudcESENhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3EyA-009hKq-BN; Tue, 13 Jul 2021 09:44:50 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ExR-009h2P-Bw
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 09:44:07 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id BD82EC652B; Tue, 13 Jul 2021 10:44:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1626169443; bh=ogTCQah5ZXfxyf8qHbvbMqgm5Z20/7yJFudECdBxqlo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kbxEyNxLPkU6i2dhiZD1EHIc2pGZXgYkYRrmRhYq28FRyiRd/+ByJhcLCSAGX3OrR
 zszaxRQHUdiDNVf8Er2spcPI2mBLSyrrKmy+BDwOGexO5pEj/LVF6iMhXJGoh5ifmk
 Yht8+7huQml0UzDH8uyHUfm+a/c+YKXu4w/4XEuUa7Y1tmFpOOhKj72hS9rY9KbNJK
 ubBxdYzSNDrvWEjAkGZ6zIiVjErRmMQF5fBXUVgSnOuA1TRZVN+nyKJ5DA7VAyrQa4
 syY269IwqfRsS1gz8QdvV+G7dcYIKtEKZz6C0HRxgB0kBsPEILRfBHHSfGqSys8uBW
 lRJx1Ai64mRHw==
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: blk_devs: make discard work on FTLs
Date: Tue, 13 Jul 2021 10:44:02 +0100
Message-Id: <c69e717ef1c31b8b41bc07cd80c5d1ac191a7424.1626169090.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626169090.git.sean@mess.org>
References: <cover.1626169090.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_024405_610973_AFD1EFD0 
X-CRM114-Status: UNSURE (   8.20  )
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

Without this change, any discard ioctl fails with -ENOTSUPP and the
following logged:

rfda: Error: discard_granularity is 0.
rfda: Error: discard_granularity is 0.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/mtd_blkdevs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 6ce4bc57f919..486251e058a6 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -419,6 +419,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (tr->discard) {
 		blk_queue_flag_set(QUEUE_FLAG_DISCARD, new->rq);
 		blk_queue_max_discard_sectors(new->rq, UINT_MAX);
+		new->rq->limits.discard_granularity = 512;
 	}
 
 	gd->queue = new->rq;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
