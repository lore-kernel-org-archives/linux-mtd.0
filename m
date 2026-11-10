Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45A606A325
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmSSkCva;
	dkim=fail reason="signature verification failed" header.d=nod.at header.i=@nod.at header.a=ed25519-sha256 header.s=v1-ed25519-20260901 header.b=oyRwHVuC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nod.at header.i=@nod.at header.a=rsa-sha256 header.s=v1-rsa-20260901 header.b=Km10Z0YH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=+ZLTkJ9yhSVFKdo9l3CtpIi3oSGpA/9+YIKrfmojuP0=; b=KmSSkCvasUK+5SPHa/Erb4UiXB
	OTx3Pk6itUgFKeexFGuF2QnQlHI9Qv9TF0fSoph+LiMD3cgU9c2zZbm6fThOVU0NHCnnuabgPePG3
	1tcbkmvAgKH9NW/cQsoZEVza79HU6hl/SZs74+QPpjn6/5AhYJZHBMH95f3MWWVhdgdXq9PtEx8wA
	msQM9gWNTTKM7Nt6ye5TX3d4KT+WQmDmgpmygUoNH7vXQwjFnzyr7/ZDnEFZta1FvgLukedVD0bhd
	TteESfk5UiONAZmZVji4EzURxhLJ6hSzZqk3AXh9VBEbxpdGjLu7Ch0rfZE2M97kQ1eKB3YCicPeU
	vHo5CgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfpp-00000002jQw-0WcQ;
	Tue, 10 Nov 2026 07:00:01 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfpl-00000002jQ1-1S0N
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 06:59:59 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1794293969; bh=3JqNgxTP6qF/uh7s0hDBAOp
	+BiBb2Ay3BGjN8pwmpWI=; b=oyRwHVuCEhzrZ0yi4CM9LFckMC8xze/6i8UL0YMByGIQfsJcQO
	c4hJejpnl8RbqE63BeaqrH9/XRzX5mVCBKBg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1794293969; bh=3JqNgxTP6qF/uh7s0hDBAOp
	+BiBb2Ay3BGjN8pwmpWI=; b=Km10Z0YHXczK9nddurm0YZccmlPDPCrUEyl9Ce8o2bQEvtXmDW
	A3jTdKgQZMlj6oNKjJL83IHFlcYU8yBUr9PwvXz3YTYspbFKVgW3joI3f343o2Bdf738UwAx5/5
	KXg6QvOLVu4oafuLn/kg7QfmhLlnXrf92jbUfVAQhWtz9NQ7uU0pazsnyZkgwFmpbZQ/3pJEYKZ
	aOOybamt5zIWZaTTmInHOn3Jzo1CYflUEOmFDT85ctE3vXfXLif4VRvcwnaLIxwa2II+23Uuoum
	vQE8M5ZSh2QCurBmihVBNJAZCo1rvE2eRwLjs8Ay+wq6sHCLITNd9attg+RMZPZd7Xw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Alejandro Pacheco" <ale@alepacheco.dev>, "David Woodhouse"
 <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH] jffs2: reject uncompressed nodes whose csize and dsize
 differ
Message-ID: <mwacav99.b8118d47-0161-4866-abc8-fc544b4ff347@nod.at>
In-Reply-To: <d1220d53-17d3-4ff2-b145-09047eeb7e23@alepacheco.dev>
References: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
 <d1220d53-17d3-4ff2-b145-09047eeb7e23@alepacheco.dev>
Date: Tue, 10 Nov 2026 06:59:29 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_225957_532404_BA07BFB4 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Am Tue, Nov 10, 2026, 03:27 schrieb Alejandro Pacheco <ale@alepacheco.dev>:

> Hi Richard, David,
> 
> Gentle ping on this one. It still applies cleanly on top of
> v7.4-rc2. Please let me know if you would like anything changed.

It's on my list. Currently I'm busy with other things and I need to allocate
first some time to untangle all the patches in my inbox.
There so many duplicates and AI slop that it's hard to filter out the good stuff.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
