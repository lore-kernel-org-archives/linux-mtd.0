Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BEBC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ATPirL9oH/Jh+4PvMpKoQkdm9Kfh94Casg3BXf12Hc=; b=0jeLPwEZfKRi5F
	A/UYQwUW78VQdRX1vKVdR+2wlV4E0D5IivQwrSy/B3lqDFLDkEiBtrf8r6NU1yQIcpEvFmEWVxb4m
	tEuY7EH1du55yep29eo9wgKNfmmsVTBgSyXIsxq8AjSPcCjA4uWQQ6AjR3Q2ilXBEZ3F8cTnKwLz/
	06LRxZC8FDS5AmHmZldgDOmjM+tj+iIPS/O+A0I8z90mGOFqen8dLDjndorXyg8t0FUPGQ/fIxIjp
	+WVdE2SwxfzNdihUN5J62Mjq8trANGWXFRY1xeb6zv4VV0mKfOCehegEC39BN/LS6WlM7w3hvUkE4
	l+14lwvmWfLXLGCeMiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r128J-005vIx-1D;
	Thu, 09 Nov 2023 10:19:31 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r128E-005vFi-1t;
	Thu, 09 Nov 2023 10:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699525158;
	bh=Z7EokJ1UdALEP2SiDB7dbNsZW0NCKV/oetJXlal69iM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RkjdJPjVAbZzNEKAPr8JL0kTpGz0UCZJIdVVndOCvDWZpxSw6ec518RfWPQG/IkiI
	 3U4qG8PeFJgQ1oMBVz7fnILZyAKQ1zplGG4nJux7vUUQsPp8SkZBfT889gzvIRdpmw
	 WUQ+WW+9cu902RASJ4kEWsLYh3rMgChUmz1/ldOW9QzCrZm2l5oTa8LM/dau5laC33
	 KuCy2ECFzxgm0lOmPhhDCsKGLIbtABjZozYU/ee/LMkGnCNdVshd/3IasKaSCJFT9/
	 KHxNE3JhUBjryUMosmrOQrOBshaRABEKKf3tZkVHzFqfXwk5cxkuGy4gRH9dIH1XGz
	 jvo7A0kAqYwOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SQybm4Pg2z4xhd;
	Thu,  9 Nov 2023 21:19:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Arnd Bergmann <arnd@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
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
 Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Helge
 Deller <deller@gmx.de>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, David Woodhouse
 <dwmw2@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil
 S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Kees Cook
 <keescook@chromium.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
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
In-Reply-To: <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
 <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
 <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
Date: Thu, 09 Nov 2023 21:18:54 +1100
Message-ID: <87o7g3qlf5.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021926_909424_73E92EA7 
X-CRM114-Status: GOOD (  16.55  )
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

