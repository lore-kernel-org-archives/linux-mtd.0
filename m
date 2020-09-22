Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADA9C2D0E2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 10:49:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F5F2396D
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 10:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wX3zF5TS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=android.com header.i=@android.com header.b="cjBL0njH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3F5F2396D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=android.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3zj8G+psnT/YSDfECC5iVZcbr8+nMBR8iAsi6F430cE=; b=wX3zF5TSh8uGdZzgjMvR8Ybr5i
	fsCfhQwOB5DB6al6jYCzWXzGxQBsegwitbDyXYy+YymzMDubgdd809bNzl/RwRTLf0jajuxsx+S94
	kWV7G2kjEw2LA6kdxbSFYRv5OURRsygIbOkZFdlm9xHx71fOqNitCBZsMSk/fyQqnqa4XmQyOxz6O
	PKUBA0MyId8AA0yAHP7eQtmv/DODsCQ5h6/iMLhW3zeVvC0ELXG0zJRukfx3x+dMKgK0p6Rj+ONgs
	NQ1eIUpExbnhKkM08Bm+Q5KFR4Tw3CBPYvUGM9/GcmKzALvH9TEpnQW4n5Vlp/TdqZXsuz7A2hAcX
	dgeN2H6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfqb-0006VJ-4z; Tue, 22 Sep 2020 10:48:33 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfqR-0006U7-0k
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 10:48:23 +0000
Received: by mail-pj1-x1043.google.com with SMTP id q4so1282276pjh.5
 for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2020 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=cjBL0njHm+8zUypttYPB1lyQmH9E2S3jK9rf/cmZXEh6EGhIdRL9gIUk/vQojZYKYn
 IihVstLnA999VhtdeYb2+OGsEINb8d80uZmj0iYuYKmjzqdzEUI76X8MpUdm0QgCwDJk
 oPFPSJ3Z+Ng/XKbFdKJfbc2uQyDB1AM3XB46PycPUVTODJj7MfvUhH1c9SOBH6hy3fN7
 +MmI5yEbIvmoO31Bcs6jUoukXNaA5DDoZecxGw2h+gJmXdQsHQE99QS9XqsD892baliJ
 wjhdtIqH6uXDr1VRf4Cpg35fClhascX89HcZ86PTKJaI3hQP1+2H5OmowlFkWHmQUA8X
 0uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=bTqHuEZVuzOtzD41UpEj1Y1keBlPd8tcXtFZretOv4aj5V9QSNh/7/qefTY/zLU8pW
 FG6k2GbXUtshq41vV/hLMR67Ao9/8V/vhWeaUFDTA23WiybcYSGsFrUptxcjtbr3rVEo
 +5fi0XCZT2E8/OQA3UaWJoE6t7h+e71LbQK3AAzS0a/+jvODRmPsQISSbsJIPHZFrttV
 eudfb7frmWO03FpwvreLu1g0E75Cpgszo33edl753ne/InEP71lm2ZykPrCRr99LbdFm
 /k3Q5G7dMhvK7g1GPjnZkT0d91SzTa3UC84J1K4fNTVBG7CUwnJDkI6kr6aQRV390eAV
 RUIQ==
X-Gm-Message-State: AOAM530lPi6Ki/fVU9OhLnJc7jjVL520Zg87EsHyuIb8qggF9KEk+SQr
 m5lCmmoQNefpXjYch+wmG0gQxQ==
X-Google-Smtp-Source: ABdhPJxmaXOIQxSeBKkx6n6E73BxPgRUl72SH7IqG1Psmqep24Gl/+025pnEfhuIqXdYNK3DnALwOg==
X-Received: by 2002:a17:90a:e10:: with SMTP id
 v16mr3235865pje.84.1600771699965; 
 Tue, 22 Sep 2020 03:48:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-231-5-90.hsd1.ca.comcast.net.
 [73.231.5.90])
 by smtp.gmail.com with ESMTPSA id kk17sm1958427pjb.31.2020.09.22.03.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 03:48:19 -0700 (PDT)
From: Daniel Rosenberg <drosen@android.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: [PATCH 0/5] Add support for Encryption and Casefolding in F2FS
Date: Tue, 22 Sep 2020 03:48:02 -0700
Message-Id: <20200922104807.912914-1-drosen@android.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_064823_113137_22BEB623 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@android.com>
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
