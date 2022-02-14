Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdlaPq6hbANSTkmQLQiVMkJSitsUNtUhRYdr+J1hC5o=; b=qjqMTlRJIKMpvk
	yV7P9SUy/iRQLfH47/6hIrQd9mNZfndEuqHcgEvLW+5uUYiOndDjsYY5d8x56Wx7Xjok3UVSieNOA
	9Eqme8ZW3s8S2huwB5vVfV+VQNwt6DbbVqX5nM9l6h4Z+YQI10X0VK+mWVlcHU8zPHJY2qOhZ5Rpp
	xIQv7ZjmBvJ4Vq1v7OAYLU6mJQmIeGz6C4DVRZ74o+t4SpiK2a0Bs7mZkJ71kpsRH7b0783g8nKyb
	pMwPl0/sR0UG/EpM8bwuNYYu8jwENbgNffJU+1x+c65eaeoqa7r7Pbmt48ysm9gudKIpXIURTX94E
	OuUgdfXTNyQy0Kd0ZB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXEj-00E8fX-19; Mon, 14 Feb 2022 09:01:33 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXEf-00E8dn-64; Mon, 14 Feb 2022 09:01:30 +0000
Received: by mail-ua1-f48.google.com with SMTP id 60so7784190uae.1;
 Mon, 14 Feb 2022 01:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3zUaM8opKL0LG20PPLjLO0sGhx6OMEFs8RjHjfjsiY4=;
 b=L5Q4exEnyP7l/yiFsDaBkuBL/oLhjcFKmzWM3PuGRSsUoe6VZO/dCyanpgD84I6JRb
 Kl8WjpuZ+oafVoBIkm9QsfRuP0SBJZXTxF5iyO3DQTyzRMaPAKFh/vpjnw6QOmTwXRBM
 iCMqAnnY8r5ePsvqkI/4QCf9tf1gtCKdpdvODiNUbtn5kFL9oow7wmeTaoLBn7hOS87c
 NzZvWq3ldf6VO6xX/snB9EyjBd5Aub3qmJcf4COB6Lrwm0IWOMUU3Iohi9rRlbOZChTw
 L8kz6HpUxPZX1Xt7eiLcI0tKR3pkYeHVVmquz3Y9/ID72ikQm/gZBtzUkpVXGRgiYb+z
 Q0yg==
X-Gm-Message-State: AOAM531IS9LqKJVJCJ4OfXlf1XJJNvUeekslIzZYFqc/Nb4Z3IKy5Yia
 YsuIDp3AhU3vr39VzK6ID6A58sJQXdiWSF8t
X-Google-Smtp-Source: ABdhPJzCs2qkJdOcxG1gMStIJspYDHMrPojq7IeeMAumBW8NieXB+ESECJaaAgiQOb8FSVM+PZnkxA==
X-Received: by 2002:ab0:254a:: with SMTP id l10mr3395603uan.131.1644829288196; 
 Mon, 14 Feb 2022 01:01:28 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id p196sm67285vke.27.2022.02.14.01.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 01:01:27 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id a6so8379958vkc.3;
 Mon, 14 Feb 2022 01:01:26 -0800 (PST)
X-Received: by 2002:a1f:7307:: with SMTP id o7mr818150vkc.0.1644829286141;
 Mon, 14 Feb 2022 01:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
 <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
In-Reply-To: <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 10:01:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWi8gno_FBbc=AwsdRtDJik8_bANjQrrRtUOOBRjFN=KA@mail.gmail.com>
Message-ID: <CAMuHMdWi8gno_FBbc=AwsdRtDJik8_bANjQrrRtUOOBRjFN=KA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-phy@lists.infradead.org, 
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 linux-spi@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, 
 openipmi-developer@lists.sourceforge.net, 
 Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, kvm@vger.kernel.org, 
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com, 
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Jaroslav Kysela <perex@perex.cz>, 
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Zha Qipeng <qipeng.zha@intel.com>, Corey Minyard <minyard@acm.org>,
 linux-pm@vger.kernel.org, John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, 
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>, 
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 netdev@vger.kernel.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 linux-mmc@vger.kernel.org, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Oleksij Rempel <linux@rempel-privat.de>, linux-renesas-soc@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_010129_255941_62492CC3 
X-CRM114-Status: GOOD (  32.95  )
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

