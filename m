Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49936C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fN66ibLpYllH0pifwg312vNY4u3yBJ/mCdVicr43iPE=; b=OACh0Q/miJLM7V
	tCOmUojLRgmySsoCzGsGhBguUTD0eAsNx0Udqwb3lVK730N8cmrMuCSknCB11xZbbHsfTarSp4EbP
	3Isq0sVbaGLb/140R98GziWr47u7DdPxjXVMju47v8zYwgvXxhmP+DLNPiNHmRWAyTPZ4lBbeaoJ+
	FJoGR/aP2RSth5lozwiZIiuHL4DdrHglpCZCwWnUx/MGQ0npAZv00zslmwYYoAcExGNRTyAeQAR2o
	UBfSFkgQsNKPhV5Cxlsk9uyi+v4W2KrKIyarTkLb+gTxjVK7rH38y1BKQqHhjru656mv3IIGe0+yf
	55eZy69/v6Loqp2uPN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ZAX-001aJN-1S; Wed, 12 Jan 2022 08:39:45 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ZAQ-001aHd-Hw; Wed, 12 Jan 2022 08:39:40 +0000
Received: by mail-oi1-f174.google.com with SMTP id s127so2486425oig.2;
 Wed, 12 Jan 2022 00:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=phWLHSZjGguJkLwzqhKqiJsmBiGXyQV/Ve2Tok5pS7g=;
 b=FSvFRalAoP2sJMbtn6PeESzb0SHiYj1L6TrPd3GvEX8jEqCjOPwa8lSRIA5g0uZXus
 OU6o//9JQJEhgqkVzlC8HrBJXEltMrW4qog7mwkZ/MkjaQuLI/yOUCgQ7eqA2x+/+zRx
 /Nmt9I23WXZ+Ql4YhS6l6Vy5jeO8YpaWzBhOW5GbrcsUNY3V0AFoWOpoy4QiI5i+jpPk
 wI5b/3N33f6ehgSHqGvY3n74gTs0u/4ft/wFQrecwIqNYMIv5aghJVSvLVkYF+v7ylvv
 QMFp6sCdYbKOj0gUgn4vQaD96o8ToYZEPRbELvMT8fVl3TvU5ZvfMG5Ii1D+nsUvR80z
 aeOQ==
X-Gm-Message-State: AOAM5311L31JzFBKxLJSG+b0/RqqOEN+rt/SJ57pIoUI8Y7ED4UrEdxh
 HN71dvWeK56QRMPKpyzAFBm5b1UctWr7eEKi
X-Google-Smtp-Source: ABdhPJx/J2cDaab3UvG0onNYJ/dQ1u0/LauqGyqmXC7ryJf0/NllTM+LrV72D8SmdQ6SL5egSXaIxw==
X-Received: by 2002:a54:469a:: with SMTP id k26mr2669804oic.147.1641976776920; 
 Wed, 12 Jan 2022 00:39:36 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51])
 by smtp.gmail.com with ESMTPSA id p24sm33645oto.32.2022.01.12.00.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:39:36 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id
 h20-20020a9d6f94000000b0059100e01744so1761961otq.4; 
 Wed, 12 Jan 2022 00:39:36 -0800 (PST)
X-Received: by 2002:ab0:2118:: with SMTP id d24mr3735076ual.78.1641976440167; 
 Wed, 12 Jan 2022 00:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
In-Reply-To: <YdyilpjC6rtz6toJ@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 09:33:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
Message-ID: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>, 
 linux-phy@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>, 
 openipmi-developer@lists.sourceforge.net, 
 Saravanan Sekar <sravanhome@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, kvm@vger.kernel.org, 
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com, 
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Jaroslav Kysela <perex@perex.cz>, 
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org, 
 John Garry <john.garry@huawei.com>, Robert Richter <rric@kernel.org>, 
 Zha Qipeng <qipeng.zha@intel.com>, Corey Minyard <minyard@acm.org>,
 linux-pm@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, 
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, 
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>, 
 Eric Auger <eric.auger@redhat.com>, netdev@vger.kernel.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 linux-mmc@vger.kernel.org, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_003938_628426_368B9C88 
X-CRM114-Status: GOOD (  33.30  )
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

