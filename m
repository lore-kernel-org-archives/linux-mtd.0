Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E7EC7115A
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 22:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITj8x6nmGlOOzHNuzwBcPTlF9zdLDu1RW3GLxd4Z07M=; b=viBlVhL8hCiKC+
	HwOC5ZCFmzUYwaYSwiA8/wXFsTN8IziXbZgEQC9UV4iI9LuYakotzp81Wrp8wRB6YBNUtNxiWNhSu
	f2SbwZSA/3GIGULbuw9iVZqmJz+rWb1xhPo8aBofKUGOcZ2RiVe6noEqaGM8LQsG/pCWXSqkHO5e/
	ArnRxgSzUavgya+4jr2Tifuvnpq8qniYS/mhVLM/5XWIZp1rB8zso3m8AhM23yiDU0R63KDocTBN+
	ImU8cxz0BYOrHamN3wvYCYGkggYZ7kOPi8Zbu6yn2nS0HA2ITFPXhHPy/Gr1ldvf6BXDEJp7jilOs
	fjIKHg5ra3jGbXuOozdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7M-0000000Ejdx-44Ru;
	Thu, 12 Jun 2025 22:09:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkJG-0000000DsYP-3zwG
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 15:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29D19A51E58;
	Thu, 12 Jun 2025 15:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E397C4CEEB;
	Thu, 12 Jun 2025 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743865;
	bh=I+yj5RaeRFm4XV7nYay72iV3VtIk9fY58cl2ElhN9GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kj3syDB7EWGXmmPQEn6faQJJCP8Zx4/ZbWfx7JOkjzRF0b8VXypiFh+vqdaR8hl+p
	 ioh5TDwlCz6GFe+gIMxEfYVqfpLapRk1/3/fdNPt56AIGQrTtOVSuQlX6VXMXgbPgz
	 1H1mS98XcOEm0C/62bgT59L+f+uAFOvphLCOqS1N5Ff2+I9VbhNd/R7nmixjuliDT+
	 0ECTov3sUQ13ituxxnl50KKaOAe7VR/jHdHqVUmefGy91C/DN+y0FzI6a5iphvbODD
	 q/NVOs5UaO1MPd6POp4EdPrhAFHt+ixI/0LAvQGsIFBVVj8kPrXJc2LfkO+5YDX4IB
	 YlD+RzbQxcOtg==
Date: Thu, 12 Jun 2025 15:57:43 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>, linux-fscrypt@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250612155743.GA3529549@google.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com>
 <20250612062521.GA1838@sol>
 <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085747_062909_B2EDCAC9 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu, Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu wrote:
> On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
> 
> ...
> 
> > FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
> > https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
> 
> /s/happens/happened/
> 
> ... and it got fixed
> https://lore.kernel.org/all/20220506082327.21605-1-giovanni.cabiddu@intel.com/

But it reached users in the first place, including stable kernels.  And
apparently the issues were going on for years and were known to the authors of
the driver
(https://lore.kernel.org/linux-crypto/91fe9f87-54d7-4140-4d1a-eac8e2081a7c@gmail.com/).

We simply don't have issues like this with the AES-NI or VAES XTS code.

And separately, QAT was reported to be much slower than AES-NI for synchronous use
(https://lore.kernel.org/linux-crypto/0171515-7267-624-5a22-238af829698f@redhat.com/)

Later, I added VAES accelerated AES-XTS code which is over twice as fast as
AES-NI on the latest Intel CPUs, so that likely widened the gap even more.

Yet, the QAT driver registers its "xts(aes)" implementation with priority 4001,
compared to priority 800 for the VAES accelerated one.  So the QAT one is the
one that will be used by fscrypt!

That seems like a major issue even just from a performance perspective.

I expect this patch will significantly improve fscrypt performance on Intel
servers that have QAT.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
