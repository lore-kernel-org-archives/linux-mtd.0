Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377BCC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh0x+oXmSirjRGH9RuUrOjPh7RBcyeIhc3sX5yGOWJs=; b=Yl0UMrU//C1JK/
	E5+0KEIzcpL45Q8ejF6+/xXp2wu4OXNKpLltEq2WO7QWwUJLMqKp6FzEhrYwlN9oDxd8iWt5/nqiq
	aZHooq2KFe741IHOnmCA+fu9V1gHNKAnNBL/JPZ9d/VQBVE2+mixw+QQT8/AzImfanAYJYeAqYQx0
	KDHh02vIdJc376wOyKlbXdWUjLgyxZCs/ry6zTjqmIULwpVzaHzYZDUyTpsSV6Ep80Wrp1iNp7sN5
	dQeKcEymQ/y8c5l24+jqLqujlNDQwbKUVE4du59wri5OV9doCiUc+TlekRcMVPjsbB7+JV+r78lXi
	MdFNMilYgrxnaCyE1lYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0pO7-004i6K-16;
	Wed, 08 Nov 2023 20:42:59 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0pO2-004i5S-18;
	Wed, 08 Nov 2023 20:42:55 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b3f938331fso81051b6e.1;
        Wed, 08 Nov 2023 12:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699476173; x=1700080973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYbfzdavLbBO2X96qC9Jj/xBig9KkpEQ+EQytSx8qtw=;
        b=rnnxgb6i40WT9Qm+/oFqX5IhTBuCYJSV0uIHgRVUitvaoxnnFZ8VZ9vEZ3karU1rzV
         mC2IDiI4iUQNLRJdL3+F0uVO0sBYF7BhWTR+/P5HrSdbQRwzw57FsljaXMmjs+0iqxW4
         l6SzEwPvd+3JBlpQLMowqpvpl+kavW68+fO+hNKYXdwAsJUpkq+eBBJBS43TW8pBTO7s
         9vs/5MGtDZV/ISSyTdkn21DEdAIfcJbn1MaQp5nvkbZzavepkwJRufRwomXZObywz0Gj
         nZ//PBv2Y4ES6UBreuMdIn79n0ViAhQovd/9ohzOVB8TES78dYWBkBeCHQ1vfNkpQaPK
         IQ8g==
X-Gm-Message-State: AOJu0YyW6TFKRS5/hZNSPeiHJ4e2dxJvY5fTwmluPyHqmVCMgmtAI+ip
	7cwOHXZvSJ+1M9OXIIReOlbQuB9k1Ksd4g==
X-Google-Smtp-Source: AGHT+IE98rSrjepM8rVbW7Sa3eqxroZyO59+7uv4gLWdlzVfUsodmAFQxIRKnDisi13NrarQ9mNrrw==
X-Received: by 2002:a05:6808:14c3:b0:3ad:af40:2831 with SMTP id f3-20020a05680814c300b003adaf402831mr3917468oiw.21.1699476172898;
        Wed, 08 Nov 2023 12:42:52 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id r6-20020a056870734600b001eb684b9347sm434138oal.44.2023.11.08.12.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 12:42:52 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b587bd1a63so619946b6e.1;
        Wed, 08 Nov 2023 12:42:51 -0800 (PST)
X-Received: by 2002:a81:4756:0:b0:59f:699b:c3b3 with SMTP id
 u83-20020a814756000000b0059f699bc3b3mr5987326ywa.0.1699476150732; Wed, 08 Nov
 2023 12:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-11-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-11-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 21:42:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, 
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
X-CRM114-CacheID: sfid-20231108_124254_388589_0B46DC0D 
X-CRM114-Status: GOOD (  22.69  )
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

SGkgQXJuZCwKCk9uIFdlZCwgTm92IDgsIDIwMjMgYXQgMjowMeKAr1BNIEFybmQgQmVyZ21hbm4g
PGFybmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KPgo+IE1pY3JvYmxhemUgcnVucyBpbnRvIGEgc2luZ2xlIC1XbWlzc2luZy1wcm90b3R5
cGVzIHdhcm5pbmcgd2hlbiB0aGF0IGlzCj4gZW5hYmxlZDoKPgo+IGFyY2gvbWljcm9ibGF6ZS9r
ZXJuZWwvdHJhcHMuYzoyMTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICd0
cmFwX2luaXQnIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IEluY2x1ZGUgdGhlIHJpZ2h0IGhl
YWRlciB0byBhdm9pZCB0aGlzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gIGFyY2gvYWxwaGEva2VybmVs
L3RyYXBzLmMgICAgICB8IDEgKwo+ICBhcmNoL2Nza3kvaW5jbHVkZS9hc20vdHJhcHMuaCAgfCAy
IC0tCj4gIGFyY2gvY3NreS9rZXJuZWwvdHJhcHMuYyAgICAgICB8IDEgKwo+ICBhcmNoL202OGsv
Y29sZGZpcmUvdmVjdG9ycy5jICAgfCAzICstLQo+ICBhcmNoL202OGsvY29sZGZpcmUvdmVjdG9y
cy5oICAgfCAzIC0tLQoKQWgsIHNvIHRoaXMgaXMgd2hlcmUgdGhlIG02OGsgY2hhbmdlcyBsaXN0
ZWQgaW4gdGhlIGNvdmVyIGxldHRlciBhcmUKaGlkaW5nIDstKQoKPiAgYXJjaC9taWNyb2JsYXpl
L2tlcm5lbC90cmFwcy5jIHwgMSArCj4gIGFyY2gvc3BhcmMva2VybmVsL3RyYXBzXzMyLmMgICB8
IDEgKwo+ICBhcmNoL3NwYXJjL2tlcm5lbC90cmFwc182NC5jICAgfCAxICsKPiAgYXJjaC94ODYv
aW5jbHVkZS9hc20vdHJhcHMuaCAgIHwgMSAtCj4gIGFyY2gveDg2L2tlcm5lbC90cmFwcy5jICAg
ICAgICB8IDEgKwo+ICAxMCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL202OGsvY29sZGZpcmUvdmVjdG9ycy5o
CgpPYnZpb3VzbHkgdGhlIG5vbi1taWNyb2JsYXplIGNoYW5nZXMgc2hvdWxkIGJlIHNwdW4gb2Zm
IGluIHNlcGFyYXRlCnBhdGNoZXMuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
