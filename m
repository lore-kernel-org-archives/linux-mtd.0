Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DF1C04AB4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 19:11:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B86E20644
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 19:11:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oS4X1WNb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B86E20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=77HPGYxO0om15Wmkkw4+TxBFfJQ6Sl3Mbr3lonB5zCI=; b=oS4
	X1WNbuNy+4VMzaW3uKlgcfUKr8SIMt3Wb9kgtDI0Ou/axtvtfqJwg/DqrESu05Ba0jl2bBD8rYDBx
	Txl8uuv2KQ3affZkUx1U4ZGWguxkcWz25O+dOk0wsy8kEgwdSzOb8yR/v0PLWzNs0BWhK54NTnDw2
	TI6uBJLc4H5C/ZpaSMhUQ2ZjBTSBarhwIzN57F0EXW0A3P847msyzMrlbiV2fIg1D0BlIxFYymFfR
	Zf7pMfP6FzuOwV0KisM0IjccrzEmtoxKvmNIs527CfNVhMyS6NUQyA8+F1eBaalLDIcqdSs28lxhD
	2XdnKUcZsX0kAfvT5YZ26Sbq/3UhGnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQcpW-0003z0-FD; Tue, 14 May 2019 19:11:14 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQcpS-0003xR-JP
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 19:11:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 5F0911809AD8F;
 Tue, 14 May 2019 21:11:04 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] ubifs: Use correct config name for encryption
Date: Tue, 14 May 2019 21:10:49 +0200
Message-Id: <20190514191050.13181-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_121110_855441_2261957B 
X-CRM114-Status: GOOD (  12.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CONFIG_UBIFS_FS_ENCRYPTION is gone, fscrypt is now
controlled via CONFIG_FS_ENCRYPTION.
This problem slipped into the tree because of a mis-merge on
my side.

Reported-by: Eric Biggers <ebiggers@kernel.org>
Fixes: eea2c05d927b ("ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/sb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 2afc8b1d4c3b..3ca41965db6e 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -748,7 +748,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 		goto out;
 	}
 
-	if (!IS_ENABLED(CONFIG_UBIFS_FS_ENCRYPTION) && c->encrypted) {
+	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION) && c->encrypted) {
 		ubifs_err(c, "file system contains encrypted files but UBIFS"
 			     " was built without crypto support.");
 		err = -EINVAL;
@@ -941,7 +941,7 @@ int ubifs_enable_encryption(struct ubifs_info *c)
 	int err;
 	struct ubifs_sb_node *sup = c->sup_node;
 
-	if (!IS_ENABLED(CONFIG_UBIFS_FS_ENCRYPTION))
+	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION))
 		return -EOPNOTSUPP;
 
 	if (c->encrypted)
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
