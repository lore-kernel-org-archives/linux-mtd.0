Return-Path: <SRS0=oRr0=34=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E090C2BA83
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:36:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F3D20661
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/r5wrSw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="NEywg0M1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F3D20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q65SPIKDiaYhr5O4d7td6k4/+MJSMVClchCyFvr0uGI=; b=e/r5wrSwZWZGAU
	jSjoXrdzW9E+OyYC5rqJ5Sz3KxBV9eCisyhTAgCfF2gMn8fpe+vrWRTs3HQnVlqJWP3QCMOyRJhVg
	GRfdwP5IIIeimnX/3/lo1F2tPoQJzst8yIpjWob+22TbpKp9ltXDSsgPfTCoxuL62DiB1w0RIONPA
	zQrrtaliyfAiJB87inZ5yCrFd1oSBS/flt6YXUBSioCynWwunKqnsaqqpvOzMYewEGM+CUQtPa9xP
	M+4bNF8FyE9BES3HFDSjxw+FlbyPmrxzwZ8EhW2TOqcbfQ057ci9x890arBzJuxQhe41+5mq2qWfT
	3D/QXzoUzc+Er+CcfSPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0F2O-0006HT-K6; Sat, 08 Feb 2020 01:36:00 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0F2L-0006G6-E2
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2020 01:35:59 +0000
Received: by mail-pg1-x549.google.com with SMTP id d9so785856pgd.10
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 17:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=GmdJt27134kNRYXiKp4wrB+O4TXMZQXM52BZBGOfEtM=;
 b=NEywg0M14MnLDWsKOucPQs1roEACrJM00yn5kNJb9zMFZHTZqInTtQiy8IBGz9p2Hj
 S2N+jRLMGwbFKmZnn0koP7Tcjk3PRRe25bAoZCO6ZvkOdazou5mlWmZGxidYIkcSGuOg
 Nc74v+ubh+mtZLefCCwVuXd9BDeFc8qAxw99sNFE3K2Kpg4BaE72oOWDN6XOg4MbOAr3
 dE6k/7AgKUChxUQkZAzZOa2U+EcNbV65+xrCtvviZzWWuHM3cy3/YjezlVDdUeYdz/l0
 cT1t9iCftO1kkoHUVh9CSB9TUY9yRGjwmslRWvlUSeA23a9y0cc6gFqjzMT4jbC4J+6s
 Ch8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=GmdJt27134kNRYXiKp4wrB+O4TXMZQXM52BZBGOfEtM=;
 b=Lb/I+awMdQQHZrPDTTEkvxWbRW0TZS55mW8So/SyWaX4dPsjGceqGCcew889nQ8sdU
 AFqO1hCH+NdnFl3un7qIb5aZi2uAedG+Ok3ovnCWTWgJhSaHzBqsL5kEnvaPcSWXvDy3
 wzNUVHQWLG0j+sTAyeRRWmo8Gl6vISSBTS1pZFdQoA1aU1FtfF5kLzSnhMNJnazMRV1l
 c81yE4o1L3wnOjUtTpbutNUEFiXChou92NTHT3cUio63SJ/zcnX50jDjynEDjS49vR0Z
 G3VweJP21AMyx7wV1+//U7RAdHNsc9sD0kmLweIiFN1AqgjCl56MCD9fnrW8KXKyb9AB
 YnxQ==
X-Gm-Message-State: APjAAAUpqrWX++/G/+/P3USVSjw6O53SoPL+sLodwlpFFn39phkX4Ggx
 Vn9OIR7ftP9zs9NdOjffsWa1ATE+CO0=
X-Google-Smtp-Source: APXvYqzX2zjDvOsycNvWYLOgK+VBNHyLR+WR4NBkkN5UhCL4Cx9+zC71iQcfsB2K3n5Ocuz6cv+mlKk8NrQ=
X-Received: by 2002:a63:211f:: with SMTP id h31mr1939792pgh.299.1581125756217; 
 Fri, 07 Feb 2020 17:35:56 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:44 -0800
