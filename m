Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19D6C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceiN/XBM4iwUshOKm0txF1gjGI9MMuJVQq2Oo2KtP4M=; b=LUp3ayLJyizcHP
	GDTOXxRqlPCnuy38yoiQb0NcXnKyykVUPQxXA3roRrC6SASya/yusaPiEVeYgzN2bi5KEyojsOZUi
	sM67TSUYLHNfG97lKtjRDQFux2y7M4WvGooWd5sh8KLHtJodTvTn4D/005UNizZhbNqM4S2FfYRvp
	Jq8wo+nk1nikl1oGn3SL5iSVRHS/zaf47yCeAoz1D6+AcrURjaeOSrqOg17155NIx66+j1eRZwsKa
	jhHNSNqPQlNRoWoEqDzqFIt2S9fIbT2SKxZ011vStiSjmED6BqOrooL09NRAM641s5iG14/wB7TDP
	qVR9ZifLOtJDMCedn19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JRm-008dX3-6W; Fri, 14 Jan 2022 10:04:38 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JRj-008dWH-B5; Fri, 14 Jan 2022 10:04:36 +0000
Received: by mail-pl1-f177.google.com with SMTP id t18so12853194plg.9;
 Fri, 14 Jan 2022 02:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LMpobQFf1iaA0D70o2w2ggZn7pjngkhXQg858+CLGTw=;
 b=nWHczXWz1+QGEExXkCjV6UYdGJepXd1Wdg6Q0OhdybhAg/uTAfFhCRNkk+UYPEv06Y
 047rLK+I1BomZMtxBOlLOhDAunsF+ifKRd5yeoBhrE3XD22SPGvax3f3mtR5FdkP9hdQ
 /6Y0tzWieJq/UYyb18wYXDxG5rINyGC9xSYkjUKQdcsnED9iBGfr5oIUWtjps1Y+vIVT
 dmZ+bynpq7UGUxaogXT+9LLAlfVrRDrjkQYCYsSr5vevVs1GFI907koAQRVdnw1OGU0Y
 kfxZsXg3e7ZPEMhzXWY/O8jXHgJpAyEBbntQ8AV6/c+Ck7JK/CHRUkiXqH1HVIT7rEGD
 8meQ==
X-Gm-Message-State: AOAM530dFwFE8Xg28Dc4/W7JRSQ8gUv1vcqQbvQ6pQ9YOs77wjDtjimj
 WXuLhKZ5gK2pQ49u6ki5odqExedE+JFesLWP
X-Google-Smtp-Source: ABdhPJxIhgniHuPNeN9cI5V/BJ2eKwDvM8AK7zPcVGWMQ9LQZFsigV0uF6Lp+GyeNBCJfiNG0dpyxw==
X-Received: by 2002:a17:90a:a105:: with SMTP id
 s5mr9832151pjp.170.1642154673944; 
 Fri, 14 Jan 2022 02:04:33 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com.
 [209.85.216.41])
 by smtp.gmail.com with ESMTPSA id d11sm5326870pfu.211.2022.01.14.02.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 02:04:33 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so13742274pjp.0; 
 Fri, 14 Jan 2022 02:04:33 -0800 (PST)
X-Received: by 2002:a67:e905:: with SMTP id c5mr3767888vso.68.1642154342466;
 Fri, 14 Jan 2022 01:59:02 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeCI47ltlWzjzjYy@sirena.org.uk>
 <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
 <20220113224319.akljsjtu7ps75vun@pengutronix.de>
In-Reply-To: <20220113224319.akljsjtu7ps75vun@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 10:58:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
Message-ID: <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
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
 Borislav Petkov <bp@alien8.de>, Jakub Kicinski <kuba@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220114_020435_399355_511E3DC2 
X-CRM114-Status: GOOD (  38.17  )
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

