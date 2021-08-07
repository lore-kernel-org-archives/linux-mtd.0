Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFD4C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6216160F14
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6216160F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDPDLKqw9D1oc5L0ICTNVSp8C/lqUbKfN/e0SU1iN6E=; b=zMIFBp/NofDHDj
	hK8PmWDMpW/TojLMLBmSrqUQ0zwkCtRXOL2/T4YXxUw8E1cgT2QMLpBw7FDPA6uQab29Fk1FyUjJG
	ULfqTyDcMKvuvwJXGAb/rv2RgLkXb49wtAZR4HhViFlD9e7hSsAyyNYBEFkLsUeFP0l5/ZfmJWCeB
	ITKeyRyxHeaAc8vka/G40ibPVNr/62nIhW6qwSU1YY3XjvS02l5B/HTFOHV5IbLoopG9zGm53pl9U
	GcVZ7MjcwKu+CTVq1V14O4iIrHZJCjthrUo7PQpqegsKITJe7QpBYG0fEB7k9nCsIKbfKiTGj8DD7
	GtsSqPB+lNhN/fqqhWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCU8j-00FBP3-EQ; Sat, 07 Aug 2021 21:45:57 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCU8U-00FBLN-M0
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 21:45:44 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 5A48FC667C; Sat,  7 Aug 2021 22:45:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628372739; bh=kDade0ad3OhVxttuN5GL+Y+UbNLv2v/uY7NQFfrYxfQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GBZHWpk0tsELh+TV6L3pSoU/9/myK2R4o2XHtNrc/tw0akBmo3NBXGmkW6o8hirxD
 5rT4DDxcJ35KotH3uOVRxNrHaYTQV7QXVR/czo85sF6wkHrAw+VR5PiCDXBe84tKIL
 S+O4zl7IMww25XQWKXwpD8MRy3tnP1h7kuWDuvFGnyUT1j09CS7cj9phAJL1lOnjxK
 vZUZU9CS9bykjR4Xe/b3VdKbZ5AC/mzafKWKIfIwqCZz0XFKGCRS5u5JoPaqoZbdeY
 io+BTc2IBIpKvTP0KZjGsX5JsiYTH2Zeyvk7Pw41cKkYZx6qQuZ1SYMRH08WVsH+/w
 zJI6gx8MyRBmQ==
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/5] mtd: blk_devs: make discard work on FTLs
Date: Sat,  7 Aug 2021 22:45:36 +0100
Message-Id: <20210807214538.14484-4-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210807214538.14484-1-sean@mess.org>
References: <20210807214538.14484-1-sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_144542_899891_3EC69350 
X-CRM114-Status: UNSURE (   8.40  )
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

If the discard_granularity is not set, discard will not work and the
following error is logged:

rfda: Error: discard_granularity is 0.

Since all the FTLs use a sector size of 512, this can be hardcoded.

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
