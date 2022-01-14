Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88788C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoR0brJy18yPkVkUmz6ZI0OVKHVhjrl7PwGFUHUvTRU=; b=frSsAf+H1gi3HG
	aCganx+pSHQK1mfgQyGbZYtsaGUSlyp661oV8SR71ty7tSuRg75uzbypYQwsvSrlc5EOR1KRTaYHO
	S3WAmtndEQX6FqrontxfCWCia2MVImtBQN080chH0VpEILnENT/oe2ee5ZQjqa4EdA7PbHWEyOyIK
	AnkJcdjKoCIv5OMNhOmWw0iUEBmZ++IZQwUWXTSuV3pbHFTlPtUVye8Q0uEp6vBCutxQMk4mTHkZa
	UDy3l/SWL/cx/EcSRMq5xcqrYNryn0azcjJpbLnxS+wgAAYr3Pyx5WV+p4wyy0m7qbuXUdLSHWqWG
	JMAQsuDsjxPhOnqJjE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8J3P-008YQk-1H; Fri, 14 Jan 2022 09:39:27 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8J3L-008YPM-QQ; Fri, 14 Jan 2022 09:39:25 +0000
Received: by mail-ua1-f43.google.com with SMTP id m15so15943330uap.6;
 Fri, 14 Jan 2022 01:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XIsXuJfmE8JES6Mbtb18c2n3rWZVUZhPWhasZQeRi6Q=;
 b=nOiif9MMeYiQWD43k3jkytXnvDdW7Vsp6YTjS5csHTYS48HDc659inS44vBVJ9HBXl
 1uy3OJxBKZ0ZGeRiH+rtk5tMKJ/iEILShhesIfWYfoabs+uaDX+mRp0HGJCP7TSbYnn5
 snz1FPjrQ9z6OmxemPr+dbL/skKXKIMjLxdnjRC5wBHZKCFbRC2+VuMtYXTb2RbLxdda
 RCD3GBzZeNkNh5q/9x5L5kS785IjXCrnrfizpPCdzQOwACEAblE3Rre1Iu1cmZsHqxhx
 KzNV8XucAWkhKzdhf+If5NLFnD5KcK7iTXBrg6S3AF6zjSZnCHemlS9OC4LYmog1sG7Y
 CGbg==
X-Gm-Message-State: AOAM533a4K1SmEy1IyX9pKy2Vkt9K0UKDfMZ6/1q44myweZcAZunMCm/
 nT1FoJNoqK+PqovTSGFUWO5RK0t5VZB8C+G4
X-Google-Smtp-Source: ABdhPJzsM6rl2hnIfvwK27/8UC+NYseaQ9atX7M2ixSf9zRV+LLakxuWmGafrqdih3HWgeOwjXojew==
X-Received: by 2002:a67:c198:: with SMTP id h24mr2312125vsj.40.1642153161987; 
 Fri, 14 Jan 2022 01:39:21 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id a190sm2007832vkb.15.2022.01.14.01.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:39:20 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id u6so16083172uaq.0;
 Fri, 14 Jan 2022 01:39:19 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr3716211vsu.5.1642153159149; 
 Fri, 14 Jan 2022 01:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
In-Reply-To: <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 10:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcMNMYf82-rz8_057BGwYWyPyhjAh3e9ynrv82GMiHvg@mail.gmail.com>
Message-ID: <CAMuHMdVcMNMYf82-rz8_057BGwYWyPyhjAh3e9ynrv82GMiHvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Mark Brown <broonie@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 KVM list <kvm@vger.kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>, 
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org, 
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, 
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Korsgaard <peter@korsgaard.com>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Eric Auger <eric.auger@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
 Richard Weinberger <richard@nod.at>, Mun Yew Tham <mun.yew.tham@intel.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, 
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_013923_890408_6C1E8F2C 
X-CRM114-Status: GOOD (  49.14  )
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

