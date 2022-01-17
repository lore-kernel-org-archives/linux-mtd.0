Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0A5C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 08:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClTUm9+1JIw8eXco61a5VoCxFcmyIKybvlz/1aHa8uo=; b=btgy/PAchlcWjC
	kIb4sUXUpFcNf2ptVUZG9AYdM78TF9HFuVdzqgqq2cnTFlHy4CZ6VEOjLRUJSIxqhlOCFsMS6KMk0
	vAb3dRBlvf2WUuAdfu0ynRB3tfr0PkZMJHRPjQFJ5E9t0nEnFhEJpUVkgspkOnMDmDCNN+zTC+rZQ
	A/FqmpDod41ZrWAbbqngLleRfRPMjKObpcP5HY8/s6M6camZt3YwBEP0lv+zwAoPBVgdj4mPOxMRT
	wNx9txzaHZhIMyNIQb7SMt63bGhgJ8Jm4CXSupjd9jr0q6Tncao4jYMzYbElAhU9GxQEd8+vvWkgE
	j3Vl/INqK7iAU6ZBcq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9NaW-00E7hI-Tz; Mon, 17 Jan 2022 08:42:05 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9NaT-00E7dO-Iu; Mon, 17 Jan 2022 08:42:03 +0000
Received: by mail-ua1-f49.google.com with SMTP id y4so29126846uad.1;
 Mon, 17 Jan 2022 00:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HSt6CNnm0GlM6Pd+PH2cbsXZ5sf+8uWh7XWO1e+2zQ0=;
 b=nhRoIW+5v6LbSJaT0GVz3gPoK/7RjHmn8OVlN03hyyXajW1HWw+0DuZOt+FjcM3Lh8
 bBVUXSOe1imD0HhkVDuHuyyRavYTnYcDPUHramEbpoWScvhyL/iyZTu96uBUGpVwXxox
 3lBC3NyPHJMSctAMTKNVQPDmYuY+ezQgj61G1GP/ozaa5DzrvGgkuLt4PCExKVI+1Opp
 YUXTtHCRHM0mdJLk9bZotB1PO44KOdSU0AdgY+1fkffnJXKp9tpDhpRWQhLqxoevsyov
 rIX6RJhX0W7rGwVRc38WpYOPwMFf1da8rD6G+2jdrdOaj9Ow67Pqvp24jDvBU7FdG65k
 F11g==
X-Gm-Message-State: AOAM530RpfUsOZO/ysRD0dKLKvke89g3FaD012fL+YqWa6orNSgQcrRi
 FUKVic2JhVaK6w0uM4d+w+zIG1U3cVGeJw==
X-Google-Smtp-Source: ABdhPJzuxk3rHwrZmVHcw1Ocpf3lNZ6BhZL/ezPOd8vsr6LaH2/H5n1Lplj53q4qjKVCTYyxgJjYOQ==
X-Received: by 2002:a05:6102:1d6:: with SMTP id
 s22mr6766198vsq.80.1642408914779; 
 Mon, 17 Jan 2022 00:41:54 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id o143sm425284vke.37.2022.01.17.00.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:41:54 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id m15so29060484uap.6;
 Mon, 17 Jan 2022 00:41:54 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr5629977uag.78.1642408914153;
 Mon, 17 Jan 2022 00:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
In-Reply-To: <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jan 2022 09:41:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
Message-ID: <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
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
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net, 
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, 
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, 
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, 
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 platform-driver-x86@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>, 
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_004201_667157_DD8678F1 
X-CRM114-Status: GOOD (  36.40  )
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

