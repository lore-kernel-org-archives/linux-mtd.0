Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49A606A332
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XjYwHko6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaD/EfjD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lOZuvHVdljQfaEvw5UH+MyrI/32FwKn5uNd6zkYvaHw=; b=XjYwHko61Gc5cyVvF0WFJS5ufL
	CO2Gs4Gg7O4JQXPlpQy+zLK5iUpLlwmAx24c1/QJVisljXx0ovQJh+OMR+ba1jnq748EvyZajXpwA
	JL0VnBvyKU+q6/80dmFvqxjWBXNiWpTv1BAWVg+k2dfN6l38eODfWYd2of1fEnhTD9mUwgrMtG5rJ
	VlyJ0yWoJZ952+Q1hAxNysPxvDbppBu/HzKqTrP37+svTpK8EchMW/Aul4ZHOcupXESpB5OucJLmh
	FQQwFMLDZViDJzbIpBSflaQZqRjXkTZUlP53XfLgmpyObbVWjXUSWyRyTXEJpFw9Fc3dQP7JmdbpZ
	RIjcPlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtnG-000000055fS-0d52;
	Tue, 10 Nov 2026 21:54:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtnE-000000055fL-1ZYz
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:54:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F30D405A0;
	Tue, 10 Nov 2026 21:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1531F0089F;
	Tue, 10 Nov 2026 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347655;
	bh=kvR+7LpUq2XDou+hL2YOto2Xs7eBH6ZEazzzuluspMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eaD/EfjDchFyH1dENQH1aadvOuz1bw9jbkiQnmwV7pFQSv0SPcCuHPSy3cg1AgrZf
	 u3NXwYhS+orvWDPCpPXaZyNSS+GoUOox6PG5uSdjRvqr3AzMoDafKsT4tR++Y52zyq
	 O4s6HPV/ywyAlQatnavFQ0pBIjmeaDW+xUB5+IzysLQjiA6eAAw0QEBP/TtTETgLFl
	 inp8RjcCw8Shmo9xA+CQnGybqXHfRUFl8MavInvwFF2mGgTJTmUjNtLd4cxgdb5YmJ
	 zo9nAVwddgdwCbsFwqFgDPymJKL5pmccIM+9BnPTJunzaUztEcw+2CGbHe8zKjhAGe
	 JD2NE+KXutgNA==
Date: Tue, 10 Nov 2026 22:54:09 +0100
From: Christian Brauner <brauner@kernel.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-fsdevel@vger.kernel.org, 
	Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 28/34] ubifs: don't set SB_RDONLY after errors
Message-ID: <20261110-erfanden-dossier-zahntechnik-efcb7a6439b0@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-28-2f44f64f0b66@kernel.org>
 <0d472865-6cbb-cbb5-b361-1f2bf71dd528@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d472865-6cbb-cbb5-b361-1f2bf71dd528@huawei.com>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:42:15AM +0800, Zhihao Cheng wrote:
> If we remove the c->ro_error check, ubifs_remount_ro->ubifs_wbuf_sync
> will return EROFS and trigger ubifs_ro_mode() again, I think we can
> retain the pre-check placement to trigger more error printing.

ubifs_ro_mode() doesn't do anything once c->ro_error is set so that
won't print anything again. But there's no point in syncing the
write-buffers and writing the master node after an error.

So I'll skip both in ubifs_remount_ro() when c->ro_error is set like
ubifs_put_super() does and only cancel the write-buffer timers. The
remount to read-only itself has to keep working because the error
doesn't set SB_RDONLY anymore.

> BTW, a remount to read-write after an error is refused too.

Only if c->ro_mount is set. ubifs_ro_mode() sets SB_RDONLY but never
c->ro_mount. So after an error on a read-write mount ubifs_reconfigure()
takes neither branch and reconfigure_super() clears SB_RDONLY again.

> The sb_rdonly won't affect the sync_fs_one_sb() after an error, and
> sb_emergency_ro check in not added into sync_fs_one_sb, should we add
> the c->ro_error check in ubifs_sync_fs() to prevent the failure
> ubifs_wbuf_sync executing?

Yes, I'll return -EROFS from ubifs_sync_fs() when c->ro_error is set.
After the !wait check so sync_filesystem() still gets to sync_inodes_sb().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
