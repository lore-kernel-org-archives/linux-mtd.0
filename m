Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CECC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03wW1trPOPEd9vaqDJbCMhB06QNunzBWUll5DofVPyw=; b=N1gcsqqse46YdT
	Yb0T9pPtMIC4FFFvXcsdgxHDishtpU7KeSMQrOpAaZ5/h/uJ/mr3+W71oRPWbd3f+cQkB+7F7q7XZ
	zbDp5A14dJw23W+8qH9GuJV5F5WGhtUV5jcUBrPEBUw5c+hqM4S93iXxfXAiPRrhVw4w4E1ghKha9
	/TeA65IK6R1SV4hKN93dHQjHYbTy8jekxqwf7Q0jAqGhpoJ+tf1dgUM9+4Iv/1uvZVTOKp6W/N+Vb
	+F+wfyfFsPDf9tU7BrJ4TR/hAteVukSsP5B0C+EOf4aFnoRqGUByXF+lgefAZQ7fbHp7L7a1tfpIK
	TsHuwgWu5M/O7ctBz4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9kvw-000vvX-K4; Tue, 18 Jan 2022 09:37:44 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9kvt-000vtY-EF; Tue, 18 Jan 2022 09:37:42 +0000
Received: by mail-ua1-f47.google.com with SMTP id w21so25929803uan.7;
 Tue, 18 Jan 2022 01:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=94RJUajJnozufTpAr/gV3w0KHJpzlohNQuBpMs4wyR0=;
 b=F60F2ZCTBjzwGrFSRfHKz/e45R5Hap4PaizW9gvkZDnUy5FWK9vjeGeG6TQ8/iJVKs
 la6IIxoB34faiY2s0s39vckaGG96kIWmxtiOpISaUOnQ5HhQOojFOszRAgwreftRAvv2
 LGWTbR62UfuD8TaFmPzVBjI4Y5jes9zkGErxIqQHkU2XD5L5fazCdp3LbDtCZa81dV++
 ILORjXTtfSlOZJkwf34JWRlXuPcIncBwOcrYjztAgwZzmWz+9Z1F3o7e/rWYIxKU2eLx
 ejkDo2K3NgI2gnS3xq0YD5PByxvJJC8tBRSA3SVjME+5qiP5F+cItiNAm4SnHM1fRiOd
 6imw==
X-Gm-Message-State: AOAM5307NW6Exg61xE1SNBzexFft+wdGyV8Wh/wxtkmSjr0jRvCI+MDC
 w135gjSN6OSXRWW0Z8Jpxa8qqpaE9Q4T1m2+
X-Google-Smtp-Source: ABdhPJz+oxK/12LPH3d1PUoCH/J6UQTZxMLJ2m34LwOIj4uVQINSa3lBu4NyFKQyGaXACzqzukw0lg==
X-Received: by 2002:a67:e2c7:: with SMTP id i7mr8991743vsm.2.1642498659253;
 Tue, 18 Jan 2022 01:37:39 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id k6sm3680165uak.9.2022.01.18.01.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:37:37 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id b16so848492uaq.4;
 Tue, 18 Jan 2022 01:37:37 -0800 (PST)
X-Received: by 2002:a67:bc17:: with SMTP id t23mr5014894vsn.57.1642498657061; 
 Tue, 18 Jan 2022 01:37:37 -0800 (PST)
MIME-Version: 1.0
References: <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
 <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
 <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
In-Reply-To: <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 10:37:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUW8+Y_=uszD+JOZO3Lpa9oDayk+GO+cg276i2f2T285w@mail.gmail.com>
Message-ID: <CAMuHMdUW8+Y_=uszD+JOZO3Lpa9oDayk+GO+cg276i2f2T285w@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org, 
 netdev <netdev@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
 openipmi-developer@lists.sourceforge.net, 
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Linux PWM List <linux-pwm@vger.kernel.org>, 
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Sebastian Reichel <sre@kernel.org>, 
 Eric Auger <eric.auger@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org, 
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>, 
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_013741_514337_E9E2DF01 
X-CRM114-Status: GOOD (  41.19  )
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

