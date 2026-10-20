Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522DC606A333
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2026 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nzyqu6YP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j+nClr50
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52BbwQzdXTNVMI3CX5Nm84RD+ipu0y1qALCOYbNXdas=; b=Nzyqu6YPMeeiGD
	1U+pmjBZ3Wq1UZ3BDX+UP4xgqnELLxXLlZ9MxReQYs475+EdqSzMFpkneacmdXpAmTHdbdQQK6rLc
	ETCs9yyRED4Os6eyCeIkyvvEm0H5VPiKIMjvJiex7/NyY8S7AzvqE+2ZySfWHrqmYpCKgoPLjNWXE
	mEv0jom7D8IXPdDFUhwDicM8lm/wZD4lGpufTVfooTNrP3dh0uTToSRXRWOzDtOfHys6Myx66Dgoi
	sPBaLhMwIFVPjzu3uBjb+9e28XkpDyVnCtDDQe50tbu4QxQBNDyimI7SPvZ5s3Y+upavX0tBydywS
	/mHaKSnFoZmDChNWrMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBDx-0000000A021-01P3;
	Tue, 20 Oct 2026 14:53:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBDv-0000000A01i-3p2S
	for linux-mtd@lists.infradead.org;
	Tue, 20 Oct 2026 14:53:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 520734065F;
	Tue, 20 Oct 2026 14:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC0B1F000C4;
	Tue, 20 Oct 2026 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792508035;
	bh=/bwYNsuvdLOeGIvvyV7lXuTJEpgdy2xoAlb1KPVe2eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j+nClr509Ip2YmEn7/caQLmG/4tBtyXZnslPC9cLou/c2WF5cUyD8vV0z4nB9Tev2
	 plhyZAe/DFKunvOqX8v/oXRElPiP3zxk2HziYyB5Fx7bPGt0t29G9UDf+1rfbuTFys
	 26EzMGskCjKKCcH4vAuqOv+1PYrBjiQnY9DVI9Dr4fSEZ8yAk0LnKIRmk7JwU0k+tW
	 rl99vZagqlR6jXNFfVasyDMk1PxV7oE6nRO/s1kciIZkWvnPgB1U5HfkO6NzVlXd9L
	 pR5YKf1B76wv3ukXrumON6Rbv57+rbThp5bo1tebJ6WrsH6Sye8PXipcbNZHIwrAzz
	 YGHmJPYOdgplw==
Date: Tue, 20 Oct 2026 16:53:45 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 20/28] gfs2: wait for a pending withdraw before
 remounting read-only
Message-ID: <20261020-steinbock-sprachen-charmant-e4fd6d840395@brauner>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-20-60743a3dc326@kernel.org>
 <CAHc6FU5bdAjABRm=bnH68b2f66TZTDZ8sPdatLB2fS7-55U=yw@mail.gmail.com>
 <20261018-ungemacht-sodbrennen-hausordnung-42d33a4f7098@brauner>
 <wauqpgtmmf2beg3pc2kqlbizrigd4ew26do4zqch5ilwdjy4cd@brolwbx25sem>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wauqpgtmmf2beg3pc2kqlbizrigd4ew26do4zqch5ilwdjy4cd@brolwbx25sem>
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:52:25AM +0200, Jan Kara wrote:
> On Sun 18-10-26 17:48:34, Christian Brauner wrote:
> ...
> > On Fri, Oct 16, 2026 at 02:32:01AM +0200, Andreas Gruenbacher wrote:
> > > > diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> > > > index 83b8bb6446e5..1535ce2b7aa8 100644
> > > > --- a/fs/gfs2/util.c
> > > > +++ b/fs/gfs2/util.c
> > > > @@ -122,7 +122,7 @@ static void do_withdraw(struct gfs2_sbd *sdp)
> > > >                 up_write(&sdp->sd_log_flush_lock);
> > > >                 return;
> > > >         }
> > > > -       clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> > > > +       clear_and_wake_up_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> > > >         gfs2_ail_drain(sdp); /* frees all transactions */
> > > >         up_write(&sdp->sd_log_flush_lock);
> > > >
> > > >
> > > > --
> > > > 2.53.0
> > > >
> > > 
> > > this looks good all around, thank you very much. Can I add it to my gfs2 queue?
> > 
> > I was planning to just provide a stable branch for everyone to pull post
> > -rc1. Then you can just pull that in?
> 
> On a related topic: I didn't find any branch with this work in vfs.git - I
> wanted to check how all the things come together after adding the generic
> emergency RO bit. So if you can push some inofficial branch for now it
> would help me... Thanks!

Absolutely:

vfs-7.5.super.ro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
