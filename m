Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57508C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265F3610FF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 265F3610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXI1P1SmrTWNPvS/GqUZv4gKIqW7nGGwf0eu2ntNEUg=; b=YsUAeQFLBYdrSU
	uqe/vtfXcFuvBgXDHvZT6l7TRg+9aEJhXVjFCi8kftzuGhdCD6hJq7cVlpwEsi4jdmXGK+LNYhcX9
	rYRdeyUWNDZlR4TV0swJ6/0Y4TurWHudKgZlPsrugi2GpSn4AKr/sAC0zPciPssj0sqBmDuCm5cGn
	8g2n+JsBPoPVcwO+ajrvPA7rz3DFl/N0x02ucQrQ0YY+bgNtGGYQJiOCfvZTEDRfQJZaBw11IbskG
	MnLrHqtkppLu7BEZHkWuuu7nOC2naYsYOoyqmfbcFqDu1XNXRUSSfZrOJcnF6YxkIDqKptDrpQjD+
	yuEQRfz9NBZs2NgpwwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO5Tt-007dzh-Bp; Wed, 08 Sep 2021 21:51:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO5Td-007dwE-TK
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 21:51:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B7E8610F8;
 Wed,  8 Sep 2021 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631137889;
 bh=KoVck986relZorHv7Og0MrrnvSEGPQxM/Ce82S4543I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=djxv3m0xGbBVx+UNIvmpHx8cZckH7eE8lOVxji2c4kw6syS4aTOebWeaYfIU2OlZn
 5mkJiQwQN8zUcAHRbz+vHGtcRPj+b80614KfoJND4jKGVBCU4d3AvgDQegdEbV9AGf
 Yvuo/EFdvS1er0WGlHd2sc/7RtLAGNA/ZsivoIl62PXpNoTwuY9zCYS7JiHE2QroN9
 RFIgFr7Er89OvNZwiPXjvCToXflBgNUIHgw6RTrPAqHPNweItKIee4IZEIGZc9zhBD
 g7OLKhrryDH847WLVqTS74OFy4hD0wca7jtZUQ+dRUeTmy+aM3SwpvvAYPdXuj4Fyi
 CHYRZsoHOcKAg==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] ext4: report correct st_size for encrypted symlinks
Date: Wed,  8 Sep 2021 14:50:31 -0700
Message-Id: <20210908215033.1122580-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_145130_034647_C198A4DE 
X-CRM114-Status: GOOD (  10.79  )
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

From: Eric Biggers <ebiggers@google.com>

commit 8c4bca10ceafc43b1ca0a9fab5fa27e13cbce99e upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after ext4_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: f348c252320b ("ext4 crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-3-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/symlink.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/symlink.c b/fs/ext4/symlink.c
index dd05af983092..a9457fed351e 100644
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@ -52,10 +52,19 @@ static const char *ext4_encrypted_get_link(struct dentry *dentry,
 	return paddr;
 }
 
+static int ext4_encrypted_symlink_getattr(const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	ext4_getattr(path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations ext4_encrypted_symlink_inode_operations = {
 	.get_link	= ext4_encrypted_get_link,
 	.setattr	= ext4_setattr,
-	.getattr	= ext4_getattr,
+	.getattr	= ext4_encrypted_symlink_getattr,
 	.listxattr	= ext4_listxattr,
 };
 
-- 
2.33.0.153.gba50c8fa24-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
