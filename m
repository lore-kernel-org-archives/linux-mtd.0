Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662E9C7115C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4JnsBDmTVO4IHPEs7SpJJ+ekomh2XoOEGIyJQ8TByE=; b=oyS3uwjHM2KUS0
	Fp8cU3lBbFGx3+Sx6JMSCz3jA3mk2T2OAdT3/EYUCfkMRKuHrGv0G+sMrt8kC5gl2z35f6g34qpmW
	xUCwCHLQFATeplsI6i6F9mRlX1JT7F94g0G8VSDfuG6hqFbW9BE1UmTGIqjUuoVTPEFsgMK/Xxw5B
	VjNBocrpEhgD8oAkAk9nYFpkn6iu5b7epj8JAPuL0cMfl8rLzws3ZvTjpsFO89+hEIhvaT2ME8zSN
	Hu44JG9wofll+fVFRn/VSmndYiBTTbWfNc5PGBVYlp2Vs6JpZ9SVb+r6GRuWy8B0zwQ8EOCFouU5U
	7oVlxIpmS2Adbfarqvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJhM-00000007fX1-0C4Y;
	Wed, 25 Jun 2025 06:33:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJhI-00000007fWN-31tC
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 06:33:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71C99A50D35;
	Wed, 25 Jun 2025 06:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B4DC4CEEA;
	Wed, 25 Jun 2025 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750833207;
	bh=KvBZdCVe3bjcds3toNzSaotNrJRp/h1SfSaoHVQtlow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgakoUfAtI3aZ6TL8fY22KKltCf5IxNhnzJ2oiyuuI/GEIHZVXnwJ10tWdkSvPitL
	 /7bgjo9d0xQe1/8gpM9TBWDxFi/Ea0rEL81mSYagOjUKrHIXs7lqZdbBqzmHFzyv8u
	 ZWO+dWfZgHmJ/TMTmP0277ODQYtrlhMqpajvswJ8zCCo09C9Bj7uSHR7SGVz+9SwGl
	 KSwIFk6u+iudkaHqeTJb2dbajWY0742z1b6HWGCzoj5/myPz3cCTRLT7guhEKxa1Ue
	 qWBczEoXOLdeLmUv9Qp8JOrF2q6gevGPPGRKDXQ/LfFR2ZmiDmtFXt9weQocqTrCp1
	 Hz6xQ9sygvLRQ==
Date: Tue, 24 Jun 2025 23:32:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250625063252.GD8962@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com>
 <20250612062521.GA1838@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612062521.GA1838@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_233328_886875_D290404C 
X-CRM114-Status: GOOD (  21.34  )
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

On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
> On Thu, Jun 12, 2025 at 12:59:14AM +0000, Eric Biggers wrote:
> > On Thu, Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote:
> > > Hi,
> > > 
> > > On 6/12/25 05:58, Eric Biggers wrote:
> > > 
> > > > But
> > > > otherwise this style of hardware offload is basically obsolete and has
> > > > been superseded by hardware-accelerated crypto instructions directly on
> > > > the CPU as well as inline storage encryption (UFS/eMMC).
> > > 
> > > For desktop, yes, but embedded still has quite a few of these, for example
> > > the STM32 crypto offload engine
> 
> By the way, I noticed you specifically mentioned STM32.  I'm not sure if you
> looked at the links I had in my commit message, but one of them
> (https://github.com/google/fscryptctl/issues/32) was actually for the STM32
> driver being broken and returning the wrong results, which broke filename
> encryption.  The user fixed the issue by disabling the STM32 driver, and they
> seemed okay with that.
> 
> That doesn't sound like something useful, IMO.  It sounds more like something
> actively harmful to users.
> 
> Here's another one I forgot to mention:
> https://github.com/google/fscryptctl/issues/9
> 
> I get blamed for these issues, because it's fscrypt that breaks.

Since two people were pushing the STM32 crypto engine in this thread:

I measured decryption throughput on 4 KiB messages on an STM32MP157F-DK2.  This
is an embedded evaluation board that includes an STM32 crypto engine and has an
800 MHz Cortex-A7 processor.  Cortex-A7 doesn't have AES instructions:

    AES-128-CBC-ESSIV:
        essiv(stm32-cbc-aes,sha256-arm):
            3.1 MB/s
        essiv(cbc-aes-neonbs,sha256-arm): 
            15.5 MB/s

    AES-256-XTS:
        xts(stm32-ecb-aes):
            3.1 MB/s
        xts-aes-neonbs:
            11.0 MB/s
            
    Adiantum:
        adiantum(xchacha12-arm,aes-arm,nhpoly1305-neon):
            53.1 MB/s

That was the synchronous throughput.  However, submitting multiple requests
asynchronously (which again, fscrypt doesn't actually do) barely helps.
Apparently the STM32 crypto engine has only one hardware queue.

I already strongly suspected that these non-inline crypto engines aren't worth
using.  But I didn't realize they are quite this bad.  Even with AES on a
Cortex-A7 CPU that lacks AES instructions, the CPU is much faster!

But of course Adiantum is even faster, as it was specifically designed for CPUs
that don't have AES instructions.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
