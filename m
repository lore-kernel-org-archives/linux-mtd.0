Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10E3C87FCA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XZ6BImBbZ5CRI/N04M9K1hbXkdVMu++ZOUaDEHN7WM=; b=eUDrYTWLJghlIU
	PpqmNa3/ftsOspnpc/OEyNqytcmRmP5BtJ3x7FmgtCsGWfHtMsrnpBkAHkRK/Adg0SIUwxKdsUcmQ
	xheWjJbpVVDjDZUExpovnYvfXbE7H4b5Y8jpxPmQb+3kaT85qGtiexEa1fl36wKfV5K2hdREBZrut
	+vXuz704tIaFR7F4vqY6TDlaZPyJVRXR7SFsB3AjjKXxQ83wnXzVtsSzSyaT6QkyWYhN3xNUZ5RPY
	VPCud7UFdbOcM+gXge+FQKCRjzfzLKi+oZBaeaRMOP36bmOT/AUMmWQm/xCK1zT3fQkUnHvct99kP
	8MX0DmEt5YMnz+03eNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul1iW-00000005TD9-3Rkv;
	Sun, 10 Aug 2025 08:47:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul1iT-00000005TB7-3eH3
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 033E0A5289D;
	Sun, 10 Aug 2025 08:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CF8C4CEEB;
	Sun, 10 Aug 2025 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754815657;
	bh=q8SgtBm3Um6/IA3ICdzyzAhRe18cnxg4v20POkcefXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtooPbxvpMTQCvH7Y/f3jq8mtZ+j/O3aDgP+3ZDwN0u32EsCmn8yc0AKE1k/H2Z1k
	 PQcymiASqiWiA16/vCx1gQQcg7YHewbgB1Wc/5K7oo75w46ZkF91d1ycyvskavJO3D
	 tTpZsbR+PitArv7r2tRUUUeejD0YwLa6Fn1dABbPofZOU+eDQdZQoCUATiN+hpG58A
	 0xvnOYtqG67M2OJnB5cZipmABNVmRvYs5TIUnVYKQR+fkIAQjUtb7DtnWFi4aymBzu
	 Iuy8JCz+4B0EdnQsu2lU/uW4tHrpSpqnCISu7mnnhxzEGd2p7NGr1cq7nEuvnDpShT
	 eax2bwRzxDaDQ==
Date: Sun, 10 Aug 2025 10:47:32 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <20250810-tortur-gerammt-8d9ffd00da19@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_014745_975936_815BD95D 
X-CRM114-Status: GOOD (  19.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> This is a cleaned-up implementation of moving the i_crypt_info and
> i_verity_info pointers out of 'struct inode' and into the fs-specific
> part of the inode, as proposed previously by Christian at
> https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> 
> The high-level concept is still the same: fs/crypto/ and fs/verity/
> locate the pointer by adding an offset to the address of struct inode.
> The offset is retrieved from fscrypt_operations or fsverity_operations.
> 
> I've cleaned up a lot of the details, including:
> - Grouped changes into patches differently
> - Rewrote commit messages and comments to be clearer
> - Adjusted code formatting to be consistent with existing code
> - Removed unneeded #ifdefs
> - Improved choice and location of VFS_WARN_ON_ONCE() statements
> - Added missing kerneldoc for ubifs_inode::i_crypt_info
> - Moved field initialization to init_once functions when they exist
> - Improved ceph offset calculation and removed unneeded static_asserts
> - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
>   no longer think it's actually correct there.
> - verity_data_blocks() now keeps doing a raw dereference
> - Dropped fscrypt_set_inode_info() 
> - Renamed some functions
> - Do offset calculation using int, so we don't rely on unsigned overflow
> - And more.
> 
> For v4 and earlier, see
> https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> 
> I'd like to take this series through the fscrypt tree for 6.18.
> (fsverity normally has a separate tree, but by choosing just one tree
> for this, we'll avoid conflicts in some places.)

Woh woh. First, I had a cleaned up version ready for v6.18 so if you
plan on taking over someone's series and resend then maybe ask the
author first whether that's ok or not. I haven't seen you do that. You
just caused duplicated work for no reason.

And second general infrastructure changes that touch multiple fses and
generic fs infrastructure I very much want to go through VFS trees.
We'll simply use a shared tree.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
