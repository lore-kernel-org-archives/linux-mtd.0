Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FA5C56202
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 04:04:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797EC2468E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 04:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPv+VArI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vUa28QYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797EC2468E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqgU/G7Dy48qvxdX5G5p0X+z47OMUOX1fnAp0AQl7T0=; b=SPv+VArI+vqDdNLd6zpBX1Xbzx
	K3vub1y3PZBxki5oWiPfQ3YSz9G5130V4CiNPOjmWQk6ptNLMIUTaqO2jubB3HGXdk/2jz8EWh8qE
	ZmjtbWNa+7NkeVdKIXTaNZjypHrmpt3fxuPlaUb8ZGBiCEK74cp0QVxgtqizj7jCwVrONRFGGuugr
	esvgGvc9XCs6Jh1sCcyVptCNaP2wl+ufmZkKytK3x/f4GdLOMn2GKQG1DOqf2hMpMJZ/K++sou41a
	ENsihjD8MBd18lCA1BO669yamMgvU32H308oxsB4KMlDBaOs5mTf3td+6qV0S8W7WPtTVBaUB9tm7
	XlQrO1jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kesDF-0008Kc-Dh; Tue, 17 Nov 2020 04:03:25 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kesDC-0008Ja-C7
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 04:03:23 +0000
Received: by mail-qt1-x849.google.com with SMTP id m17so10493075qtu.11
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2020 20:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=yi0JUluZtuNsiNBZqteV14yq9mKWglSiwibM+BbEW8s=;
 b=vUa28QYkFc2WUUIbgYO3nv/X2d3Z3MKwmP9a9NdvQ+iXI9eRQSpwcbM1zweGD+PWjQ
 QyO7PKMH7hALyP5kVRRUUEQhNUMyGcGxycU5hh15BIlDdMDVNFeomDPWZtAiNxYcDVgI
 O9N7Q8fQK6FCCYWzN4zAysq4VjpXkGWFoHwSAyIgOdZ3JdTXsHSQxt7A535mEFe6mbCI
 xRcdwurKrJjRS3x/Wy7Owt+nUhBzzoZd59OpZAMSSLJwMwiWNfuJ57bdm6HBz3MYe3jz
 CDHDezcGavS4VIbNKWOomIriqHoANjpxWR1mF8/FtsvNrR1jmsH9N2dG7lDQUsqelH/h
 IREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=yi0JUluZtuNsiNBZqteV14yq9mKWglSiwibM+BbEW8s=;
 b=bD1XlcQraRVbAvWWy5PulXT093xBeXqHnkL7YY0gji7mHp6Gw4UmD5wrNIWLKeRXIo
 nLAwhqI3n1QoT4DA/sxDhC29e/7OWKO+L4uxxxg7REUFo7DqMErNes+KKaMep/AOzWYv
 RFXEuTciLvJPPfQoHihFoO1F2HUKxYLwC1YNxJjzwcdFSkoNmUKMsdspIWWJl0yEZRTd
 gNrq3wdsBHaPrmuVU2h2IiZgEUqv94K4T0qkrS/4UaM61/NiffS7VMjznCmmuAi8qYNN
 RfDs8ep13jNqbWFe79NzqYnjdE9anx3bvFKDDnLVdvfQY/k5JfREjLJWBY/OfkSBpNN6
 zG7A==
X-Gm-Message-State: AOAM531uRpdfzRcpyNAHJUBDWwTiBdh7h8rQLzKSN1uWA3uEh+6iU9sq
 a6qRSFrfRYxmOHXw+CWcw5829IIP/+o=
X-Google-Smtp-Source: ABdhPJwVaMNu6pc/HpSWjKyc3VedMIrzCM6dHWWO+chOqAq4rf69TQRjG2u+LrpdtRlwfoNUezY7MZGkC5A=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a05:6214:12ed:: with SMTP id
 w13mr18440880qvv.23.1605585798591; Mon, 16 Nov 2020 20:03:18 -0800 (PST)
Date: Tue, 17 Nov 2020 04:03:12 +0000
Message-Id: <20201117040315.28548-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 0/3] Add support for Encryption and Casefolding in F2FS
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_230322_494226_D612919D 
X-CRM114-Status: GOOD (  14.00  )
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

v2:
Simplified generic dentry_op function
Passed through errors in f2fs_match_ci_name

Daniel Rosenberg (3):
  libfs: Add generic function for setting dentry_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption

 fs/crypto/fname.c       |  4 --
 fs/crypto/hooks.c       |  1 -
 fs/ext4/dir.c           |  7 ---
 fs/ext4/ext4.h          |  4 --
 fs/ext4/namei.c         |  1 +
 fs/ext4/super.c         |  5 ---
 fs/f2fs/dir.c           | 96 +++++++++++++++++++++++++++++++----------
 fs/f2fs/f2fs.h          | 11 +++--
 fs/f2fs/hash.c          | 11 ++++-
 fs/f2fs/inline.c        |  4 ++
 fs/f2fs/namei.c         |  1 +
 fs/f2fs/recovery.c      | 12 +++++-
 fs/f2fs/super.c         |  7 ---
 fs/libfs.c              | 60 ++++++++++++++++++++++++++
 fs/ubifs/dir.c          |  1 +
 include/linux/fs.h      |  1 +
 include/linux/fscrypt.h |  5 ++-
 17 files changed, 170 insertions(+), 61 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
