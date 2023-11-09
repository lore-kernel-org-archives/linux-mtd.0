Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FA7C4167D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yApRfeN3VhSmz3Vh6Jw7d7shWObTtav6fxfjECojZ0=; b=j4C0b6pUN5ziHf
	cGQag3BclQNWzhZMSgFZ5limznKLQ/v3ZXkrrxu0n/Aoq+mQ5hLwBexQU/NWuJvOFk4dGMWmNQdW6
	OBPkl3gFR1fuIERfam2ZPblLL9cFf6dr8A8pVlgr7iJDMvs8ovcoN0M4vJjdh9QSNVKVbY74h0xwz
	QLRxYmhBSzRgqHYTmjHalQHkAEVv89bLx0Zmzjb3wLy0ah8itOPzFE+6j/7gc96xk1Led+nlGIryf
	spXTe4kNkhJmHBLDb35EwMMpXhyET3PyzRnnPTaf+hfNZ0tor8XAbsYeV6l00swY3PD5+bDgQyvBp
	KlKCbd/ZL3uYwvbHY8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r144R-006J53-19;
	Thu, 09 Nov 2023 12:23:39 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r144M-006J33-0z;
	Thu, 09 Nov 2023 12:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699532610;
	bh=R2IIgl4ZRFgwipCQ4ZBWquxZCbtnLxeQT8yMzVcSClk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JOE+Y96nQb0g0fD7YjgIsTtXOrsQ0zdJ9Xit6bae239vdgrtE8Xe20tGEjOEwp6b5
	 bBGasTtN2qhciM6Vxj5gO1APMLHXfhhNabxTTxDpDoDz6AXcIv0hdu9+rRXuZNmSj3
	 PriUuPEOny5OCaNxYhuQeMYyhW0D7Uuip11fA5kii4KmxM9zaRV2MnEviCDpMHy6zq
	 fUfZ9elCA6bj44/a3P1CQqNaCruTVzrNA2B2UxDQEd/EBpaSM5DHluHgXy74J1JLYp
	 rlgnpTfcT5fdD0htnPYkbVFENF7DqxPzxI5N3NUPYBgm/lUlPDoiySV3dJVovZ01Br
	 M0UtCQNJ+RaEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SR1MD6jtmz4wd2;
	Thu,  9 Nov 2023 23:23:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Arnd
 Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro
 Yamada <masahiroy@kernel.org>, "linux-kbuild@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>
Cc: Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, guoren <guoren@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Michal Simek
 <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh
 Nguyen <dinguyen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Geoff
 Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, Heiko
 Carstens <hca@linux.ibm.com>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo
 Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Helge Deller
 <deller@gmx.de>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, David Woodhouse
 <dwmw2@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil
 S
 Keshavamurthy <anil.s.keshavamurthy@intel.com>, Kees Cook
 <keescook@chromium.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, "linux-alpha@vger.kernel.org"
 <linux-alpha@vger.kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Netdev
 <netdev@vger.kernel.org>, "linux-parisc@vger.kernel.org"
 <linux-parisc@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-bcachefs@vger.kernel.org"
 <linux-bcachefs@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
In-Reply-To: <886df4e4-9fc2-ca52-e7e9-53688e6e821a@csgroup.eu>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
 <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
 <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
 <87o7g3qlf5.fsf@mail.lhotse>
 <886df4e4-9fc2-ca52-e7e9-53688e6e821a@csgroup.eu>
