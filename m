Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE73AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s52sbSWTgS4Yz47S9bhUhv5IFnsukjMH5g8/xrH4s14=; b=LCjq6qcyTLgpE6
	3mTR17wLke5ofMjUN6HMIS/cNBZSMytQHnzk90m4yBGbRtE04xC4+zHAEHJE55/fmOHnC1nXbbkV8
	MnfkkS6DvMidd9IOK8iDV7m7eXiUcJCF8McUbrDEeXVq+sFzdsp0eFIlN+08HGW1TFfRMb/0mJLmz
	q2BSuY58MdVLXTCYwSSKYy85uW0/HXY63jZogSnl6TNNqoCsNHnDqp9WWc6Qa/V51VFLZNxbR2PNe
	TdMmdPGcJn8fWddeki8sN4YdnxjGVnzQEwVvFbzkTaB7/3Jms79d+N/5MuPmw8JewEEHaik3vSyRS
	aFI6MuLdLFOmm7WzXsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PSS-00EXYG-Qe; Mon, 17 Jan 2022 10:41:52 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PSP-00EXWg-SQ; Mon, 17 Jan 2022 10:41:51 +0000
Received: by mail-qk1-f173.google.com with SMTP id 193so18395340qkh.13;
 Mon, 17 Jan 2022 02:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8wbyaDOKHzyncR/a8atHHiwf57S6QrlnXekhvOqZ5Zc=;
 b=ctHkskrZJjPwrMYuvujLTJu1OjIkvYeA0k1b2ovJ4FdGxJd5nqc2nWOYMjoU//LGeZ
 qgukoFljEKwRlKc1FLc/7dKppx6sQoY7KD5znCg1zCbbC1t6D5pSIV/oZ13FPC0KfOVJ
 g28l62oku45cRhlpMX1rd36gLh+1K07jjlOOtz+umR3j4dwqlw48IEfv4Jo1QqQJ8IW2
 4CQjuk2kRLA67tg07S1NK3GFTN8a9hdrzAT/jT8Byqx89Wmpxgp7NTEyw+6bAw4qova2
 vD2dj0Yslr0jSRtptg2iSS4E2RfU4LQZooF/9nB6XKeH94MzWVRAS0Umf9SEpsVLflfW
 Aj1g==
X-Gm-Message-State: AOAM533OyiOQ0A6WNzpqUrNE6nguV7sL/XavU3faQ/bZJEm4M41MYmyO
 Vs64vWjwhiml0p4avLPM7gb18fP23KXtnHT0
X-Google-Smtp-Source: ABdhPJyuBtMGTg6BoOMljm7UP5owanPIlR6Ho/q30R1RkqGHxHq+iPE46nCtq2l3nU+Kp8q2E3eyzg==
X-Received: by 2002:a05:620a:1906:: with SMTP id
 bj6mr14568287qkb.94.1642416103402; 
 Mon, 17 Jan 2022 02:41:43 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id z5sm8252302qti.57.2022.01.17.02.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 02:41:43 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id g81so44420692ybg.10;
 Mon, 17 Jan 2022 02:41:43 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr5738849uag.78.1642415764003;
 Mon, 17 Jan 2022 02:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
In-Reply-To: <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jan 2022 11:35:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
Message-ID: <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Andrew Lunn <andrew@lunn.ch>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 KVM list <kvm@vger.kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>, 
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-phy@lists.infradead.org, netdev <netdev@vger.kernel.org>, 
 linux-spi <linux-spi@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
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
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, 
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, 
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
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
 Vinod Koul <vkoul@kernel.org>, 
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, 
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_024149_931197_CD48B9CF 
X-CRM114-Status: GOOD (  50.86  )
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

