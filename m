Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C71C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/37hrgRVUd7UhZgaw7wGdNl/LgI8EjRqKsBV009MFGQ=; b=bIqU6KqLU8tW45
	mEp/RQ/FaDh2xjk50fmRJRtr8RfF+MHmNMZreXfR3Te5HFQFHgsqFG1dMPYm5LRFcQYZpZmHQ3zyz
	KVLQ1G0G/YUATl5wArnjaCqFdI0ZOvNAsDFZ/NJb2cwA+3qFuOgba9m4pDMeQOjB7zXy55S0FgQEv
	uJr/8j1Y0yW8pY7O7kis1enPLzJpGf88h4U1OTjnqJLq2RAF+HDMZ7htzukOyDO9cDDddFWnNLD19
	utZMz35Y7P9jHv5cSy/GL9nH2FsqXgLd2WAi6pxYZQnAtgXo1xwN2xVjeYnhWvZK4sNhgo1JMLKw1
	L4XHhQxYQjXkbT9fgzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9jsi-000kGY-1w; Tue, 18 Jan 2022 08:30:20 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9jsf-000kFa-KC; Tue, 18 Jan 2022 08:30:19 +0000
Received: by mail-qt1-f177.google.com with SMTP id f5so4997514qtp.11;
 Tue, 18 Jan 2022 00:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wwyuk2lsKqIfL1r34uR4hiV5J4os/EyMOhjZZucVxAA=;
 b=Oy80BdCNgeMGmYYna52qMhTTLHdUnD/tjGVOdqzrSAmFUMSW5sgnD2fZAsb2+0QpHJ
 VF3xKrHhw6azs2wXIo+LHOY7r76VOPULNfEFtpodBA3jmmVPH0L0TPx6livF6otvCCAP
 ECd3eY1aaSy/7o4CIYcqf8tQyAhfCfAVB5QbrF0ZmB5/1kR3xs5o21yrVZZob56MV8vh
 kL8TMxPG1CCszErra31yUm+NZM5oUYvCnwqsrviniZoZGDvjhSs+Ym0E4usMFV+VLD00
 II3KKyIpMEsZ6uVPYQdYAych0E0wTz/b5ADJNUwmXrxgBLEIH4E6LshhqwhwLU/+p4JM
 jG7w==
X-Gm-Message-State: AOAM533wMyFRoSzeHvOqimvb+f8CPdmkvBX8iSY5xvaC+a7rq6nTMz5K
 6sQiEPNFfBTWuAjihj2QjIjuiZZBb+0SCIIY
X-Google-Smtp-Source: ABdhPJwF3iuuzxQKRwd3SA3eLGVCZb3rB/nxPddUnT49t00Y+EHPBcwbYM0zILnBy0iLVyfVnKFNpA==
X-Received: by 2002:ac8:5e4a:: with SMTP id i10mr19799790qtx.569.1642494616024; 
 Tue, 18 Jan 2022 00:30:16 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id m7sm3340300qkn.112.2022.01.18.00.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 00:30:15 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id p5so53364276ybd.13;
 Tue, 18 Jan 2022 00:30:15 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr7281422uag.78.1642494312957;
 Tue, 18 Jan 2022 00:25:12 -0800 (PST)
MIME-Version: 1.0
References: <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
In-Reply-To: <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 09:25:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
Message-ID: <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>, 
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org, 
 linux-spi <linux-spi@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org, 
 Linux PWM List <linux-pwm@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, 
 Mark Gross <markgross@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
 Richard Weinberger <richard@nod.at>, Mun Yew Tham <mun.yew.tham@intel.com>, 
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>, netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_003017_677666_FA3A5AC6 
X-CRM114-Status: GOOD (  40.29  )
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

