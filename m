Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B272FC61CE8
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 01:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFy5KZaZGL4hSgWkAMSGbwCtLzEJrsTXFp0P0isqcRY=; b=zaAX0+kvqFLlyh
	DqXDGpDJz3C7rU2Dk1U+qWfwK42btHvdvg455aVrzvZsgHFth2+ZHFVSvVeeFJASTAAkAgdT3Gzwx
	uc0KwE20+Aes5NSO8bYfhwbMyB4GF3lyGwnOp4NPbR2sKhbqDGS3CjrdWbr3J2tSJ3J1aR2uV3IXe
	MuYINXqSk1NuhFb+4Aph4G2GYuIWKu8t90cIcf7u/YUOB8h6X5K0DN3YB//sHktZq+KOhyBZ4N/po
	R7G/tDccIcxKx21oxP9ABDBUeCnTCUtcUhfbLya4YRlJzFZtP/Kf0vnaD1AfB/RRxiDO+PYywc4eQ
	9e4XOqCzfvazerDtfGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtA8-0000000F33y-2EXa;
	Fri, 13 Jun 2025 01:24:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPt9F-0000000F2yY-2FmS
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 01:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 857A56112C;
	Fri, 13 Jun 2025 01:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4CEC4CEEA;
	Fri, 13 Jun 2025 01:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749777840;
	bh=d5rHizoOE6yeSiQobFd52hpxfVk2+AkiKtye4xkZZNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sopL9OVGaKkYBLoQ9K0Gx3mNqKCtmF6HeqAxRPeMFvJLOQNPGNCCbdfRxS2LlfLqu
	 C3Drs4Qu4cFQG2+79qNVN/2U+Mp5r2Ku8fHrvgJywco1pbYG6PtA3ImiR1O4x08klz
	 xDAF1Jfb3fKbHGBJ+46TYP3cVpNrl19/EEmKclh0GQCX86o255XF08PT4Rd7b6JjMQ
	 0pZk7pLaqF1Q6YqyMWUL0yY5F1li1Q6ACzRmSrSgpQrt8hIvANSSWWinXiguz6euWJ
	 eocxM+zUeCV/S4k5Ycq56kPx+45/tXS3yhtnvX35hipDpMVHslTEwlPdsTCo0NKkoz
	 V/KcVAfBqnyXg==
Date: Fri, 13 Jun 2025 01:23:57 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>, linux-fscrypt@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250613012357.GA3603104@google.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com>
 <20250612062521.GA1838@sol>
 <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
 <20250612155743.GA3529549@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612155743.GA3529549@google.com>
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

On Thu, Jun 12, 2025 at 03:57:43PM +0000, Eric Biggers wrote:
> On Thu, Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu wrote:
> > On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
> > 
> > ...
> > 
> > > FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
> > > https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
> > 
> > /s/happens/happened/
> > 
> > ... and it got fixed
> > https://lore.kernel.org/all/20220506082327.21605-1-giovanni.cabiddu@intel.com/
> 
> But it reached users in the first place, including stable kernels.  And
> apparently the issues were going on for years and were known to the authors of
> the driver
> (https://lore.kernel.org/linux-crypto/91fe9f87-54d7-4140-4d1a-eac8e2081a7c@gmail.com/).
> 
> We simply don't have issues like this with the AES-NI or VAES XTS code.
> 
> And separately, QAT was reported to be much slower than AES-NI for synchronous use
> (https://lore.kernel.org/linux-crypto/0171515-7267-624-5a22-238af829698f@redhat.com/)
> 
> Later, I added VAES accelerated AES-XTS code which is over twice as fast as
> AES-NI on the latest Intel CPUs, so that likely widened the gap even more.
> 
> Yet, the QAT driver registers its "xts(aes)" implementation with priority 4001,
> compared to priority 800 for the VAES accelerated one.  So the QAT one is the
> one that will be used by fscrypt!
> 
> That seems like a major issue even just from a performance perspective.
> 
> I expect this patch will significantly improve fscrypt performance on Intel
> servers that have QAT.

I was curious, so I actually ran a benchmark on an Intel Emerald Rapids server.
Specifically, I used a kernel module that repeatedly en/decrypted 4096-byte
messages with AES-XTS using crypto_skcipher_en/decrypt().  That's basically what
fscrypt's file contents encryption does, but here I just measured the raw crypto
performance.  I tested both xts-aes-vaes-avx512 and qat_aes_xts.  For both, the
difference between encryption and decryption was within the margin of error, so
I'll give just one number for each.

Results:

    xts-aes-vaes-avx512: 16171 MB/s
    qat_aes_xts: 289 MB/s

So, QAT is 55 times slower than the VAES-optimized software code!

It's even slower than the generic C code:
     
    xts(ecb(aes-generic)): 305 MB/s

Now, it could be argued that this is user error -- I "should" have created lots
of asynchronous crypto requests for 4K blocks, submitted them all at once, and
waited for them to complete.  Thus allowing parallel processing by QAT.

But, that's simply not what fscrypt does.  And even if it did, it could only
plausibly help for large bios.  Short bios, for which latency is really
important, would continue to be massively regressed by using QAT for them.

Even for large bios, it would have to get over 55 times faster to be worth it,
which seems (very?) tenuous.

Also, as is known from dm-crypt which does do async processing, the code that's
needed to do it is quite complex and error-prone.

In any case, async processing would be a theoretical future improvement.  It's
simply not what fscrypt does today, or has ever done.

I also found that, even though I built the QAT driver as a loadable module, it
was loaded automatically on the system and prioritized itself over the VAES-
accelerated AES-XTS.  Thus, it would be what fscrypt uses on Intel servers where
the QAT driver is enabled in kconfig, even just as 'm'.

Even disregarding the historical data corruption issues with QAT, I think this
makes it *very* clear that the QAT driver is harmful to fscrypt users.

And I've seen similar results with the Qualcomm crypto engine
(https://lore.kernel.org/r/20241203180553.16893-1-ebiggers@kernel.org/).
So this isn't even unique to this particular accelerator either.

This has gone on for long enough.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
