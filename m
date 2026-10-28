Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B09B606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OUguiaDH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZG0L0aDj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=briz3uglq5o4xxAYsNscdaLExWZztTTihasYZd55bvI=; b=OUguiaDHchHbgAueujy1JFut2Q
	kqGph2sK0DApsCtWIkXTGHRvBCtFya3XJJOb6ZXH0xfTOXCUCCzyQ06eA19THEox33XPGqlJ+vUnQ
	h4Z3bZEMOozVap6/nIQHeR++0KKGWepkElbT0FVJq8ktxg3eXIOdfXviIBsful+ZeRy1Zhyottis2
	Xay0Is39o4lY7ISymwiiiUuoLYOCmt6aV17Kc9rOhDLLOeXuMCXxylI2Gq+9uORs0LWol/HK/GhIY
	3OleBP+c6syNNV8yyjr3qrt0u8IamRxSrX3NVdiVX6dy5h4t72JULgN1K50xtbTDv/9Qxsguqlbjw
	1+iQDRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM66m-00000007U08-1xtC;
	Wed, 28 Oct 2026 16:02:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM66l-00000007U00-1oUc
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 16:02:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB8D943C3A;
	Wed, 28 Oct 2026 16:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46E81F01828;
	Wed, 28 Oct 2026 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793203354;
	bh=pqvidO18/MsoqEupSyt5zaIZm2NWShVR3YPJxgjMIMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZG0L0aDjqTsgzLztgQj3GHplRgcp3JC3WsGZx/YxNehTd57FmefkseXr4Ci+4rVVw
	 zsXoUG77/qVXIA2DpIi2sH2fHwl0axkhR82Tjx9aQoC7Sw4R9qUujs/7L2qGiiyxQv
	 PNpbPrkUbijZwlr47dpkhLJ1a+VXN/J5c5ub85J3WNeW3H3YLxnJ6AENufO/RZu6Ya
	 JpHCSjA8ZNcK6EQ4M9Yem1gPVU7Mm8F8EsMtwmSU7iQFut12ngDTz77ZcX2DeEmXuM
	 DTQlwFe9KPqXNTo3ZYRHY5f02yibn5HXVRh1DwdEbuXTEKLho1gpQlejTX87U/GRT9
	 4dpxOZTZfBbdQ==
From: Christian Brauner <brauner@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	ecryptfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	ocfs2-devel@lists.linux.dev,
	linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH RFC 21/28] gfs2: don't set SB_RDONLY on withdraw
Date: Wed, 28 Oct 2026 17:01:49 +0100
Message-ID: <20261028-zurschaustellen-okkupieren-inkompatibel-d11525ce88b8@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHc6FU6z4kX5R3Og8m0dYOHsjFcw+4Btvfe87AGPxy_EWs0E7A@mail.gmail.com>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org> <20261012-work-fs-sb_rdonly-v1-21-60743a3dc326@kernel.org> <CAHc6FU6z4kX5R3Og8m0dYOHsjFcw+4Btvfe87AGPxy_EWs0E7A@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=brauner@kernel.org; h=from:subject:message-id; bh=/2bL9FoOj20KqA4rEtCDZi7CA8CHUBzAXKXFts8ojnQ=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ksmL8GiJ4XnsbsM5a7aM7ZHXDo+ubXVQend6xo3Dq c6XHseWd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzk10SGf8Zp6etfiUn5Kaa4 zdp+ONFrN+eR4/7Xl/x14Hr2cnIIdxQjw5rNYWumRtzN/zyzJWbl3ZUT/BYEPb13q6vr0/3MC10 NDQwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 02:01:00AM +0200, Andreas Gruenbacher wrote:
> According to commit d564053f0746 ("GFS2: Clean up freeze code"), the
> idea of the freeze sysfs file was to make it behave like the FIFREEZE
> / FITHAW ioctls. This isn't what the code is doing at all.

That's a pre-existing and separate from this series. freeze_store() calls
freeze_super() and thaw_super() directly with FREEZE_HOLDER_USERSPACE and never
goes through gfs2_freeze_super() and gfs2_thaw_super(). So it never takes the
freeze glock. I don't think that's for this series to fix.

> Not sure what should prevent us from fixing withdrawn filesystem
> thawing and the SB_RDONLY issue in separate commits. Both need fixing
> in the end, but that's okay.

I guess.

> So before this patch, 'mount -o remount,rw' of a withdrawn filesystem
> fails with -EIO, and this patch changes it to -EROFS. What's wrong
> with -EIO? Once do_withdraw() doesn't set SB_RDONLY anymore, the
> filesystem will remain read-write mounted; getting an -EROFS error in
> that state seems odd.

You can keep -EIO but I tried to make it somewhat consistent.

> > +       /* A withdrawn filesystem can't take the freeze glock anymore. */
> > +       if (gfs2_withdrawn(sdp)) {
> > +               mutex_unlock(&sdp->sd_freeze_mutex);
> > +               return -EIO;
> > +       }
>
> This is racy; the filesystem can still be withdrawn after this
> gfs2_withdrawn() check. It should make more sense to bail out of the
> for loop in gfs2_freeze_super() on withdrawn filesystems.

Right, good catch.

> I'm not a fan of those fake mount options. It doesn't matter all that
> much for "withdrawn" because remounting will fail anyway, but it's
> still messy.

Sure.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