SGkgVXdlLAoKT24gRnJpLCBKYW4gMTQsIDIwMjIgYXQgMTA6MjYgQU0gVXdlIEtsZWluZS1Lw7Zu
aWcKPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MTMsIDIwMjIgYXQgMTE6MzU6MzRQTSArMDMwMCwgU2VyZ2V5IFNodHlseW92IHdyb3RlOgo+ID4g
T24gMS8xMy8yMiAxMjo0NSBBTSwgTWFyayBCcm93biB3cm90ZToKPiA+ID4+PiBUbyBtZSBpdCBz
b3VuZHMgbXVjaCBtb3JlIGxvZ2ljYWwgZm9yIHRoZSBkcml2ZXIgdG8gY2hlY2sgaWYgYW4KPiA+
ID4+PiBvcHRpb25hbCBpcnEgaXMgbm9uLXplcm8gKGF2YWlsYWJsZSkgb3IgemVybyAobm90IGF2
YWlsYWJsZSksIHRoYW4gdG8KPiA+ID4+PiBzcHJpbmtsZSBhcm91bmQgY2hlY2tzIGZvciAtRU5Y
SU8uIEluIGFkZGl0aW9uLCB5b3UgaGF2ZSB0byByZW1lbWJlcgo+ID4gPj4+IHRoYXQgdGhpcyBv
bmUgcmV0dXJucyAtRU5YSU8sIHdoaWxlIG90aGVyIEFQSXMgdXNlIC1FTk9FTlQgb3IgLUVOT1NZ
Uwo+ID4gPj4+IChvciBzb21lIG90aGVyIGVycm9yIGNvZGUpIHRvIGluZGljYXRlIGFic2VuY2Uu
IEkgdGhvdWdodCBub3QgaGF2aW5nCj4gPiA+Pj4gdG8gY2FyZSBhYm91dCB0aGUgYWN0dWFsIGVy
cm9yIGNvZGUgd2FzIHRoZSBtYWluIHJlYXNvbiBiZWhpbmQgdGhlCj4gPiA+Pj4gaW50cm9kdWN0
aW9uIG9mIHRoZSAqX29wdGlvbmFsKCkgQVBJcy4KPiA+ID4KPiA+ID4+IE5vLCB0aGUgbWFpbiBi
ZW5lZml0IG9mIGdwaW9kX2dldF9vcHRpb25hbCgpIChhbmQgY2xrX2dldF9vcHRpb25hbCgpKSBp
cwo+ID4gPj4gdGhhdCB5b3UgY2FuIGhhbmRsZSBhbiBhYnNlbnQgR1BJTyAob3IgY2xrKSBhcyBp
ZiBpdCB3ZXJlIGF2YWlsYWJsZS4KPiA+Cj4gPiAgICBIbSwgSSd2ZSBqdXN0IGxvb2tlZCBhdCB0
aGVzZSBhbmQgbXVzdCBub3RlIHRoYXQgdGhleSBtYXRjaCAxOjEgd2l0aAo+ID4gcGxhdGZvcm1f
Z2V0X2lycV9vcHRpb25hbCgpLiBVbmZvcnR1bmF0ZWx5LCB3ZSBjYW4ndCBob3dldmVyIGJlaGF2
ZSB0aGUKPiA+IHNhbWUgd2F5IGluIHJlcXVlc3RfaXJxKCkgLS0gYmVjYXVzZSBpdCBoYXMgdG8g
c3VwcG9ydCBJUlEwIGZvciB0aGUgc2FrZQo+ID4gb2YgaTgyNTMgZHJpdmVycyBpbiBhcmNoLy4u
Lgo+Cj4gTGV0IG1lIHJlZm9ybXVsYXRlIHlvdXIgc3RhdGVtZW50IHRvIHRoZSBJTUhPIGVxdWl2
YWxlbnQ6Cj4KPiAgICAgICAgIElmIHlvdSBzZXQgYXNpZGUgdGhlIGRpZmZlcmVuY2VzIGJldHdl
ZW4KPiAgICAgICAgIHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKSBhbmQgZ3Bpb2RfZ2V0X29w
dGlvbmFsKCksCj4gICAgICAgICBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgaXMgbGlrZSBn
cGlvZF9nZXRfb3B0aW9uYWwoKS4KPgo+IFRoZSBpbnRyb2R1Y3Rpb24gb2YgZ3Bpb2RfZ2V0X29w
dGlvbmFsKCkgbWFkZSBpdCBwb3NzaWJsZSB0byBzaW1wbGlmeQo+IHRoZSBmb2xsb3dpbmcgY29k
ZToKPgo+ICAgICAgICAgcmVzZXRfZ3BpbyA9IGdwaW9kX2dldCguLi4pCj4gICAgICAgICBpZiBJ
U19FUlIocmVzZXRfZ3Bpbyk6Cj4gICAgICAgICAgICAgICAgIGVycm9yID0gUFRSX0VSUihyZXNl
dF9ncGlvKQo+ICAgICAgICAgICAgICAgICBpZiBlcnJvciAhPSAtRU5ERVY6Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIGVycm9yCj4gICAgICAgICBlbHNlOgo+ICAgICAgICAgICAg
ICAgICBncGlvZF9zZXRfZGlyZWN0aW9uKHJlc2V0X2dwaW9kLCBJTkFDVElWRSkKPgo+IHRvCj4K
PiAgICAgICAgIHJlc2V0X2dwaW8gPSBncGlvZF9nZXRfb3B0aW9uYWwoLi4uLikKPiAgICAgICAg
IGlmIElTX0VSUihyZXNldF9ncGlvKToKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJlc2V0X2dw
aW8KPiAgICAgICAgIGdwaW9kX3NldF9kaXJlY3Rpb24ocmVzZXRfZ3Bpb2QsIElOQUNUSVZFKQo+
Cj4gYW5kIEkgbmV2ZXIgbmVlZCB0byBhY3R1YWxseSBrbm93IGlmIHRoZSByZXNldF9ncGlvIGFj
dHVhbGx5IGV4aXN0cy4KPiBFaXRoZXIgdGhlIGxpbmUgaXMgcHV0IGludG8gaXRzIGluYWN0aXZl
IHN0YXRlLCBvciBpdCBkb2Vzbid0IGV4aXN0IGFuZAo+IHRoZW4gZ3Bpb2Rfc2V0X2RpcmVjdGlv
biBpcyBhIG5vb3AuIEZvciBhIHJlZ3VsYXRvciBvciBhIGNsayB0aGlzIHdvcmtzCj4gaW4gYSBz
aW1pbGFyIHdheS4KPgo+IEhvd2V2ZXIgZm9yIGFuIGludGVydXB0IHRoaXMgY2Fubm90IHdvcmsu
IFlvdSB3aWxsIGFsd2F5cyBoYXZlIHRvIGNoZWNrCj4gaWYgdGhlIGlycSBpcyBhY3R1YWxseSB0
aGVyZSBvciBub3QgYmVjYXVzZSBpZiBpdCdzIG5vdCB5b3UgY2Fubm90IGp1c3QKPiBpZ25vcmUg
dGhhdC4gU28gdGhlcmUgaXMgbm8gYmVuZWZpdCBvZiBhbiBvcHRpb25hbCBpcnEuCj4KPiBMZWF2
aW5nIGVycm9yIG1lc3NhZ2UgcmVwb3J0aW5nIGFzaWRlLCB0aGUgaW50cm9kdWN0aW9uIG9mCj4g
cGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIGFsbG93cyB0byBjaGFuZ2UKPgo+ICAgICAgICAg
aXJxID0gcGxhdGZvcm1fZ2V0X2lycSguLi4pOwo+ICAgICAgICAgaWYgKGlycSA8IDAgJiYgaXJx
ICE9IC1FTlhJTykgewo+ICAgICAgICAgICAgICAgICByZXR1cm4gaXJxOwo+ICAgICAgICAgfSBl
bHNlIGlmIChpcnEgPj0gMCkgewo+ICAgICAgICAgICAgICAgICAuLi4gc2V0dXAgaXJxIG9wZXJh
dGlvbiAuLi4KPiAgICAgICAgIH0gZWxzZSB7IC8qIGlycSA9PSAtRU5YSU8gKi8KPiAgICAgICAg
ICAgICAgICAgLi4uIHNldHVwIHBvbGxpbmcgLi4uCj4gICAgICAgICB9Cj4KPiB0bwo+Cj4gICAg
ICAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKC4uLik7Cj4gICAgICAgICBpZiAo
aXJxIDwgMCAmJiBpcnEgIT0gLUVOWElPKSB7Cj4gICAgICAgICAgICAgICAgIHJldHVybiBpcnE7
Cj4gICAgICAgICB9IGVsc2UgaWYgKGlycSA+PSAwKSB7Cj4gICAgICAgICAgICAgICAgIC4uLiBz
ZXR1cCBpcnEgb3BlcmF0aW9uIC4uLgo+ICAgICAgICAgfSBlbHNlIHsgLyogaXJxID09IC1FTlhJ
TyAqLwo+ICAgICAgICAgICAgICAgICAuLi4gc2V0dXAgcG9sbGluZyAuLi4KPiAgICAgICAgIH0K
Pgo+IHdoaWNoIGlzbid0IGEgd2luLiBXaGVuIGNoYW5naW5nIHRoZSByZXR1cm4gdmFsdWUgYXMg
eW91IHN1Z2dlc3QsIGl0IGNhbgo+IGJlIGNoYW5nZWQgaW5zdGVhZCB0bzoKPgo+ICAgICAgICAg
aXJxID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCguLi4pOwo+ICAgICAgICAgaWYgKGlycSA8
IDApIHsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGlycTsKPiAgICAgICAgIH0gZWxzZSBpZiAo
aXJxID4gMCkgewo+ICAgICAgICAgICAgICAgICAuLi4gc2V0dXAgaXJxIG9wZXJhdGlvbiAuLi4K
PiAgICAgICAgIH0gZWxzZSB7IC8qIGlycSA9PSAwICovCj4gICAgICAgICAgICAgICAgIC4uLiBz
ZXR1cCBwb2xsaW5nIC4uLgo+ICAgICAgICAgfQo+Cj4gd2hpY2ggaXMgYSB0YWQgbmljZXIuIElm
IHRoYXQgaXMgeW91ciBnb2FsIGhvd2V2ZXIgSSBhc2sgeW91IHRvIGFsc28KPiBjaGFuZ2UgdGhl
IHNlbWFudGljIG9mIHBsYXRmb3JtX2dldF9pcnEoKSB0byByZXR1cm4gMCBvbiAibm90IGZvdW5k
Ii4KClBsZWFzZSBkb24ndCBtYWtlIHRoYXQgY2hhbmdlLiBJZiBwbGF0Zm9ybV9nZXRfaXJxKCkg
d291bGQgcmV0dXJuIDAgb24KIm5vdCBmb3VuZCIsIGFsbCBleGlzdGluZyB1c2VycyBoYXZlIHRv
IGJlIGNoYW5nZWQgdG86CgogICAgICAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEoLi4uKTsKICAg
ICAgICBpZiAoaXJxIDwgMCkgewogICAgICAgICAgICAgICAgcmV0dXJuIGlycTsKICAgICAgICB9
IGVsc2UgaWYgKCFpcnEpIHsKICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwogICAgICAg
IH0gZWxzZSB7CiAgICAgICAgICAgICAgICAuLi4gc2V0dXAgaXJxIG9wZXJhdGlvbiAuLi4KICAg
ICAgICB9CgpJZiB0aGUgSVJRIGlzIG5vdCBvcHRpb25hbCwgdGhlcmUgc2hvdWxkIGJlIGFuIGVy
cm9yIGNvZGUgd2hlbiBpdCBpcwpub3QgcHJlc2VudC4gVGhpcyBrZWVwcyBlcnJvciBoYW5kbGlu
ZyBzaW1wbGUuCgpUaGUgX29wdGlvbmFsKCkgZGlmZmVyZW5jZSBsaWVzIGluIHRoZSB6ZXJvL05V
TEwgdnMuIGVycm9yIGNvZGUgaW4KY2FzZSBvZiBub3QgcHJlc2VudC4KCj4gTm90ZSB0aGUgd2lu
IGlzIGNvbnNpZGVyYWJseSBsZXNzIGNvbXBhcmVkIHRvIGdwaW9kX2dldF9vcHRpb25hbCB2cwo+
IGdwaW9kX2dldCBob3dldmVyLiBBbmQgdGhlbiBpdCBzdGlsbCBsYWNrcyB0aGUgc2VtYW50aWMg
b2YgYSBkdW1teSBpcnEKPiB3aGljaCBJTUhPIGZvcmZlaXRzIHRoZSByaWdodCB0byBjYWxsIGl0
IC4uLl9vcHRpb25hbCgpLgo+Cj4gTm93IEknbSB1bndpbGxpbmcgdG8gY29udGludWUgdGhlIGRp
c2N1c3Npb24gdW5sZXNzIHRoZXJlIHBvcHMgdXAgYQo+IHN1Z2dlc3Rpb24gdGhhdCByZXN1bHRz
IGluIGEgY29uc2lkZXJhYmxlIHBhcnQgKHNheSA+IDEwJSkgb2YgdGhlCj4gZHJpdmVycyB1c2lu
ZyBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsIG5vdCBoYXZpbmcgdG8gY2hlY2sgaWYgdGhlCj4g
cmV0dXJuIHZhbHVlIGNvcnJlc3BvbmRzIHRvICJub3QgZm91bmQiLgoKVXN1YWxseSBkcml2ZXJz
IGRvIGhhdmUgdG8gY2hlY2sgaWYgdGhlIGludGVycnVwdCB3YXMgcHJlc2VudCBvcgpub3QsIGJl
Y2F1c2UgdGhleSBtYXkgaGF2ZSB0byBjaGFuZ2UgdGhlIG9wZXJhdGlvbiBvZiB0aGUgZHJpdmVy
LApkZXBlbmRpbmcgb24gaW50ZXJydXB0LWJhc2VkIG9yIHRpbWVyL3BvbGxpbmctYmFzZWQgcHJv
Y2Vzc2luZy4KCkNsb2NrcywgcmVndWxhdG9ycywgYW5kIHJlc2V0cyBhcmUgZGlmZmVyZW50LCBh
cyB0aGVpciBhYnNlbmNlIGlzCnJlYWxseSBhIG5vLW9wLiAgVGhlIGFic2VuY2Ugb2YgYW4gaW50
ZXJydXB0IGlzIG5vdCBhIG5vLW9wIChleGNlcHQKZm9yIHRoZSBzZXBhcmF0ZSBpbnRlcnJ1cHRz
IHZzLiBhIHNpbmdsZSBtdXhlZCBpbnRlcnJ1cHQgY2FzZSkuCgpHcntvZXRqZSxlZXRpbmd9cywK
CiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
