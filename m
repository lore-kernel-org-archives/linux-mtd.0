Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48534606A330
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g94mrb3w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVycrJem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TU/ZkUY4UTt0S5pa+3gkXUnoASisbKRghy56Bu1NJs4=; b=g94mrb3wFdWApZuA0iTF5WtUrG
	v07ES2+IoolQtBOerGST/tiudWmZ8xYAqEqO5ZZzhlotZHwQD9SeFDS8Z5NGdruvFiMI2p4THqiiV
	PWd/01LJibEoKwqdjTNHtDUAlRC2shgYBxf9Sq8LnuKTB22eB0slL6mriJWyzypMunvbE5a0ND1E8
	EhEeyC3j7N7fsAmS2nzX1xDsVQ4mX7DNvhFraX6l2yHlUyhqS4uzuD88jf6yuMmTYSxqFdMCshAje
	4zbAcmQS4GqWwed7HqKmlkbkEYYQOwMi6KBSPEd9eS2PgGIrKOQ1mrLGRidCohowJtiB+H5TxBoNG
	jl/3ndyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtsu-0000000577D-00Km;
	Tue, 10 Nov 2026 22:00:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtss-0000000576s-2FFD
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 22:00:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3E8C637BD;
	Tue, 10 Nov 2026 22:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA391F0089F;
	Tue, 10 Nov 2026 22:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348005;
	bh=gSi1Cem5uo/nHM5eotKecOrdsXKahxKBDl5fLDSMhvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JVycrJemQMYteTNBsZxUIffQQQPnmrdfGKeARGla+1IErQkChKMhQGOQqlFsfFuhx
	 iwIJoL9qUTODeU6AXawH9JQNrAydyCRqIIZbUIV5s97GSGrL10gNf3kHcDT+5OUruy
	 Q4A/l5PfIpgDURJVTAxCGWrV/XmVD6HaFcN4brBwt1NHeMAiye9Wr1IJu70oJjCdtn
	 XPSDMt6ALnAU6hffPYN51LzE3iM3nlgmmW4NNuqk/GDMMyDuPDB0Rj+b81J7Eztgj4
	 4mfjQRZL094u1Ft6gJOZoWL8bPLzEMTw7x7xlRLHKixpz8bS4+KWY7fDcq9FGXfsPL
	 m+JbHKkaOL78A==
Date: Tue, 10 Nov 2026 23:00:00 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 09/34] exfat: don't set SB_RDONLY after filesystem
 errors
Message-ID: <20261110-kundgeben-charakter-womit-db0a0035bb5e@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-9-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191228@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191228@kernel.org>
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

On Fri, Oct 30, 2026 at 04:09:55PM +0000, sashiko-bot@kernel.org wrote:
> Can __exfat_truncate() and/or exfat_evict_inode() check
> exfat_emergency_state() to prevent metadata modifications and discards after
> the filesystem enters emergency read-only state?

Pre-existing.

-- 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
