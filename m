Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C22C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 06:10:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D5C24698
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 06:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ea+ibYaz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="c6PEOqqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D5C24698
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lWv/6ZSMZuvNYw0leIHiUnPlpnqIIeezA7f12Qf3WE8=; b=Ea+ibYazYVtQcEnqs4IUEHSrX5
	ENcZZiWDe8lz06YlwbQznZWmHyqzi20a5t+g6CVmH8CWS6ZoNKCqz8mjvQNuE1pEoS4JWzfc09c70
	FREN/UUwhY038qW2rtr10lGFJs37aJPgtKNcO1hna3fY/H2k06CLL/TCD2vJpeDZNGB4pD8WsveAi
	JJ5hTnP80jATyV6z9vj2phViRDygOL5t5D4NstH97PDsZ6+S7KXvV/g+bppKctqQNtupf6LXDM1Fx
	2OGi0gpv+Fe1MHWDD/mRls+9P5wk5AkENcDxLGJx3EJ4pO2Ja3Q3SDCC35i91I2172wYrJ3C8zOiu
	lriumTug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfd87-0007i7-Lz; Thu, 19 Nov 2020 06:09:15 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfd84-0007gh-8z
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 06:09:13 +0000
Received: by mail-qv1-xf49.google.com with SMTP id bl3so3730765qvb.8
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2020 22:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=ANbu1Df+KdZWLGFVKIuoVXDzF2gJVrXKwqf/2x+Sgns=;
 b=c6PEOqqB1y53GrJM29i1IJOo4HV+KBw2qDYjjOmo3Lwic4AiGfQBHqg29ajW15QvO5
 VEJwuKDRs4rD3iyUSjV08gc0kn4Usqif1RBjXIj3Vj2gh4jZmHN95C5ewXA0Ilpniu03
 mgu3gBv+mEHKHmf8oQjXZwmOy2XfLEFOAGvCsAfevMnnIyEEkLE8DsIkAw8ahjs8WSl5
 khD4T/rIpxE2eqoBJXFSXgEWFUgDdmRAz6wrLPtZmCSuOUS+lnwS0q0adeZgnYAJrioL
 TdLT+x8VODOw3i7smRHF2swF/AHnI00L5YyqI53TuB4YP9a2sgNPeqSwZmuNFNPddSjG
 BUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=ANbu1Df+KdZWLGFVKIuoVXDzF2gJVrXKwqf/2x+Sgns=;
 b=mLqLj76iyGCHFUzMyLhsoxB8y2l+nBzTuegz87H4lFYwURx2Vs+VhZLTW21G0VYSEI
 SEcFC3GAI1J/52HDdlG0CVn60vZpcrfNPDJqA3pzfKKtih4XcOAUfv57f+X2cBDurkEF
 MN6kAJVeomZtpMj4IdKgVfzrLMNHcZDuMWkqpRC/ounzTs2MMG243SImA4wzmKqFOCX5
 QU5fT5ApRjgyPxc6o3tG0wxlSKnOCe432/qXx1HGNQrphE/VK4K8FIASg05WIxdlgSWg
 EjDqXXyUJz4dpIychqRRis7QQpLHHOrZ0KQRTldnZXHPhwQSna0pVlceafOd0vJsd2RC
 n39Q==
X-Gm-Message-State: AOAM531+uJ3lsZXzTdGYftByjTrWomyE5ewCkRE0Rt4hXjGc1b5LPZsz
 dJYzGeWhtPlQWZT7Y1bfqKnLup/hpqA=
X-Google-Smtp-Source: ABdhPJwON+zdFtliqZ+ma3jEjb9UxZ0ne5Mm+ghwPkKFU99I/CIoH/3dozPBLOiAETaSOGqDxwavxcB+6fo=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:ad4:490d:: with SMTP id
 bh13mr9760846qvb.14.1605766147299; 
 Wed, 18 Nov 2020 22:09:07 -0800 (PST)
Date: Thu, 19 Nov 2020 06:09:01 +0000
Message-Id: <20201119060904.463807-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v4 0/3] Add support for Encryption and Casefolding in F2FS
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_010912_363137_E26355F0 
X-CRM114-Status: GOOD (  12.60  )
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

v4:
Added reviewed bys and acks from Eric
Removed unneeded variable
ifdef consistency

Daniel Rosenberg (3):
  libfs: Add generic function for setting dentry_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption

 fs/crypto/fname.c           |   4 --
 fs/crypto/fscrypt_private.h |   1 -
 fs/crypto/hooks.c           |   1 -
 fs/ext4/dir.c               |   7 ---
 fs/ext4/ext4.h              |   4 --
 fs/ext4/namei.c             |   1 +
 fs/ext4/super.c             |   5 --
 fs/f2fs/dir.c               | 105 ++++++++++++++++++++++++++----------
 fs/f2fs/f2fs.h              |  11 ++--
 fs/f2fs/hash.c              |  11 +++-
 fs/f2fs/inline.c            |   4 ++
 fs/f2fs/namei.c             |   1 +
 fs/f2fs/recovery.c          |  12 ++++-
 fs/f2fs/super.c             |   7 ---
 fs/libfs.c                  |  70 ++++++++++++++++++++++++
 fs/ubifs/dir.c              |   1 +
 include/linux/fs.h          |   1 +
 include/linux/fscrypt.h     |   7 ++-
 18 files changed, 185 insertions(+), 68 deletions(-)


base-commit: 0fa8ee0d9ab95c9350b8b84574824d9a384a9f7d
-- 
2.29.2.454.gaff20da3a2-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
