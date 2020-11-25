Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AD1C56202
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8899421527
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AtkvlVr+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfKG5p5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8899421527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ySa8vMXa+YwxirRUCTafGayY4xuQV6kUf03Gnnm7RvM=; b=AtkvlVr+YTVTmlkzWexdzvExgu
	zzoVynuvUpju+ivgCgYywauCM5Ua1yqaFZNQSGsBPqiFpHIEhPJUlKOOnivA7SLQKqinTx2MmBIHQ
	k6/Ljhp7JDtZ/8JNzHT0VbzR2ac3WCXgxBSdZquwo3LzapaN4R5tQ+VdHue5Y3r4SYT4o+po6rlH5
	mxwd2VXeBNNawIKHPNFBNqUixH/kdPlbO9vPEeD7LmjRmaNIr5ROB7Dj2f39Ua26fC3DKamxv9Q61
	u0I1BPtVXc5I3uKMMZ5lUAARG2sBzv4p3shUVadIlJFZybFQl40nX4D8KCl4kAHng7QlC9QX+F3Z7
	TLuXrlog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khic8-0001Vd-NV; Wed, 25 Nov 2020 00:24:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khic2-0001SE-RC
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 00:24:48 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3C3D206F7;
 Wed, 25 Nov 2020 00:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263885;
 bh=M+jRhoaXexMV9nGYgDRJMTIlxGlDLMY+dRhqnifs5zA=;
 h=From:To:Cc:Subject:Date:From;
 b=jfKG5p5lCJrZohfYetsr7smx0o/PxZnPkiYY4BSgdkLRvpXBClZebe+sVZSD55SOM
 fQtjkrtWMe5YZw93YlGoVDWhHtT1YgODfqRzxL6WxvjCd0h4i557joki7DDVrp/4Uz
 eK40i3Jw/3iSNyICbU1tkn/IvXLj3y9CNPMG5egg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 0/9] Allow deleting files with unsupported encryption policy
Date: Tue, 24 Nov 2020 16:23:27 -0800
Message-Id: <20201125002336.274045-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_192446_988860_32C95FE6 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently it's impossible to delete files that use an unsupported
encryption policy, as the kernel will just return an error when
performing any operation on the top-level encrypted directory, even just
a path lookup into the directory or opening the directory for readdir.

It's desirable to return errors for most operations on files that use an
unsupported encryption policy, but the current behavior is too strict.
We need to allow enough to delete files, so that people can't be stuck
with undeletable files when downgrading kernel versions.  That includes
allowing directories to be listed and allowing dentries to be looked up.

This series fixes this (on ext4, f2fs, and ubifs) by treating an
unsupported encryption policy in the same way as "key unavailable" in
the cases that are required for a recursive delete to work.

The actual fix is in patch 9, so see that for more details.

Patches 1-8 are cleanups that prepare for the actual fix by removing
direct use of fscrypt_get_encryption_info() by filesystems.

This patchset applies to branch "master" (commit 4a4b8721f1a5) of
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.

Eric Biggers (9):
  ext4: remove ext4_dir_open()
  f2fs: remove f2fs_dir_open()
  ubifs: remove ubifs_dir_open()
  ext4: don't call fscrypt_get_encryption_info() from dx_show_leaf()
  fscrypt: introduce fscrypt_prepare_readdir()
  fscrypt: move body of fscrypt_prepare_setattr() out-of-line
  fscrypt: move fscrypt_require_key() to fscrypt_private.h
  fscrypt: unexport fscrypt_get_encryption_info()
  fscrypt: allow deleting files with unsupported encryption policy

 fs/crypto/fname.c           |  8 +++-
 fs/crypto/fscrypt_private.h | 28 ++++++++++++++
 fs/crypto/hooks.c           | 16 +++++++-
 fs/crypto/keysetup.c        | 20 ++++++++--
 fs/crypto/policy.c          | 22 +++++++----
 fs/ext4/dir.c               | 16 ++------
 fs/ext4/namei.c             | 10 +----
 fs/f2fs/dir.c               | 10 +----
 fs/ubifs/dir.c              | 11 +-----
 include/linux/fscrypt.h     | 75 +++++++++++++++++++------------------
 10 files changed, 126 insertions(+), 90 deletions(-)


base-commit: 4a4b8721f1a5e4b01e45b3153c68d5a1014b25de
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
