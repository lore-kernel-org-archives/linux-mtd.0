Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27EEC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jan 2024 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tovxo2b2+BIazWZ09hdMyt2qMEYAOogIKTCsysB2vMo=; b=dhKDds+NU/dS+P
	3gjfTWp3G/MoQHOtkSBHmrIP72MBMo96lnAKU6l9cYWHSZSmZI/8iID6wi0z9ZPd3596Fg7h92KLR
	vx/2vZ5DgxtAdWsj/7whVa4hZIdUlb8YFRDMfTjJq4uODmTgKJSMQUnbokCooco+iK+I0tzqQKDhq
	3ALDYO9/Rk9MRIp1z4axXUh6zcsKzSFeEtcFwkrA8fIvPYJxvnttwpSEKXWmARA9DGqq8TTV89IDZ
	6WMPipEWpZzq0O4jD0Ep1LfcXmnBw6w+ZUJ6le5qayJx6fQLkc7vKWGfNXu/IhUWsTcTTGdMcz/C6
	mhYLgsXJ1JxP6sNLQPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUVH-00AouG-0X;
	Wed, 10 Jan 2024 09:04:03 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUVB-00Aos1-2R;
	Wed, 10 Jan 2024 09:03:59 +0000
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-68009cb4669so25686986d6.1;
        Wed, 10 Jan 2024 01:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704877435; x=1705482235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2Qk0JS/X/M+iSFJkteLpcJbyzGhmpZqpSZNg5QY+TE=;
        b=R4WKDfLeE5hk+3KQkq74j0aZr208y2SiNgrhlX65KLbuJ/N0u3T6oG2JQC6Wdio+Gx
         IJtCUyYMINJZ2dKkgLEnZzXeZjpPLVCD6yLSRWgyX2naXlwsgHdc+7dR2Jet3twvwUBk
         OszYhaJhSrr6SrF7WalJqcacP7onUfX59RAgr0fEOLO0ASryDFqVJs2a9WcNO6uWC3L1
         v5vCdB5bJTgoBxLMyUGeZ7Fd/9CQuDHq+TE3NeYoEmXPxhieiPo8lmMefxsPlZTFD+KY
         037tp+DRnFFqkL1p3shWRhl3mq4soeuL6WBiAB7xmUVrXH7bGQ13jqWHBTGiXTjKIeRw
         w2aA==
X-Gm-Message-State: AOJu0Yw/uetB1UfHgz1j/lhNWfzaYqDweznF8YVTAC8kXESKfT/zijJC
	A+/dW5nJnOdH5Eqh7itqLJyeQIIVr8jjwAmm
X-Google-Smtp-Source: AGHT+IH9pRMRNB25wdUS036NybSu6NIBaIcOu5ECsq/W6ubh4h/CqbdOtUYlc7VqRyl+hcZ4wFwprw==
X-Received: by 2002:a05:6214:e45:b0:67f:940a:ed1c with SMTP id o5-20020a0562140e4500b0067f940aed1cmr919260qvc.66.1704877434707;
        Wed, 10 Jan 2024 01:03:54 -0800 (PST)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id d10-20020a0cc68a000000b00680613267d5sm1560671qvj.115.2024.01.10.01.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 01:03:54 -0800 (PST)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-67f8d9fe99fso26710086d6.2;
        Wed, 10 Jan 2024 01:03:54 -0800 (PST)
X-Received: by 2002:a81:9843:0:b0:5fa:7e0a:b133 with SMTP id
 p64-20020a819843000000b005fa7e0ab133mr127729ywg.79.1704877413506; Wed, 10 Jan
 2024 01:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-9-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-9-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jan 2024 10:03:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Message-ID: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Subject: Re: [PATCH 08/22] [v2] arch: consolidate arch_irq_work_raise prototypes
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
	linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Alexander Gordeev <agordeev@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_010357_797784_9A66F904 
X-CRM114-Status: GOOD (  19.78  )
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

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCAyOjAx4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJu
ZWwub3JnPiB3cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4g
VGhlIHByb3RvdHlwZSB3YXMgaGlkZGVuIGluIGFuICNpZmRlZiBvbiB4ODYsIHdoaWNoIGNhdXNl
cyBhIHdhcm5pbmc6Cj4KPiBrZXJuZWwvaXJxX3dvcmsuYzo3MjoxMzogZXJyb3I6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3IgJ2FyY2hfaXJxX3dvcmtfcmFpc2UnIFstV2Vycm9yPW1pc3Npbmct
cHJvdG90eXBlc10KClRoaXMgaXNzdWUgaXMgbm93IHByZXNlbnQgdXBzdHJlYW0uCgo+IFNvbWUg
YXJjaGl0ZWN0dXJlcyBoYXZlIGEgd29ya2luZyBwcm90b3R5cGUsIHdoaWxlIG90aGVycyBkb24n
dC4KPiBGaXggdGhpcyBieSBwcm92aWRpbmcgaXQgaW4gb25seSBvbmUgcGxhY2UgdGhhdCBpcyBh
bHdheXMgdmlzaWJsZS4KPgo+IEFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgo+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPiBBY2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRlciBHb3JkZWV2IDxhZ29yZGVldkBsaW51eC5pYm0uY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpUZXN0ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
