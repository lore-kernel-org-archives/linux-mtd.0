Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C9606A32A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 00:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gP/MRsNT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7oQLSyE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qk4LNK5YxLXR5d0oWjWpP0whhR02SYxO8Kechxm5Ky8=; b=gP/MRsNT2bMwBh6DZKBqFlrgxI
	9UaFVXKaFRS1X9gAMYB8cEuntY1c6K49goaPYpnDG9yMFIv5sDIYLiLTrbdNnRAuFcNgsJnf4CLaI
	sCiBrszmWY2RTldBHIiKltlWVXbdqXq1BgV37gGQIBR+8o156a46da+jRBa3ah+zFI8M/lLFh0fCQ
	lRNbJvcvmQKGxtDnd9uIYQy86AU9lYImgn2+anPlbH6M+gPetS/5bWHgAJog1GjBtRXojnzGU/xgW
	rCRz0kalhyPqOcoT8z79HNG3dPYmVaQ4IQlueRytLNCc4Sy1C+eeEhN57lf4fZxqwGpbsdvAWQjTG
	b1fdNfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYQ-00000007MGU-3g26;
	Wed, 18 Nov 2026 00:29:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYP-00000007MGL-0Izo
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 00:29:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8225D61209;
	Wed, 18 Nov 2026 00:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68D01F000C4;
	Wed, 18 Nov 2026 00:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961776;
	bh=qNXt9CrtwBP/UShhCkJznTf/nidzDEjoR+gXc90tUlE=;
	h=From:To:Cc:Subject:Date;
	b=R7oQLSyEL2pcGI1LgWXqvBRuFvDXgrxHyqrzhhpooghQUP5mlr4xyynm7F8jbOMDD
	 PYH4i6YSAbmQVvYK0HyDYT6Zx5CzESmw5G+ROIhEgR+h6jiIdbMKuXnhCEjc/Lzy5L
	 exwybYXRrpf4lytvHpJunftrfDkcrGwG92v6V+pWBcbqFU3FkU9wl9CGA+l9UAhVAF
	 rKu/B4bKdKI7yJ7T36P1BMh6J+QlBj5OlZ7fZsgEczMYZHDwW4wzKRMlCpPTnymTXk
	 NsxWx0g64DaJxxDpf5y1jmIanBDipGhZK7GPyb7+TfL4K+eRCq5GeF9pF7Gj6BKzUf
	 6HeZK24C2Irmw==
From: Thorsten Blum <blum@kernel.org>
To: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 0/4] fscrypt: Add FSTR() helper macro and convert initializers
Date: Wed, 18 Nov 2026 01:28:46 +0100
Message-ID: <20261118002845.574426-6-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; i=blum@kernel.org; h=from:subject; bh=wqbOfCuCbdUcemVKsc9HdxKwyAV8xTGLwFPgISLMeYE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/PtrOPPLOlNey+xjX9vwP7NPkJococ3yzDrV/Vf5Fb UGhytqFHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR7qkM/109FfZ8O2wdlXJg YnLU4vt5bx6kpHxW+TTt088oN+1jW4oZ/tnuPNNc0OU9y7Nf7F5uZ5103Yr3KsmdDgqRnjH3dzC Z8AAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Similar to QSTR(), add FSTR() to initialize struct fscrypt_str from a
NUL-terminated string without specifying its length.

Use the helper for 8 initializers in btrfs, F2FS, and UBIFS, replacing
hard-coded lengths and explicit strlen() calls.

Thorsten Blum (4):
  fscrypt: Add FSTR() helper macro
  btrfs: Use FSTR() for the "default" name
  f2fs: Use FSTR() in f2fs_do_make_empty_dir()
  ubifs: Use FSTR() in ubifs_xattr_{set,get,remove}()

 fs/btrfs/inode.c        | 3 +--
 fs/btrfs/ioctl.c        | 3 +--
 fs/btrfs/super.c        | 3 +--
 fs/f2fs/dir.c           | 7 ++-----
 fs/ubifs/xattr.c        | 6 +++---
 include/linux/fscrypt.h | 1 +
 6 files changed, 9 insertions(+), 14 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