IkFybmQgQmVyZ21hbm4iIDxhcm5kQGFybmRiLmRlPiB3cml0ZXM6Cj4gT24gV2VkLCBOb3YgOCwg
MjAyMywgYXQgMTk6MzEsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+IExlIDA4LzExLzIwMjMg
w6AgMTM6NTgsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPgo+PiBwb3dlcnBjIGhhcyBmdW5j
dGlvbnMgZG9pbmcgbW9yZSBvciBsZXNzIHRoZSBzYW1lLCB0aGV5IGFyZSBjYWxsZWQgCj4+IF9f
Y19rZXJuZWxfY2xvY2tfZ2V0dGltZSgpIGFuZCBhbGlrZSB3aXRoIHRoZWlyIHByb3RvdHlwZXMg
c2l0aW5nIGluIAo+PiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXku
aAo+Pgo+PiBTaG91bGQgdGhvc2UgcHJvdG90eXBlcyBiZSBtb3ZlZCB0byBpbmNsdWRlL3Zkc28v
Z2V0dGltZS5oIHRvbyBhbmQgCj4+IGV2ZW50dWFsbHkgcmVuYW1lZCwgb3IgYXJlIHRoZXkgY29u
c2lkZXJlZCB0b28gcG93ZXJwYyBzcGVjaWZpYyA/Cj4KPiBJIGRvbid0IGFjdHVhbGx5IGtub3cs
IG15IGluaXRpYWwgaW50ZXJwcmV0YXRpb24gd2FzIHRoYXQKPiB0aGVzZSBmdW5jdGlvbiBuYW1l
cyBhcmUgcGFydCBvZiB0aGUgdXNlciBBQkkgZm9yIHRoZSB2ZHNvLAo+IGJ1dCBJIG5ldmVyIGxv
b2tlZCBjbG9zZWx5IGVub3VnaCBhdCBob3cgdmRzbyB3b3JrcyB0bwo+IGJlIHN1cmUgd2hhdCB0
aGUgYWN0dWFsIEFCSSBpcy4KCkFGQUlLIHRoZSBBQkkgaXMganVzdCB0aGUgc3ltYm9scyB3ZSBl
eHBvcnQsIGFzIGRlZmluZWQgaW4gdGhlIGxpbmtlcgpzY3JpcHQ6CgovKgogKiBUaGlzIGNvbnRy
b2xzIHdoYXQgc3ltYm9scyB3ZSBleHBvcnQgZnJvbSB0aGUgRFNPLgogKi8KVkVSU0lPTgp7CglW
RFNPX1ZFUlNJT05fU1RSSU5HIHsKCWdsb2JhbDoKCQlfX2tlcm5lbF9nZXRfc3lzY2FsbF9tYXA7
CgkJX19rZXJuZWxfZ2V0dGltZW9mZGF5OwoJCV9fa2VybmVsX2Nsb2NrX2dldHRpbWU7CgkJX19r
ZXJuZWxfY2xvY2tfZ2V0cmVzOwoJCV9fa2VybmVsX2dldF90YmZyZXE7CgkJX19rZXJuZWxfc3lu
Y19kaWNhY2hlOwoJCV9fa2VybmVsX3NpZ3RyYW1wX3J0NjQ7CgkJX19rZXJuZWxfZ2V0Y3B1OwoJ
CV9fa2VybmVsX3RpbWU7CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28v
dmRzbzY0Lmxkcy5TP2g9djYuNiYjbjExNwoKPiBJZiBfX2Nfa2VybmVsX2Nsb2NrX2dldHRpbWUo
KSBldGMgYXJlIG5vdCBwYXJ0IG9mIHRoZSB1c2VyLWZhY2luZwo+IEFCSSwgSSB0aGluayByZW5h
bWluZyB0aGVtIGZvciBjb25zaXN0ZW5jeSB3aXRoIHRoZSBvdGhlcgo+IGFyY2hpdGVjdHVyZXMg
d291bGQgYmUgYmVzdC4KClRoZSBfX2Mgc3ltYm9scyBhcmUgbm90IHBhcnQgb2YgdGhlIEFCSSwg
c28gd2UgY291bGQgcmVuYW1lIHRoZW0uCgpBdCB0aGUgbW9tZW50IHRob3VnaCB0aGV5IGRvbid0
IGhhdmUgdGhlIHNhbWUgcHJvdG90eXBlIGFzIHRoZSBnZW5lcmljCnZlcnNpb25zLCBiZWNhdXNl
IHdlIGZpbmQgdGhlIFZEU08gZGF0YSBpbiBhc20gYW5kIHBhc3MgaXQgdG8gdGhlIEMKZnVuY3Rp
b25zLCBlZzoKCmludCBfX2Nfa2VybmVsX2dldHRpbWVvZmRheShzdHJ1Y3QgX19rZXJuZWxfb2xk
X3RpbWV2YWwgKnR2LCBzdHJ1Y3QgdGltZXpvbmUgKnR6LAoJCQkgICAgY29uc3Qgc3RydWN0IHZk
c29fZGF0YSAqdmQpOwoKSSB0aGluayB3ZSBjYW4gcmV3b3JrIHRoYXQgdGhvdWdoLCBieSBpbXBs
ZW1lbnRpbmcKX19hcmNoX2dldF92ZHNvX2RhdGEoKSBhbmQgZ2V0dGluZyB0aGUgdmRzb19kYXRh
IGluIEMuIFRoZW4gd2UnZCBiZSBhYmxlCnRvIHNoYXJlIHRoZSBwcm90b3R5cGVzLgoKY2hlZXJz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