Message-Id: <20200208013552.241832-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v7 0/8] Support fof Casefolding and Encryption
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_173557_498597_90CE8BDB 
X-CRM114-Status: GOOD (  14.67  )
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These patches are all on top of torvalds/master

Ext4 and F2FS currently both support casefolding and encryption, but not at
the same time. These patches aim to rectify that.

I moved the identical casefolding dcache operations for ext4 and f2fs into
fs/libfs.c, as all filesystems using casefolded names will want them.

I've also adjust fscrypt to not set it's d_revalidate operation during it's
prepare lookup, instead having the calling filesystem set it up. This is
done to that the filesystem may have it's own dentry_operations. Also added
a helper function in libfs.c that will work for filesystems supporting both
casefolding and fscrypt.

For Ext4, since the hash for encrypted casefolded directory names cannot be
computed without the key, we need to store the hash on disk. We only do so
for encrypted and casefolded directories to avoid on disk format changes.
Previously encryption and casefolding could not be on the same filesystem,
and we're relaxing that requirement. F2fs is a bit more straightforward
since it already stores hashes on disk.

I've updated the related tools with just enough to enable the feature. I
still need to adjust ext4's fsck's, although without access to the keys,
neither fsck will be able to verify the hashes of casefolded and encrypted
names.

v7 chances:
Moved dentry operations from unicode to libfs, added new iterator function
to unicode to allow this.
Added libfs function for setting dentries to remove code duplication between
ext4 and f2fs.

v6 changes:
Went back to using dentry_operations for casefolding. Provided standard
implementations in fs/unicode, avoiding extra allocation in d_hash op.
Moved fscrypt d_ops setting to be filesystem's responsibility to maintain
compatibility with casefolding and overlayfs if casefolding is not used
fixes some f2fs error handling

v4-5: patches submitted on fscrypt

v3 changes:
fscrypt patch only creates hash key if it will be needed.
Rebased on top of fscrypt branch, reconstified match functions in ext4/f2fs

v2 changes:
fscrypt moved to separate thread to rebase on fscrypt dev branch
addressed feedback, plus some minor fixes


Daniel Rosenberg (8):
  unicode: Add utf8_casefold_iter
  fs: Add standard casefolding support
  f2fs: Use generic casefolding support
  ext4: Use generic casefolding support
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption
  ext4: Hande casefolding with encryption
  ext4: Optimize match for casefolded encrypted dirs

 Documentation/filesystems/ext4/directory.rst |  27 ++
 fs/crypto/fname.c                            |   7 +-
 fs/crypto/fscrypt_private.h                  |   1 -
 fs/crypto/hooks.c                            |   1 -
 fs/ext4/dir.c                                |  78 +----
 fs/ext4/ext4.h                               |  93 ++++--
 fs/ext4/hash.c                               |  26 +-
 fs/ext4/ialloc.c                             |   5 +-
 fs/ext4/inline.c                             |  41 ++-
 fs/ext4/namei.c                              | 325 ++++++++++++-------
 fs/ext4/super.c                              |  21 +-
 fs/f2fs/dir.c                                | 127 +++-----
 fs/f2fs/f2fs.h                               |  15 +-
 fs/f2fs/hash.c                               |  25 +-
 fs/f2fs/inline.c                             |   9 +-
 fs/f2fs/namei.c                              |   1 +
 fs/f2fs/super.c                              |  17 +-
 fs/f2fs/sysfs.c                              |  10 +-
 fs/libfs.c                                   | 127 ++++++++
 fs/ubifs/dir.c                               |  18 +
 fs/unicode/utf8-core.c                       |  25 +-
 include/linux/f2fs_fs.h                      |   3 -
 include/linux/fs.h                           |  24 ++
 include/linux/fscrypt.h                      |   6 +-
 include/linux/unicode.h                      |  10 +
 25 files changed, 671 insertions(+), 371 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
