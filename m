Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30968C10F05
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:11:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F3421934
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZbWw/Pga";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vm02uAjr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F3421934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zF94BF8e4BK7V+DEpH/9d08aG3Do47BO/To2KxgsxjM=; b=ZbWw/PgaFwpa1i
	CldYfD4Q0bCIJJOEdfgrh4DhvWg/QwvkIBl1OvdQv7+gRyzRmR2yh8Kabgc/zrduoDyQKIwifuYW2
	NHtq6SxQpX3CI9DTOTQ76CCQugFDgecNpKjMpjMUtg6YmI5jBc6L/DNJ0PYtX9hur5As11PF8xPHG
	N/Yr0QtmuGhrnUWUfmUTPIg101y2obaNq7HWziL7zE1q6zOGnjb2NQydPumgK5TQfMrmUPOfTziAE
	HFZ0+mcuRG4OJ1bE0UqUS8kuqhJXs5MlM+e6bLXbp3RJv8Jk49/AOgHHCnxdYtVLDSsRa2rS1xiOD
	cOhzX6ZWPp4rd3WAIHYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB0T0-0001ZG-HY; Mon, 01 Apr 2019 17:11:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB0Sx-0001YB-C4
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 17:11:24 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78B26206B8;
 Mon,  1 Apr 2019 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554138682;
 bh=bVz8EWNOD7U2ZdTxmnpm0giLJvx5jIQYLqWiOb4vouY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vm02uAjrn53nwk9HjpcmQ9hyhfts8IMLGNZbObqcdg5m/f6dUA30E5mJiysVdASwX
 syloEVqNRPd86BXToQN9xgIu7SEavlW2J1b2eUNZGEzVY2f4YgRWeP0skJyTrwQ6aX
 sigUn90POxEA/f/X0Beg8yDzU7w0OUi0F7JRUUig=
Date: Mon, 1 Apr 2019 10:11:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v2 0/5] fscrypt: d_revalidate fixes and cleanups
Message-ID: <20190401171119.GC131675@gmail.com>
References: <20190320183913.12686-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320183913.12686-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_101123_439205_94AD8A63 
X-CRM114-Status: GOOD (  19.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 11:39:08AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> This patch series improves dentry revalidation in fscrypt.
> 
> To recap, fscrypt (aka ext4/f2fs/ubifs encryption) encrypts both file
> contents and file names in individual directory trees.  A single
> filesystem can contain many encrypted directory trees using many
> different encryption keys.  Major users of fscrypt require the ability
> to delete encrypted files when their encryption key is unavailable, e.g.
> when the system needs to delete a removed user's home directory or free
> up space from a logged-out user's cache directory.
> 
> Therefore fscrypt allows listing, looking up, and deleting files in
> encrypted directories via encoded ciphertext names, but only before the
> key is added.  After the key is added, the ciphertext names are
> invalidated via ->d_revalidate() and plaintext names are shown instead.
> 
> fscrypt isn't a stacked filesystem, and it's explicitly for storage
> encryption, not OS-level access control.  Thus, whether each directory
> inode has its key or not is a global state, not per-process.  Also, the
> inode keeps its key until it's evicted from the inode cache.  So,
> plaintext names shouldn't ever get invalidated by ->d_revalidate().
> 
> This patch series makes the following improvements:
> 
> - Only assign ->d_revalidate() to ciphertext filenames, thus allowing
>   overlayfs to use an fscrypt-encrypted upperdir in some cases.
>   (Previous discussion: https://lkml.org/lkml/2019/3/13/255)
> 
> - Fix cases where plaintext filenames would wrongly be invalidated,
>   including a real-world bug recently reported on Chromium OS.
> 
> - Fix cases where ciphertext filenames would wrongly not be invalidated.
> 
> - Allow rcu-walk lookups in encrypted directories with the key, which
>   improves performance.
>   (Previous attempt: https://patchwork.kernel.org/patch/10594133/)
> 
> - Fix cases where rename() and link() could succeed on ciphertext names.
> 
> Changed since v1:
> 
> - Fixed comment in fscrypt_d_revalidate() to explain that dget_parent()
>   is actually still required.
> 
> - Moved clearing DCACHE_ENCRYPTED_NAME into fscrypt.h, to avoid an extra
>   #ifdef and cluttering up dcache.c.
> 
> Eric Biggers (5):
>   fscrypt: clean up and improve dentry revalidation
>   fscrypt: fix race allowing rename() and link() of ciphertext dentries
>   fs, fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing directory
>   fscrypt: only set dentry_operations on ciphertext dentries
>   fscrypt: fix race where ->lookup() marks plaintext dentry as
>     ciphertext
> 
>  fs/crypto/crypto.c      | 58 ++++++++++++++++---------------
>  fs/crypto/fname.c       |  1 +
>  fs/crypto/hooks.c       | 28 ++++++++++-----
>  fs/dcache.c             |  2 ++
>  fs/ext4/ext4.h          | 62 +++++++++++++++++++++++++--------
>  fs/ext4/namei.c         | 76 ++++++++++++++++++++++++++++-------------
>  fs/f2fs/namei.c         | 17 +++++----
>  fs/ubifs/dir.c          |  8 ++---
>  include/linux/dcache.h  |  2 +-
>  include/linux/fscrypt.h | 61 +++++++++++++++++++++++----------
>  10 files changed, 208 insertions(+), 107 deletions(-)
> 
> -- 
> 2.21.0.225.g810b269d1ac-goog
> 

Any more comments on these patches?  I'd like to apply them to the fscrypt tree
for 5.2.  Richard, can you check whether these solve your overlayfs use case?
Also, patch 5 could use Acks from ext4, f2fs, and ubifs people.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
