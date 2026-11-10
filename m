Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E51606D4DA
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iVkLMfEq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OT1LM/Xd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mOfxsMaEYU3njkyefLDuX9GDTbRvHrtDUcZP6RcrtsQ=; b=iVkLMfEqsE74EdoAxFZfM7ovSE
	SaANbVl1CMUlTCcgCrnbNg/YufmXX9jrg20b2q6r69ec+VtmvxGCWBvMXvDJwStGBGnvroNRQEldS
	ic+3wrWLIAKaQa3zzhMbFn5JC439w31LYJV6uOzYBgl0xeXMz6mKgntFovfBnTt7iz1GicxlhyYrI
	PffiFl8UvVKeUEonXuc8k5POxfA1jEXcjAHYst7wW6v1tadGIblkho5NX3LiNkfQBnKgu8p6xEG9f
	+f/U5oyQGUPGdjFqB4cAaN2rUJPK+fj6wP42keHyroWvhCtgQN2fTd9Elj3XySUaK8irwHxgJB8O8
	bQZGXZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtpl-000000056U6-3SrX;
	Tue, 10 Nov 2026 21:56:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtpj-000000056SU-3Bho
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:56:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC23F637F5;
	Tue, 10 Nov 2026 21:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C96A1F008A2;
	Tue, 10 Nov 2026 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347810;
	bh=2ZDErYEQzOGJUjtDBXVtItn62hZcw22wk/hmpMTwW8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OT1LM/XddW8RQD5eAmU8fBGOFbAM8/CnJEQs3885Wa0JF4KqnzpeNdym5//nw/qmO
	 iSIXz2DK4b5upf83EDFMcSmu0R158tcCDKFJPJc+nb5CZdciue++Ti2l4+7JB3cJcZ
	 ofKUHpSYZzgbI/fZlqfADzqczaOi6d9z3Y/zO6lUhjFut4nTY/Mo51uO4It6fBxl4w
	 kteuhsecwTnXgVw0wlXvii87uhXMhUgsuU0E2MSi8RSzt1K2+xoj6E83ckzwcRg4rF
	 Ht/S7BOo0R3XlqC9Z0pGpdIAMmq9jRNZQqamTSsu2Lll7rHCO7Qg9kxjiih6PwTNRR
	 88zmVF8rr0Lbw==
Date: Tue, 10 Nov 2026 22:56:45 +0100
From: Christian Brauner <brauner@kernel.org>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Karl Mehltretter <kmehltretter@gmail.com>, dsterba@suse.cz, 
	tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 06/34] nilfs2: don't set SB_RDONLY after filesystem
 errors
Message-ID: <20261110-deformation-knabe-geltung-3bb7600eaead@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-6-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191225@kernel.org>
 <CAKFNMombDWkJ=m+CjMy7qnd_yy-vZ9c-EE7R95HKKkcy-M0+SQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKFNMombDWkJ=m+CjMy7qnd_yy-vZ9c-EE7R95HKKkcy-M0+SQ@mail.gmail.com>
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

On Wed, Nov 04, 2026 at 02:32:10AM +0900, Ryusuke Konishi wrote:
> Sashiko's point here has a valid aspect.
>
> This inconsistency can be resolved by inserting the following handling
> logic if sb_emergency_ro(s) is true:
>
>        } else if (!ctx->cno) {
>                 if (nilfs_tree_is_busy(s->s_root)) {
>                         if (sb_emergency_ro(s)) {
>                                 if (!(fc->sb_flags & SB_RDONLY)) {
>                                         err = -EROFS;
>                                         goto failed_super;
>                                 } else {
>                                         s->s_flags |= SB_RDONLY;
>                                 }

Meh, I'd not set SB_RDONLY there. Because it changes the read-only state
outside of reconfigure_super() which is precisely what this series gets
rid of.

The superblock can be frozen at that point, e.g., when the error hit
while it was frozen, and then thaw_super() leaves s_writers locked again:

  mount /dev/sda /mnt
  fsfreeze -f /mnt
  <error>                       -> sb_set_emergency_ro()
  mount -o ro /dev/sda /mnt2    -> SB_RDONLY on the frozen superblock
  fsfreeze -u /mnt              -> s_writers stay locked

It also turns the superblock read-only underneath the existing
read-write mount without sb_prepare_remount_readonly().

The busy-tree branch does what get_tree_bdev() does for every other
block device filesystem. A second read-only mount fails with EBUSY and a
second read-write mount gets the superblock and every write fails with
EROFS. That's what ext4 does since commit d3476f3dad4a ("ext4: don't set
SB_RDONLY after filesystem errors").

If we want the second read-only mount to work I think we should do it
for get_tree_bdev() and nilfs2 alike and treat the emergency state as
read-only in the comparison without touching s_flags:

	if ((bool)(fc->sb_flags & SB_RDONLY) !=
	    (sb_rdonly(s) || sb_emergency_ro(s))) {

But I'd do that on top.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