SGkgVXdlLAoKT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgODoyOSBBTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBPbiBTYXQsIEZlYiAx
MiwgMjAyMiBhdCAxMToxNjozMFBNICswMzAwLCBTZXJnZXkgU2h0eWx5b3Ygd3JvdGU6Cj4gPiBU
aGlzIHBhdGNoIGlzIGJhc2VkIG9uIHRoZSBmb3JtZXIgQW5keSBTaGV2Y2hlbmtvJ3MgcGF0Y2g6
Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMDMzMTE0NDUyNi4xOTQz
OS0xLWFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbS8KPiA+Cj4gPiBDdXJyZW50bHkg
cGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIHJldHVybnMgYW4gZXJyb3IgY29kZSBldmVuIGlm
IElSUQo+ID4gcmVzb3VyY2Ugc2ltcGx5IGhhcyBub3QgYmVlbiBmb3VuZC4gIEl0IHByZXZlbnRz
IHRoZSBjYWxsZXJzIGZyb20gYmVpbmcKPiA+IGVycm9yIGNvZGUgYWdub3N0aWMgaW4gdGhlaXIg
ZXJyb3IgaGFuZGxpbmc6Cj4gPgo+ID4gICAgICAgcmV0ID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRp
b25hbCguLi4pOwo+ID4gICAgICAgaWYgKHJldCA8IDAgJiYgcmV0ICE9IC1FTlhJTykKPiA+ICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsgLy8gcmVzcGVjdCBkZWZlcnJlZCBwcm9iZQo+ID4gICAg
ICAgaWYgKHJldCA+IDApCj4gPiAgICAgICAgICAgICAgIC4uLndlIGdldCBhbiBJUlEuLi4KPiA+
Cj4gPiBBbGwgb3RoZXIgKl9vcHRpb25hbCgpIEFQSXMgc2VlbSB0byByZXR1cm4gMCBvciBOVUxM
IGluIGNhc2UgYW4gb3B0aW9uYWwKPiA+IHJlc291cmNlIGlzIG5vdCBhdmFpbGFibGUuICBMZXQn
cyBmb2xsb3cgdGhpcyBnb29kIGV4YW1wbGUsIHNvIHRoYXQgdGhlCj4gPiBjYWxsZXJzIHdvdWxk
IGxvb2sgbGlrZToKPiA+Cj4gPiAgICAgICByZXQgPSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFs
KC4uLik7Cj4gPiAgICAgICBpZiAocmV0IDwgMCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiA+ICAgICAgIGlmIChyZXQgPiAwKQo+ID4gICAgICAgICAgICAgICAuLi53ZSBnZXQgYW4g
SVJRLi4uCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IE1hdHRoaWFzIFNjaGlmZmVyIDxtYXR0aGlhcy5z
Y2hpZmZlckBldy50cS1ncm91cC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgU2h0eWx5
b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pgo+Cj4gV2hpbGUgdGhpcyBwYXRjaCBpcyBiZXR0ZXIgdGhh
biB2MSwgSSBzdGlsbCBkb24ndCBsaWtlIGl0IGZvciB0aGUKPiByZWFzb25zIGRpc2N1c3NlZCBm
b3IgdjEuIChpLmUuIDAgaXNuJ3QgdXNhYmxlIGFzIGEgZHVtbXkgdmFsdWUgd2hpY2ggSQo+IGNv
bnNpZGVyIHRoZSByZWFsIGFkdmFudGFnZSBmb3IgdGhlIG90aGVyIF9nZXRfb3B0aW9uYWwoKSBm
dW5jdGlvbnMuKQoKSU1ITyB0aGUgcmVhbCBhZHZhbnRhZ2UgaXMgdGhlIHNpbXBsaWZpZWQgZXJy
b3IgaGFuZGxpbmcsIHdoaWNoIGlzIHRoZQphcmVhIHdoZXJlIG1vc3Qgb2YgdGhlIGN1cnJlbnQg
YnVncyBhcmUuIFNvIEkgYXBwbGF1ZCB0aGUgY29yZSBjaGFuZ2UuCgpBbHNvIElNSE8sIHRoZSBk
dW1teSB2YWx1ZSBoYW5kbGluZyBpcyBhIHJlZCBoZXJyaW5nLiAgQ29udHJhcnkgdG8Kb3B0aW9u
YWwgY2xvY2tzIGFuZCByZXNldHMsIGEgbWlzc2luZyBvcHRpb25hbCBpbnRlcnJ1cHQgZG9lcyBu
b3QKYWx3YXlzIG1lYW4gdGhlcmUgaXMgbm90aGluZyB0byBkbzogaW4gY2FzZSBvZiBwb2xsaW5n
LCBzb21ldGhpbmcKZWxzZSBtdXN0IGRlZmluaXRlbHkgYmUgZG9uZS4gIFNvIGV2ZW4gaWYgcmVx
dWVzdF9pcnEoKSB3b3VsZCBhY2NlcHQKYSBkdW1teSBpbnRlcnJ1cHQgemVybyBhbmQganVzdCBk
byBub3RoaW5nLCBpdCB3b3VsZCBnaXZlIHRoZSBmYWxzZQppbXByZXNzaW9uIHRoYXQgdGhhdCBp
cyBhbGwgdGhlcmUgaXMgdG8gZG8sIHdoaWxlIGFuIGFjdHVhbCBjaGVjawpmb3IgemVybyB3aXRo
IHBvbGxpbmcgY29kZSBoYW5kbGluZyBtYXkgc3RpbGwgbmVlZCB0byBiZSBwcmVzZW50LAp0aHVz
IGxlYWRpbmcgdG8gbW9yZSBub3QgbGVzcyBidWdzLgoKPiBBcGFydCBmcm9tIHRoYXQsIEkgdGhp
bmsgdGhlIHN1YmplY3QgaXMgYmFkbHkgY2hvc2VuLiBXaXRoICJNYWtlCj4gc29tZWZ1bmMoKSBv
cHRpb25hbCIgSSB3b3VsZCBleHBlY3QgdGhhdCB5b3UgaW50cm9kdWNlIGEgS2NvbmZpZyBzeW1i
b2wKPiB0aGF0IHJlc3VsdHMgaW4gdGhlIGZ1bmN0aW9uIG5vdCBiZWluZyBhdmFpbGFibGUgd2hl
biBkaXNhYmxlZC4KCkFncmVlZC4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