SGkgQW5kcmV3LAoKT24gTW9uLCBKYW4gMTAsIDIwMjIgYXQgMTA6MjAgUE0gQW5kcmV3IEx1bm4g
PGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiBPbiBNb24sIEphbiAxMCwgMjAyMiBhdCAwOToxMDox
NFBNICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDEwLCAy
MDIyIGF0IDEwOjU0OjQ4UE0gKzAzMDAsIFNlcmdleSBTaHR5bHlvdiB3cm90ZToKPiA+ID4gVGhp
cyBwYXRjaCBpcyBiYXNlZCBvbiB0aGUgZm9ybWVyIEFuZHkgU2hldmNoZW5rbydzIHBhdGNoOgo+
ID4gPgo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjEwMzMxMTQ0NTI2LjE5
NDM5LTEtYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tLwo+ID4gPgo+ID4gPiBDdXJy
ZW50bHkgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIHJldHVybnMgYW4gZXJyb3IgY29kZSBl
dmVuIGlmIElSUQo+ID4gPiByZXNvdXJjZSBzaW1wbHkgaGFzIG5vdCBiZWVuIGZvdW5kLiBJdCBw
cmV2ZW50cyB0aGUgY2FsbGVycyBmcm9tIGJlaW5nCj4gPiA+IGVycm9yIGNvZGUgYWdub3N0aWMg
aW4gdGhlaXIgZXJyb3IgaGFuZGxpbmc6Cj4gPiA+Cj4gPiA+ICAgICByZXQgPSBwbGF0Zm9ybV9n
ZXRfaXJxX29wdGlvbmFsKC4uLik7Cj4gPiA+ICAgICBpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVO
WElPKQo+ID4gPiAgICAgICAgICAgICByZXR1cm4gcmV0OyAvLyByZXNwZWN0IGRlZmVycmVkIHBy
b2JlCj4gPiA+ICAgICBpZiAocmV0ID4gMCkKPiA+ID4gICAgICAgICAgICAgLi4ud2UgZ2V0IGFu
IElSUS4uLgo+ID4gPgo+ID4gPiBBbGwgb3RoZXIgKl9vcHRpb25hbCgpIEFQSXMgc2VlbSB0byBy
ZXR1cm4gMCBvciBOVUxMIGluIGNhc2UgYW4gb3B0aW9uYWwKPiA+ID4gcmVzb3VyY2UgaXMgbm90
IGF2YWlsYWJsZS4gTGV0J3MgZm9sbG93IHRoaXMgZ29vZCBleGFtcGxlLCBzbyB0aGF0IHRoZQo+
ID4gPiBjYWxsZXJzIHdvdWxkIGxvb2sgbGlrZToKPiA+ID4KPiA+ID4gICAgIHJldCA9IHBsYXRm
b3JtX2dldF9pcnFfb3B0aW9uYWwoLi4uKTsKPiA+ID4gICAgIGlmIChyZXQgPCAwKQo+ID4gPiAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiAgICAgaWYgKHJldCA+IDApCj4gPiA+ICAgICAg
ICAgICAgIC4uLndlIGdldCBhbiBJUlEuLi4KPiA+Cj4gPiBUaGUgZGlmZmVyZW5jZSB0byBncGlv
ZF9nZXRfb3B0aW9uYWwgKGFuZCBtb3N0IG90aGVyICpfb3B0aW9uYWwpIGlzIHRoYXQKPiA+IHlv
dSBjYW4gdXNlIHRoZSBOVUxMIHZhbHVlIGFzIGlmIGl0IHdlcmUgYSB2YWxpZCBHUElPLgo+ID4K
PiA+IEFzIHRoaXMgaXNuJ3QgZ2l2ZW4gd2l0aCBmb3IgaXJxcywgSSBkb24ndCB0aGluayBjaGFu
Z2luZyB0aGUgcmV0dXJuCj4gPiB2YWx1ZSBoYXMgbXVjaCBzZW5zZS4KPgo+IFdlIGFjdHVhbGx5
IHdhbnQgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIHRvIGxvb2sgZGlmZmVyZW50IHRvIGFs
bAo+IHRoZSBvdGhlciBfb3B0aW9uYWwoKSBtZXRob2RzIGJlY2F1c2UgaXQgaXMgbm90IGVxdWl2
YWxlbnQuIElmIGl0Cj4gbG9va3MgdGhlIHNhbWUsIGRldmVsb3BlcnMgd2lsbCBhc3N1bWUgaXQg
aXMgdGhlIHNhbWUsIGFuZCBnZXQKPiB0aGVtc2VsdmVzIGludG8gdHJvdWJsZS4KCkRldmVsb3Bl
cnMgYWxyZWFkeSBhc3N1bWUgaXQgaXMgdGhlIHNhbWUsIGFuZCB0aHVzIGZvcmdldCB0aGV5IGhh
dmUKdG8gY2hlY2sgYWdhaW5zdCAtRU5YSU8gaW5zdGVhZCBvZiB6ZXJvLgoKR3J7b2V0amUsZWV0
aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
