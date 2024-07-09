Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED67C3DA41
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2024 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EG7qrtfJlMtSGsilEVpDLnSZgYI0eLBG8JnzdEI9Lc=; b=Q6fNpd+CgXz0Ck
	D5amD2HpZ/0kgS1A9mKMWprtVnYewUYGxhtFuoOBLq6yxqb1+LP9OwSdgoORik009WamwvDb0t/a1
	n0iNHVGbTBTzGLoaKzPK7AubJO2oIf0df6CX89iy9wsSZCoTLqo76PcbNOp/XsFYQcuRpTpdQmYWl
	DhSxP9x3K8HKyIONdru1GREErOZyslx1ez1w3BOPdlkHS3yPdcvWpJE83Vq3N50ns2jBFy2nS1ST7
	NtHmps1ZHokcsQPx6N+Glh4CZ0zwtXdRs4FpUfYJZUjLkU3GSX8+UAo+OWJE7tBVdJRIEJi3xBNWd
	8KEvuHfdtpK6KZQMtP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRBNN-00000007TnH-0hjT;
	Tue, 09 Jul 2024 13:59:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRBNG-00000007Tjq-3XvV;
	Tue, 09 Jul 2024 13:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9170C61350;
	Tue,  9 Jul 2024 13:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DDFC4AF14;
	Tue,  9 Jul 2024 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533557;
	bh=lOu/lBsHlc0T260klipFJ3eC1pkfxWiSQhwcmOXWsVc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OMBqYN+uslxW2al/s9+gRrrahqmKqVwbxAMJYDtN8CWX81snbPwX15dfdtn8Pz0Bb
	 +IovT5mqe8Psr+vz6GaBBc8o9RtQfYU6M4S+2Gx+NUUbpGA/HK3Z8knXugNYi3p6+U
	 78qpneNgjjFgQAu76HOpnjtMqWno1vSL98EX4VAp2LPz4j5pT0E+/44KPIi32WwZPu
	 tjNTXmY9EyO8A+MLcG62SSxJozhu8leZy8nJpLXGcyGV7LP2vcOGKrl4bJWU0XsFYT
	 kF6bpZbhgYDo9J/AqwU/6ppB7azQQTD2wdfdk7DA15FIUWikczGZ3sHsmu1spFGXbn
	 HqYrIHjyJ7isQ==
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso34426635e9.0;
        Tue, 09 Jul 2024 06:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXdlzu/Djfgp7yiwexP20/H9JIlSscHYxgbctMcmvZgewxEJ3i8wEk5pjSNW9iYw4lIS7d5uoKTd/5fz1m+v+1AE3IKS9mmAyx7Adne1lo2jPX+q8Ax5QzX4Oapa22QPtqEno6L9ubNf4cS5CHeXUfpad6
X-Gm-Message-State: AOJu0YzzGgfiHJRkNUzQCM8fRYvPi/dcmXPkpRSMW+hbFLajJBcJEL6T
	X+xZaQ1FfGi0nY4ItSpW03x5zzROA/cRvCyTrFH3115X8ymVyYHl6wbyIcVaSIhV0+bli5hqrf2
	KScRvOzO4Law68uQht+8NRVWGSQ==
X-Google-Smtp-Source: AGHT+IGMENhIgXoK8usdNd4oA5p2Oya5uy5180V2zPL6MX5LWDNpdwwwQ6+gVbUVi74o5Dj052FJFnlAxOODOirsQJA=
X-Received: by 2002:a05:6512:3c8c:b0:52e:9951:7881 with SMTP id
 2adb3069b0e04-52eb99d20b8mr2282487e87.52.1720533535249; Tue, 09 Jul 2024
 06:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
 <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
 <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
 <241a4cf9830b0118f01e8fcf2853c62527636049.camel@maquefel.me> <jyvlqfvqn5bp3jmvxvwyrcqmihjohuq3o757mfph7x37kbwvtq@gtgyh4fca4fq>
In-Reply-To: <jyvlqfvqn5bp3jmvxvwyrcqmihjohuq3o757mfph7x37kbwvtq@gtgyh4fca4fq>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 9 Jul 2024 07:58:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9Jk90HovH8bwzgCHwwh9j4mBm_Aaiq+EOj1HT3R17_Q@mail.gmail.com>
Message-ID: <CAL_Jsq+9Jk90HovH8bwzgCHwwh9j4mBm_Aaiq+EOj1HT3R17_Q@mail.gmail.com>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Sebastian Reichel <sre@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vinod Koul <vkoul@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_065919_038104_B80FA39E 
X-CRM114-Status: GOOD (  31.94  )
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

