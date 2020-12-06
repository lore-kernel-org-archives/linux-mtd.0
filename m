Return-Path: <SRS0=t8q+=FK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C63C4167B
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Dec 2020 23:13:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775AD2310B
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Dec 2020 23:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 775AD2310B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BFOv+vFP5Hnf1GT3LyttU4BdSCciwCMi/faUpzW+2I8=; b=aVuUSgR27ceGjwOS4W9gGzlNN
	9rU2QVNqsioQQk2k0e0QyDsyymFOanqZ2ZJhSzha9TbnPsoA+2u2ObVbLN/xI0w9CK4MO+p205AbK
	ZckIMDJfdxo5nh3PC7u7iTcfmdS42b/ec0oNfnjdfoa+lwUViiguvXUIrI4c9rhA/etrXrfMa37RH
	VbVBtcwSizYmY1L0kcLut4n7ABeMSBjLPoFUXoXGWc+ZPlYlW6MWfTN//vA//DhJKaPZ107XOws7c
	atzw3R2DG2omuqZ0BXLhPRqZyD6lMhXkKHmrcCG5b9Abd7XMBV6VrM+vbD2D38SHebo8Z/eHWVqe2
	eXIZfl9KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1km3Ci-0003BS-QA; Sun, 06 Dec 2020 23:12:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km3Cg-0003B8-LS
 for linux-mtd@lists.infradead.org; Sun, 06 Dec 2020 23:12:31 +0000
Date: Sun, 6 Dec 2020 15:12:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607296347;
 bh=wRedg1gNvQnfzRd6Sc7Ch4DYbkAvFJu/PD8ZGSHjgdQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=p/xjEKdNmYBgu8ertFQ3kUSFZYs3wZW1WKv60D5Oq2w7r1BqLZpkeVCObJviLcO9c
 mn+fdEsig3KRc+N+WZ0ZB3QtuvA/8UBzd+2zhfU/qvEoJzXAgwaJsTSVb4tDD0revn
 FThRM3xGsbpwK/GH4RDGh1eLB6BesQ0OXu28aTHkTl2XK/CIdOnmQT71ogyuIca+Rj
 d/G0x3Gv47eJEDJlnGLra/FTf9tKEYa7heydAUn5gFubAeTAglA/+VFvAulBht2ne/
 khg13oQdPfbl6LqgKhnsG7vNz0V/N69ZbgosskWCY2TNS/me34ryQYoL+20rOBYjIQ
 qJhC9wCHWNrvg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH v2 0/9] Allow deleting files with unsupported encryption
 policy
Message-ID: <X81lWZeMaSHi5gz4@sol.localdomain>
References: <20201203022041.230976-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203022041.230976-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_181230_779689_3892A403 
X-CRM114-Status: GOOD (  16.84  )
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

On Wed, Dec 02, 2020 at 06:20:32PM -0800, Eric Biggers wrote:
> Currently it's impossible to delete files that use an unsupported
> encryption policy, as the kernel will just return an error when
> performing any operation on the top-level encrypted directory, even just
> a path lookup into the directory or opening the directory for readdir.
> 
> It's desirable to return errors for most operations on files that use an
> unsupported encryption policy, but the current behavior is too strict.
> We need to allow enough to delete files, so that people can't be stuck
> with undeletable files when downgrading kernel versions.  That includes
> allowing directories to be listed and allowing dentries to be looked up.
> 
> This series fixes this (on ext4, f2fs, and ubifs) by treating an
> unsupported encryption policy in the same way as "key unavailable" in
> the cases that are required for a recursive delete to work.
> 
> The actual fix is in patch 9, so see that for more details.
> 
> Patches 1-8 are cleanups that prepare for the actual fix by removing
> direct use of fscrypt_get_encryption_info() by filesystems.
> 
> This patchset applies to branch "master" (commit 4a4b8721f1a5) of
> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.
> 
> Changed since v1:
>   - Made some minor updates to commit messages.
>   - Added Reviewed-by tags.
> 
> Eric Biggers (9):
>   ext4: remove ext4_dir_open()
>   f2fs: remove f2fs_dir_open()
>   ubifs: remove ubifs_dir_open()
>   ext4: don't call fscrypt_get_encryption_info() from dx_show_leaf()
>   fscrypt: introduce fscrypt_prepare_readdir()
>   fscrypt: move body of fscrypt_prepare_setattr() out-of-line
>   fscrypt: move fscrypt_require_key() to fscrypt_private.h
>   fscrypt: unexport fscrypt_get_encryption_info()
>   fscrypt: allow deleting files with unsupported encryption policy
> 
>  fs/crypto/fname.c           |  8 +++-
>  fs/crypto/fscrypt_private.h | 28 ++++++++++++++
>  fs/crypto/hooks.c           | 16 +++++++-
>  fs/crypto/keysetup.c        | 20 ++++++++--
>  fs/crypto/policy.c          | 22 +++++++----
>  fs/ext4/dir.c               | 16 ++------
>  fs/ext4/namei.c             | 10 +----
>  fs/f2fs/dir.c               | 10 +----
>  fs/ubifs/dir.c              | 11 +-----
>  include/linux/fscrypt.h     | 75 +++++++++++++++++++------------------
>  10 files changed, 126 insertions(+), 90 deletions(-)
> 
> 
> base-commit: 4a4b8721f1a5e4b01e45b3153c68d5a1014b25de

All applied to fscrypt.git#master for 5.11.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
