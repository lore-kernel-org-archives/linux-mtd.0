Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF43C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 21:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgTCB6Xr+Nl8Hupr7/E3C0tOTh5qz6v3Sx+jKqwCmtA=; b=r79rVPtg8h+Jsi
	VI8j7CrWE1/VUh2Max/hZUc9ySmuZA3RiTUmCy+RVXZAcfyn6A17U0pCVzjW/DA4qheqh8F7grnZC
	pCBvYOvtqiwj8WIQndTKiBa4JLKfhzyHwOp3gBN79Xax3bCI6UB1No5UFhWmMgCTy0JHwsd7t6f3c
	jsZWfcP/w9RcfpEiAj/3M6UOHTpJwP4o3o/FT65E8F1u3WNKuc1YyRF2KwSpBhFD1E6OTyqzUuWya
	pekmpy+0QDDWz7yjZKosaD9XNlN41jgr662sLC0IukNqeUzXhnitArv2C6IXJmmnctb/O6tjpjntR
	FUJt3LP84KSu2V+eiVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0pp4-004l0p-3A;
	Wed, 08 Nov 2023 21:10:51 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0pp0-004kxx-0Q;
	Wed, 08 Nov 2023 21:10:47 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b566ee5f1dso87756b6e.0;
        Wed, 08 Nov 2023 13:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699477837; x=1700082637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bav5/FGayyEQonBNC4kdS6ICDtnFE4p01QngumR4dg4=;
        b=JQMkdUJ+KI5i4WTB0lIgbNZukHCM/sRcG8kaMc2gHlYb0jqck+slVv+zd1YZxAOX07
         7Yv4S6tfplF6lW08oKQ/WFVHaynQ3PiVq6BVaNgb/RcRbDY9SE2wSzKKag9ZfHJgxQGo
         2HTfp2Yzefv74GZaCJg6kUJ8dIGxCWqjHBT3HX6+YJSby3YYgjBnTDAkC5qwUYTYmCVn
         fw19tZlkVRRRW/7yl4p0HRsUBRrSoT87S7+y3IfYftjeSikN0J7l8cxnL/rrv7ap61aK
         dZTuzGFW5oDC/Mr3ArZoEQtLV/R8kYgPZ221FjtouVHIJlApZM04B9Exu+J6WAOrA5Df
         QXEA==
X-Gm-Message-State: AOJu0Yw/cmQ7dxvwOXIKNE9GkeEHHkDZWbIQRz9dSjJhrYjBPK1qK5H9
	/Pnw/PkQnUNm1gbcel3nwuUnaadV7nu+Iw==
X-Google-Smtp-Source: AGHT+IFewAADDBza8DNV6nHsx3FoKzBzcCOHEN09D5AUQ7dsHGoVEtNxvD4vtiVKdvd/Uh2ElOG27Q==
X-Received: by 2002:a54:4117:0:b0:3b2:e5f2:5a59 with SMTP id l23-20020a544117000000b003b2e5f25a59mr2791126oic.35.1699477836801;
        Wed, 08 Nov 2023 13:10:36 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id h25-20020aca1819000000b003b2ef9778absm2022144oih.46.2023.11.08.13.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 13:10:36 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b5ff072fc4so77967b6e.3;
        Wed, 08 Nov 2023 13:10:36 -0800 (PST)
X-Received: by 2002:a0d:f3c2:0:b0:59b:54b5:7d66 with SMTP id
 c185-20020a0df3c2000000b0059b54b57d66mr2960037ywf.34.1699477816210; Wed, 08
 Nov 2023 13:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-11-arnd@kernel.org>
 <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com> <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
In-Reply-To: <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 22:10:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, guoren <guoren@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Geoff Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
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
	Alexander Viro <viro@zeniv.linux.org.uk>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_131046_173974_0E6A5F1E 
X-CRM114-Status: GOOD (  31.88  )
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

