Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CEAC71135
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 02:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HGH7luQ5FkTvBH/om8ZiJz5JdtpSbblaihBHYIj/eA=; b=GNE7RzBKuD0HwY
	CR0An1YaoAEVmMJ2w99WBUYciTymSad45/S1srjs329DzFSg2XSNUcILUG+TYByC4A/gzXyiLa0PY
	ne9MrBrB9p97NGEDHWfioYroE6O1DH4Dorbh33huIAklNoqaHKN9NEIIkg1Il/GVCIIBFd3Bfb/nV
	/sSfoZSCq7JRRIKltY7g2+NehypjQ5lY18mtALFEbumxG9UMXsF34stQE0ep3hwM2jkgwwy08M1e1
	aVUb7Zy18PvjYZpv/Fo4sYWdD8hqsfFww2Kmsq39jAC/e5GEJohEtTjdGb4B1mnq2SieAoQyZ6f4p
	Y5iIG04mM2hUuFdCr4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXyK-0000000C0jH-1zlG;
	Thu, 12 Jun 2025 02:47:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWHl-0000000BqX5-34MF
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 00:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94871629E6;
	Thu, 12 Jun 2025 00:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03066C4CEE3;
	Thu, 12 Jun 2025 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749689956;
	bh=1pLf5bk/3PFIluwpReZ5mviAqg4CGwb1cCQQmcLw6f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kn8RsBx4W5wwKgjX2bn2GPL7w7pbuxS4bXmDFzdgWA+KONs14NmKhmdJn+9//1d2a
	 U2/Kgaq61LJNRw8jMvkf4uuYNdcYZYbu5E+O60TZXvsvNQ7wT7YrPZUrelkhOW+wAN
	 Xy4kBVI1wepj/dFanHYyWK6/6/i0/d1i+/QhVo9b/rG0Xb9jNoDgkijJvYExFr7dwj
	 Y6UevZfed66WMmM3EFdMAmC1ngqx06O96BHAbNL6wlbVp6LW3w7GkeJKZz9M+LSMyL
	 WAnmQ488J49VwokEuqF6q/94k3A/56jKE7K5zazfC8qQE2LLdby/S/Sdex/T3xWbx8
	 ZwyP9Yt+uFe7A==
Date: Thu, 12 Jun 2025 00:59:14 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250612005914.GA546455@google.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote:
> Hi,
> 
> On 6/12/25 05:58, Eric Biggers wrote:
> 
> > But
> > otherwise this style of hardware offload is basically obsolete and has
> > been superseded by hardware-accelerated crypto instructions directly on
> > the CPU as well as inline storage encryption (UFS/eMMC).
> 
> For desktop, yes, but embedded still has quite a few of these, for example
> the STM32 crypto offload engine, and I expect quite a few FPGA based
> implementations exist, so this would require vendors to maintain a fork to
> keep their out-of-tree drivers functional when updating the kernel.
> 
> POWER also has an asynchronous offload engine with AES, SHA and gzip
> support, these are significantly faster than the CPU.

Do you know if anyone is actually still using a legacy-style accelerator with
fscrypt, and if so what specific performance improvements are they getting?

Arguing that legacy-style crypto acceleration could theoretically be useful in
general isn't really relevant here.  What's relevant here is whether it's
actually useful and worthwhile with this specific kernel subsystem.

As I mentioned, fscrypt has never been optimized for legacy-style accelerators
anyway, and no one has ever tried to do so.  It just hasn't been relevant.

Meanwhile, the real feedback I *do* get from users is that these drivers are
causing problems for users, since the Crypto API (unwisely) enables them by
default and thus fscrypt uses them by default.

There are people who do care about some of these drivers, but they tend to be
the manufacturer of the hardware, not the users.  To me it seems like more of a
check-box exercise than something that is actually worth using in practice.

> If a buggy engine passes self-test, can this simply be fixed by adding more
> tests? :>

The crypto self-tests are disabled by default, just like any other kernel
subsystem.  They are supposed to be run before a kernel is released, but for
most of the drivers they aren't, since people don't have the hardware.  Thus, a
lot of drivers in-tree don't even pass the tests we do have.

Some distros do enable the crypto self-tests in production kernels, but only the
fast tests; the full set of tests is too slow to enable in production.  But even
the full tests don't properly test the hardware offload drivers, which have
unique challenges that do not exist in software code.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
