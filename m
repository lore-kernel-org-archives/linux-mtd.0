Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5672B606A33C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UHRxojsR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=acw6ROyl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UEyvhxLVDarE6VTOWrnaiukCMkX07IoLL/HEVeMXeHc=; b=UHRxojsRBwt2ehnHFMBGjuLlMy
	SSvrO4LP+9LBgdwuBxF4DQxisL3qx/ibSpAwKxLgs3exuU1Z3EDjy8PIv2hxT/6zWfwEKQK5YC6Pk
	9e2HXyb+qzKqg5V84v9rsRG8CsiKQHdl6L/x6SfSxuwZWnAAmcAtLCa99sjzcXtOKmE/b2qd8+cPh
	M9aIk0WMztDrw3MDbSCbUcJV1Ok5vj0B9j5cLhtiDIWw/sueX3mOtKfInJJyIyj+tUByImUD2QpoD
	yDEGygVPQDLlf5iR8ewVRgMN+H0w8ZE7sBLk8TE97YXwqmAbKWyNTID3NG7gWEH7Ievi5iJ/s+6S6
	0ROMkThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtlR-000000055b1-3HwY;
	Tue, 10 Nov 2026 21:52:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtlQ-000000055av-48B5
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:52:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA1BB44F19;
	Tue, 10 Nov 2026 21:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF171F0089F;
	Tue, 10 Nov 2026 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347544;
	bh=NG5N/qv9kqIWaHQubYWcMp3ybQzZkmkmYbSR6qxrMo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=acw6ROylAoj6eTCgQIZH1HF5HgE5P5i985FgFa/sQiOMubXxw/4hpDuAimeoYHbKS
	 0SA7cNzKIUClpR0boV9m6svRkVNWvTapQsEiZPpLQHWIu8PhcvqBqPX9y4UUlZ2KY/
	 5fwYfFdUXyOFfzFfZY38g+/FK3zGeFYWShaCqv09SrX3g48zWo0/Idrv0VFBg41AxO
	 WoebTuoM7ofgzaxUvwBHUAS3R/uMOhy/D8K88+u2/Ll+1y/YvTKQAeAJSY4m5TCMYt
	 ONPv2sRQBHG3ZpoZpNmdTMDQx4GhCZL9ou3GR4YFh4AcRI3UVK+GX6nRvFAQH/csHa
	 xf2OIXvo4ErlQ==
Date: Tue, 10 Nov 2026 22:52:18 +0100
From: Christian Brauner <brauner@kernel.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>, linux-fsdevel@vger.kernel.org, 
	Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 19/34] ocfs2: keep the current mount options on remount
Message-ID: <20261110-zerfallen-meiden-wacholderbeere-a90ac157e063@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-19-2f44f64f0b66@kernel.org>
 <0a8576a4-e397-4a49-ab0e-8f0f32bf2642@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a8576a4-e397-4a49-ab0e-8f0f32bf2642@linux.alibaba.com>
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

On Fri, Oct 30, 2026 at 10:58:52AM +0800, Joseph Qi wrote:
> ocfs2_reconfigure() decides the transition from fc->sb_flags alone without
> sb_flags_mask test, unlike reconfigure_super(). And fspick() passes
> fs_context_for_reconfigure(target.dentry, 0, 0). So on a read-only mount:

> So it seems we should test sb_flags_mask as well?

No, that's a generic bug. I fixed that in reconfigure_super() with
"super: keep the read-only state if a reconfiguration doesn't change it".
That is in vfs-7.5.super (cf. [1]). This series depends on that work.

If SB_RDONLY isn't in sb_flags_mask it fills in the current read-only
state. So ocfs2_reconfigure() sees SB_RDONLY and stays read-only. ocfs2
is one of the 23 filesystems listed there that only look at
fc->sb_flags.

> The same falls out of a legacy remount whose flags omit MS_RDONLY.

No, do_remount() always passes MS_RMT_MASK which includes MS_RDONLY. A
remount without MS_RDONLY asks for read-write.

Thanks for the review!

[1]: https://lore.kernel.org/r/20261011-work-super-fixes-core-v1-11-c727176c5b53@kernel.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
