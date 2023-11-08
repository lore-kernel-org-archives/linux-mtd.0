Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CE9C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 21:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZYz4W8JVI3vewgoFJcWy/GL+GSEuzLn4YHm2Vzahkc=; b=yA5wx++N/S04XB
	iW2GWuW64YrJm2Bbr7YBEldRsDrRSVC7nzMAbLGAeCjYM/BqoqxnT5lRkjKyxdFpH7wOc024j7aId
	twHzSdkSne0rtY8Dpl75/HoqueULo1fWXVF0/l5uXMJfdLkIPim4Dr0QvOcVlQjCBI5+Ayywg4DJ7
	XARwRyFDf6/5CZfbqQpvdRE2TVuK8fpfbLHXZlA24WGcNuIemSSJtTc94SmdppAzoSAvKpkCa+U8Y
	Y95XIQ24+20TqYLRqz66lDeomDll8Gw8zS4HB6+/BzwI3TLlM2Uek7xcXw/GP9GfWRGCTBiweTT3k
	Cg/aNYucdWMFnXkYfnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0pmG-004kZk-3D;
	Wed, 08 Nov 2023 21:07:57 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0pmC-004kXU-1X;
	Wed, 08 Nov 2023 21:07:54 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5A16D580918;
	Wed,  8 Nov 2023 16:07:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 08 Nov 2023 16:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1699477661; x=1699484861; bh=D9PBCL8QJKdjrKS2aPJfuUQXeRbWRMeFHOK
	ckMk8fx4=; b=FzEkiJbbsOcjeyoGRwxvz+27m/0EEN52kEtbmSfnSLxjsunhTiL
	NfUpLQ2lMaNQM96rJSWMhX1vu2lvWTmYQ+94rPQoTRikLBiEjVkhx122mvhBFjKQ
	U5TGFlasJtrQz1D7CH1hVXq/4CUXHEmC0SXgOgbsxsmqVBXPjJ6IiWR1L/VYLFZD
	XaGxAnAinQklWeTyoPeeAGtYUUQIZX8H/zBze0un/GO9mbGPspFKceZcmPF+unL4
	kNNYqyz4Nnv3vLyDQfTWJAwW2so0MUevk7DJxqisp5Xl7R8/m+axDeNitBypskfX
	D8Rsn3kpcQJ2fu6hUerp+k7/Bpi8xmjAE2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1699477661; x=1699484861; bh=D9PBCL8QJKdjrKS2aPJfuUQXeRbWRMeFHOK
	ckMk8fx4=; b=LmqNAy3jRW8lY5IcykLYM+OvjkcYQjDv2Cd5j1qdrakTjXXA/j+
	/E3SAMCFGeXJAd+vBXJDuwGp38C0j3EBw7K0I7TFk+KdegquYjjlo+2qe+Ss6fEx
	vTFJPMC1jaxZ1RiQPNLyTH4/PtfJEIBJRBDr+VVRztDGI1MBoVaVcWj5nK9n57lT
	IBiw5NhM15aVUl9nTNk4GEH/jjyPtDc5nRFt1GtJMHbfoOK2CNQf2Dsq4mugP1kK
	dALzlNsXk+kultkDq6XTINxe/wKYr9lcblw8RuAMeZQf5KYd1CJy2yk9Lj+caD2x
	oxDrnMalA2nkjbwEcTlCPYvCvjr0Nrwhw/Q==
X-ME-Sender: <xms:m_hLZRjCM3LJYcd_H3Y5bpOYjbi1yqnza3xT2w7kP2rHPp5sCfzJDA>
    <xme:m_hLZWBQgSaXFHWT19d86A-NgdffQEOdIcOuYzVBH4zvXhu-7j9M2L00zWERZJgRe
    v8hgNLAyXZqY4agMGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduledgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:m_hLZRHRJeNeY1dqiPXQRyfkkAf70-rPEGX-6eg0F6Q137FpjKDzrQ>
    <xmx:m_hLZWS2fm-qbaVb5GtignMLAwFFSwCYf0sAO1wU3h5TQwBje9c7Gg>
    <xmx:m_hLZexERWmFNZFNunigpkMDJerei1oQtEjo173y5fN7JgbzFQPvUQ>
    <xmx:nfhLZaaJuDFNhR3nYwXvLB9jLUndDir4RaYg61Qk7sjjclFK2W-zJg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 48539B60089; Wed,  8 Nov 2023 16:07:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
In-Reply-To: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-11-arnd@kernel.org>
 <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Date: Wed, 08 Nov 2023 22:07:18 +0100
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
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_130752_583464_7B95B6C7 
X-CRM114-Status: GOOD (  16.71  )
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

