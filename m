Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B46C4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 01:10:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1512221EB
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 01:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="imumd0Ue";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="uuOUEWPH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1512221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4bYiLabYyVgNwodswiKZm2tBIBQxQtFghdE5Bq7WfuU=; b=imumd0Ue9abmVHXyFanRKOBOm
	d65W2Lnk7UNSuxar3+/2dMuEkjCamH3xmuMpH0x52jRpgZB4tzEiUCEF0wei5KM5VU32OQn3AxSkw
	V1gYhBPlDmV0wdYGHe1tupWHAsYQEK/d6CdRkWeJPQ9axPDDa+bYAOG/jfAQq1NxWFdJQtpw5dc7a
	MGFCoHgF9yEKTOZyd/wl+Vz7GgAnxBoXWotShLENl/jf/nrTPeUoZDUi9MLRyV/bp/kfvIrqB2CxO
	xfLN8UcMQ8M7TlyqwKc8vPzUvVnshrZVd5Sn/vCNgrvlF4+EnSw+mps4tuLzmxNijAjCjrRGW0PbE
	QCEvIMdtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtHt-0000iJ-4p; Wed, 23 Sep 2020 01:09:37 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtHm-0000dT-QR
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 01:09:31 +0000
Received: by mail-pf1-x44a.google.com with SMTP id m13so12742076pfk.19
 for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2020 18:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Iygja5AJutfHm4YvnlwM0dTYeIXTivBw9HNzBAy37AM=;
 b=uuOUEWPHZPuw+wZv2NxYlk5b4qARvVhk9l5VutTgoWWyZcZuyFizEpd19JZZxiAyOb
 N8d29un2MtSSLuDqVDdx9nztGjWduT3vGmFgDh4JHNW7EtDxLNSGgrYx1Rc7lzW4b3I8
 sSdyPuacc0AOb0wygCNqd6lnNi9/DX4DMjG3C2FBiP1Pu9EdYhx1oFuiAV6dTxk7Siks
 /ElKvk36qbnET7SIYDn4ZKBN7NYUpL1HndaHubTYMsiBJU2Z2BhnhFlzXILr7DkR/VMK
 WQG+cZoJpfNOQxgiYQTj/NE4KPzx1aIFC1HCVvXnLQbft4QsCMTIFurk39tiFbW3k595
 L4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Iygja5AJutfHm4YvnlwM0dTYeIXTivBw9HNzBAy37AM=;
 b=Bk2edFiu9TVD/gL2ImGfGD353q2No0y1DzczLfmBQJe+3kNc0zhV5zl3DvOgLmf7Zj
 zsSlsm+9Kbqy3Q6tk9f72/jTN/EFjHssdbqWBVhN1wYZQF1kC1f8+yS5gabWBjdeWs7x
 86D9QpPqeeyBCiOsAY+Nblx7Zk75Xiz6LLMTHT6mQTw1f3ARGm/bXEPbog4Fbp3CqRm1
 ctgUFCaCsURN6cTkk7J52QIWpC4ovFrhtiSnpjj3JSg+O5Qgl4wt4dHBGNBvOONUEDwP
 bG2ggXZqnlnvNdt8rcUA3maoP73rnZml38h7w72bdz5T0ZDy3V6b916B5FDRxBr2Nxou
 t+0A==
X-Gm-Message-State: AOAM533z1SbhmFDgmw2EKJ8Iw50EHZG8UB/uR9dz4VZsrSOWy5RIKp2Z
 WHqpqwOXLPJoHfHP2zv41dFEEjRjC0Q=
X-Google-Smtp-Source: ABdhPJweQ2fLHpSG59qNGPeo45kVpwuKLLDae76QKJ3/73ksJ2F3VdQo0rXG32bWWdxvVzGJGgieliFiQ6Y=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a63:c34b:: with SMTP id
 e11mr5777378pgd.25.1600823363879; 
 Tue, 22 Sep 2020 18:09:23 -0700 (PDT)
Date: Wed, 23 Sep 2020 01:01:48 +0000
In-Reply-To: <20200923010151.69506-1-drosen@google.com>
Message-Id: <20200923010151.69506-3-drosen@google.com>
Mime-Version: 1.0
References: <20200923010151.69506-1-drosen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH 2/5] fscrypt: Export fscrypt_d_revalidate
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_210930_875421_EC374500 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is in preparation for shifting the responsibility of setting the
dentry_operations to the filesystem, allowing it to maintain its own
operations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/fname.c       | 3 ++-
 include/linux/fscrypt.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 011830f84d8d..d45db23ff6c4 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -541,7 +541,7 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_siphash);
  * Validate dentries in encrypted directories to make sure we aren't potentially
  * caching stale dentries after a key has been added.
  */
-static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 {
 	struct dentry *dir;
 	int err;
@@ -580,6 +580,7 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 
 	return valid;
 }
+EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
 
 const struct dentry_operations fscrypt_d_ops = {
 	.d_revalidate = fscrypt_d_revalidate,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 991ff8575d0e..265b1e9119dc 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -207,6 +207,7 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 bool fscrypt_match_name(const struct fscrypt_name *fname,
 			const u8 *de_name, u32 de_name_len);
 u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
+extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
 void fscrypt_decrypt_bio(struct bio *bio);
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
