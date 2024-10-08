Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2FCCEF147
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=m/6uUkERU9VZ9A87AmvTbkyZFEZtrVmaxTw03jpLdC0=; b=kO2C6Uk2NwxNNfmYGZQ0CC+2XW
	kruDN3kzMKk2GNzlQwM9gTc/ft+auSimwo5aGfffqVHp3MWSBIsJ0JGpEGlTznEbpsDYEHlDUgfRw
	BZGB2Dz2oa4sPon02MQrThhAVfEqoWxZO6/g79n8jq0PVu4QzKEIaOz1TJGwlu+F64VEBoTxmtvfy
	YqABHx1TNBZHSwu/7j+1eyC3rcKy4Cgr2IV+8wOX4izVJ6ozGPg64yauNVV1J5tAxQ65im2oed6no
	Zyxez8q+evzSMM7uTrklsD0wwIhf05zxUwkF9zPEwrELhCFV9OfaLEUbZGm+5AuHWQCFgOX4WdYgH
	Ddr/OHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Vo-00000005IwZ-3l8Y;
	Tue, 08 Oct 2024 09:28:12 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6VZ-00000005Iqg-3RzW;
	Tue, 08 Oct 2024 09:27:59 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 51CC0200791;
	Tue,  8 Oct 2024 05:27:54 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 08 Oct 2024 05:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728379674;
	 x=1728386874; bh=vXVXlSmeQt3lDbjU6nzfzfDoQAW9RRomvBadp2xogcw=; b=
	bjNgc0cUBA4uZdH1q47ixH6gx6ApEG2i+6J6MPi8YvLMk08HDLdfZy8hT8Zg6yKe
	2NNW+K4vM+BLpVDgWKXQdLIKSYik0I3IB7tJont13em6PzKvSbkr1B06qXFqKd2M
	d0ejs6pFeYw/YXyhY+Lcf2huo4OyJRBX1xHiNcSNQmv5p+6ZX+wr7Pd1lBixTgNN
	hy3ySSe4YK4xve31mXcvCM9P9Iw3LCUZGsP9K1m9N7p5Xb7ubYL9XZcAEES2eqKH
	q4Bj/X1CPUurJVbo5pIPpwwN0hbRGOj6w0V/7h1MK76aEfaffRgEVf3txqnhVsaH
	NQLl8GS7yuUNX9Q5G2TmCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728379674; x=
	1728386874; bh=vXVXlSmeQt3lDbjU6nzfzfDoQAW9RRomvBadp2xogcw=; b=p
	sOjcXwit6BXpazNlyHcp7RQtet3ms/ShGIHVtIXjHH7z2u/WnegtOxGTuiQ548AQ
	+QeNCeOEnTuopzDdr6d1WJbi0tqer+OAMlHpYNMA4rKYXQSYp8xhdFdowZELsMYk
	mPiA+7k1yhl45NYwlOZiplxm5RqztnqU39N1c1aWbEv2VrChje997BHNId6Fidh8
	f/66rTIRr/Rf8m4bRDMcg+3Et00AosDHyah9nBj+ZrujjgTGAUXfWePzzlS94iIY
	R0idMtIh3pgHEw8KwMyxu5rrZ+cNSTvxzSNz15dfdF6tlWKdZbu29sjFAq+ca8xW
	Sb+T7NjbiudHSJhRasvgA==
X-ME-Sender: <xms:FvsEZxj4OSOJO5R_iNsz2YcNkoHn0yLCSkYK6NBW46UzHpbVeaOylw>
    <xme:FvsEZ2BOquKh3Ly6rs2-r88YflJwtYbElvZlqzUDwQxS0vX2aRowkRAfJok_DDP9J
    pVcVjM_bJaqf2Jtc-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhg
    rdhukhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtoh
    hmpdhrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrihgughgvghhrvgih
    shdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhroh
    huphdrvghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghp
    thhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhpihhggh
    hinhesghhmrghilhdrtghomhdprhgtphhtthhopeguvghllhgvrhesghhmgidruggv
X-ME-Proxy: <xmx:FvsEZxH3zfzkJa8RVVsQJZoKvnwBlHYLBK33c0RZVMnXZVlSu1AFqQ>
    <xmx:FvsEZ2TkOnb2xmY6R_aU2VmL8HDxOWOBk8tgzBsUripCRCPzrK9zmw>
    <xmx:FvsEZ-zauMDlD6bC6qkUsSUnHXG1P0xy_37njpHP8yhxpPZjQln2mQ>
    <xmx:FvsEZ87a2x1N0-w1vvIsh6Lf1hOcJGqvGuZ7q-fy_-iHchmecU6CvA>
    <xmx:GvsEZ3DPdeCYlhTq-fZUHLeUnTw2J7FWdf8IfVzPa0rAh4jeq3MQ4aNK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C545D2220071; Tue,  8 Oct 2024 05:27:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 09:27:20 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <jvetter@kalrayinc.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sound@vger.kernel.org, "Yann Sionneau" <ysionneau@kalrayinc.com>
Message-Id: <a9fa56b4-b00c-4941-8c8c-1d3b58b573e2@app.fastmail.com>
In-Reply-To: <20241008075023.3052370-2-jvetter@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-2-jvetter@kalrayinc.com>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_022758_284392_73D57D95 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue, Oct 8, 2024, at 07:50, Julian Vetter wrote:
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index 80de699bf6af..f14655ed4d9d 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -102,6 +102,12 @@ static inline void log_post_read_mmio(u64 val, u8 
> width, const volatile void __i
> 
>  #endif /* CONFIG_TRACE_MMIO_ACCESS */
> 
> +extern void memcpy_fromio(void *to, const volatile void __iomem *from,
> +			  size_t count);
> +extern void memcpy_toio(volatile void __iomem *to, const void *from,
> +			size_t count);
> +extern void memset_io(volatile void __iomem *dst, int c, size_t count);
> +

I think having this globally visible is the reason you are running
into the mismatched prototypes. The patches to change the architecture
specific implementations are all good, but I would instead add
#ifdef checks around the prototypes the same way you do for the
implementation, to make the series bisectible and shorter.

 include/asm-generic/io.h |  58 ++----------------
 lib/iomap_copy.c         | 127 +++++++++++++++++++++++++++++++++++++++

Along the same lines, I would change lib/Makefile to build
this file unconditionally even on architectures that don't
set CONFIG_HAS_IOMEM. Again, strengthening the driver dependencies
is good, but it feels like a distraction here when we just need the
common implementation to be available.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
