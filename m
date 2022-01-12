Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F63C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnqlhSouclVWm1HEdkPy2cMi26eZMwI4xYIfEEPKm1g=; b=qrRKhzxDq8fDYL
	OVnQwwS7RF4fvK7V51G50I0sJE9eEfZAkvgCuSkjJ2FRT/us5arnaxiOWlHrnOaqzu3bwbnsvsY7N
	UPaSq6M+HYpAjnlZH7Xb3+lHsvNLmzMey8RnlFrfeSc/W/RVp70PMDgA5uJkagGI3/rNvgBFg7K1k
	1+MF0E2lsYMtePQqJA6xzDuah+yprVUIOsyAAcPphrLeN+CvrTgB2jKMHbYPrhQ3Vv6EAPBKzGgOd
	CgSM/4GjCR1Jry9wX72q/nGE+4HWe6lyzZaCm+PTIHDx5l86ZE239Ruec88k3Itwu3+UF82uDtC60
	SrbZ3D4UpQKAxy3AlVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7aqh-0026Ju-Ap; Wed, 12 Jan 2022 10:27:23 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7aqd-0026Hp-QM; Wed, 12 Jan 2022 10:27:21 +0000
Received: by mail-ua1-f42.google.com with SMTP id y4so3856032uad.1;
 Wed, 12 Jan 2022 02:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bq/EV5whRByTBzcA7NkMG0ZHqS/XeQEEEioGL5IxVZo=;
 b=OmgMeYt/HiVkEr4DWMm9NeD1Ff9krW60PVIQgVbUBNVhgLI9uPlh6tEzdSVRYtVwOA
 tmuuTcr8tMrX1q199EQ8f3JEeyJmTUp8cOMGah7nqrACbjUpRIOcfMBmt+EUFOSoZTgu
 ei2PQDXNR+p7u2d2ZfRhuU1m6D4/cWDCRGhud6eO9mnKYgj+tcbS4TdV3pkD7MYET3YU
 cAwEoOZ1zQHSC1s4eGiMK75OOusYwWaVuHvidTBCcSx62BL44p8PuGep44QM2rRZ98Gi
 /C7FyLnwBShKFTrje8qvv/bKZ0ofySokZCxK1COXWn31KxORTqew3DKv7jxeODzDfqVp
 pQlg==
X-Gm-Message-State: AOAM5314/S1wgUseTEsO2zFhpicCJcb2RtCKB9Uous1oayZrqpOUXiOc
 nlMiQJVQhHSg4US1LJOobZYJjPCCszlI44VT
X-Google-Smtp-Source: ABdhPJzsx3C3SLY8VwcswehbfLmU9Ei+QTEwNapX+i6TAx3XwclCQ7xOtxlniSCRMvxOcLF0HXY+XA==
X-Received: by 2002:ab0:3b16:: with SMTP id n22mr2950526uaw.72.1641983237257; 
 Wed, 12 Jan 2022 02:27:17 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id f23sm1011476vsl.0.2022.01.12.02.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:27:15 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id u6so3940768uaq.0;
 Wed, 12 Jan 2022 02:27:14 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr3809205vsg.57.1641983234508; 
 Wed, 12 Jan 2022 02:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
In-Reply-To: <20220112085009.dbasceh3obfok5dc@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 11:27:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
Message-ID: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org, 
 Jiri Slaby <jirislaby@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 platform-driver-x86@vger.kernel.org, 
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, 
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Eric Auger <eric.auger@redhat.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 openipmi-developer@lists.sourceforge.net, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-edac@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Richard Weinberger <richard@nod.at>, Mun Yew Tham <mun.yew.tham@intel.com>, 
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, 
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_022719_916175_F937F880 
X-CRM114-Status: GOOD (  41.92  )
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

