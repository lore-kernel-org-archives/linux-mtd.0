Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363F0C64E7B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 21:08:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF66520709
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 21:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF66520709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XdPt4SQcL4DL/Z9Qf8RjGxTB7CAq7oWeYk7tYupu5LU=; b=eI/YjPB0N0X6/zcmqSkiyQX7q
	1EwKN3OhAY6va6SYR6MZvr/QgY9dV86WRA3y4TxqHkRiLv5KxH03nCGjvu1ixa9WwhJnT1h7q+1qQ
	hHzNn3jiH7MWAvz9jVTk+YMq1e/+4wdhPHrAjK/uczcFNG1rJe7BL/dByTNwwWQjSGsbFlLZG4NuW
	6fQjWH/oW5FA7gtQMN19ATA7/XKVoqYm7WuzXl+IsLHupEiamcnP6Xo8r6lF3M1/uQ3YIdxHV18H2
	ZT8Aa2XaP+/ni04k54iDIn/XF4r9L3e6kPnM33LXibgLQ/+uTj8LJKBdYvbtfJy+hJjrWeidwVywf
	CNnS3EVgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkZM4-0004r6-16; Wed, 02 Dec 2020 21:08:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkZLy-0004p7-M8
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 21:08:00 +0000
Date: Wed, 2 Dec 2020 13:07:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606943277;
 bh=z7aM84uoaVRXDrRTKXVTwdXKK69LzrzJ1yjZQqo3344=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZNH/dFHxK112U8asIp9Tyi1NmmUiP3WZ8jKeTdDrVskZASdlAR/S1wDBS3JHVR6j
 3z+pV6U+lXcVEMTt2lE9kKMNWS54qhtKYSyZJ1y/OwNcNYH+2zcwZXXoqTyEQWwNpS
 ZkQymrXas2DHQb0qKTLFm0/3JkDC9FC7r39gbgLcj5+c/ZI+idYLTm/7F/T7NVWXvO
 q4jhvHNzRrrww4sIAKh0IFFHKFWbaAxr6ln+yidV6vyDxnLQUewpajhRHkcPDimBi2
 +7L2ec88F9TKg8MI6yFF0aM//oPxYTD/cl8b1g/XUOyYDXPhM0kBavcUQeTmQOIU7o
 p9GqnFEnkOM7g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH 0/9] Allow deleting files with unsupported encryption
 policy
Message-ID: <X8gCKTx96rXUMh0i@gmail.com>
References: <20201125002336.274045-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125002336.274045-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_160758_882547_00425657 
X-CRM114-Status: GOOD (  16.82  )
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

On Tue, Nov 24, 2020 at 04:23:27PM -0800, Eric Biggers wrote:
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

Any more comments on this patch series?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
