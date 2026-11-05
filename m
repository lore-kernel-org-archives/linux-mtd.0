Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF4F606D81F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T3qvL5uj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hozC474n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KLtLX0xgE1ePBn2IhovaunpXSGrhX1zbWuf95NEPB3A=; b=T3qvL5ujr4O4NJQ9tqcM+ZkpkT
	98Z4ztQ6Ddz6doGnsDMRk9B8ZyNl7lMQ8aTKANgCWTqMNTUlUoyOGWpDuVgiuJ4Ba5Pj+ZtKwznop
	7KOfziDzhicoBIRn4Gg2DLYjQHSesaWQEtVnRRDeAOBJD7sV/gpK9Eedt3a/Y5/cS2O9cg1c9VE63
	38kXE0X5C7fHL/cmAo7Nyy3Rvya34zpacYHcYHNS3FzPp6JIYDmYp6q0bGa8ku4dfwYEOWubBxWmD
	Xm+K6ApzwUW5zPrFFujtR6Ra3VmF75+T+7sijEgs2pXqpM8yEEMUQDZH8Q/DoYlNeaa0l014CRT4L
	p/GHs/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP19o-00000009tDL-2495;
	Thu, 05 Nov 2026 17:21:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP19j-00000009tAu-3r1r
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B57541915;
	Thu,  5 Nov 2026 17:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD2F1F00A15;
	Thu,  5 Nov 2026 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899303;
	bh=J29j2FTF2kZyY8FR+vqT+YtHMECplwfMHUOlXHohMLQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hozC474nQcThmslZgShDckSTgkqAWA3LVbuIi/4tD8mnomn1ttPIJXIIt748ilLjD
	 fUCgZWlNGPXy2VX5xyDBQNZSKk8EjDjD+/54mqnyCL0pycJrHwZLHgLrswmBSr6wCf
	 7XAQjLEC7zdDy3YLuOxSWQf0O86xDogFb84szA9EruBDPU+ToZzmgJOkE+bvIoLWR2
	 nFaIowqK2yuUerXr5hSUVc1CbJ8Z31cW6bxsh8wx1ymp76WP4gUV9hc4Hvwu/nqePH
	 Yk5wejGwIfHoAErYIZKvFR+Gh2g6BakM7ojfD+jXgor61EsPOMn8mhRRayaubyx4Nf
	 m7rmwg5OIjXcg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 58482279ADC6;
	Thu, 05 Nov 2026 17:21:37 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 5/7] spi: cadence-xspi: Add irq-less support
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Bharat Bhushan <bbhushan2@marvell.com>, 
 Sunil Kovvuri Goutham <sgoutham@marvell.com>, 
 Tanmay Jagdale <tanmay@marvell.com>
In-Reply-To: <20261016102917.171095-6-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
 <20261016102917.171095-6-paul.cercueil@bootlin.com>
Date: Thu, 05 Nov 2026 17:21:36 +0000
Message-Id: <179389929639.3073895.14736746474148064109.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=542; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lrq+vyqDhx2mj8qUXuuQDj+Q3aMe1F9V7cwQ55je/aY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe7FY0DLdPfx1xemJUkqBHd1lo3pVZAhkLNX5Gynl7K
 7BfPLCjo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABOZ9JLhf/H5ko1bS7Y+OXyA
 rbKleFVS9YWYcubO40e/i0Tk+kaKzGNk+MuSI/VcLevugQkcN07tfxaqF7T0fqDCH4PACTO3T1A
 5yAwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

> Make the interrupt line optional. If not provided, the driver will
> instead resort to polling registers.
> 
> This can be useful in itself, but will be used later to support write on
> kernel panic.
> 
> Note the cdns_xspi_is_{sdma,stig}_ready() seem to have moved for no
> reason; they were actually moved out of a conditional compilation block
> (#ifdef CONFIG_64BIT), as they are needed in conf-independent paths now.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