T24gRnJpLCBKdWwgNSwgMjAyNCBhdCAzOjIx4oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBUaHUsIEp1
biAyNywgMjAyNCBhdCAxMToyOTo0NEFNICswMzAwLCBOaWtpdGEgU2h1YmluIHdyb3RlOgo+ID4g
T24gVHVlLCAyMDI0LTA2LTE4IGF0IDE5OjIwICswMzAwLCBOaWtpdGEgU2h1YmluIHdyb3RlOgo+
ID4gPiBIZWxsbyBBbmR5IQo+ID4gPiBPbiBNb24sIDIwMjQtMDYtMTcgYXQgMTI6NTggKzAyMDAs
IEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAx
MTozOOKAr0FNIE5pa2l0YSBTaHViaW4gdmlhIEI0IFJlbGF5Cj4gPiA+ID4gPGRldm51bGwrbmlr
aXRhLnNodWJpbi5tYXF1ZWZlbC5tZUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBUaGUgZ29hbCBpcyB0byByZWNpZXZlIEFDS3MgZm9yIGFsbCBwYXRjaGVzIGluIHNlcmll
cyB0byBtZXJnZSBpdAo+ID4gPiA+ID4gdmlhIEFybmQgYnJhbmNoLgo+ID4gPiA+Cj4gPiA+ID4g
J3JlY2VpdmUnCj4gPiA+ID4KPiA+ID4gPiA+IFVuZm9ydHVuYXRlbHksIENMSyBzdWJzeXN0ZW0g
c3VkZGVubHkgd2VudCBzaWxlbnQgb24gY2xrIHBvcnRpb24KPiA+ID4gPiA+IG9mCj4gPiA+ID4g
PiBzZXJpZXMgVjIgcmVyb2xsLAo+ID4gPiA+ID4gdHJpZWQgdG8gcGluZyB0aGVtIGZvciBhYm91
dCBhIG1vbnRoIGJ1dCBubyBsdWNrLgo+ID4gPiA+ID4KPiA+ID4gPiA+IExpbms6Cj4gPiA+ID4g
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDA4LWVwOTN4eC1jbGstdjItMS1hZGNk
NjhjMTM3NTNAbWFxdWVmZWwubWUKPiA+ID4gPiA+Cj4gPiA+ID4gPiBTb21lIGNoYW5nZXMgc2lu
Y2UgbGFzdCB2ZXJzaW9uICh2OSkgLSBzZWUgIkNoYW5nZXMgaW4gdjEwIiwKPiA+ID4gPiA+IG1v
c3RseQo+ID4gPiA+ID4gY29zbWV0aWMuCj4gPiA+ID4KPiA+ID4gPiAuLi4KPiA+ID4gPgo+ID4g
PiA+ID4gUGF0Y2hlcyBzaG91bGQgYmUgZm9ybWF0ZWQgd2l0aCAnLS1oaXN0b2dyYW0nCj4gPiA+
ID4KPiA+ID4gPiAnZm9ybWF0dGVkJwo+ID4gPiA+Cj4gPiA+ID4gLi4uCj4gPiA+ID4KPiA+ID4g
PiA+IENoYW5nZXMgaW4gdjEwOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJlb3JkZXJlZCBTb0IgdGFn
cyB0byBtYWtlIHN1cmUgdGhleSBhcHBlYXIgYmVmb3JlIFJiIGFuZCBBY2tlZAo+ID4gPiA+ID4g
dGFncy4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMgbm90IHJlcXVpcmVkLiBUaGUgaW1wb3J0YW5j
ZSBpcyBvbmx5IHRoZSBvcmRlciBvZiBTb0JzCj4gPiA+ID4gdGhlbXNlbHZlcy4gSWYgdGhleSBh
cmUgaW50ZXJsZWF2ZWQgd2l0aCBvdGhlciB0YWdzLCBpdCdzIGZpbmUuCj4gPiA+Cj4gPiA+IEFo
IC0gb2suIEp1c3Qgc2F3IHNvbWVvbmUgd2FzIGNvbXBsYWluaW5nIGFib3V0IGI0IHJlb3JkZXJp
bmcgdGhlbS4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IC4uLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4g
PiBIb3BlZnVsbHkgdG8gc2VlIHRoaXMgc2VyaWVzIGJlaW5nIGV2ZW50dWFsbHkgYXBwbGllZCBz
b29uLgo+ID4gPiA+IEFybmQ/IChEbyB3ZSBoYXZlIGFsbCBuZWNlc3Nhcnkgc3Vic3lzdGVtIG1h
aW50YWluZXJzJyB0YWdzLCBidHc/KQo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+ID4gQXMgaSBz
ZWUgZnJvbSBteSBwZXJzcGVjdGl2ZSBvbmx5IHRocmVlIGxlZnQ6Cj4gPiA+Cj4gPiA+IENsayBz
dWJzeXN0ZW06Cj4gPiA+Cj4gPiA+IC0gY2xrOiBlcDkzeHg6IGFkZCBEVCBzdXBwb3J0IGZvciBD
aXJydXMgRVA5M3h4Cj4gPiA+Cj4gPiA+IERNQSBzdWJzeXN0ZW0gKGJ1dCB0aGUgb25seSByZXF1
ZXN0IGZyb20gVmlub2QsIGFzIGZhciBhcyBpIHJlbWVtYmVyLAo+ID4gPiB3YXMgZml4aW5nIGNv
bW1pdHMgdGl0bGVzKToKPiA+ID4KPiA+ID4gLSBkbWFlbmdpbmU6IGNpcnJ1czogQ29udmVydCB0
byBEVCBmb3IgQ2lycnVzIEVQOTN4eAo+ID4gPiAtIGRtYWVuZ2luZTogY2lycnVzOiByZW1vdmUg
cGxhdGZvcm0gY29kZQo+ID4gPgo+ID4gPiBCZXNpZGUgdGhhdCB0YWdzIG1pc3Npbmcgb24gcGxh
dGZvcm0gY29kZSByZW1vdmFsICh3aGljaCBjYW4gYmUgQWNrZWQKPiA+ID4gYnkgQXJuZCBoaW1z
ZWxmIGkgYmVsaWV2ZSkgYW5kIGR0c2kvZHRzIGZpbGVzIChzYW1lID8pLgo+ID4KPiA+IFZpbm9k
IGFja2VkIHRoZSBhYm92ZSB0d28gcGF0Y2hlczoKPiA+Cj4gPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvWm5rSXA4Yk9jWkszeVZLUEBtYXRzeWEvCj4gPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvWm5rSW1wOEJ0VGR4bDdPM0BtYXRzeWEvCj4gPgo+ID4gc28gb25seToKPiA+Cj4g
PiAtIGNsazogZXA5M3h4OiBhZGQgRFQgc3VwcG9ydCBmb3IgQ2lycnVzIEVQOTN4eAo+ID4KPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDYxNy1lcDkzeHgtdjEwLTMtNjYyZTY0
MGVkODExQG1hcXVlZmVsLm1lLwo+ID4KPiA+IGxlZnQuCj4gPgo+ID4gSG9wZSBTdGVwaGVuIHdp
bGwgZmluZCBzb21lIHRpbWUgZm9yIHRoaXMgb25lLgo+Cj4gQXMgd2UncmUgYXBwcm9hY2hpbmcg
dGhlIG1lcmdlIHdpbmRvdyBhbmQgdGhpcyBpcyBzdGlsbCB1bmNsZWFyLCBJCj4gYXBwbGllZCB0
aGUgcHdtIGJpdHMgKGkuZS4gcGF0Y2hlcyAxMiwgMTMpLiBJZiBJIHVuZGVyc3RhbmQgY29ycmVj
dGx5LAo+IHBhdGNoIDMzIGlzbid0IHN1aXRhYmxlIGZvciBhcHBsaWNhdGlvbiB5ZXQgYXMgaXQg
aGFzIGEgZGVwZW5kZW5jeSBvbgo+IHBpbmN0cmwgY2hhbmdlcyBpbiB0aGF0IHNlcmllcy4KCk5v
dyBjYXVzaW5nIGFuIGVycm9yIGluIGxpbnV4LW5leHQ6CgpEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL2NpcnJ1cyxlcDkzMDEtcHdtLmV4YW1wbGUuZHRzOjE4OjE4OgpmYXRh
bCBlcnJvcjogZHQtYmluZGluZ3MvY2xvY2svY2lycnVzLGVwOTMwMS1zeXNjb24uaDogTm8gc3Vj
aCBmaWxlIG9yCmRpcmVjdG9yeQogICAxOCB8ICAgICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2Nsb2NrL2NpcnJ1cyxlcDkzMDEtc3lzY29uLmg+CiAgICAgIHwgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KY29tcGlsYXRpb24gdGVy
bWluYXRlZC4KbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmxpYjo0NDI6CkRvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vY2lycnVzLGVwOTMwMS1wd20uZXhhbXBsZS5k
dGJdCkVycm9yIDEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
