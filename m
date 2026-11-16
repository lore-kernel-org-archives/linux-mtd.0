Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A6606A323
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NMFZnida;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITfVd9wI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kUfJQOJLlk9azd3OSLjDX5Xv7zvg1dDgg9AJOXvnDWA=; b=NMFZnida1/CIGxSoRkRXApdpdI
	LBPiy1QCB42A3GQtBmXeNlj+LB3b3lacZvgsmHzf/mxXZ4OLKfujeOLrv0VNUjS9JTUlbcEgZ+5MT
	GigGeimhyd8AW1gBcIwfxPuj1UJhdBHad4eiiKk7g4wrl4ad2yJsOZpvZA9/Fpzs7scO+Jx2+BClW
	cWpzB3w3cw3Z6CiDTH2vpJGnR82GHLiIxGRK77RCNJ+fAITtwghPdzRRA2iILUeiFk5Oz70voH0cw
	Jh9K3Y4Z+M+iOFgIeLa0tB3SEclZHrUlyTEiTQ+0m2T1EPD4veb1RDJ+Z3eDHWDe/042bdjgQ5iQA
	ROhuxLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStPT-00000001qmp-0JzM;
	Mon, 16 Nov 2026 09:53:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStPR-00000001qmg-2uwM
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 09:53:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FBB3403A0;
	Mon, 16 Nov 2026 09:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755391F000C4;
	Mon, 16 Nov 2026 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822837;
	bh=ZJJAwrYiVuc03fJzpQ6JP1zmHcGVR+cvTb2BYqmzziU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ITfVd9wIQ+nAJl70v53f42aDy/XLw55ZzF4oM5tblfEkuK2iHhD8qpLtJZT0c0P+n
	 HTtvLYBRLgESb81dQJ9PMlL8Si8rguYAg3MfEHU2CYldhRS9twbkP4WgHCBwgFXQT7
	 b78SqT79oeCU7aHqQl3icLQCvN74FKTQYOIdftgBB/Pp9sTlail+VAzkjVRGlSgVUB
	 wx6NDyYG0eJRW9+VWuvkpQkOs6ju3VgVddH1fqrpvs7U8MQOKu6shGaFMeZPkgQmZS
	 O/Y6znUt0e5V4BVxF51ykZt+7guJX6IM2GRfuJSgYd1WbVXBzS0acGGTp0MhvwaUCn
	 TYQGj8hI8awFA==
Date: Mon, 16 Nov 2026 10:53:49 +0100
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	stable@vger.kernel.org, Farhad Alemi <farhad.alemi@berkeley.edu>, 
	Tyler Hicks <code@tyhicks.com>, Jan Kara <jack@suse.cz>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 00/33] fs: don't set SB_RDONLY after filesystem errors
Message-ID: <20261116-kiesel-exekutive-liedchen-26b1c45fe533@brauner>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
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

This is now on vfs-7.5.super. There's a bunch of outstanding
pre-existing fixes per-filesystems. So please, if you're a filesystem
maintainer take a look.

I will declare this series ready, otherwise this will turn from the yak
shaving that this is right now into yak-herd shaving.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