SGkgVXdlLAoKT24gV2VkLCBKYW4gMTIsIDIwMjIgYXQgOTo1MSBBTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBPbiBXZWQsIEphbiAx
MiwgMjAyMiBhdCAwOTozMzo0OEFNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4g
PiBPbiBNb24sIEphbiAxMCwgMjAyMiBhdCAxMDoyMCBQTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1
bm4uY2g+IHdyb3RlOgo+ID4gPiBPbiBNb24sIEphbiAxMCwgMjAyMiBhdCAwOToxMDoxNFBNICsw
MTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEphbiAxMCwgMjAy
MiBhdCAxMDo1NDo0OFBNICswMzAwLCBTZXJnZXkgU2h0eWx5b3Ygd3JvdGU6Cj4gPiA+ID4gPiBU
aGlzIHBhdGNoIGlzIGJhc2VkIG9uIHRoZSBmb3JtZXIgQW5keSBTaGV2Y2hlbmtvJ3MgcGF0Y2g6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMDMz
MTE0NDUyNi4xOTQzOS0xLWFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbS8KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBDdXJyZW50bHkgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIHJldHVy
bnMgYW4gZXJyb3IgY29kZSBldmVuIGlmIElSUQo+ID4gPiA+ID4gcmVzb3VyY2Ugc2ltcGx5IGhh
cyBub3QgYmVlbiBmb3VuZC4gSXQgcHJldmVudHMgdGhlIGNhbGxlcnMgZnJvbSBiZWluZwo+ID4g
PiA+ID4gZXJyb3IgY29kZSBhZ25vc3RpYyBpbiB0aGVpciBlcnJvciBoYW5kbGluZzoKPiA+ID4g
PiA+Cj4gPiA+ID4gPiAgICAgcmV0ID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCguLi4pOwo+
ID4gPiA+ID4gICAgIGlmIChyZXQgPCAwICYmIHJldCAhPSAtRU5YSU8pCj4gPiA+ID4gPiAgICAg
ICAgICAgICByZXR1cm4gcmV0OyAvLyByZXNwZWN0IGRlZmVycmVkIHByb2JlCj4gPiA+ID4gPiAg
ICAgaWYgKHJldCA+IDApCj4gPiA+ID4gPiAgICAgICAgICAgICAuLi53ZSBnZXQgYW4gSVJRLi4u
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQWxsIG90aGVyICpfb3B0aW9uYWwoKSBBUElzIHNlZW0gdG8g
cmV0dXJuIDAgb3IgTlVMTCBpbiBjYXNlIGFuIG9wdGlvbmFsCj4gPiA+ID4gPiByZXNvdXJjZSBp
cyBub3QgYXZhaWxhYmxlLiBMZXQncyBmb2xsb3cgdGhpcyBnb29kIGV4YW1wbGUsIHNvIHRoYXQg
dGhlCj4gPiA+ID4gPiBjYWxsZXJzIHdvdWxkIGxvb2sgbGlrZToKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAgICAgcmV0ID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCguLi4pOwo+ID4gPiA+ID4gICAg
IGlmIChyZXQgPCAwKQo+ID4gPiA+ID4gICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiA+
ICAgICBpZiAocmV0ID4gMCkKPiA+ID4gPiA+ICAgICAgICAgICAgIC4uLndlIGdldCBhbiBJUlEu
Li4KPiA+ID4gPgo+ID4gPiA+IFRoZSBkaWZmZXJlbmNlIHRvIGdwaW9kX2dldF9vcHRpb25hbCAo
YW5kIG1vc3Qgb3RoZXIgKl9vcHRpb25hbCkgaXMgdGhhdAo+ID4gPiA+IHlvdSBjYW4gdXNlIHRo
ZSBOVUxMIHZhbHVlIGFzIGlmIGl0IHdlcmUgYSB2YWxpZCBHUElPLgo+ID4gPiA+Cj4gPiA+ID4g
QXMgdGhpcyBpc24ndCBnaXZlbiB3aXRoIGZvciBpcnFzLCBJIGRvbid0IHRoaW5rIGNoYW5naW5n
IHRoZSByZXR1cm4KPiA+ID4gPiB2YWx1ZSBoYXMgbXVjaCBzZW5zZS4KPiA+ID4KPiA+ID4gV2Ug
YWN0dWFsbHkgd2FudCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgdG8gbG9vayBkaWZmZXJl
bnQgdG8gYWxsCj4gPiA+IHRoZSBvdGhlciBfb3B0aW9uYWwoKSBtZXRob2RzIGJlY2F1c2UgaXQg
aXMgbm90IGVxdWl2YWxlbnQuIElmIGl0Cj4gPiA+IGxvb2tzIHRoZSBzYW1lLCBkZXZlbG9wZXJz
IHdpbGwgYXNzdW1lIGl0IGlzIHRoZSBzYW1lLCBhbmQgZ2V0Cj4gPiA+IHRoZW1zZWx2ZXMgaW50
byB0cm91YmxlLgo+ID4KPiA+IERldmVsb3BlcnMgYWxyZWFkeSBhc3N1bWUgaXQgaXMgdGhlIHNh
bWUsIGFuZCB0aHVzIGZvcmdldCB0aGV5IGhhdmUKPiA+IHRvIGNoZWNrIGFnYWluc3QgLUVOWElP
IGluc3RlYWQgb2YgemVyby4KPgo+IElzIHRoaXMgYW4gYWNrIGZvciByZW5hbWluZyBwbGF0Zm9y
bV9nZXRfaXJxX29wdGlvbmFsKCkgdG8KPiBwbGF0Zm9ybV9nZXRfaXJxX3NpbGVudCgpPwoKTm8g
aXQgaXNuJ3QgOy0pCgpJZiBhbiBvcHRpb25hbCBJUlEgaXMgbm90IHByZXNlbnQsIGRyaXZlcnMg
ZWl0aGVyIGp1c3QgaWdub3JlIGl0IChlLmcuCmZvciBkZXZpY2VzIHRoYXQgY2FuIGhhdmUgbXVs
dGlwbGUgaW50ZXJydXB0cyBvciBhIHNpbmdsZSBtdXhlZCBJUlEpLApvciB0aGV5IGhhdmUgdG8g
cmVzb3J0IHRvIHBvbGxpbmcuIEZvciB0aGUgbGF0dGVyLCBmYWxsLWJhY2sgaGFuZGxpbmcKaXMg
bmVlZGVkIGVsc2V3aGVyZSBpbiB0aGUgZHJpdmVyLgpUbyBtZSBpdCBzb3VuZHMgbXVjaCBtb3Jl
IGxvZ2ljYWwgZm9yIHRoZSBkcml2ZXIgdG8gY2hlY2sgaWYgYW4Kb3B0aW9uYWwgaXJxIGlzIG5v
bi16ZXJvIChhdmFpbGFibGUpIG9yIHplcm8gKG5vdCBhdmFpbGFibGUpLCB0aGFuIHRvCnNwcmlu
a2xlIGFyb3VuZCBjaGVja3MgZm9yIC1FTlhJTy4gSW4gYWRkaXRpb24sIHlvdSBoYXZlIHRvIHJl
bWVtYmVyCnRoYXQgdGhpcyBvbmUgcmV0dXJucyAtRU5YSU8sIHdoaWxlIG90aGVyIEFQSXMgdXNl
IC1FTk9FTlQgb3IgLUVOT1NZUwoob3Igc29tZSBvdGhlciBlcnJvciBjb2RlKSB0byBpbmRpY2F0
ZSBhYnNlbmNlLiBJIHRob3VnaHQgbm90IGhhdmluZwp0byBjYXJlIGFib3V0IHRoZSBhY3R1YWwg
ZXJyb3IgY29kZSB3YXMgdGhlIG1haW4gcmVhc29uIGJlaGluZCB0aGUKaW50cm9kdWN0aW9uIG9m
IHRoZSAqX29wdGlvbmFsKCkgQVBJcy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
