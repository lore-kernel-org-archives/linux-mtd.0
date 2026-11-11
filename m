Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0D606A335
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T8yyMFW7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gAMQa0RH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oLiz4WgDZyr5Vmctk/hgxVwugwfKpRiHZYRy5Xor+8A=; b=T8yyMFW7frd9C3ROh99J1twulT
	ERp0SslfQVQ3vAzfVWa+OLWMvFRASsjr3kB7+FjbixShSVsIh9EieU/DUpsbA9HbvVy5GafixJA6U
	5wi8RP38JStzDiPhLV5fZuoUIiuoox5wCeCscBM6fmsFjZejtKvJ/SS6mSjgpOMvMVXNLZ031VkIY
	MfQlnurIqa6VsQQPmtIfTtmhCIdMdMIFViC2MnLVf1itS092gqHsbrdTLntr90bCDHUdW8E7YHCFh
	E6axjL0M2iyXzs6vCF5D6EyvInyrVNFNu1CNSFUdXjG8Z5ARjdGlJeMkofKECPmcJJ5pf6gXDo+8O
	CMk4JH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ju-00000006Ck4-3Doq;
	Wed, 11 Nov 2026 09:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4jq-00000006CjY-1wyV
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 09:35:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3FC2633C5;
	Wed, 11 Nov 2026 09:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C1C1F00A05;
	Wed, 11 Nov 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389729;
	bh=0wPrDM3ByIgNRkd8um3+s03MrGcxAel/A496/JlTAcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gAMQa0RHrVEcdCTId5GAxxrGWJDWYg7Xh9YkxitRixioy7tg5wkBQEI9uDd0st8Uh
	 YnLgub2226L347lF9jDxz6rLuPv+BzoRXwpWU0BDi3ju+jCRN2OVUks/c7NHGphhPb
	 yixhl7x1QNHf0c/Lk2q3KpoiDJj3aFjSw/RyQ1fFnXRuUmU7OERWNGYndDndIk28pZ
	 mcUdS46AqNl+Ss3lxn4EkmaINg65asBvoEa4HqvQacm+3kr4vokkQ8k0xi5Y3s3AtZ
	 xSra2BP1eQvakfogTaMApKno9neO8lkjjcSTp8d26FwgVll1KJ2zWA+h/3Hdorto4K
	 Aygw8PaUPL5yQ==
Date: Wed, 11 Nov 2026 10:35:23 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 25/34] gfs2: wait for a pending withdraw before
 remounting read-only
Message-ID: <20261111-dackel-verfechten-eheringe-01ff8d8ee23b@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-25-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191244@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191244@kernel.org>
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

On Fri, Oct 30, 2026 at 04:10:09PM +0000, sashiko-bot@kernel.org wrote:
> If the filesystem is subsequently remounted read-only via
> gfs2_reconfigure() -> gfs2_make_fs_ro(), gfs2_log_flush() bails out early on
> the withdrawn filesystem without clearing SDF_JOURNAL_LIVE, leaving
> wait_on_bit() in gfs2_make_fs_ro() sleeping forever while holding
> sb->s_umount.

Pre-existing. The fix is probably to queue the withdraw from
gfs2_reconfigure() and flush it before gfs2_make_fs_ro().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