T24gU2F0LCBKYW4gMTUsIDIwMjIgYXQgOToyMiBQTSBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5
b3ZAb21wLnJ1PiB3cm90ZToKPiBPbiAxLzE0LzIyIDExOjIyIFBNLCBVd2UgS2xlaW5lLUvDtm5p
ZyB3cm90ZToKPiA+IFlvdSBoYXZlIHRvIHVuZGVyc3RhbmQgdGhhdCBmb3IgY2xrIChhbmQgcmVn
dWxhdG9yIGFuZCBncGlvZCkgTlVMTCBpcyBhCj4gPiB2YWxpZCBkZXNjcmlwdG9yIHRoYXQgY2Fu
IGFjdHVhbGx5IGJlIHVzZWQsIGl0IGp1c3QgaGFzIG5vIGVmZmVjdC4gU28KPiA+IHRoaXMgaXMg
YSBjb252ZW5pZW5jZSB2YWx1ZSBmb3IgdGhlIGNhc2UgIklmIHRoZSBjbGsvcmVndWxhdG9yL2dw
aW9kIGluCj4gPiBxdWVzdGlvbiBpc24ndCBhdmFpbGFibGUsIHRoZXJlIGlzIG5vdGhpbmcgdG8g
ZG8iLiBUaGlzIGlzIHdoYXQgbWFrZXMKPiA+IGNsa19nZXRfb3B0aW9uYWwoKSBhbmQgdGhlIG90
aGVycyByZWFsbHkgdXNlZnVsIGFuZCBqdXN0aWZpZXMgdGhlaXIKPiA+IGV4aXN0ZW5jZS4gVGhp
cyBkb2Vzbid0IGFwcGx5IHRvIHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKS4KPgo+ICAgIEkg
ZG8gdW5kZXJzdGFuZCB0aGF0LiBIb3dldmVyLCBJUlFzIGFyZSBhIGRpZmZlcmVudCBiZWFzdCB3
aXRoIHRoZWlyCj4gb3duIGp1c3RpZmljYXRpb25zLi4uCgo+ID4gY2xrX2dldF9vcHRpb25hbCgp
IGlzIHNhbmUgYW5kIHNlbnNpYmxlIGZvciBjYXNlcyB3aGVyZSB0aGUgY2xrIG1pZ2h0IGJlCj4g
PiBhYnNlbnQgYW5kIGl0IGhlbHBzIHlvdSBiZWNhdXNlIHlvdSBkb24ndCBoYXZlIHRvIGRpZmZl
cmVudGlhdGUgYmV0d2Vlbgo+ID4gIm5vdCBmb3VuZCIgYW5kICJ0aGVyZSBpcyBhbiBhY3R1YWwg
cmVzb3VyY2UiLgo+ID4KPiA+IFRoZSByZWFzb24gZm9yIHBsYXRmb3JtX2dldF9pcnFfb3B0aW9u
YWwoKSdzIGV4aXN0ZW5jZSBpcyBqdXN0IHRoYXQKPiA+IHBsYXRmb3JtX2dldF9pcnEoKSBlbWl0
cyBhbiBlcnJvciBtZXNzYWdlIHdoaWNoIGlzIHdyb25nIG9yIHN1Ym9wdGltYWwKPgo+ICAgIEkg
dGhpbmsgeW91IGFyZSB2ZXJ5IHdyb25nIGhlcmUuIFRoZSByZWFsIHJlYXNvbiBpcyB0byBzaW1w
bGlmeSB0aGUKPiBjYWxsZXJzLgoKSW5kZWVkLgoKRXZlbiBmb3IgY2xvY2tzLCB5b3UgY2Fubm90
IGFzc3VtZSB0aGF0IHlvdSBjYW4gYWx3YXlzIGJsaW5kbHkgdXNlCnRoZSByZXR1cm5lZCBkdW1t
eSAoYWN0dWFsbHkgYSBOVUxMIHBvaW50ZXIpIHRvIGNhbGwgaW50byB0aGUgY2xrCkFQSS4gIFdo
aWxlIHRoaXMgd29ya3MgZmluZSBmb3Igc2ltcGxlIHVzZSBjYXNlcywgd2hlcmUgeW91IGp1c3QK
d2FudCB0byBlbmFibGUvZGlzYWJsZSBhbiBvcHRpb25hbCBjbG9jayAoY2xrX3ByZXBhcmVfZW5h
YmxlKCkgYW5kCmNsa19kaXNhYmxlX3VucHJlcGFyZSgpKSwgaXQgZG9lcyBub3Qgd29yayBmb3Ig
bW9yZSBjb21wbGV4IHVzZSBjYXNlcy4KCkNvbnNpZGVyIGEgZGV2aWNlIHdpdGggbXVsdGlwbGUg
Y2xvY2sgaW5wdXRzLCBzb21lIG9mIHRoZW0gb3B0aW9uYWwsCndoZXJlIHRoZSBkZXZpY2UgZHJp
dmVyIGhhcyB0byBmaW5kLCBzZWxlY3QgYW5kIGNvbmZpZ3VyZSBhIHN1aXRhYmxlCmNsb2NrIHRv
IG9wZXJhdGUgYXQgYSBjZXJ0YWluIGNsb2NrIGZyZXF1ZW5jeS4gVGhlIGRyaXZlciBjYW4gY2Fs
bApjbGtfZ2V0X3JhdGUoTlVMTCkgZmluZSwgYnV0IHdpbGwgYWx3YXlzIHJlY2VpdmUgYSB6ZXJv
IHJhdGUsIHNvIGl0CmhhcyB0byBjaGVjayBmb3IgdGhpcyAocmVnYXJkbGVzcyBvZiB0aGlzIGJl
aW5nIGEgZHVtbXkgY2xvY2sgb3Igbm90LApiZWNhdXNlIHRoaXMgY291bGQgYmUgYW4gdW5wb3B1
bGF0ZWQgY2xvY2sgY3J5c3RhbCwgd2hpY2ggd291bGQgYmUKZGVzY3JpYmVkIGluIERUIGFzIGEg
KHByZXNlbnQpIGZpeGVkLXJhdGUgY2xvY2sgd2l0aCBjbG9jay1mcmVxdWVuY3kKPSA8MD4pLgpG
b3IgY29uZmlndXJpbmcgdGhlIGNsb2NrIHJhdGUsIHRoZSBkcml2ZXIgZG9lcyBuZWVkIHRvIGNo
ZWNrCmV4cGxpY2l0bHkgZm9yIHRoZSBwcmVzZW5jZSBvZiBhIGR1bW15IGNsb2NrLCBhcyBjbGtf
c2V0X3JhdGUoTlVMTCwKcmF0ZSkgcmV0dXJucyAwICgic3VjY2VzcyIpLCB3aGlsZSBvYnZpb3Vz
bHkgaXQgZGlkbid0IGRvIGFueXRoaW5nLAphbmQgdGh1cyBjb25maWd1cmluZyB0aGUgZGV2aWNl
IHRvIHVzZSB0aGF0IGNsb2NrIHdvdWxkIGNhdXNlIGJyZWFrYWdlLgoKWW91IGNhbiBjaGVjayBp
ZiB0aGUgY2xvY2sgaXMgYSByZWFsIGNsb2NrIG9yIGEgZHVtbXkgdXNpbmcKImlmIChjbGspIC4u
LiIuCkFuZCB5b3UnZCB1c2UgdGhlIHNhbWUgcGF0dGVybiB3aXRoIHBsYXRmb3JtX2lycV9nZXRf
b3B0aW9uYWwoKSBpZiBpdAp3b3VsZCByZXR1cm4gMCBpZiB0aGUgSVJRIHdhcyBub3QgZm91bmQ6
ICJpZiAoaXJxKSAuLi4iLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