SGkgVXdlLAoKT24gVHVlLCBKYW4gMTgsIDIwMjIgYXQgMTA6MDkgQU0gVXdlIEtsZWluZS1Lw7Zu
aWcKPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MTgsIDIwMjIgYXQgMDk6MjU6MDFBTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+
ID4gT24gTW9uLCBKYW4gMTcsIDIwMjIgYXQgNjowNiBQTSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4g
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSmFu
IDE3LCAyMDIyIGF0IDAyOjA4OjE5UE0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
PiA+ID4gPiBPbiBNb24sIEphbiAxNywgMjAyMiBhdCAxMjo0OSBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo+ID4gPiA+IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gPiA+
ID4gPiBTbyB0aGVyZSBhcmUgdGhyZWUgcmVhc29uczogYmVjYXVzZSB0aGUgYWJzZW5jZSBvZiBh
biBvcHRpb25hbCBJUlEKPiA+ID4gPiA+ID4gaXMgbm90IGFuIGVycm9yLCBhbmQgdGh1cyB0aGF0
IHNob3VsZCBub3QgY2F1c2UgKGEpIGFuIGVycm9yIGNvZGUKPiA+ID4gPiA+ID4gdG8gYmUgcmV0
dXJuZWQsIGFuZCAoYikgYW4gZXJyb3IgbWVzc2FnZSB0byBiZSBwcmludGVkLCBhbmQgKGMpCj4g
PiA+ID4gPiA+IGJlY2F1c2UgaXQgY2FuIHNpbXBsaWZ5IHRoZSBsb2dpYyBpbiBkZXZpY2UgZHJp
dmVycy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGRvbid0IGFncmVlIHRvIChhKS4gSWYgdGhlIHZh
bHVlIHNpZ25hbGluZyBub3QtZm91bmQgaXMgLUVOWElPIG9yIDAKPiA+ID4gPiA+IChvciAtRU5P
REVWKSBkb2Vzbid0IG1hdHRlciBtdWNoLiBJIHdvdWxkbid0IGRldmlhdGUgZnJvbSB0aGUgcmV0
dXJuCj4gPiA+ID4gPiBjb2RlIHNlbWFudGljcyBvZiBwbGF0Zm9ybV9nZXRfaXJxKCkganVzdCBm
b3IgaGF2aW5nIHRvIGNoZWNrIGFnYWluc3QgMAo+ID4gPiA+ID4gaW5zdGVhZCBvZiAtRU5YSU8u
IFplcm8gaXMgdGhlbiBqdXN0IGFub3RoZXIgbWFnaWMgdmFsdWUuCj4gPiA+ID4KPiA+ID4gPiBa
ZXJvIGlzIGEgbmF0dXJhbCBtYWdpYyB2YWx1ZSAoYWxzbyBmb3IgcG9pbnRlcnMpLgo+ID4gPiA+
IEVycm9ycyBhcmUgYWx3YXlzIG5lZ2F0aXZlLgo+ID4gPiA+IFBvc2l0aXZlIHZhbHVlcyBhcmUg
Y29va2llcyAob3IgcG9pbnRlcnMpIGFzc29jaWF0ZWQgd2l0aCBzdWNjZXNzLgo+ID4gPgo+ID4g
PiBZZWFoLCB0aGUgaXNzdWUgd2hlcmUgd2UgZG9uJ3QgYWdyZWUgaXMgaWYgIm5vdC1mb3VuZCIg
aXMgc3BlY2lhbCBlbm91Z2gKPiA+ID4gdG8gZGVzZXJ2ZSB0aGUgbmF0dXJhbCBtYWdpYyB2YWx1
ZS4gRm9yIG1lIC1FTlhJTyBpcyBtYWdpYyBlbm91Z2ggdG8KPiA+ID4gaGFuZGxlIHRoZSBhYnNl
bmNlIG9mIGFuIGlycSBsaW5lLiBJIGNvbnNpZGVyIGl0IGV2ZW4gdGhlIGJldHRlciBtYWdpYwo+
ID4gPiB2YWx1ZS4KPiA+Cj4gPiBJdCBkaWZmZXJzIGZyb20gb3RoZXIgc3Vic3lzdGVtcyAoY2xr
LCBncGlvLCByZXNldCksIHdoaWNoIGRvIHJldHVybgo+ID4gemVybyBvbiBub3QgZm91bmQuCj4K
PiBJTUhPIGl0IGRvZXNuJ3QgbWF0dGVyIGF0IGFsbCB0aGF0IHRoZSByZXR1cm4gdmFsdWUgaXMg
emVybywgcmVsZXZhbnQgaXMKPiB0aGUgc2VtYW50aWMgb2YgdGhlIHJldHVybmVkIHZhbHVlLiBG
b3IgY2xrLCBncGlvLCByZXNldCBhbmQgcmVndWxhdG9yCj4gTlVMTCBpcyBhIHVzYWJsZSBkdW1t
eSwgZm9yIGlycXMgaXQncyBub3QuIFNvIHdoYXQgeW91IGRvIHdpdGggdGhlIHZhbHVlCj4gcmV0
dXJuZWQgYnkgcGxhdGZvcm1fZ2V0X2lycV93aGF0ZXZlcigpIGlzOiB5b3UgY29tcGFyZSBpdCB3
aXRoIHRoZQo+IChtYWdpYz8pIG5vdC1mb3VuZCB2YWx1ZSwgYW5kIGlmIGl0IG1hdGNoZXMsIHlv
dSBlbnRlciBhIHN1aXRhYmxlCj4gaWYtYmxvY2suCj4KPiBGb3IgdGhlIChjbGt8Z3Bpb2R8cmVn
dWxhdG9yKV9nZXRfb3B0aW9uYWwoKSB5b3UgZG9uJ3QgaGF2ZSB0byBjaGVjawo+IGFnYWluc3Qg
dGhlIG1hZ2ljIG5vdC1mb3VuZCB2YWx1ZSAoc28gbm8gaW1wbGVtZW50YXRpb24gZGV0YWlsIG1h
Z2ljCj4gbGVha3MgaW50byB0aGUgY2FsbGVyIGNvZGUpIGFuZCBqdXN0IHBhc3MgaXQgdG8gdGhl
IG5leHQgQVBJIGZ1bmN0aW9uLgo+IChBbmQgbXkgZXhwZWN0YXRpb24gd291bGQgYmUgdGhhdCBp
ZiB5b3UgY2hvc2UgdG8gcmVwcmVzZW50IG5vdC1mb3VuZCBieQo+ICh2b2lkICopNjYgaW5zdGVh
ZCBvZiBOVUxMLCB5b3Ugd29uJ3QgaGF2ZSB0byBhZGFwdCBhbnkgdXNlciwganVzdCB0aGUKPiBm
cmFtZXdvcmsgaW50ZXJuYWwgY2hlY2tzLiBUaGlzIGlzIGEgZ29vZCB0aGluZyEpCgpBaCwgdGhl
cmUgaXMgdGhlIHdyb25nIGFzc3VtcHRpb246IGRyaXZlcnMgc29tZXRpbWVzIGRvIG5lZWQgdG8g
a25vdwppZiB0aGUgcmVzb3VyY2Ugd2FzIGZvdW5kLCBhbmQgdGh1cyBkbyBuZWVkIHRvIGtub3cg
YWJvdXQgKHZvaWQgKik2NiwKLUVOT0RFViwgb3IgLUVOWElPLiAgSSBhbHJlYWR5IGdhdmUgZXhh
bXBsZXMgZm9yIElSUSBhbmQgY2xrIGJlZm9yZS4KSSBjYW4gaW1hZ2luZSB0aGVzZSBleGlzdCBm
b3IgZ3Bpb2QgYW5kIHJlZ3VsYXRvciwgdG9vLCBhcyBzb29uIGFzCnlvdSBnbyBiZXlvbmQgdGhl
IHRyaXZpYWwgImVuYWJsZSIgYW5kICJkaXNhYmxlIiB1c2UtY2FzZXMuCgpBbmQgMC9OVUxMIHZz
LiA+IDAgaXMgdGhlIG5hdHVyYWwgY2hlY2sgaGVyZTogbWlzc2luZywgYnV0IG5vdAphbiBlcnJv
ci4gIEV2ZW4gZm9yIElSUSB0aGlzIHdhcyBlbnZpc2lvbmVkIGJlZm9yZSwgd2hlbiBpdCB3YXMK
ZGVjaWRlZCB0aGF0IHZJUlEgemVybyBkb2VzIG5vdCBleGlzdC4KKEluY29uc2lzdGVudCkgRXJy
b3IgY29kZXMgYXJlIG5vdCwgYXMgbWlzc2luZyBvcHRpb25hbCByZXNvdXJjZXMKYXJlIG5vdCBl
cnJvciBjb25kaXRpb25zLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