SGkgVXdlLAoKT24gVGh1LCBKYW4gMTMsIDIwMjIgYXQgMTE6NDMgUE0gVXdlIEtsZWluZS1Lw7Zu
aWcKPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MTMsIDIwMjIgYXQgMTE6NTc6NDNQTSArMDMwMCwgU2VyZ2V5IFNodHlseW92IHdyb3RlOgo+ID4g
T24gMS8xMy8yMiAxMToxNyBQTSwgTWFyayBCcm93biB3cm90ZToKPiA+ID4+IFRoZSBzdWJzeXN0
ZW1zIHJlZ3VsYXRvciwgY2xrIGFuZCBncGlvIGhhdmUgdGhlIGNvbmNlcHQgb2YgYSBkdW1teQo+
ID4gPj4gcmVzb3VyY2UuIEZvciByZWd1bGF0b3IsIGNsayBhbmQgZ3BpbyB0aGVyZSBpcyBhIHNl
bWFudGljIGRpZmZlcmVuY2UKPiA+ID4+IGJldHdlZW4gdGhlIHJlZ3VsYXIgX2dldCgpIGZ1bmN0
aW9uIGFuZCB0aGUgX2dldF9vcHRpb25hbCgpIHZhcmlhbnQuCj4gPiA+PiAoT25lIG1pZ2h0IHJl
dHVybiB0aGUgZHVtbXkgcmVzb3VyY2UsIHRoZSBvdGhlciB3b24ndC4gVW5mb3J0dW5hdGVseQo+
ID4gPj4gd2hpY2ggb25lIGltcGxlbWVudHMgd2hpY2ggaXNuJ3QgdGhlIHNhbWUgZm9yIHRoZXNl
IHRocmVlLikgVGhlCj4gPiA+PiBkaWZmZXJlbmNlIGJldHdlZW4gcGxhdGZvcm1fZ2V0X2lycSgp
IGFuZCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgaXMKPiA+ID4+IG9ubHkgdGhhdCB0aGUg
Zm9ybWVyIG1pZ2h0IGVtaXQgYW4gZXJyb3IgbWVzc2FnZSBhbmQgdGhlIGxhdGVyIHdvbid0Lgo+
ID4KPiA+ICAgIFRoaXMgaXMgb25seSBhIGN1cnJlbnQgZGlmZmVyZW5jZSBidXQgSSdtIHN0aWxs
IGdvaW5nIHRvIHJldHVybiAwIElTTwo+ID4gLUVOWElPIGZyb20gbGF0Zm9ybV9nZXRfaXJxX29w
dGlvbmFsKCksIG5vIHdheSBJJ2QgbGVhdmUgdGhhdCAtRU5YSU8gdGhlcmUKPiA+IGFsb25lLi4u
IDotKQo+Cj4gVGhpcyB3b3VsZCBhZGRyZXNzIGEgYml0IG9mIHRoZSBjcml0aWMgaW4gbXkgY29t
bWl0IGxvZy4gQnV0IGFzIDAgaXNuJ3QKPiBhIGR1bW15IHZhbHVlIGxpa2UgdGhlIGR1bW15IHZh
bHVlcyB0aGF0IGV4aXN0IGZvciBjbGssIGdwaW9kIGFuZAo+IHJlZ3VsYXRvciBJIHN0aWxsIHRo
aW5rIHRoYXQgdGhlIG5hbWluZyBpcyBhIGJhZCBpZGVhIGJlY2F1c2UgaXQncyBub3QKPiBpbiB0
aGUgc3Bpcml0IG9mIHRoZSBvdGhlciAqX2dldF9vcHRpb25hbCBmdW5jdGlvbnMuCj4KPiBTZWVp
bmcgeW91IHNheSB0aGF0IC1FTlhJTyBpcyBhIGJhZCByZXR1cm4gdmFsdWUgZm9yCj4gcGxhdGZv
cm1fZ2V0X2lycV9vcHRpb25hbCgpIGFuZCAwIHNob3VsZCBiZSB1c2VkIGluc3RlYWQsIEkgd29u
ZGVyIHdoeQo+IG5vdCBjaGFuZ2luZyBwbGF0Zm9ybV9nZXRfaXJxKCkgdG8gcmV0dXJuIDAgaW5z
dGVhZCBvZiAtRU5YSU8sIHRvby4KPiBUaGlzIHF1ZXN0aW9uIGlzIGZvciBub3cgb25seSBhYm91
dCBhIHNlbnNpYmxlIHNlbWFudGljLiBUaGF0IGFjdHVhbGx5Cj4gY2hhbmdpbmcgcGxhdGZvcm1f
Z2V0X2lycSgpIGlzIHByb2JhYmx5IGhhcmRlciB0aGFuIGNoYW5naW5nCj4gcGxhdGZvcm1fZ2V0
X2lycV9vcHRpb25hbCgpIGlzIGEgZGlmZmVyZW50IHN0b3J5Lgo+Cj4gSWYgb25seSBwbGF0Zm9y
bV9nZXRfaXJxX29wdGlvbmFsKCkgaXMgY2hhbmdlZCBhbmQgZ2l2ZW4gdGhhdCB0aGUKPiBjYWxs
ZXJzIGhhdmUgdG8gZG8gc29tZXRoaW5nIGxpa2U6Cj4KPiAgICAgICAgIGlmICh0aGlzX2lycV9l
eGlzdHMoKSk6Cj4gICAgICAgICAgICAgICAgIC4uLiAoZS5nLiByZXF1ZXN0X2lycSkKPiAgICAg
ICAgIGVsc2U6Cj4gICAgICAgICAgICAgICAgIC4uLiAoZS5nLiBzZXR1cCBwb2xsaW5nKQo+Cj4g
SSByZWFsbHkgdGhpbmsgaXQncyBhIGJhZCBpZGVhIHRoYXQgdGhpc19pcnFfZXhpc3RzKCkgaGFz
IHRvIGJlCj4gZGlmZmVyZW50IGZvciBwbGF0Zm9ybV9nZXRfaXJxKCkgdnMuIHBsYXRmb3JtX2dl
dF9pcnFfb3B0aW9uYWwoKS4KCkZvciBwbGF0Zm9ybV9nZXRfaXJxKCksIHRoZSBJUlEgYmVpbmcg
YWJzZW50IGlzIGFuIGVycm9yIGNvbmRpdGlvbiwKaGVuY2UgaXQgc2hvdWxkIHJldHVybiBhbiBl
cnJvciBjb2RlLgpGb3IgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpLCB0aGUgSVJRIGJlaW5n
IGFic2VudCBpcyBub3QgYW4gZXJyb3IKY29uZGl0aW9uLCBoZW5jZSBpdCBzaG91bGQgbm90IHJl
dHVybiBhbiBlcnJvciBjb2RlLCBhbmQgMCBpcyBPSy4KCkdye29ldGplLGVldGluZ31zLAoKICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
