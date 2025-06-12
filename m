Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27ACC7113E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 06:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JRIbuiF47CkGiTyOuHcyDbzwyNAVkuQg7wFPaslPi8=; b=a3CbLL9kFcSfwc
	fIucVygsri45jIOqeVSyCNMdUEOyf/HQpeKbx/A6x59XYTBwNYqpwz4pnUW4d5s5HOBMUnGSoWQea
	Q1RHc4ipuFi1Wb31nQ6PeM/9X/SwVZ22bAl1GRKkSHMqsEOExF/demG/xU6WLoGb1bEpbdUlUYpGo
	TXPa+E7QhZTaPqjT0ug7z1OO2UH3B1SPt/t6k8nwLZnmp8jfN1Id5iCXHNEsJMLO6oro9llvbGwl1
	4moEF+Ka/iK7At+hm6a//4cU88QwHIHMlTIMhCuDW1UKoF29rNSpYRJWVQmJka8yhRftVDT4u8qk9
	GNrz+Y27+TbUPtiIZv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbOG-0000000CJgG-2T4y;
	Thu, 12 Jun 2025 06:26:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbOD-0000000CJfY-3tU7
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 06:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B050D5C0E0E;
	Thu, 12 Jun 2025 06:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C556AC4CEEA;
	Thu, 12 Jun 2025 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749709547;
	bh=M9CxTHdXT5WrEkUahJ2svzM+9WFZHYH6PnfsJfmp96g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JKL18zgaAsvyau0vg8RznAF41pnRn29ke6AvxA2D7Mw7V5apl+KttEkVoHd6d/tnL
	 Tuo1iauSla5SB1LKgm+CI852NO9cSM9ti1JUQsc/o7dMziPmdWh9ZdbdQ2+TqECf72
	 tKe6h029giSgUjLMox+O2hYJKhtS6lMpSEfXLsJfJnNduiMUk/nc06zKPQ6Xuo/CLw
	 gDfzldMCEdbHvb9VdubI943kkJgzbIHMo9wMyw6AZYo1x8aI4EOPR+sgVoGrwCPBtm
	 IjKOYTe5ai8875DlouqZWShNo2Danpn8JLN4tG1KOtY8p69UDDT8P0t64FjMsOusx5
	 x4gCYIr9ucEUA==
Date: Wed, 11 Jun 2025 23:25:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250612062521.GA1838@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612005914.GA546455@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_232618_008893_55B3E72A 
X-CRM114-Status: GOOD (  15.48  )
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

On Thu, Jun 12, 2025 at 12:59:14AM +0000, Eric Biggers wrote:
> On Thu, Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote:
> > Hi,
> > 
> > On 6/12/25 05:58, Eric Biggers wrote:
> > 
> > > But
> > > otherwise this style of hardware offload is basically obsolete and has
> > > been superseded by hardware-accelerated crypto instructions directly on
> > > the CPU as well as inline storage encryption (UFS/eMMC).
> > 
> > For desktop, yes, but embedded still has quite a few of these, for example
> > the STM32 crypto offload engine

By the way, I noticed you specifically mentioned STM32.  I'm not sure if you
looked at the links I had in my commit message, but one of them
(https://github.com/google/fscryptctl/issues/32) was actually for the STM32
driver being broken and returning the wrong results, which broke filename
encryption.  The user fixed the issue by disabling the STM32 driver, and they
seemed okay with that.

That doesn't sound like something useful, IMO.  It sounds more like something
actively harmful to users.

Here's another one I forgot to mention:
https://github.com/google/fscryptctl/issues/9

I get blamed for these issues, because it's fscrypt that breaks.

FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
https://lore.kernel.org/r/0171515-7267-624-5a22-238af829698f@redhat.com/

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
