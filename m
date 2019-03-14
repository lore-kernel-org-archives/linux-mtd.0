Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E699DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:17:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7311217F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBA7s/B9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7311217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Im+A0M/LarC8uNgpRXdFPKQ5NaIqxnsdCgNU5qga38=; b=kBA7s/B9UU/k+W
	Cn0hwZr/noS42IkLQ3YzwkgabT7lYSKN4xrVE635ZRBde9RRLQ4qHZqZLxd7SgYHCT1+lvErE/yl8
	/Tj83ls1Y7FS0JVfoTZKpW2yXrgIDMDzj4ZuSa6Y/PyvfrU3LYU4XNBCZ7+klYLxruIb2dDKOUOkI
	2hensnWBYceYw/g1xCbVR49AQOsdlbth0J1QZEp8VGZ3yYDIKxXAh6rDPxnw+yAZ95ElZpcKmRSNT
	CYfnsrnB0mPEZ6wMtejK4MmtwlyLT1CJ/W20QsSYfwV01bu8tQdhoO0LNFToSZCeuAPn81/A1oHtg
	7VG/+KEZWssjkI1QAYZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4TyV-0001X5-Tm; Thu, 14 Mar 2019 17:16:59 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4TyQ-00017F-RL
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 17:16:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id A4EC818013763;
 Thu, 14 Mar 2019 18:16:20 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] fscrypt: Implement FS_CFLG_OWN_D_OPS
Date: Thu, 14 Mar 2019 18:15:56 +0100
Message-Id: <20190314171559.27584-2-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190314171559.27584-1-richard@nod.at>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_101655_545534_6694C2CA 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, Richard Weinberger <richard@nod.at>,
 amir73il@gmail.com, linux-unionfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, paullawrence@google.com,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If a filesystem sets FS_CFLG_OWN_D_OPS it manages dentry operations
itself and fscrypt is not allowed to set them.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/hooks.c       | 4 +++-
 include/linux/fscrypt.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 56debb1fcf5e..3ec925405fbe 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -107,7 +107,9 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry)
 		spin_unlock(&dentry->d_lock);
 	}
 
-	d_set_d_op(dentry, &fscrypt_d_ops);
+	if ((dir->i_sb->s_cop->flags & FS_CFLG_OWN_D_OPS) == 0)
+		d_set_d_op(dentry, &fscrypt_d_ops);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e5194fc3983e..7139a110ac4f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -48,6 +48,7 @@ struct fscrypt_name {
  * fscrypt superblock flags
  */
 #define FS_CFLG_OWN_PAGES (1U << 1)
+#define FS_CFLG_OWN_D_OPS (1U << 2)
 
 /*
  * crypto operations for filesystems
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
