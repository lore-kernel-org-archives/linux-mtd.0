Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1319CC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jan 2024 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VE8N/nQyVi/FLqUApVSFbwPdUqyk8UDb9DVUn3HOC0=; b=p1TBRH/YSfXCRO
	prjm6C43VQplxaP/JHiaF/4Xv3f6YsEshqmhy5uyNCwE9NBhCOC/BFhX3qBFu5HX5YwhZMZa1aM7Z
	6uaBRddMuXiYu/hp5lLdP0e8Szcw+NZdjOPMwHVXZSYSE5++e4dzkVmWiqYMLcwMs6nTkmBVKbgFC
	//wn3IqSZtoWwgjlJlrxMS2Wull/SqAytu2hvuVpPDgnP1LnZmcdv+SNvJLSbxDK7bTyNisQpnrNp
	nGJgzSNB0vrotacG60BF/3lrtUlS6LW2EiZeKZj3ZYgI+cy5zxvqHbfkX66kbdleq7+l0XOLEdlY0
	oK7VA0VeyFqzOJMhEQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVhX-00AzoY-0J;
	Wed, 10 Jan 2024 10:20:47 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVhS-00Azme-27;
	Wed, 10 Jan 2024 10:20:44 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 0F1522B005B2;
	Wed, 10 Jan 2024 05:20:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jan 2024 05:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1704882033;
	 x=1704889233; bh=syE5UlqFQxkc/rlq6eSMNsD1Ft+dm/4kEwr9kygNnZw=; b=
	JP39xJs9nz7sao0Mw71uaZ/eiQXIoVplqugjUGZYhQ7guX3+bZhIuPn+FTIF0P/U
	kFKA5/KKnrvphnR9VVDqO7b9pSS6wICSG3UluT021gLpH5lthNGCLq13PQ9KJjEJ
	1ljadw2mqVer0c9AYE4e0vRLjHJbc6Ff1HjG1hJRNVl2d58ls4RnrwTbd1lVfNCT
	/p4Lj2EC6KAxjG6XjKrUccDBnfGAbkRQ9JltT0U4qRnMynNH4R98FTVJAThZmA9u
	jQBMWbwGpK+oalRypy9TC8j8qfMWGON+J6gzAN0ArgN5Lu7H51+TiItFXrD89wmd
	vZG/l4E5n8fT1+kO8ueizQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704882033; x=
	1704889233; bh=syE5UlqFQxkc/rlq6eSMNsD1Ft+dm/4kEwr9kygNnZw=; b=U
	mPKqJXZVgmHnjEzCuKASxczr7emU7nTNeH25WN9+C8eCNew7DVr1bRr/+srzmGUM
	OLnTHQSNkb+EpmX50WeEu35xdXIziu96hJDuEpPD56diPrxIQi32vTaocnV2ckb1
	HD7aUd5o6s31cHFZPeyloB1t3fGS7jNWGPLq0zyRBeBaK7y25NpZqIyzw5gFDKsU
	pgPvYLFgWLau455DHxp57ybe58+CnFFt/AMqw12H893i5lWeRlqp9SNjB20pdoew
	+mPjKLaT3vdzJvpuSAYIlv2XgkShbWLlHqONIAN9nqEm1n8JAXEzEYFZ9iKC3jQK
	mYsm11bq3sdDv2qml7QSw==
X-ME-Sender: <xms:b2-eZV_KMr_PAO_kk0ge4HNc0mbJzBFnJKYHP3Wn5ArwwAHJiUgo6g>
    <xme:b2-eZZug-0NmwZ3_tB5EneosW6omYAdslyOjXGHW_SxmM98uPtte7R3mOTMO5r8vb
    U5elh8Vhr3nkMsPDkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeiuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:b2-eZTD8snTlVFeWedik1H69gSlAKgK5Cfa5oODX4P9VlRv3yNVtaA>
    <xmx:b2-eZZfs69_EmPDsleKZW4CQjR8pVKQx5Y8bLR1JfUiKHCBXHCWmmA>
    <xmx:b2-eZaMqe5fTef3bZBI_1IiTCXh5CeSfqu9FYtz6ovkxTl1P8-0xSA>
    <xmx:cW-eZYGsc9qNXZdY9id5LaSUAgT20Cc4RFtJpxiSbqeKVbO3FhZS773eVF0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 64819B6008D; Wed, 10 Jan 2024 05:20:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <fdf707b9-f39d-4f5a-a8bf-1bcb8cc6594f@app.fastmail.com>
In-Reply-To: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-9-arnd@kernel.org>
 <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Date: Wed, 10 Jan 2024 11:20:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, "Masahiro Yamada" <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org, "Matt Turner" <mattst88@gmail.com>,
 "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, guoren <guoren@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>, "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Geoff Levand" <geoff@infradead.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 x86@kernel.org, "Helge Deller" <deller@gmx.de>,
 "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Timur Tabi" <timur@kernel.org>,
 "Kent Overstreet" <kent.overstreet@linux.dev>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Anil S Keshavamurthy" <anil.s.keshavamurthy@intel.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Juri Lelli" <juri.lelli@redhat.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-parisc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 linux-mtd@lists.infradead.org, "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>
Subject: Re: [PATCH 08/22] [v2] arch: consolidate arch_irq_work_raise prototypes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_022042_743015_B5899F89 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMTAsIDIwMjQsIGF0IDEwOjAzLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gT24gV2VkLCBOb3YgOCwgMjAyMyBhdCAyOjAx4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBr
ZXJuZWwub3JnPiB3cm90ZToKPj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Pj4KPj4gVGhlIHByb3RvdHlwZSB3YXMgaGlkZGVuIGluIGFuICNpZmRlZiBvbiB4ODYsIHdoaWNo
IGNhdXNlcyBhIHdhcm5pbmc6Cj4+Cj4+IGtlcm5lbC9pcnFfd29yay5jOjcyOjEzOiBlcnJvcjog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnYXJjaF9pcnFfd29ya19yYWlzZScgWy1XZXJyb3I9
bWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gVGhpcyBpc3N1ZSBpcyBub3cgcHJlc2VudCB1cHN0cmVh
bS4KPgo+PiBTb21lIGFyY2hpdGVjdHVyZXMgaGF2ZSBhIHdvcmtpbmcgcHJvdG90eXBlLCB3aGls
ZSBvdGhlcnMgZG9uJ3QuCj4+IEZpeCB0aGlzIGJ5IHByb3ZpZGluZyBpdCBpbiBvbmx5IG9uZSBw
bGFjZSB0aGF0IGlzIGFsd2F5cyB2aXNpYmxlLgo+Pgo+PiBBY2tlZC1ieTogQ2F0YWxpbiBNYXJp
bmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+PiBBY2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+Cj4+IFJldmlld2VkLWJ5OiBBbGV4YW5kZXIgR29yZGVldiA8YWdvcmRlZXZAbGludXgu
aWJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Pgo+IFRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4K
CkkndmUgc2VudCBvdXQgdGhlIGFzbS1nZW5lcmljIHB1bGwgcmVxdWVzdCBub3csCnRoYXQgY29u
dGFpbnMgdGhlIGZpeC4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuCgogICAgICBBcm5kCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
