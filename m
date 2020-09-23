Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6001BC4727D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 01:10:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF58221EB
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 01:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oIX7FokR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="VzYml5mR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF58221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3zj8G+psnT/YSDfECC5iVZcbr8+nMBR8iAsi6F430cE=; b=oIX7FokR9r8yrYwlUmUmMz5UmJ
	GJlbaDD1Ncy9P678ROVnztrrHGbXXNlgf9akKF856GaXFb98vlnxMWuA/FZCxuHT34bmjdxl7rH2j
	Fm1tm/IfCqlY5jyGNQDX+WOXa1iR/knKR0F9P0JY7vMbIvy+R3ZkhOiq2NXk49ulvfNmXXxltKdZu
	kpLQ3NBUyHFBSahhZk+Jo/z4bixGD5U34wC4Q7BjSvGzfQVFlXTo+tbMY47I6j7cDTRqvZNpGaMEp
	12kx67mMR91symJz70fDY4MiYI3jFd4XhisnIV39GsTFbR0mQ76TLCnHHCeT+/n/0JqQwHSFW/k4W
	hxCApjug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtHg-0000dA-46; Wed, 23 Sep 2020 01:09:24 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtHe-0000bG-87
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 01:09:23 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id b127so17800062ybh.21
 for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2020 18:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=VzYml5mRARymBMqJuBNvlalVRmIpcIRL7rCYhdalEJ6bKiRq37APrmAer+cndQz7ow
 HDgQ8sObYp4idOZvJsIB8XMBdAbJDoPCXf8RcjD8zqSkhEpxPKkDqW19XQG4XFjZvJaz
 8jEIjxaKoJcRnQ8fhGfMGPAbu8NwMdXX1LmNNI+9aYl3v1FIDXUdjNESPhuk/al8UMRu
 iwH+o2SnESdtrDrKMurtAfxp8eGbb3YAnwpecd7/CBg1WdTaJUzuh/5gxIJHiCHdeBs/
 OuNNmgOyE5L/7V98+v4aCcawDaDAqbTrPsoF6o6qWk/oSi7nQACkmrj0atUkhEeP/rkK
 mCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=ZQ88XORDSPsg4raZHRS6kFPXZb/N6mAI6aKGEOE9OE+giQ6PBcjmG6juBQGzW/0L2U
 GSVyar+OWcAcj1m20HSHU33vWWLXLHxJgXlot3mNjfRwdsarXOxsb2UTc+Hkpouq6HcH
 0ClaXmjuIB41AAn/xNPO9vMKhdBkfE63NKzoP2wahqlrWGVqtAwF3xrT8YH3Bv1i/w7q
 2hAZVe6WqQ3RGLDb2DE6IPlYGJ6aUD778C8GZXBO1NyNE5cIF6otiANv9DB8dvgvyz8D
 XM3fj75qAEGFKUp8BTEB84hJXoUK9Dff0thIV6oRxYyEkHELdmKVfSRXKzffJ/fAiz6I
 XS7w==
X-Gm-Message-State: AOAM531xJ2YW8BMN5A7k2F7XccjfLWCmshjvnJcVJ4Ff5stllt4z2APN
 FOsxK0iLl6UKKGk8DRMZYm6xO4DGjVs=
X-Google-Smtp-Source: ABdhPJw5IYwBppbdbWip5F74kDHHvTSDqolnxLv2PtjxebJu9eXnJbODevPPAagFkTBzSK+vbQomxUmmEHU=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a25:6dc6:: with SMTP id
 i189mr10208913ybc.355.1600823358686; 
 Tue, 22 Sep 2020 18:09:18 -0700 (PDT)
Date: Wed, 23 Sep 2020 01:01:46 +0000
Message-Id: <20200923010151.69506-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH 0/5] Add support for Encryption and Casefolding in F2FS
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_210922_301398_CB5026F8 
X-CRM114-Status: GOOD (  12.50  )
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

These patches are on top of the f2fs dev branch

F2FS currently supports casefolding and encryption, but not at
the same time. These patches aim to rectify that. In a later follow up,
this will be added for Ext4 as well. I've included one ext4 patch from
the previous set since it isn't in the f2fs branch, but is needed for the
fscrypt changes.

The f2fs-tools changes have already been applied.

Since both fscrypt and casefolding require their own dentry operations,
I've moved the responsibility of setting the dentry operations from fscrypt
to the filesystems and provided helper functions that should work for most
cases.

These are a follow-up to the previously sent patch set
"[PATCH v12 0/4] Prepare for upcoming Casefolding/Encryption patches"

Daniel Rosenberg (5):
  ext4: Use generic casefolding support
  fscrypt: Export fscrypt_d_revalidate
  libfs: Add generic function for setting dentry_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption

 fs/crypto/fname.c       |  7 ++---
 fs/crypto/hooks.c       |  1 -
 fs/ext4/dir.c           | 67 -----------------------------------------
 fs/ext4/ext4.h          | 16 ----------
 fs/ext4/hash.c          |  2 +-
 fs/ext4/namei.c         | 21 ++++++-------
 fs/ext4/super.c         | 15 +++------
 fs/f2fs/dir.c           | 64 ++++++++++++++++++++++++++++++---------
 fs/f2fs/f2fs.h          | 11 +++----
 fs/f2fs/hash.c          | 11 ++++++-
 fs/f2fs/namei.c         |  1 +
 fs/f2fs/recovery.c      | 12 +++++++-
 fs/f2fs/super.c         |  7 -----
 fs/libfs.c              | 49 ++++++++++++++++++++++++++++++
 fs/ubifs/dir.c          |  1 +
 include/linux/fs.h      |  1 +
 include/linux/fscrypt.h |  6 ++--
 17 files changed, 148 insertions(+), 144 deletions(-)

-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
