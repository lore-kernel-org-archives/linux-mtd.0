Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD0606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kyZwqjYC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oC9iFwgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=liNr8CefV3XmF90XcHrEos9Zn5pcJVJWZFQzUSD95iE=; b=kyZwqjYCitFzB2/ZfqcNsGqwfo
	KfV+8l6G2Wmvcsym9zrysG4rMvEtusjKEcN3dGcOrUfpPF/Qpr77U1MHugxKc74d9KpN51cdLDcua
	0sWPvYqxFEkiyrr8Dd247W6mP1Bsw/N9iH3ZZNuufK3BCxVK5v2RHS0JY4UkVf9Xf3oGOElquKrIW
	ZLPvLjF7G43dFZx0a1v+4gcwJmhe2Z94g0OLlO/yYrDZ4Wfpw6n7fjm4nG0rEe5uE/ZgrPp5bHMRH
	UH5IceF7dy6jLzECo++XhjKrXEfN4fh/Kdrkf5yv1IOieruH4KMfX3yyDvvRCpVxxhsuGtbZgaSpG
	S5hbtc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQthi-000000055FJ-0RWG;
	Tue, 10 Nov 2026 21:48:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQthh-000000055F5-0ROT
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:48:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DFDA61300;
	Tue, 10 Nov 2026 21:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688451F0089F;
	Tue, 10 Nov 2026 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347312;
	bh=S2pPMf68MKLxuySWp5Wno+q1xTo+NPVvk6DAmNFSvFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oC9iFwgoyNF0avpSzP+LujPrHBL55F0iQ1+eh40/xaQGCsUJwyZj2fPS30ujin4Dm
	 SVnQqpZ2SjogMiMYXPEzvfYKJzVMoBv+Df3csdKCA801hOuiWqyDvQl/FCA1PveiKn
	 dlzsj5berdJeLTvrfRf1tn+APYZX4HAekqypgq7yh7KMtnngVzBJ7X+HDQSs3Y/Ves
	 YrQKw6AR2dcxgAuVjhMouKyxBmBPILui/uSJqFha6vIpd35V81aHP3IEK9IhKRSlAC
	 hI/LC3SWGPGbDDIpo82LOorhqYu1cfTQEirY6vqyc6wT1nSwBig0OETsSsx225pPq2
	 gh4ZaFXCqLkVQ==
Date: Tue, 10 Nov 2026 22:48:26 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 03/34] fs: add a generic emergency read-only state
Message-ID: <20261110-person-fischen-gutmachen-7b04d2256799@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-3-2f44f64f0b66@kernel.org>
 <gm5ays7o5ps2gcokxw6giymwwalixk6dychwlqfgx4brjohfth@cyrrjbycqjnj>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gm5ays7o5ps2gcokxw6giymwwalixk6dychwlqfgx4brjohfth@cyrrjbycqjnj>
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

On Thu, Nov 05, 2026 at 10:00:02AM +0100, Jan Kara wrote:
> Maybe it would be good to mention here that anything that goes through
> mnt_want_write_file() or mnt_get_write_access() is treated by these changes
> as well (due to the __mnt_is_readonly() change).

Agreed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