SGkgVXdlLAoKT24gTW9uLCBKYW4gMTcsIDIwMjIgYXQgNjowNiBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBPbiBNb24sIEphbiAx
NywgMjAyMiBhdCAwMjowODoxOVBNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4g
PiBPbiBNb24sIEphbiAxNywgMjAyMiBhdCAxMjo0OSBQTSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4g
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+ID4gVGhlIGxvZ2lj
IGluIGUuZy4gZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jIGFuZAo+ID4gPiA+IGRyaXZlcnMv
c3BpL3NwaS1yc3BpLmMgY291bGQgYmUgc2ltcGxpZmllZCBhbmQgaW1wcm92ZWQgKGN1cnJlbnRs
eQo+ID4gPiA+IGl0IGRvZXNuJ3QgaGFuZGxlIGRlZmVycmVkIHByb2JlKSBpZiBwbGF0Zm9ybV9n
ZXRfaXJxX29wdGlvbmFsKCkKPiA+ID4gPiB3b3VsZCByZXR1cm4gMCBpbnN0ZWFkIG9mIC1FTlhJ
Ty4KCj4gPiA+IEFsc28gZm9yIHNwaS1yc3BpLmMgSSBkb24ndCBzZWUgaG93IHBsYXRmb3JtX2dl
dF9pcnFfYnluYW1lX29wdGlvbmFsKCkKPiA+ID4gcmV0dXJuaW5nIDAgaW5zdGVhZCBvZiAtRU5Y
SU8gd291bGQgaGVscC4gUGxlYXNlIHRhbGsgaW4gcGF0Y2hlcy4KClsuLi5dCgo+IFRoaXMgaXMg
bm90IGEgc2ltcGxpZmljYXRpb24sIGp1c3QgbG9va2luZyBhdCB0aGUgbGluZSBjb3VudCBhbmQg
dGhlCj4gYWRkZWQgZ290b3MuIFRoYXQncyBiZWNhdXNlIGl0IGFsc28gaW1wcm92ZXMgZXJyb3Ig
aGFuZGxpbmcgYW5kIHNvIHRoZQo+IGVmZmVjdCBpc24ndCBlYXNpbHkgc3BvdHRlZC4KClllcywg
aXQncyBsYXJnZXIgYmVjYXVzZSBpdCBhZGRzIGN1cnJlbnRseSBtaXNzaW5nIGVycm9yIGhhbmRs
aW5nLgoKPiBXaGF0IGFib3V0IHRoZSBmb2xsb3dpbmcgaWRlYSAoaW4gcHl0aG9uaWMgcHNldWRv
IGNvZGUgZm9yIHNpbXBsaWNpdHkpOgoKTm8gaWRlYSB3aGF0IHlvdSBnYWluIGJ5IHRocm93aW5n
IGluIGEgbGFuZ3VhZ2UgdGhhdCBpcyBpcnJlbGV2YW50CnRvIGtlcm5lbCBwcm9ncmFtbWluZyAo
d2h5IG5vIFJ1c3Q/IDstKQoKPiA+ID4gPiBTbyB0aGVyZSBhcmUgdGhyZWUgcmVhc29uczogYmVj
YXVzZSB0aGUgYWJzZW5jZSBvZiBhbiBvcHRpb25hbCBJUlEKPiA+ID4gPiBpcyBub3QgYW4gZXJy
b3IsIGFuZCB0aHVzIHRoYXQgc2hvdWxkIG5vdCBjYXVzZSAoYSkgYW4gZXJyb3IgY29kZQo+ID4g
PiA+IHRvIGJlIHJldHVybmVkLCBhbmQgKGIpIGFuIGVycm9yIG1lc3NhZ2UgdG8gYmUgcHJpbnRl
ZCwgYW5kIChjKQo+ID4gPiA+IGJlY2F1c2UgaXQgY2FuIHNpbXBsaWZ5IHRoZSBsb2dpYyBpbiBk
ZXZpY2UgZHJpdmVycy4KPiA+ID4KPiA+ID4gSSBkb24ndCBhZ3JlZSB0byAoYSkuIElmIHRoZSB2
YWx1ZSBzaWduYWxpbmcgbm90LWZvdW5kIGlzIC1FTlhJTyBvciAwCj4gPiA+IChvciAtRU5PREVW
KSBkb2Vzbid0IG1hdHRlciBtdWNoLiBJIHdvdWxkbid0IGRldmlhdGUgZnJvbSB0aGUgcmV0dXJu
Cj4gPiA+IGNvZGUgc2VtYW50aWNzIG9mIHBsYXRmb3JtX2dldF9pcnEoKSBqdXN0IGZvciBoYXZp
bmcgdG8gY2hlY2sgYWdhaW5zdCAwCj4gPiA+IGluc3RlYWQgb2YgLUVOWElPLiBaZXJvIGlzIHRo
ZW4ganVzdCBhbm90aGVyIG1hZ2ljIHZhbHVlLgo+ID4KPiA+IFplcm8gaXMgYSBuYXR1cmFsIG1h
Z2ljIHZhbHVlIChhbHNvIGZvciBwb2ludGVycykuCj4gPiBFcnJvcnMgYXJlIGFsd2F5cyBuZWdh
dGl2ZS4KPiA+IFBvc2l0aXZlIHZhbHVlcyBhcmUgY29va2llcyAob3IgcG9pbnRlcnMpIGFzc29j
aWF0ZWQgd2l0aCBzdWNjZXNzLgo+Cj4gWWVhaCwgdGhlIGlzc3VlIHdoZXJlIHdlIGRvbid0IGFn
cmVlIGlzIGlmICJub3QtZm91bmQiIGlzIHNwZWNpYWwgZW5vdWdoCj4gdG8gZGVzZXJ2ZSB0aGUg
bmF0dXJhbCBtYWdpYyB2YWx1ZS4gRm9yIG1lIC1FTlhJTyBpcyBtYWdpYyBlbm91Z2ggdG8KPiBo
YW5kbGUgdGhlIGFic2VuY2Ugb2YgYW4gaXJxIGxpbmUuIEkgY29uc2lkZXIgaXQgZXZlbiB0aGUg
YmV0dGVyIG1hZ2ljCj4gdmFsdWUuCgpJdCBkaWZmZXJzIGZyb20gb3RoZXIgc3Vic3lzdGVtcyAo
Y2xrLCBncGlvLCByZXNldCksIHdoaWNoIGRvIHJldHVybgp6ZXJvIG9uIG5vdCBmb3VuZC4KV2hh
dCdzIHRoZSBwb2ludCBpbiBoYXZpbmcgKl9vcHRpb25hbCgpIEFQSXMgaWYgdGhleSBqdXN0IHJl
dHVybiB0aGUKc2FtZSB2YWx1ZXMgYXMgdGhlIG5vbi1vcHRpb25hbCBvbmVzPwoKCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