SGkgQXJuZCwKCk9uIFdlZCwgTm92IDgsIDIwMjMgYXQgMTA6MDfigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiBPbiBXZWQsIE5vdiA4LCAyMDIzLCBhdCAyMTo0Miwg
R2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgOCwgMjAyMyBhdCAyOjAx
4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiBGcm9tOiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4+Cj4gPj4gTWljcm9ibGF6ZSBydW5zIGlu
dG8gYSBzaW5nbGUgLVdtaXNzaW5nLXByb3RvdHlwZXMgd2FybmluZyB3aGVuIHRoYXQgaXMKPiA+
PiBlbmFibGVkOgo+ID4+Cj4gPj4gYXJjaC9taWNyb2JsYXplL2tlcm5lbC90cmFwcy5jOjIxOjY6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ3RyYXBfaW5pdCcgWy1XbWlzc2lu
Zy1wcm90b3R5cGVzXQo+ID4+Cj4gPj4gSW5jbHVkZSB0aGUgcmlnaHQgaGVhZGVyIHRvIGF2b2lk
IHRoaXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+Cj4gPj4gIGFyY2gvYWxwaGEv
a2VybmVsL3RyYXBzLmMgICAgICB8IDEgKwo+ID4+ICBhcmNoL2Nza3kvaW5jbHVkZS9hc20vdHJh
cHMuaCAgfCAyIC0tCj4gPj4gIGFyY2gvY3NreS9rZXJuZWwvdHJhcHMuYyAgICAgICB8IDEgKwo+
ID4+ICBhcmNoL202OGsvY29sZGZpcmUvdmVjdG9ycy5jICAgfCAzICstLQo+ID4+ICBhcmNoL202
OGsvY29sZGZpcmUvdmVjdG9ycy5oICAgfCAzIC0tLQo+ID4KPiA+IEFoLCBzbyB0aGlzIGlzIHdo
ZXJlIHRoZSBtNjhrIGNoYW5nZXMgbGlzdGVkIGluIHRoZSBjb3ZlciBsZXR0ZXIgYXJlCj4gPiBo
aWRpbmcgOy0pCj4gPgo+ID4+ICBhcmNoL21pY3JvYmxhemUva2VybmVsL3RyYXBzLmMgfCAxICsK
PiA+PiAgYXJjaC9zcGFyYy9rZXJuZWwvdHJhcHNfMzIuYyAgIHwgMSArCj4gPj4gIGFyY2gvc3Bh
cmMva2VybmVsL3RyYXBzXzY0LmMgICB8IDEgKwo+ID4+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90
cmFwcy5oICAgfCAxIC0KPiA+PiAgYXJjaC94ODYva2VybmVsL3RyYXBzLmMgICAgICAgIHwgMSAr
Cj4gPj4gIDEwIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
PiA+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvbTY4ay9jb2xkZmlyZS92ZWN0b3JzLmgKPiA+
Cj4gPiBPYnZpb3VzbHkgdGhlIG5vbi1taWNyb2JsYXplIGNoYW5nZXMgc2hvdWxkIGJlIHNwdW4g
b2ZmIGluIHNlcGFyYXRlCj4gPiBwYXRjaGVzLgo+Cj4gSSBtZXNzZWQgdXAgb25lIG9mIG15IHJl
YmFzZXMgaGVyZSBhbmQgYWNjaWRlbnRhbGx5IHNlbnQKPiB0aGUgd3JvbmcgY2hhbmdlbG9nIHRl
eHQuIE15IGludGVudGlvbiB3YXMgdG8gaGF2ZSB0aGUKPiBjb21iaW5lZCBwYXRjaCBidXQgd2l0
aCB0aGlzIHRleHQ6Cj4KPiAgICAgYXJjaDogaW5jbHVkZSBsaW51eC9jcHUuaCBmb3IgdHJhcF9p
bml0KCkgcHJvdG90eXBlCj4KPiAgICAgc29tZSBhcmNoaXRlY3R1cmVzIHJ1biBpbnRvIGEgLVdt
aXNzaW5nLXByb3RvdHlwZXMgd2FybmluZwo+ICAgICBmb3IgdHJhcF9pbml0KCkKPgo+ICAgICBh
cmNoL21pY3JvYmxhemUva2VybmVsL3RyYXBzLmM6MjE6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciAndHJhcF9pbml0JyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiAgICAg
SW5jbHVkZSB0aGUgcmlnaHQgaGVhZGVyIHRvIGF2b2lkIHRoaXMgY29uc2lzdGVudGx5LCByZW1v
dmluZwo+ICAgICB0aGUgZXh0cmEgZGVjbGFyYXRpb25zIG9uIG02OGsgYW5kIHg4NiB0aGF0IHdl
cmUgYWRkZWQgYXMgbG9jYWwKPiAgICAgd29ya2Fyb3VuZHMgYWxyZWFkeS4KPgo+ICAgICBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKVGhhdCBtYWtlcyBzZW5z
ZSwgYWx0aG91Z2ggaXQncyBoYXJkIHRvIGNvbWJpbmUgdGhpcyB3aXRoICJteSBwcmVmZXJlbmNl
CndvdWxkIGJlIGZvciB0aGUgcGF0Y2hlcyB0byBtYWtlIGl0IHRocm91Z2ggdGhlIHJlc3BlY3Rp
dmUgc3Vic3lzdGVtCm1haW50YWluZXIgdHJlZXMiLi4uCgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
