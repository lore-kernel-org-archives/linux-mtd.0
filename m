Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2039C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgSgIMMra24suBeU1ykvtEqto+iQozeSW83+OcW+iU8=; b=hgym3bRSp+SqNd
	PdyEwNXnPk59asGLEi2szEev1N6Cjyk3ajTFk1UztI0FFvB3FHpYWLaOmbxnfATmG4edaIFzPfzyq
	cSpHI/fkyrQaQ6gO4BJlM8TFlpGotEZKG0VxtryPqvfN30ndrYOatmjlWvZxn3EBE1w9EtWFtGFAt
	0FMHXiYTaLnCGM93pmgJVpIAobqkiQuuLom/hwqzVq8vyCuSqrjUMBrfR/yG33gw/qnfuHPGhloMr
	iyNzlH1v/yDx3mpZRJepqSI+ZnLRrtINDFComaJn413SclGDjvymEbYd4RADI0hefYGEpByZR6UyL
	PbXjKe4ibtZe4l5DQehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0oMz-004dNC-2H;
	Wed, 08 Nov 2023 19:37:45 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0oMv-004dLq-0g;
	Wed, 08 Nov 2023 19:37:42 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 687A25809A6;
	Wed,  8 Nov 2023 14:37:35 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 08 Nov 2023 14:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1699472255; x=1699479455; bh=TuAUBn+gwTzKKR6XAwbb0F/b3IHOZTvECkt
	LGe4hx4g=; b=MpP4b56x0KBMpvmmk34khrpdqgaPpulwL1SW5QZNpR0pZbL+1mC
	tkgP6Crt1QszVtxegS3rDdmsnyHC8byp5kRjx+SPeLzX2GG7rLCItkjcgz0EdNWv
	Gq69ZGou2LiNrtaC7FaZPkws+icIw7tlu8NlHzzqZz3F6/T5ke0CjNfT5CzOIzcO
	wlzgmN6+4r3Yu6FokdfkzE9zpJNYuZ8GtMHqVYbPQiP/PZAVr4gD+0R65k8mK/GL
	TQX5MFWouHszC2cFQ8cULo8TEtCwqpaexq/q002RFilA2NNtMFPjUwSQebD9k8jn
	wAX9oI/LiWUh39T8sqdrJKhCiLqAx/VKgpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1699472255; x=1699479455; bh=TuAUBn+gwTzKKR6XAwbb0F/b3IHOZTvECkt
	LGe4hx4g=; b=ehqYku5jaD5aa8sQ6H1yoT4VXUfRnaoNcziQHMGaIXhItKgqAj4
	Hlc3loXGRlRiaTOqNhvj2uKXLY0x/2v4YoUSCCZaMgxaprHVMVkWZ5QubLY/Jb+X
	slx1zHyanQdRJk3AaZ/kME5bd0gKMVHE7D5VkKqAr+Xs8yhTIy0LndSevkJ+DVIO
	GY0/rjRxikPPYllrW3ZRaUQb789TbLCQtJmdAQFz1vAnRgOar288487BsvpEsdTp
	LQ4scdpYhMDJ5fvQheRWQymSodK3voIoiRxGrKzWBgQzNoPaIhI2uKhQG9ZEbG8l
	N6PvxTQbZDJj1iMQzok8F85XOSQCTEIlBfw==
X-ME-Sender: <xms:feNLZbHQUcczMbInEIUBgObHjW0UpBNORQ7x_Y8Ypx4p7LG9PdI5tA>
    <xme:feNLZYX9doh1U8iuWa6zqM6NuELh7Qh3HEkQ0GZRN_NG1L1cqkPlAYPc3JWQwdwSK
    4EsvATv1wCBrLE6tmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduledguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:feNLZdLHawZeagz4RHPjBAOgtuv5RJQEfb3r_-W1NqPoLhX5l7zbZg>
    <xmx:feNLZZEs5icyy541jo03y-vdYpm91DiTp34yB-42NIzCdUT0--dexA>
    <xmx:feNLZRUE-9jBS0gJI7lscQ6-L93osWu88ZKWbrlbY3DvnbG8qPI9Xg>
    <xmx:f-NLZSv4fJ5MAT-ZrZwfcrNWEWa7rd7CJsHSMVq86iF4ZJzOEDo-5w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 421A9B60089; Wed,  8 Nov 2023 14:37:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
In-Reply-To: <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
 <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
Date: Wed, 08 Nov 2023 20:37:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
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
 "Geoff Levand" <geoff@infradead.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "x86@kernel.org" <x86@kernel.org>, "Helge Deller" <deller@gmx.de>,
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
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_113741_335104_49157C38 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBOb3YgOCwgMjAyMywgYXQgMTk6MzEsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4g
TGUgMDgvMTEvMjAyMyDDoCAxMzo1OCwgQXJuZCBCZXJnbWFubiBhIMOpY3JpdMKgOgoKPiBwb3dl
cnBjIGhhcyBmdW5jdGlvbnMgZG9pbmcgbW9yZSBvciBsZXNzIHRoZSBzYW1lLCB0aGV5IGFyZSBj
YWxsZWQgCj4gX19jX2tlcm5lbF9jbG9ja19nZXR0aW1lKCkgYW5kIGFsaWtlIHdpdGggdGhlaXIg
cHJvdG90eXBlcyBzaXRpbmcgaW4gCj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Zkc28vZ2V0
dGltZW9mZGF5LmgKPgo+IFNob3VsZCB0aG9zZSBwcm90b3R5cGVzIGJlIG1vdmVkIHRvIGluY2x1
ZGUvdmRzby9nZXR0aW1lLmggdG9vIGFuZCAKPiBldmVudHVhbGx5IHJlbmFtZWQsIG9yIGFyZSB0
aGV5IGNvbnNpZGVyZWQgdG9vIHBvd2VycGMgc3BlY2lmaWMgPwoKSSBkb24ndCBhY3R1YWxseSBr
bm93LCBteSBpbml0aWFsIGludGVycHJldGF0aW9uIHdhcyB0aGF0CnRoZXNlIGZ1bmN0aW9uIG5h
bWVzIGFyZSBwYXJ0IG9mIHRoZSB1c2VyIEFCSSBmb3IgdGhlIHZkc28sCmJ1dCBJIG5ldmVyIGxv
b2tlZCBjbG9zZWx5IGVub3VnaCBhdCBob3cgdmRzbyB3b3JrcyB0bwpiZSBzdXJlIHdoYXQgdGhl
IGFjdHVhbCBBQkkgaXMuCgpJZiBfX2Nfa2VybmVsX2Nsb2NrX2dldHRpbWUoKSBldGMgYXJlIG5v
dCBwYXJ0IG9mIHRoZSB1c2VyLWZhY2luZwpBQkksIEkgdGhpbmsgcmVuYW1pbmcgdGhlbSBmb3Ig
Y29uc2lzdGVuY3kgd2l0aCB0aGUgb3RoZXIKYXJjaGl0ZWN0dXJlcyB3b3VsZCBiZSBiZXN0LgoK
ICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