T24gV2VkLCBOb3YgOCwgMjAyMywgYXQgMjE6NDIsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
Pgo+IE9uIFdlZCwgTm92IDgsIDIwMjMgYXQgMjowMeKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4+Cj4+IE1pY3JvYmxhemUgcnVucyBpbnRvIGEgc2luZ2xlIC1XbWlzc2luZy1wcm90b3R5cGVz
IHdhcm5pbmcgd2hlbiB0aGF0IGlzCj4+IGVuYWJsZWQ6Cj4+Cj4+IGFyY2gvbWljcm9ibGF6ZS9r
ZXJuZWwvdHJhcHMuYzoyMTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICd0
cmFwX2luaXQnIFstV21pc3NpbmctcHJvdG90eXBlc10KPj4KPj4gSW5jbHVkZSB0aGUgcmlnaHQg
aGVhZGVyIHRvIGF2b2lkIHRoaXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4KPj4gIGFyY2gvYWxw
aGEva2VybmVsL3RyYXBzLmMgICAgICB8IDEgKwo+PiAgYXJjaC9jc2t5L2luY2x1ZGUvYXNtL3Ry
YXBzLmggIHwgMiAtLQo+PiAgYXJjaC9jc2t5L2tlcm5lbC90cmFwcy5jICAgICAgIHwgMSArCj4+
ICBhcmNoL202OGsvY29sZGZpcmUvdmVjdG9ycy5jICAgfCAzICstLQo+PiAgYXJjaC9tNjhrL2Nv
bGRmaXJlL3ZlY3RvcnMuaCAgIHwgMyAtLS0KPgo+IEFoLCBzbyB0aGlzIGlzIHdoZXJlIHRoZSBt
NjhrIGNoYW5nZXMgbGlzdGVkIGluIHRoZSBjb3ZlciBsZXR0ZXIgYXJlCj4gaGlkaW5nIDstKQo+
Cj4+ICBhcmNoL21pY3JvYmxhemUva2VybmVsL3RyYXBzLmMgfCAxICsKPj4gIGFyY2gvc3BhcmMv
a2VybmVsL3RyYXBzXzMyLmMgICB8IDEgKwo+PiAgYXJjaC9zcGFyYy9rZXJuZWwvdHJhcHNfNjQu
YyAgIHwgMSArCj4+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90cmFwcy5oICAgfCAxIC0KPj4gIGFy
Y2gveDg2L2tlcm5lbC90cmFwcy5jICAgICAgICB8IDEgKwo+PiAgMTAgZmlsZXMgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvbTY4ay9jb2xkZmlyZS92ZWN0b3JzLmgKPgo+IE9idmlvdXNseSB0aGUgbm9uLW1pY3JvYmxh
emUgY2hhbmdlcyBzaG91bGQgYmUgc3B1biBvZmYgaW4gc2VwYXJhdGUKPiBwYXRjaGVzLgoKSSBt
ZXNzZWQgdXAgb25lIG9mIG15IHJlYmFzZXMgaGVyZSBhbmQgYWNjaWRlbnRhbGx5IHNlbnQKdGhl
IHdyb25nIGNoYW5nZWxvZyB0ZXh0LiBNeSBpbnRlbnRpb24gd2FzIHRvIGhhdmUgdGhlCmNvbWJp
bmVkIHBhdGNoIGJ1dCB3aXRoIHRoaXMgdGV4dDoKCiAgICBhcmNoOiBpbmNsdWRlIGxpbnV4L2Nw
dS5oIGZvciB0cmFwX2luaXQoKSBwcm90b3R5cGUKICAgIAogICAgc29tZSBhcmNoaXRlY3R1cmVz
IHJ1biBpbnRvIGEgLVdtaXNzaW5nLXByb3RvdHlwZXMgd2FybmluZwogICAgZm9yIHRyYXBfaW5p
dCgpCiAgICAKICAgIGFyY2gvbWljcm9ibGF6ZS9rZXJuZWwvdHJhcHMuYzoyMTo2OiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICd0cmFwX2luaXQnIFstV21pc3NpbmctcHJvdG90
eXBlc10KICAgIAogICAgSW5jbHVkZSB0aGUgcmlnaHQgaGVhZGVyIHRvIGF2b2lkIHRoaXMgY29u
c2lzdGVudGx5LCByZW1vdmluZwogICAgdGhlIGV4dHJhIGRlY2xhcmF0aW9ucyBvbiBtNjhrIGFu
ZCB4ODYgdGhhdCB3ZXJlIGFkZGVkIGFzIGxvY2FsCiAgICB3b3JrYXJvdW5kcyBhbHJlYWR5Lgog
ICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKCkkg
bWFkZSB0aGUgc2FtZSBtaXN0YWtlIHdpdGggdGhlICJhcmNoOiBhZGQgZG9fcGFnZV9mYXVsdCBw
cm90b3R5cGVzIgpwYXRjaCB0aGF0IHdhcyBtaXNzaW5nIGFuIGV4cGxhbmF0aW9uLgoKICAgICAg
QXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
