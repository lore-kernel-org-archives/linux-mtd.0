Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBEEC56202
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 06:43:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 678BC24655
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 06:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IukmT9Vj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="nEBuvp/4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 678BC24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nrO1/YdlBFG6fkC/mDO8KYhti1Q/8+KtXiaXIMvcQ4g=; b=IukmT9Vjjj2gnn7s9Yv7saHnxp
	8pv0Zu7Xioh1ojY9ymGGfa7mQ/4oi1qJEmI+WqcqY2iNPhqJU3DO2V7dBtypbCp0d/IV3JHyIfMjv
	Dc6f1oo1HsQfhxi5vO5xROyCTn7/h82pv6T6szlGkBaI0fNkY0Q6Iz6PE+uOX4p0FuMR1Ob0PDP3c
	k4Gl7Dns+r/45lG9DXhIdE1b4TwLZK+H3KGWIhmx7nqvMp6Ax8CP88Z+M4wSufK0901WrP8tMckS9
	N1BOUia8gSMBD6+EunnOwvyYA1vxIF1PAS35yM+EEG0ORnhWdT3ZwzvsSvX9DjTKCaenptZfLVJUX
	+lHQc0Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfHBC-0002r7-0Y; Wed, 18 Nov 2020 06:42:58 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfHB8-0002q4-Vb
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 06:42:55 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id 60so657699qvb.15
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 22:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=u5caVYpjW51UviyAUiIiuabnW39XcM6vjoXzylmjMQQ=;
 b=nEBuvp/4qXTH4AAIx8Gr2DG2ZKpgZ7YLYjZB4voXYemMwTXptimZcegqwTHgPpPw0I
 EwVwGOxQa0Aap22fetPS3Lj1KFiJioOyzRYapPZ3sh/IAuvruSKA7NOPaADtyCApdcOZ
 eAHvd6+arAeAaZ+UyJBdV9j0eelWwDnmi6lZpJl9AxxsRYC6qRxvLZVskUhKpBbGb5qW
 pV4o4S/wW+/n3D8iLw3TM6UN0E6wiazwRqgTjGZUDhQT6iU9/QB6j3bqBsuOg9PvT/PI
 dyzTuACoqvvljMcN66fAqWLJpRZe+hY81fFWPiwVJVjTQu1i6Bp5N0pAHXwnA55L1ZPQ
 JGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=u5caVYpjW51UviyAUiIiuabnW39XcM6vjoXzylmjMQQ=;
 b=Rk+ZLIK5F89V/MRBlQB72g68NexuBXaL+RLVsm5xsk+uo7ZyoJNrvG3qIhPeUS+nLf
 Bme9twjZhXVncWUAF9Ogm+4Muv3ioW7i7q8Zu74UwCFXCDu2NssDLDYMTzt5Cd+zq3nF
 UXOmbcbVz33fp2fpPvwdPr8qLEG0o22pN3MEgLrdt+rYLXVh8S/up+Vpw3tu2PiWh61A
 78FsMXMcjPhyiHZ2sG1Jd50mIh1vaSOKgAzFeJmvEniHXCCMcvI/Q0fCgbPTdBzajkwK
 IPY13T/Ll+6EQHCB3WArhQRNsBb8vDf8CF2h/ulOtRlR2d41pV5s3WLVQE1t2xz+m1Hf
 Lfpw==
X-Gm-Message-State: AOAM532Yljtm4/UD8M3j1+94+A4Gqj2ADgdUABkzheGt59ueBNEp1OYV
 54tkwxvbrmpRZyFiNwgZOgbwgtdpbrg=
X-Google-Smtp-Source: ABdhPJxIZ2FilqfFWaJShB2bRFVummoWsUhq+iNGutp/cAxbjC3GBHd8GSqHZEJazc+0X49BH56xSs8BuGU=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:ad4:490d:: with SMTP id
 bh13mr3584587qvb.14.1605681769641; 
 Tue, 17 Nov 2020 22:42:49 -0800 (PST)
Date: Wed, 18 Nov 2020 06:42:42 +0000
Message-Id: <20201118064245.265117-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v3 0/3] Add support for Encryption and Casefolding in F2FS
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_014255_030034_FBB523AE 
X-CRM114-Status: GOOD (  12.52  )
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

These patches are on top of the torvalds tree.

F2FS currently supports casefolding and encryption, but not at
the same time. These patches aim to rectify that. In a later follow up,
this will be added for Ext4 as well.

The f2fs-tools changes have already been applied.

Since both fscrypt and casefolding require their own dentry operations,
I've moved the responsibility of setting the dentry operations from fscrypt
to the filesystems and provided helper functions that should work for most
cases.

These are a follow-up to the previously sent patch set
"[PATCH v12 0/4] Prepare for upcoming Casefolding/Encryption patches"

v2:
Simplified generic dentry_op function
Passed through errors in f2fs_match_ci_name

v3:
Split some long lines
Cleaned up some code
Made some comments clearer
Fixed bug in v2 error passing

Daniel Rosenberg (3):
  libfs: Add generic function for setting dentry_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption

 fs/crypto/fname.c       |   4 --
 fs/crypto/hooks.c       |   1 -
 fs/ext4/dir.c           |   7 ---
 fs/ext4/ext4.h          |   4 --
 fs/ext4/namei.c         |   1 +
 fs/ext4/super.c         |   5 --
 fs/f2fs/dir.c           | 105 +++++++++++++++++++++++++++++-----------
 fs/f2fs/f2fs.h          |  11 ++---
 fs/f2fs/hash.c          |  11 ++++-
 fs/f2fs/inline.c        |   4 ++
 fs/f2fs/namei.c         |   1 +
 fs/f2fs/recovery.c      |  12 ++++-
 fs/f2fs/super.c         |   7 ---
 fs/libfs.c              |  70 +++++++++++++++++++++++++++
 fs/ubifs/dir.c          |   1 +
 include/linux/fs.h      |   1 +
 include/linux/fscrypt.h |   7 ++-
 17 files changed, 185 insertions(+), 67 deletions(-)


base-commit: 0fa8ee0d9ab95c9350b8b84574824d9a384a9f7d
-- 
2.29.2.454.gaff20da3a2-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
