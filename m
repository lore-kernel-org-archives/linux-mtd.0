Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F950C001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ORLyUyM+WVMU8V2rYRQzq2mWFezX8i41NOyN82YnYa0=; b=37ei4jAW8a2Rhh
	BLCjFdfCOZJK5DbDcVlIj7C7l/dweN0GtQAThOugHZS0F+jlueiomGqkynBdGW5TwWt/fyuYJOfvf
	Q3Ftv6o9gJUQj72vMtPSWC3Y9EgVxZtnt7l+wIrxh69ODO8CQEQ10Non/C177SB0szBp30L0hLCpa
	2y9OQec0oX/STeI1fslA0KPcVKv89DClGVZFMQMWXTb7xChsM8swPQMT6VceTCMpJIsYD8874iQHR
	cmXXhB8HE097V6WglTm/RM6+zzzjwfh0ITuskFYrWVfMkxONBk2568BF9WlvlFwj79LUGlzkkkAuz
	skOQlwpfK80Sy1u9h47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvdJ-0084nI-35;
	Fri, 18 Aug 2023 09:19:05 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvdH-0084mt-18
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 09:19:04 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=mengferry@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Vq1xhCX_1692350334;
Received: from j66c13357.sqa.eu95.tbsite.net(mailfrom:mengferry@linux.alibaba.com fp:SMTPD_---0Vq1xhCX_1692350334)
          by smtp.aliyun-inc.com;
          Fri, 18 Aug 2023 17:18:58 +0800
From: Ferry Meng <mengferry@linux.alibaba.com>
To: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Ferry Meng <mengferry@linux.alibaba.com>
Subject: [PATCH] ubifs: fix missing error code err
Date: Fri, 18 Aug 2023 17:18:48 +0800
Message-Id: <20230818091848.108186-1-mengferry@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_021903_585515_18E7A48D 
X-CRM114-Status: UNSURE (   3.65  )
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

Fix smatch warning:

fs/ubifs/journal.c:1610 ubifs_jnl_truncate() warn: missing error code
'err'

Signed-off-by: Ferry Meng <mengferry@linux.alibaba.com>

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index dc52ac0f4a34..ab837b73d4b9 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1607,6 +1607,7 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 				ubifs_err(c, "bad data node (block %u, inode %lu)",
 					  blk, inode->i_ino);
 				ubifs_dump_node(c, dn, dn_size);
+				err = -EUCLEAN;
 				goto out_free;
 			}
 
-- 
2.19.1.6.gb485710b


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
