Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479E606A330
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t1l2I1Ek;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S3A4M8PG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wY47y2l1fR4gf2r9E9NfyEOdag3mlDtIuLzNYxuOFAk=; b=t1l2I1EkPEvar6NAkw8sowuVL3
	fIIr8O9pYbdtZu4YsFczT3Sp9u79quRf6jo1hbE1wSwnI0z5MmpKso6PL4fOSapxvaeqQRLVF1uJY
	dTU0FkfBrIMgo3mxmHUeXruBIW12IrS22Yj9eOY/R6+2HX9RUkXfMILFt448lsGGSjXSpnMqv902q
	XZ8HYfKkVoyIL023V2cP/UBn3u9r2GW7OegBsSZITkZD6oDrwQ5cOC9/cZ6RG2waq0v8Gfxjup2rE
	8n53ICBqHAaccjWKeDTFUihQWmrsJ1HGYWCvGcFTqpurdClXTQ6CnSgJ+NiiBzzm8fLBgjE2t4qzE
	Nbgw7Mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4lS-00000006D3T-30jo;
	Wed, 11 Nov 2026 09:37:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4lR-00000006D3C-12MC
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 09:37:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D8BF608FB;
	Wed, 11 Nov 2026 09:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D071F00A05;
	Wed, 11 Nov 2026 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389828;
	bh=V3OCk+N8SB0awCd36HtzgSzqG30/oaImEUc9AZVKUng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S3A4M8PGrXZZOjpczvfRgaHWV379jGtDI+QSGgXmCBtKj/ifTm4o2c/Ak/jI1r70F
	 2G46uDCdpQPL2kqtHqHS5rV/1XDUQoXAxQT2YrsX0fEoyBXHynKrsDXD6F4ZFfE9Iv
	 rg9rJLzMKxS14WpcNgCywWHctZHbfmICCX40LkQshwDheWrF1im1dw2Juu+6OxXvsI
	 QR+QoVJrLogbfPB2tmdB2QXkbfq6pDu14YuQu21BrehPbP86A/CS6YUpMGnawv5j+g
	 vvsgo74iOZRxBtosfh27sXCrUErO6RMDC9/L5pG6pwW800na+FQoE9k4Xsp5ln0jFn
	 2jqesqNPs4+vQ==
Date: Wed, 11 Nov 2026 10:37:02 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 28/34] ubifs: don't set SB_RDONLY after errors
Message-ID: <20261111-perfekt-dekaden-bildband-0e31f4bd1858@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-28-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191247@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191247@kernel.org>
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

On Fri, Oct 30, 2026 at 04:10:12PM +0000, sashiko-bot@kernel.org wrote:
> Should ubifs_ro_mode() call sb_set_emergency_ro(c->vfs_sb) unconditionally?

Yes, the background thread doesn't hold s_umount. I'll do that.

> Does allowing ubifs_remount_ro() to run after c->ro_error is set cause a NULL
> pointer dereference on c->write_reserve_buf or trigger assertions in
> reserve_space() and ubifs_wbuf_sync_nolock()?

ubifs_remount_ro() won't sync the write-buffers or write the master node
after an error anymore and ubifs_sync_fs() fails early. See my other reply.

> Now that ubifs_reconfigure() no longer returns -EROFS on a read-only remount
> when c->ro_error is set, should the assertion at the end of
> ubifs_reconfigure() also be guarded by !c->ro_error, similar to
> ubifs_put_super()?

Yes.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
