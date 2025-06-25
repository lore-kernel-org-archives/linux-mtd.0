Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C9BC7EE2A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWde/74LvcUT+/NkkKytf033UgrQG7fElYH/Fobp2d0=; b=WrxIw+H+H8vkoN
	jJwdpczuP08BkBq5YIBl0jgCpz3oI1Gm28gk4k1XTiThTGRp605MkQlshIPxB2rDFJw1dsQ41kNpW
	RcsBGXQEMXiDDKqPDR2Lm7I9mLFsVo/XKIxVY/YUgpjd5LXrAhzFgP/aS9Q5NhY4QSCWkmtu7Ik4I
	MwMveq/TZThGO18Qsg82ghd7Eu2Ikto3V4F+syandNAIopk0sf/8y9hyz3S5xOGf6oFgVriVMPVYa
	1prKTRE6pLT0MB/T+R5Zk4PznL4B5j5iIMrqrRoFbsCnik9RxyPxujR6Y9p2uedtuc3rg+rQ2NLYT
	lMF0nqI+lFg479jQmIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWq3-00000009rf1-2wM8;
	Wed, 25 Jun 2025 20:35:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV1c-00000009d7E-02pS
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Jun 2025 18:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Lf/gt+1Qj5853DGziX2FWW6NuGF+8XTYFSBydnxuhII=; b=ELFijLNXI9dnYEwGNlfv4qH59J
	wFt9dyNww1UU13JPlIjDVLbhdnLpQtDnI578U3TMuJYRwL16r/purnwUeyEbyzJHNbPLqKJVeBUz1
	qWMT4aBbNVz37MTtNn4ruXZ96t++hnSpLecI4hOi8IPMqCDoJFkm9zolz1kvZguHOgG6reMTmB/ih
	z/yq3qhA0cy0+74yhjbLYQD29KoRlG3DkOlFthu8d1WCLCzwuMr5b1vyIiGR6UHewCaExeCT+/vqt
	ZZ1SxBYDLZVyziO+QIzbgM21HFhQZL3tLylX3nggCLOy+ya+H/Du10q2W/lhejyRfpaQ8ES6NRofL
	kJXOZJKw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV1Z-00000005vWi-1Lg0
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 18:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E026F5C5C94;
	Wed, 25 Jun 2025 18:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C0C4CEEA;
	Wed, 25 Jun 2025 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876747;
	bh=WRHYPzI57hddDK7CE8Wr1nJ8heCzKe+3hF0K0wP3ejc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3gbLHlg+Xr2KnUs3hglU2onJJoUGSlohkLlIO0HiHKEfzcHm7gbBX7ehcf6RPYV/
	 +lZdqAI4YsE3A8mHgnUfSM9Qr3Uqr4VhCyGtockNTKWG0+lc/YO91ybT2218qYd9B8
	 jOIucmU2Yi99l/8qd4aJIkS2fkjuIddv1w1bJOwL0xgoqCDcWZy9KQ2abe8KvHwn3Y
	 BpA+FSQrIB4THuqB3RMyQi/a0HkIxNqAHE5vcpF0mV4D0ZBT/g9VXKCrxMjPY5B9lC
	 SRv0AlpeaFxq62qgpTMg5AGtCYq6KdpB/doP2ovkMnfKnZJimNdBjGwPNThRlOjZ0r
	 N27ijJqi/rVSg==
Date: Wed, 25 Jun 2025 11:38:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Simon Richter <Simon.Richter@hogyros.de>, linux-fscrypt@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250625183831.GA1703@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com>
 <20250612062521.GA1838@sol>
 <20250625063252.GD8962@sol>
 <20250625124445.GC28249@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625124445.GC28249@mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_193909_572957_BE5E7D34 
X-CRM114-Status: GOOD (  15.24  )
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

On Wed, Jun 25, 2025 at 08:44:45AM -0400, Theodore Ts'o wrote:
> On Tue, Jun 24, 2025 at 11:32:52PM -0700, Eric Biggers wrote:
> > 
> > That was the synchronous throughput.  However, submitting multiple requests
> > asynchronously (which again, fscrypt doesn't actually do) barely helps.
> > Apparently the STM32 crypto engine has only one hardware queue.
> > 
> > I already strongly suspected that these non-inline crypto engines
> > aren't worth using.  But I didn't realize they are quite this bad.
> > Even with AES on a Cortex-A7 CPU that lacks AES instructions, the
> > CPU is much faster!
> 
> I wonder if the primary design goal of the STM32 crypto engine is that
> it might reduce power consumption --- after all, one of the primary
> benchmarketing metrics that vendors care about is "hours of You Tube
> watch time" --- and decryptoing a video stream doesn't require high
> performance.
> 
> Given that the typical benchmarketing number which handset vendors
> tend to care about is SQLite transactions per second, maybe they
> wouldn't be all that eager to use the crypto engine.  :-)
> 

My STM32MP157F-DK2 board (with screen removed) is pulling 1.5W regardless of
whether it's running the benchmark with the STM32 crypto engine or with the NEON
bit-sliced code.  However, the NEON bit-sliced code finishes 5 times faster.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
