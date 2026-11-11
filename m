Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16704606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UJ5fsEp1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OdtnVYVc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ynZHz5P2ywcZ3eLt+8E0w82xiFJY8c506rheir4Etlw=; b=UJ5fsEp1hmPb7zQrLk9i5NFZn+
	jzTDClTa/jsZAz30xdoU7+BwtIRqX4bkQMJWDgC/G3XVei3PPRXen6H45McF5MVLZPzUnMI7aqW5B
	9sBZQoFh3Q8TDtAcukjbdHD/Zf0dyv4Nwma7EYcLSKRk/SlisLNEQS8MK9RGoTUa0L9LPn3CFY9Us
	2cifNyKSn860ngvB4G3dpElKD7xDgW41IAoC/PlZHr3Sf+xjPfhxRtx1nxhuowvYGhGg134Xfp9Cg
	T0eh09uMjBPwEcwdOj6Xh1gG/PD4rNBy6yuXYumu+3IUWivIU2eIG/B1KbECwbhPvydtWkksfZgvi
	skqR2goQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4jF-00000006Cd5-2dnX;
	Wed, 11 Nov 2026 09:34:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4jE-00000006Ccl-0Y9R
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 09:34:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8E3433D1;
	Wed, 11 Nov 2026 09:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CCD1F00A05;
	Wed, 11 Nov 2026 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389691;
	bh=9oT8mJ+Ro9B5pT3ilEOpm07E7nXRbdqUWub1X6gjjq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OdtnVYVcsG19f5hTkpS9kaTbzYuiT4HMccwgMwUjVwnIpesQBW34vpb3Soyr4kOrP
	 hOWU9u/FdRtMey9V9HCAE456IT8ckxwm57A+Ly6VYYZWBpzFU181QmxIL4ZKaQBkuv
	 R4IW4Vu3xTtqaWY7OChZuL0TLDuaiwTiXF6Sh1i/iIOBQY4YZqWcOBld9mgeDtepGg
	 xhpH4Hal/ORXF7Ws8rDRjza2UZ1LZnHqJFb3QJhbDQIkq2cHWiFFEkTUDv9nHA3f8I
	 KC2GcTd5PWGGo5PuIK0Rr7OdS0N/e91AdadUEU857idCihrAQD4FlV8x8zGu2F2D2e
	 mjn9fyjTG/YWQ==
Date: Wed, 11 Nov 2026 10:34:46 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 17/34] ntfs: don't set SB_RDONLY after filesystem
 errors
Message-ID: <20261111-weinreben-einlieferung-sequenz-e817949ea18c@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-17-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191236@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191236@kernel.org>
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

On Fri, Oct 30, 2026 at 04:10:02PM +0000, sashiko-bot@kernel.org wrote:
> Should ntfs_trim_prealloc() (called from ntfs_file_release() and
> ntfs_stream_file_release()) also check ntfs_emergency_state(vol) before
> rolling back preallocated blocks?

It only drops trailing holes from the runlist so no clusters are freed.
And __ntfs_write_inode(), ntfs_mft_writepages() and
ntfs_mft_record_free() refuse in that state so nothing reaches the disk.

> Does ntfs_drop_big_inode() need the same !ntfs_emergency_state(ni->vol) guard
> when truncating unlinked inodes with I_SYNC set?

Yes, ntfs_evict_big_inode() already leaves unlinked inodes alone in that
state. We'll probably just do the same.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
