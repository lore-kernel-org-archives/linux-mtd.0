Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF31C7EE2A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSId6Rk9LDMR9+dl329P2xBUUMhFGCao3M7eLZrWIZE=; b=p+ADUMnQ3snTIO
	hM7jNtbjwNeL9NliMP6LaGP7wHauObRmJhso3UCfrwI8J5S4A184sqD2TDB6qU8O089ucPmAyesBP
	ESelm5j+98U2Q4+ek85xlxjR63Yv5XOZm8Vo8KINJbmFBPidyYIylvHduIH+BYiBsBgWkLEyQmLyn
	QNsuz+/FNUx5KBI+g1t2R/9bgyNmkMi0vHWhD2JyaJnh7nk1xYDTqp7M8D06xsAyFQaGJ2WT2oi9z
	EMj+4BYl/mfhYlpke4CrwnQvr5UGGvZbok/Aw9rfcv37iDhZnWSKhe+R+izbfOfYU0bLEmswK2pdU
	B3+AJWGLvztqu+TFrBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWqF-00000009rwP-32Qn;
	Wed, 25 Jun 2025 20:35:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVJl-00000009fSZ-3yOb
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 18:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4CD94370D;
	Wed, 25 Jun 2025 18:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47806C4CEF0;
	Wed, 25 Jun 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750877876;
	bh=9dMCTDJZVMzbS/zBD503nWWVWKm2FovKnQMyh9fpcro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RfXX4gyzdrSzcJwCnXlcD7dGqdLurOrI0ukuDS2ni26iDSAkow3zKchchRI+UwGL1
	 CVKaafO3G5sw5GHlEXIh3Nd6XqMu1XckZgzUk0fTVra8Q6hu2OyuukS/LyKTM99iQ0
	 GU2vTn4zkFANEHPM7nlTTgGrUFfu7jYUY1z36LgXLui0nbyr5/AcWl2u2YAECr2NSc
	 NhAF455t2SLxIKM4WhoJQbgB2AKEVaCyIXCBcGKejkf6AvfaxoxjTBZWNaOA7ihAlm
	 rGX+iUEeloK2dGYQQToMRuwVDS6n9Jc0QxIW8RytzIg/Rs/1sFMntTZ5pnUBMgDuyL
	 pIg6KkFWyV51A==
Date: Wed, 25 Jun 2025 11:57:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Maxime MERE <maxime.mere@foss.st.com>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250625185721.GB1703@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
 <20250613144239.GA1287@sol>
 <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_115758_025823_FF9E266D 
X-CRM114-Status: GOOD (  19.84  )
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

On Wed, Jun 25, 2025 at 06:29:17PM +0200, Maxime MERE wrote:
> 
> 
> On 6/13/25 16:42, Eric Biggers wrote:
> > Honestly, the responses to this thread so far have made it even more clear that
> > this patch is the right decision.
> 
> The chaining system I previously presented is just an example intended to
> demonstrate the value of hardware drivers in the context of ST platforms.
> 
> The key point is that our hardware IP allows us to securely embed encryption
> keys directly in hardware, making sure they are never visible or accessible
> from Linux, which runs in a non-secure environment. Our software
> architectures rely on a Secure OS running in parallel with Linux, similar to
> what is done on Android. This Secure OS is responsible for sensitive
> cryptographic operations.
> 
> This Secure OS can manages the keys with a dedicated hardware peripheral
> (SAES). The Linux side never sees the keys directly. Instead, the Secure OS
> prepares the keys and shares them securely with the cryptographic engine
> (CRYP) through a dedicated hardware bus.
> 
> This architecture improves security boundary: keys isolated from the
> non-secure Linux environment. But decryption can be processed by the linux
> kernel.

Can you please stop hijacking this thread with what is basically an irrelevant
marketing blurb?  The STM32 driver actually just stores the keys in memory.  See
stm32_cryp_ctx::key in drivers/crypto/stm32/stm32-cryp.c, and struct
stm32_hash_ctx::key in drivers/crypto/stm32/stm32-hash.c.

So even if the STM32 crypto engine technically supports hardware keys, the
potential benefits of that are not actually being realized in Linux.

And for applications like fscrypt that derive a large number of keys, it isn't
actually possible to use hardware keys even if the driver supported it, without
key wrapping and proper integration with the key hierarchy.  (FWIW, the
hardware-wrapped inline encryption keys feature does do that, but that is very
different from what we're talking about here.)

Also, the STM32 driver does not actually fully support any of fscrypt's file
contents encryption modes.  It does support AES-256-ECB and AES-128-CBC, so it
can be used for AES-256-XTS and AES-128-CBC-ESSIV when the CPU handles the XTS
masking or IV encryption respectively.  But to do that, the CPU needs access to
part of the secret keys.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
