Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9A606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ihjA6H+D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLtQoeAY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LXDegZwv8TZMuJBRxvCWVfysBdMis7B+kEAicWdaoRI=; b=ihjA6H+D1Gn1yl9WNaMDYo1yC3
	Lzy6c9MmCrQE+q+deVKLdft/GbOunPfO3gA+s3cdYIe7gvJnkeVfBAc8Gu8YO6hulIBVNuS8iWSck
	oE1COPAv4HpkFl3sgduGJCpgQl7XaYn8bLRcnkvS1gLDO5yBZQ8q188gfQHvdgFTtGVrspHmkdsBZ
	0DHbeL/hlcEWjbl26gS02qroH0IyesEq7eePLPlUYM3+11LXppx7417AqyFG8Fzvan8CEt0by24ua
	Rt2hXR0Mc7aXbsVbqk6GahsvWu03Ku3GLNYNhQR3mbNwqVrtKtD/T40Zc34OEIpjoPkyrMR7ZkSm9
	KK75TLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ib-00000006CUO-24Q8;
	Wed, 11 Nov 2026 09:34:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ia-00000006CU9-2P64
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 09:34:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9F9D633C5;
	Wed, 11 Nov 2026 09:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719321F00A05;
	Wed, 11 Nov 2026 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389651;
	bh=UxQLDsrm5Bn3FiXuPcGFrFZIY4Qgd1CNPnHPoQGzQhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GLtQoeAY0mrnAY0bSjsRnGSvaNs+ez+7FDZJNG8Mtcj65toWfTW8PMB5aiEVszULa
	 KoCE9F9mivUgLpHq3UdX5jpwfh65n3G71JcnKQ0V/nXpe+ynzHzRT9H4XVJ6t4iRBD
	 b+q+n3vga6wqq6ZvC4QYq4PdA1v6i7ki/pYBnygnNDBLj/b4MpLRA2e6a2H3Guzi4A
	 Zg8knxWD3iXKhgGMpp6YRUS+wGEdQwKLTPwRTz+hw3HzAzdM2Q8c27wWucohtcbkYw
	 ijQS9GoePWL7z4nmn7h4xTd/MYb4YUoWbPDpdrEcJu03uNN3wZdh8VzFLtVBFv71Mo
	 53OC38J7SEyDQ==
Date: Wed, 11 Nov 2026 10:34:05 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 16/34] hpfs: don't set SB_RDONLY after filesystem
 errors
Message-ID: <20261111-verpennen-eigne-ortstarif-e47e3521ab76@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-16-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191235@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191235@kernel.org>
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

On Fri, Oct 30, 2026 at 04:10:01PM +0000, sashiko-bot@kernel.org wrote:
> Does this allow a read-write remount or reconfigure after an error to
> succeed and synchronously write the spare block at sector 17 via
> mark_dirty()?

That writes the same dirty bit that hpfs_error() already wrote when the
error happened. Before this patch the same remount ran mark_dirty() as
well and made the filesystem writable again on top.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
