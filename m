Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD50C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9913B2146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWaYxz0/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wVVDHm0u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9913B2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+fZ95LOMoMner+ttAAU5E53LA35YKmSUEbwt8DfO4s=; b=hWaYxz0//PK7W0
	8neOS1ND1KItjLlmSrCMK+D27RXOYC4rnbfLsTwslom7qXW/ZTuiOZCx/jZvORT7HdSQpc4Rq24F2
	o1/TeSpX0gUAO0yV2INDdRTyAxUk1SrOsgM87JRrsnVB35oA9tIbKF9667hujw1YiN73/UYVvt6uX
	hv5SHSaEhgA9GCbH9vQrkvIWOTCdRPoADAOSxCcuEPuBGwr7XlulAjLaEHs1qQIFr+b38BSKZLl/o
	Qm2uZyaR3+MViNWUrKVo+WaSolfrNyP00uWpqqcz7l3T6STsg6pwvIk/PqQUy95YYpytWFrNBk3Tc
	VoRANam22C3jL/U7CDqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6g8t-0000me-BA; Wed, 20 Mar 2019 18:40:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6g8N-0008Vb-P8
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 18:40:17 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37A1321841;
 Wed, 20 Mar 2019 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553107215;
 bh=QPdDcwv8QIQHVxEXZR8gR3cRzKCH9Mf22Cf6SiteznU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wVVDHm0uotjkjfN448/7q/NYGAclTe2c9aCMPtDz3xBWYQ1I4tqAfAMUu0syQxWp6
 hiqp9xi0Wr7Sc5TzlpXB/4D2JchsoJF6uMNCfC+XhByuA+sbOHSIyQVH+u/y964RLk
 P1GoxbBTjV1z6a5W9PGbwRmc6NXa2V2VBRqql7pY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 4/5] fscrypt: only set dentry_operations on ciphertext
 dentries
Date: Wed, 20 Mar 2019 11:39:12 -0700
Message-Id: <20190320183913.12686-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
In-Reply-To: <20190320183913.12686-1-ebiggers@kernel.org>
References: <20190320183913.12686-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_114015_826495_41724005 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Plaintext dentries are always valid, so only set fscrypt_d_ops on
ciphertext dentries.

Besides marginally improved performance, this allows overlayfs to use an
fscrypt-encrypted upperdir, provided that all the following are true:

    (1) The fscrypt encryption key is placed in the keyring before
	mounting overlayfs, and remains while the overlayfs is mounted.

    (2) The overlayfs workdir uses the same encryption policy.

    (3) No dentries for the ciphertext names of subdirectories have been
	created in the upperdir or workdir yet.  (Since otherwise
	d_splice_alias() will reuse the old dentry with ->d_op set.)

One potential use case is using an ephemeral encryption key to encrypt
all files created or changed by a container, so that they can be
securely erased ("crypto-shredded") after the container stops.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 2e7498a821a48..9d8910e86ee5d 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -115,9 +115,8 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry)
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
 		spin_unlock(&dentry->d_lock);
+		d_set_d_op(dentry, &fscrypt_d_ops);
 	}
-
-	d_set_d_op(dentry, &fscrypt_d_ops);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
-- 
2.21.0.225.g810b269d1ac-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