Date: Thu, 09 Nov 2023 23:23:20 +1100
Message-ID: <87il6bqfnr.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_042334_629165_AB6EA76B 
X-CRM114-Status: GOOD (  17.21  )
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

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6Cj4g
TGUgMDkvMTEvMjAyMyDDoCAxMToxOCwgTWljaGFlbCBFbGxlcm1hbiBhIMOpY3JpdMKgOgo+PiAi
QXJuZCBCZXJnbWFubiIgPGFybmRAYXJuZGIuZGU+IHdyaXRlczoKPj4+IE9uIFdlZCwgTm92IDgs
IDIwMjMsIGF0IDE5OjMxLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+IExlIDA4LzExLzIw
MjMgw6AgMTM6NTgsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4+Cj4+Pj4gcG93ZXJwYyBo
YXMgZnVuY3Rpb25zIGRvaW5nIG1vcmUgb3IgbGVzcyB0aGUgc2FtZSwgdGhleSBhcmUgY2FsbGVk
Cj4+Pj4gX19jX2tlcm5lbF9jbG9ja19nZXR0aW1lKCkgYW5kIGFsaWtlIHdpdGggdGhlaXIgcHJv
dG90eXBlcyBzaXRpbmcgaW4KPj4+PiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdmRzby9nZXR0
aW1lb2ZkYXkuaAo+Pj4+Cj4+Pj4gU2hvdWxkIHRob3NlIHByb3RvdHlwZXMgYmUgbW92ZWQgdG8g
aW5jbHVkZS92ZHNvL2dldHRpbWUuaCB0b28gYW5kCj4+Pj4gZXZlbnR1YWxseSByZW5hbWVkLCBv
ciBhcmUgdGhleSBjb25zaWRlcmVkIHRvbyBwb3dlcnBjIHNwZWNpZmljID8KPj4+Cj4+PiBJIGRv
bid0IGFjdHVhbGx5IGtub3csIG15IGluaXRpYWwgaW50ZXJwcmV0YXRpb24gd2FzIHRoYXQKPj4+
IHRoZXNlIGZ1bmN0aW9uIG5hbWVzIGFyZSBwYXJ0IG9mIHRoZSB1c2VyIEFCSSBmb3IgdGhlIHZk
c28sCj4+PiBidXQgSSBuZXZlciBsb29rZWQgY2xvc2VseSBlbm91Z2ggYXQgaG93IHZkc28gd29y
a3MgdG8KPj4+IGJlIHN1cmUgd2hhdCB0aGUgYWN0dWFsIEFCSSBpcy4KPj4gCj4+IEFGQUlLIHRo
ZSBBQkkgaXMganVzdCB0aGUgc3ltYm9scyB3ZSBleHBvcnQsIGFzIGRlZmluZWQgaW4gdGhlIGxp
bmtlcgo+PiBzY3JpcHQ6Cj4+IAo+PiAvKgo+PiAgICogVGhpcyBjb250cm9scyB3aGF0IHN5bWJv
bHMgd2UgZXhwb3J0IGZyb20gdGhlIERTTy4KPj4gICAqLwo+PiBWRVJTSU9OCj4+IHsKPj4gCVZE
U09fVkVSU0lPTl9TVFJJTkcgewo+PiAJZ2xvYmFsOgo+PiAJCV9fa2VybmVsX2dldF9zeXNjYWxs
X21hcDsKPj4gCQlfX2tlcm5lbF9nZXR0aW1lb2ZkYXk7Cj4+IAkJX19rZXJuZWxfY2xvY2tfZ2V0
dGltZTsKPj4gCQlfX2tlcm5lbF9jbG9ja19nZXRyZXM7Cj4+IAkJX19rZXJuZWxfZ2V0X3RiZnJl
cTsKPj4gCQlfX2tlcm5lbF9zeW5jX2RpY2FjaGU7Cj4+IAkJX19rZXJuZWxfc2lndHJhbXBfcnQ2
NDsKPj4gCQlfX2tlcm5lbF9nZXRjcHU7Cj4+IAkJX19rZXJuZWxfdGltZTsKPj4gCj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC90cmVlL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby92ZHNvNjQubGRzLlM/aD12Ni42JiNu
MTE3Cj4+IAo+Pj4gSWYgX19jX2tlcm5lbF9jbG9ja19nZXR0aW1lKCkgZXRjIGFyZSBub3QgcGFy
dCBvZiB0aGUgdXNlci1mYWNpbmcKPj4+IEFCSSwgSSB0aGluayByZW5hbWluZyB0aGVtIGZvciBj
b25zaXN0ZW5jeSB3aXRoIHRoZSBvdGhlcgo+Pj4gYXJjaGl0ZWN0dXJlcyB3b3VsZCBiZSBiZXN0
Lgo+PiAKPj4gVGhlIF9fYyBzeW1ib2xzIGFyZSBub3QgcGFydCBvZiB0aGUgQUJJLCBzbyB3ZSBj
b3VsZCByZW5hbWUgdGhlbS4KPj4gCj4+IEF0IHRoZSBtb21lbnQgdGhvdWdoIHRoZXkgZG9uJ3Qg
aGF2ZSB0aGUgc2FtZSBwcm90b3R5cGUgYXMgdGhlIGdlbmVyaWMKPj4gdmVyc2lvbnMsIGJlY2F1
c2Ugd2UgZmluZCB0aGUgVkRTTyBkYXRhIGluIGFzbSBhbmQgcGFzcyBpdCB0byB0aGUgQwo+PiBm
dW5jdGlvbnMsIGVnOgo+PiAKPj4gaW50IF9fY19rZXJuZWxfZ2V0dGltZW9mZGF5KHN0cnVjdCBf
X2tlcm5lbF9vbGRfdGltZXZhbCAqdHYsIHN0cnVjdCB0aW1lem9uZSAqdHosCj4+IAkJCSAgICBj
b25zdCBzdHJ1Y3QgdmRzb19kYXRhICp2ZCk7Cj4+IAo+PiBJIHRoaW5rIHdlIGNhbiByZXdvcmsg
dGhhdCB0aG91Z2gsIGJ5IGltcGxlbWVudGluZwo+PiBfX2FyY2hfZ2V0X3Zkc29fZGF0YSgpIGFu
ZCBnZXR0aW5nIHRoZSB2ZHNvX2RhdGEgaW4gQy4gVGhlbiB3ZSdkIGJlIGFibGUKPj4gdG8gc2hh
cmUgdGhlIHByb3RvdHlwZXMuCj4KPiBJIHRoaW5rIGl0IHdvdWxkIG5vdCBhIGJlZW4gZ29vZCBp
ZGVhLCBpdCB3b3VsZCBiZSBsZXNzIHBlcmZvcm1hbnQsIGZvciAKPiBleHBsYW5hdGlvbiBzZWUg
Y29tbWl0IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWU4NzZmMGI2OWRjOTkzZTg2Y2E3Nzk1ZTYz
ZTk4Mzg1YWE5YTdlZjMKCkFoIHRoYW5rcy4gSSB3YXMgd29uZGVyaW5nIHdoeSB5b3UgaGFkIGRv
bmUgaXQgaW4gYXNtLgoKSXQncyBhIHBpdHkgYnV0IHlvdSdyZSByaWdodCB0aGF0J3MgcHJvYmFi
bHkgYSBtZWFzdXJhYmxlIHBlcmZvcm1hbmNlCmhpdCBmb3Igc29tZSBvZiB0aG9zZSBjYWxscy4K
CmNoZWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
