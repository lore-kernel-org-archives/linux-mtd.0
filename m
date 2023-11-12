Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7955C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Nov 2023 04:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59q9Bb/c9Z1K8JnqthI30EnZ6xmd8QvUgmdAAyqontM=; b=tORSWR1bUo9zID
	EokS8JGNZtkGov7dR08+F+kHSNQ05uoUpzZCd6ThderQYUbCfwX5K/LpAT+mafaibqSOmv/kL0jEo
	zHbClPEE446tT+93ijb09hcPFjtfx+tKrb/ko0mPp8hIJWq4maQCuDd6X2hQAE+ZXj5j0rupI93wC
	dfhDvJ6buOjWYNH9vzNJGXp8mzL3S3VnXC0keeBSRncNIP41OExT7dgK+i4WovTg9zeIPD0HM2L+c
	p/jAcQSQ5QfEcMJwYuYkRbasZ+FlLMoO1EKCQAQVa1cmHNE0q1R9XcNVclRTOqEC81qEJ9lUm75sW
	cAadeGqI90syIq/VX2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r21zX-00BerK-0z;
	Sun, 12 Nov 2023 04:22:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r21zQ-00Beqf-2f;
	Sun, 12 Nov 2023 04:22:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D65B60C02;
	Sun, 12 Nov 2023 04:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC1EC433AB;
	Sun, 12 Nov 2023 04:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699762947;
	bh=FJL4JNEf9Nr1DoflQgnKi0tfP9lyYuVjCmmad2iv8TA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T9IHCfRSJCCiMNO/B2lnKhTDg7vzSLaSof7ydAGyTQokfwHc0UzVrA9vy+3S4mFHO
	 Mpc/gtpML1wYUcpX2bPDBy9pPY5QgOuHgc/QzsPUa8mOygZ56/qPbpHlwwajazH46U
	 1n3ZTA/MJFWE7HGwSGp8kR738Ey0K/PgQf5/mwzV91s5bTFFTjRfOkgcW5rDr+NefW
	 70g/doUyhEQMNRVBFV9M32HHKhYl3CB4VPe3qN0mLdZDr/+kodq44fJDaQC3vcGEqX
	 U3rqX7e9UEtc3XjfnoI7xoUubZMR0tX2Ciz3rIWEnZ55X4l4ocVhndGYJ7soDuUgJ2
	 X1txJX8483BHg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c5071165d5so12180191fa.0;
        Sat, 11 Nov 2023 20:22:27 -0800 (PST)
X-Gm-Message-State: AOJu0YwEmCWHuiYPjlP+mwUTkCeNr+4ZEY+dP7DsZlnrkJWy5/PxCMJF
	7U9mRlGWMyM5uN8HpsM3Q7Iq9LBq4ufMT2GCP6s=
X-Google-Smtp-Source: AGHT+IGKtBb4zpepnAgJWTPQf4OFL8Yxg0IypTLD7L38xtqORdph/fQnU2/w9oi/MfemCZAy/+rZ76w/2ug+y+JaBNQ=
X-Received: by 2002:a05:6402:3d9:b0:53f:731a:e513 with SMTP id
 t25-20020a05640203d900b0053f731ae513mr2174574edw.25.1699762924720; Sat, 11
 Nov 2023 20:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-13-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-13-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Nov 2023 23:21:53 -0500
X-Gmail-Original-Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Subject: Re: [PATCH 12/22] csky: fix arch_jump_label_transform_static override
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Geoff Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, Helge Deller <deller@gmx.de>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, David Woodhouse <dwmw2@infradead.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Kees Cook <keescook@chromium.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Al Viro <viro@zeniv.linux.org.uk>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, netdev@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_202228_951613_DDB98135 
X-CRM114-Status: GOOD (  19.50  )
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

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCA4OjAy4oCvQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4K
PiBUaGUgYXJjaF9qdW1wX2xhYmVsX3RyYW5zZm9ybV9zdGF0aWMoKSBmdW5jdGlvbiBpbiBjc2t5
IHdhcyBvcmlnaW5hbGx5IG1lYW50IHRvCj4gb3ZlcnJpZGUgdGhlIGdlbmVyaWMgX193ZWFrIGZ1
bmN0aW9uLCBidXQgdGhhdCBnb3QgY2hhbmdlZCB0byBhbiAjaWZuZGVmIGNoZWNrLgo+Cj4gVGhp
cyBzaG93ZWQgdXAgYXMgYSBtaXNzaW5nLXByb3RvdHlwZSB3YXJuaW5nOgo+IGFyY2gvY3NreS9r
ZXJuZWwvanVtcF9sYWJlbC5jOjQzOjY6IGVycm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
ICdhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3JtX3N0YXRpYycgWy1XZXJyb3I9bWlzc2luZy1wcm90
b3R5cGVzXQo+Cj4gQ2hhbmdlIHRoZSBtZXRob2QgdG8gdXNlIHRoZSBuZXcgbWV0aG9kIG9mIGhh
dmluZyBhICNkZWZpbmUgYW5kIGEgcHJvdG90eXBlCj4gZm9yIHRoZSBnbG9iYWwgZnVuY3Rpb24u
Cj4KPiBGaXhlczogN2U2YjlkYjI3ZGU5ICgianVtcF9sYWJlbDogbWFrZSBpbml0aWFsIE5PUCBw
YXRjaGluZyB0aGUgc3BlY2lhbCBjYXNlIikKPiBGaXhlczogNGU4YmI0YmE1YTU1ICgiY3NreTog
QWRkIGp1bXAtbGFiZWwgaW1wbGVtZW50YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9qdW1w
X2xhYmVsLmggfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oIGIvYXJjaC9j
c2t5L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaAo+IGluZGV4IGQ0ODhiYTYwODRiYy4uOThhM2Y0
YjE2OGJkIDEwMDY0NAo+IC0tLSBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9qdW1wX2xhYmVsLmgK
PiArKysgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oCj4gQEAgLTQzLDUgKzQz
LDEwIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBhcmNoX3N0YXRpY19icmFuY2hfanVt
cChzdHJ1Y3Qgc3RhdGljX2tleSAqa2V5LAo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPgo+
ICtlbnVtIGp1bXBfbGFiZWxfdHlwZTsKPiArdm9pZCBhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3Jt
X3N0YXRpYyhzdHJ1Y3QganVtcF9lbnRyeSAqZW50cnksCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBlbnVtIGp1bXBfbGFiZWxfdHlwZSB0eXBlKTsKPiArI2RlZmluZSBh
cmNoX2p1bXBfbGFiZWxfdHJhbnNmb3JtX3N0YXRpYyBhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3Jt
X3N0YXRpYwo+ICsKPiAgI2VuZGlmICAvKiBfX0FTU0VNQkxZX18gKi8KPiAgI2VuZGlmIC8qIF9f
QVNNX0NTS1lfSlVNUF9MQUJFTF9IICovCj4gLS0KPiAyLjM5LjIKPgo+ClRoYW5rIHlvdSEKUmV2
aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
