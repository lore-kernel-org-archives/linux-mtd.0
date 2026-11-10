Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C187B606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gwn5SWb3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k07W8ph5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K7igYKl6B1f32H6PwnaiI51xJucTf6qSvXeNjue0oPU=; b=Gwn5SWb334swldhqj7/a4dkfHv
	RZqLEq9Yqn6vflc7DEz5H9qX3z9ROzsgRwKVUZ+XGtOTNYPhu6QfT7D8ktV+4d6LmCuMwXyPKrdI6
	pUDZypTTesXaxb9IrHahqUCyPhVSCJwbQEv1NDJAnQHcNlYnB8Bmg+ks4TalwoGO2rrDxgDemu3mW
	Is5jfOlZcVtPn6csd1nk5jFluhiwWa25cvmX15Rzt8ZgakZOJnLSMGQv8+v/10/760y6wDB1ueK8b
	E+EH3KEXl2KejYzQ1c6ohyOovcIJmy28JU68nUEzoiIU0evDsq8gkpr5Q1H7AaJvd8c5TqTTxTqtZ
	kmsNumYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtsX-0000000571B-1B2E;
	Tue, 10 Nov 2026 21:59:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtsW-00000005710-102u
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:59:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9612455F7;
	Tue, 10 Nov 2026 21:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB3E1F0089F;
	Tue, 10 Nov 2026 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347983;
	bh=sSI5fSzHXT6l17Dh1aqL0HL8Ya/c/u8QoksVrlo85Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k07W8ph5jDucWyYd1JAfrEw4i6xY04o8KKCSMcakegRQzZa6WBYF/iiSupP9LnPJ6
	 PqRhHexhugKYQxif88bLv/RmfKXZebt0jM/KU0AoU7X/Rvq61mdIO9FJhp2BYx92kS
	 p4IfKEBA/29+u3ojBvJItjPeNy1gDzVaKYKHNh0QJMp0FcqnToCGYHvHu+0j4vs2lh
	 6l9GcvDZOpU9QKqBiCWntZiVc7lisJ/D0GY22YgK9BHJp/qwHkFYO1cN5SLvdma2T0
	 YcK1DObxEoQMnj0ObSoLKNC4Sggkxu1v2pCbXzPTs5E5lpGJXBDIfiFdtYdZPgCyQ8
	 L6MbrOl5ir66Q==
Date: Tue, 10 Nov 2026 22:59:38 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 07/34] fat: don't set SB_RDONLY after filesystem errors
Message-ID: <20261110-zehen-rammen-unabdingbar-81907ca99042@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-7-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191226@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191226@kernel.org>
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

On Fri, Oct 30, 2026 at 04:09:53PM +0000, sashiko-bot@kernel.org wrote:
> However, the dirty directory and FAT buffer_heads in sb->s_bdev are still
> written out by bdev writeback, mmb_sync() in fat_evict_inode(), and
> sync_blockdev() on unmount. Wouldn't that flush the deleted old directory
> entry along with a new directory entry containing start = 0 and size = 0,
> losing the file or directory contents and orphaning its cluster chain?

Right. I'll drop that check.

-- 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
