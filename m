Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC00606A940
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qPAZIOy8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArRY5tYD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z5z0nEvMchSlb5e+FLX9z2bqlgni2uot6EIJ1FPOXsw=; b=qPAZIOy8/e6/tTOtR15xMjGFAV
	Mt+V2kwlNYUUGgC0PK7gdtMWmf8G5Q+rDkOqkHKlW/qriW4do0sRuCz9mhx9Kck6ccW1fhiklvo5M
	oP/lUafOi1+zLObX5CzDW6zX0xgUeS+2AdKpbY000Um3ZKpvagWtxyJsMos412kHS+PQqwgKUCCNC
	Tz6HhLBBSraMXd+nn2e4kODLzcxROm7HoayK1YCbGXR65P1wiQp8ZA9hHqNmGxjoLcAoFV7S0P41t
	LlB/sGsgSMRrxE0jz7pen0UspckF8ewWoWVG/Yyr7bqo8j6T52WssnNFf5lN81eVcWfHcCI2TMjdK
	c2kLpWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA5p-00000001boY-2wm2;
	Tue, 03 Nov 2026 08:42:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA5m-00000001bnV-2lya
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 08:42:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2A9A6021A;
	Tue,  3 Nov 2026 08:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8121F1F000C1;
	Tue,  3 Nov 2026 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793695325;
	bh=/Mmu1SJgefq+KaAvFDsItBgRjAHi+/Cf/AJ8uC5U19o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ArRY5tYDCFtc+xAoM77X7yHuc7rwLTxS1aG8aniTRKZtQGG442iT2gAjl2m+2dnnS
	 G+x+3k3jdG/f9V6Ry2EC6wMt93w+qL6UAFF3n4mG2B4dCloG5G4EwLnqrfLFnbkFJu
	 TVKZ97pmWfUobd6UGBB3rVmPxEolFi8QvwwI97bWdICu7aoijfe08s48DJ+voAL4Sr
	 Tw0HK23tCKk2+MLHCh/kPVnPF5cV8SneXBmKrRyfbWAsj4nk316I3t0Y1VXaYkys8F
	 wkP/2Fq9Ez76IMQS8TueH6Gfef4ET86iQJ5WDrGrumAkawpwZDe14gdg0mEl2dWHO8
	 BA07yDEdurjig==
Date: Tue, 3 Nov 2026 09:41:58 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 33/34] xfs: allow remounting read-only after a shutdown
Message-ID: <20261103-galgen-ehebruch-stehen-a967c14ce53e@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-33-2f44f64f0b66@kernel.org>
 <20261103054155.GB1559@lst.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103054155.GB1559@lst.de>
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

On Tue, Nov 03, 2026 at 06:41:55AM +0100, Christoph Hellwig wrote:
> Btw, if my previous reply wasn't clear:  please add the test for this
> to xfstests where they actually get run regularly and not the kernel
> selftests which for file systems are basically unused.
> 
> Bonus points for having generic tests instead of purely file system
> specific ones.

I can drop the tests from this series but xfstests for this will be a
follow-up.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