SGkgVXdlLAoKT24gTW9uLCBKYW4gMTcsIDIwMjIgYXQgMTA6MjQgQU0gVXdlIEtsZWluZS1Lw7Zu
aWcKPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MTcsIDIwMjIgYXQgMDk6NDE6NDJBTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+
ID4gT24gU2F0LCBKYW4gMTUsIDIwMjIgYXQgOToyMiBQTSBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0
eWx5b3ZAb21wLnJ1PiB3cm90ZToKPiA+ID4gT24gMS8xNC8yMiAxMToyMiBQTSwgVXdlIEtsZWlu
ZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gWW91IGhhdmUgdG8gdW5kZXJzdGFuZCB0aGF0IGZvciBj
bGsgKGFuZCByZWd1bGF0b3IgYW5kIGdwaW9kKSBOVUxMIGlzIGEKPiA+ID4gPiB2YWxpZCBkZXNj
cmlwdG9yIHRoYXQgY2FuIGFjdHVhbGx5IGJlIHVzZWQsIGl0IGp1c3QgaGFzIG5vIGVmZmVjdC4g
U28KPiA+ID4gPiB0aGlzIGlzIGEgY29udmVuaWVuY2UgdmFsdWUgZm9yIHRoZSBjYXNlICJJZiB0
aGUgY2xrL3JlZ3VsYXRvci9ncGlvZCBpbgo+ID4gPiA+IHF1ZXN0aW9uIGlzbid0IGF2YWlsYWJs
ZSwgdGhlcmUgaXMgbm90aGluZyB0byBkbyIuIFRoaXMgaXMgd2hhdCBtYWtlcwo+ID4gPiA+IGNs
a19nZXRfb3B0aW9uYWwoKSBhbmQgdGhlIG90aGVycyByZWFsbHkgdXNlZnVsIGFuZCBqdXN0aWZp
ZXMgdGhlaXIKPiA+ID4gPiBleGlzdGVuY2UuIFRoaXMgZG9lc24ndCBhcHBseSB0byBwbGF0Zm9y
bV9nZXRfaXJxX29wdGlvbmFsKCkuCj4gPiA+Cj4gPiA+ICAgIEkgZG8gdW5kZXJzdGFuZCB0aGF0
LiBIb3dldmVyLCBJUlFzIGFyZSBhIGRpZmZlcmVudCBiZWFzdCB3aXRoIHRoZWlyCj4gPiA+IG93
biBqdXN0aWZpY2F0aW9ucy4uLgo+ID4KPiA+ID4gPiBjbGtfZ2V0X29wdGlvbmFsKCkgaXMgc2Fu
ZSBhbmQgc2Vuc2libGUgZm9yIGNhc2VzIHdoZXJlIHRoZSBjbGsgbWlnaHQgYmUKPiA+ID4gPiBh
YnNlbnQgYW5kIGl0IGhlbHBzIHlvdSBiZWNhdXNlIHlvdSBkb24ndCBoYXZlIHRvIGRpZmZlcmVu
dGlhdGUgYmV0d2Vlbgo+ID4gPiA+ICJub3QgZm91bmQiIGFuZCAidGhlcmUgaXMgYW4gYWN0dWFs
IHJlc291cmNlIi4KPiA+ID4gPgo+ID4gPiA+IFRoZSByZWFzb24gZm9yIHBsYXRmb3JtX2dldF9p
cnFfb3B0aW9uYWwoKSdzIGV4aXN0ZW5jZSBpcyBqdXN0IHRoYXQKPiA+ID4gPiBwbGF0Zm9ybV9n
ZXRfaXJxKCkgZW1pdHMgYW4gZXJyb3IgbWVzc2FnZSB3aGljaCBpcyB3cm9uZyBvciBzdWJvcHRp
bWFsCj4gPiA+Cj4gPiA+ICAgIEkgdGhpbmsgeW91IGFyZSB2ZXJ5IHdyb25nIGhlcmUuIFRoZSBy
ZWFsIHJlYXNvbiBpcyB0byBzaW1wbGlmeSB0aGUKPiA+ID4gY2FsbGVycy4KPiA+Cj4gPiBJbmRl
ZWQuCj4KPiBUaGUgY29tbWl0IHRoYXQgaW50cm9kdWNlZCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlv
bmFsKCkgc2FpZDoKPgo+ICAgICAgICAgSW50cm9kdWNlIGEgbmV3IHBsYXRmb3JtX2dldF9pcnFf
b3B0aW9uYWwoKSB0aGF0IHdvcmtzIG11Y2ggbGlrZQo+ICAgICAgICAgcGxhdGZvcm1fZ2V0X2ly
cSgpIGJ1dCBkb2VzIG5vdCBvdXRwdXQgYW4gZXJyb3Igb24gZmFpbHVyZSB0bwo+ICAgICAgICAg
ZmluZCB0aGUgaW50ZXJydXB0Lgo+Cj4gU28gdGhlIGF1dGhvciBvZiA4OTczZWE0NzkwMWM4MWEx
OTEyYmQwNWYxNTc3YmVkOWI1YjUyNTA2IGZhaWxlZCB0bwo+IG1lbnRpb24gdGhlIHJlYWwgcmVh
c29uPyBPciBsb29rIGF0Cj4gMzFhOGQ4ZmE4NGM1MWQzYWIwMGJmMDU5MTU4ZDVkZTYxNzhjZjg5
MDoKPgo+ICAgICAgICAgWy4uLl0gdXNlIHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKSB0byBn
ZXQgc2Vjb25kL3RoaXJkIElSUQo+ICAgICAgICAgd2hpY2ggYXJlIG9wdGlvbmFsIHRvIGF2b2lk
IGJlbG93IGVycm9yIG1lc3NhZ2UgZHVyaW5nIHByb2JlOgo+ICAgICAgICAgWy4uLl0KPgo+IExv
b2sgdGhyb3VnaCB0aGUgb3V0cHV0IG9mCj4KPiAgICAgICAgIGdpdCBsb2cgLVNwbGF0Zm9ybV9n
ZXRfaXJxX29wdGlvbmFsCj4KPiB0byBmaW5kIHNldmVyYWwgbW9yZSBvZiB0aGVzZS4KCkNvbW1p
dCA4OTczZWE0NzkwMWM4MWExICgiZHJpdmVyIGNvcmU6IHBsYXRmb3JtOiBJbnRyb2R1Y2UKcGxh
dGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIikgYW5kIHRoZSB2YXJpb3VzIGZpeHVwcyBmaXhlZCB0
aGUgdWdseQpwcmludGluZyBvZiBlcnJvciBtZXNzYWdlcyB0aGF0IHdlcmUgbm90IGFwcGxpY2Fi
bGUuCkluIGhpbmRzaWdodCwgcHJvYmFibHkgY29tbWl0IDc3MjNmNGM1ZWNkYjhkODMgKCJkcml2
ZXIgY29yZToKcGxhdGZvcm06IEFkZCBhbiBlcnJvciBtZXNzYWdlIHRvIHBsYXRmb3JtX2dldF9p
cnEqKCkiKSBzaG91bGQgaGF2ZQpiZWVuIHJldmVydGVkIGluc3RlYWQsIHVudGlsIGEgcGxhdGZv
cm1fZ2V0X2lycV9vcHRpb25hbCgpIHdpdGggcHJvcGVyCnNlbWFudGljcyB3YXMgaW50cm9kdWNl
ZC4gIEJ1dCBhcyB3ZSB3ZXJlIGFsbCBpbiBhIGh1cnJ5IHRvIGtpbGwKdGhlIG5vbi1hcHBsaWNh
YmxlIGVycm9yIG1lc3NhZ2UsIHdlIHdlbnQgZm9yIHRoZSBxdWljayBhbmQgZGlydHkgZml4LgoK
PiBBbHNvIEkgZmFpbCB0byBzZWUgaG93IGEgY2FsbGVyIG9mICh0b2RheSdzKSBwbGF0Zm9ybV9n
ZXRfaXJxX29wdGlvbmFsKCkKPiBpcyBzaW1wbGVyIHRoYW4gYSBjYWxsZXIgb2YgcGxhdGZvcm1f
Z2V0X2lycSgpIGdpdmVuIHRoYXQgdGhlcmUgaXMgbm8KPiBzZW1hbnRpYyBkaWZmZXJlbmNlIGJl
dHdlZW4gdGhlIHR3by4gUGxlYXNlIHNob3cgbWUgYSBzaW5nbGUKPiBjb252ZXJzaW9uIGZyb20g
cGxhdGZvcm1fZ2V0X2lycSB0byBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsIHRoYXQKPiB5aWVs
ZGVkIGEgc2ltcGxpZmljYXRpb24uCgpUaGF0J3MgZXhhY3RseSB3aHkgd2Ugd2FudCB0byBjaGFu
Z2UgdGhlIGxhdHRlciB0byByZXR1cm4gMCA7LSkKCj4gU28geW91IG5lZWQgc29tZSBtb3JlIGVm
Zm9ydCB0byBjb252aW5jZSBtZSBvZiB5b3VyIFBPVi4KPgo+ID4gRXZlbiBmb3IgY2xvY2tzLCB5
b3UgY2Fubm90IGFzc3VtZSB0aGF0IHlvdSBjYW4gYWx3YXlzIGJsaW5kbHkgdXNlCj4gPiB0aGUg
cmV0dXJuZWQgZHVtbXkgKGFjdHVhbGx5IGEgTlVMTCBwb2ludGVyKSB0byBjYWxsIGludG8gdGhl
IGNsawo+ID4gQVBJLiAgV2hpbGUgdGhpcyB3b3JrcyBmaW5lIGZvciBzaW1wbGUgdXNlIGNhc2Vz
LCB3aGVyZSB5b3UganVzdAo+ID4gd2FudCB0byBlbmFibGUvZGlzYWJsZSBhbiBvcHRpb25hbCBj
bG9jayAoY2xrX3ByZXBhcmVfZW5hYmxlKCkgYW5kCj4gPiBjbGtfZGlzYWJsZV91bnByZXBhcmUo
KSksIGl0IGRvZXMgbm90IHdvcmsgZm9yIG1vcmUgY29tcGxleCB1c2UgY2FzZXMuCj4KPiBBZ3Jl
ZWQuIEJ1dCBmb3IgY2xrcyBhbmQgZ3Bpb2RzIGFuZCByZWd1bGF0b3JzIHRoZSBzaW1wbGUgY2Fz
ZSBpcyBxdWl0ZQo+IHVzdWFsLiBGb3IgaXJxcyBpdCBpc24ndC4KCkl0IGlzIGZvciBkZXZpY2Vz
IHRoYXQgY2FuIGhhdmUgZWl0aGVyIHNlcGFyYXRlIGludGVycnVwdHMsIG9yIGEgc2luZ2xlCm11
bHRpcGxleGVkIGludGVycnVwdC4KClRoZSBsb2dpYyBpbiBlLmcuIGRyaXZlcnMvdHR5L3Nlcmlh
bC9zaC1zY2kuYyBhbmQKZHJpdmVycy9zcGkvc3BpLXJzcGkuYyBjb3VsZCBiZSBzaW1wbGlmaWVk
IGFuZCBpbXByb3ZlZCAoY3VycmVudGx5Cml0IGRvZXNuJ3QgaGFuZGxlIGRlZmVycmVkIHByb2Jl
KSBpZiBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkKd291bGQgcmV0dXJuIDAgaW5zdGVhZCBv
ZiAtRU5YSU8uCgo+IEFuZCBpZiB5b3UgY2Fubm90IGJsaW5kbHkgdXNlIHRoZSBkdW1teSwgdGhl
biB5b3UncmUgbm90IHRoZSB0YXJnZXR0ZWQKPiBjYWxsZXIgb2YgKl9nZXRfb3B0aW9uYWwoKSBh
bmQgc2hvdWxkIGJldHRlciB1c2UgKl9nZXQoKSBhbmQgaGFuZGxlCj4gLUVOT0RFViBleHBsaWNp
dGx5LgoKTm8sIGJlY2F1c2UgdGhlIGphbml0b3JzIHRlbmQgdG8gY29uc29saWRhdGUgZXJyb3Ig
bWVzc2FnZSBoYW5kbGluZywKYnkgbW92aW5nIHRoZSBwcmludGluZyB1cCwgaW5zaWRlIHRoZSAq
X2dldCgpIG1ldGhvZHMuICBUaGF0J3MgZXhhY3RseQp3aGF0IGhhcHBlbmVkIGhlcmUuClNvIHRo
ZXJlIGFyZSB0aHJlZSByZWFzb25zOiBiZWNhdXNlIHRoZSBhYnNlbmNlIG9mIGFuIG9wdGlvbmFs
IElSUQppcyBub3QgYW4gZXJyb3IsIGFuZCB0aHVzIHRoYXQgc2hvdWxkIG5vdCBjYXVzZSAoYSkg
YW4gZXJyb3IgY29kZQp0byBiZSByZXR1cm5lZCwgYW5kIChiKSBhbiBlcnJvciBtZXNzYWdlIHRv
IGJlIHByaW50ZWQsIGFuZCAoYykKYmVjYXVzZSBpdCBjYW4gc2ltcGxpZnkgdGhlIGxvZ2ljIGlu
IGRldmljZSBkcml2ZXJzLgoKQ29tbWl0IDg5NzNlYTQ3OTAxYzgxYTEgKCJkcml2ZXIgY29yZTog
cGxhdGZvcm06IEludHJvZHVjZQpwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkiKSBmaXhlZCAo
YiksIGJ1dCBkaWRuJ3QgYWRkcmVzcyAoYSkgYW5kCihjKS4KCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
