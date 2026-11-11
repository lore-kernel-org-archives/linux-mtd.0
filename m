Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D80606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c0pcZGvY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3Cb6yMC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JaJj7f59yHgWxLAf/176pBwOIjNvQRz8L9/VClriA4E=; b=c0pcZGvYYq0tD87OI/ZM9F3I8j
	nb2DlDeoUL/bkQ7lOkJf7/ztu2IXruUpSbHKK4DoymWB8DMKlidMtYSFDp0QdUly1iYVy46AI1tSW
	yEX3BECbPNt+DmOeOI+z/colwMQdMyFOMWBm84r/DYcxq91KoHO9jmAUqHL7Xc+Vpm4v1OdBJbrIy
	1/+EXkpDqCBvuGKHm/5f07UfJcPzBdh53YZI7+5kHo4imgczGpO63+9/TZTJ6M5kGgPk2x87RgPLT
	0WAEdyhN8ZT9y4K/JM5Ebt9ZKYWV+q0hBMAIu2lpRGtvgl4Zanv5NjzXckYXbQupdngMAedW7dDT/
	BYstLx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4iG-00000006CQ5-10mH;
	Wed, 11 Nov 2026 09:33:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4iE-00000006CPw-3AVl
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 09:33:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 375D940622;
	Wed, 11 Nov 2026 09:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0931F00A05;
	Wed, 11 Nov 2026 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389630;
	bh=456qmbozWJFCOonDULqMGwfLm3LOz4ouH9mjjl+y80o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3Cb6yMC6Xx+MhtaqnOrnXGh1yx6okkK2jIpzAW4cu5aUYc8j/y7EU8g3NgNu/QuZ
	 h6aRu73Riaov4wJiTnTP4KKCxNNwt/WLi4lQRVlUpwcuYix3GWpv5VbatMMyd2c2ka
	 bsAKOxkUbXnwPs9gnHyNBgbqw2VZSeX+TvxOlIZowTeU16S9ZvRFLN2y2DgCcctYkQ
	 uKpzfty4H61QbRrp+wcGz2FRiFuijKiwVF5IpDCY/ybtNToPzQn0DiqL5TuyPiT2ba
	 ETQN7xaKj7gXRMaAdX02fBSo5rp8cdjm+07TNPZUCfj2UcYTANvSDnd0dwsYA2Fr6z
	 h9XcZ9pa3YQpQ==
Date: Wed, 11 Nov 2026 10:33:43 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Viacheslav Dubeyko <slava@dubeyko.com>, dsterba@suse.cz, 
	tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 11/34] hfs: don't set SB_RDONLY after MDB write errors
Message-ID: <20261111-albern-windhund-lockmittel-21301b1f1729@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-11-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191230@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191230@kernel.org>
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

On Fri, Oct 30, 2026 at 04:09:57PM +0000, sashiko-bot@kernel.org wrote:
> Returning early at the top of hfs_file_truncate() skips the out: label
> adjustments as well, leaving HFS_I(inode)->phys_size,
> HFS_I(inode)->fs_blocks, and the inode byte count inflated past
> inode->i_size.

That's all in-memory state. hfs_write_inode() and hfs_mdb_commit()
refuse after the error. None of it reaches the disk.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
