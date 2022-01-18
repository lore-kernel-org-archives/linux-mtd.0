Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3149DC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8Dod8D59jqDMcrPTwz76WXGbtVU54cyL8L/pZtLAP0=; b=tDKuxc24rJt2Jb
	wJfSCL1xcljIONSni4dsKAwHCCPG7oWahKZvO+28MN1hVpSDcjABR32Zt7rJgVYc2Qoj0YEWckPGT
	4xuY7sKf6zwwoZ0DUOV++qOv4RQr++1hxsrQva0CCm9p4415ugIfjB0yzpsISmK0lBIfhuLFMJnR+
	NTXSwcYfCFmutL4mghOcV3N1yAFyc/Zwm0twWUtwa1IxNAGK5GDJrzEYdnvTadrqa358TIoIaRten
	i9nqDfYssu0ndaqXnKA/05+9gXWIDiL1D2wWX4/2ZMxVPEVJXlb0uqKC8JMPpR1gTeAPPXIRSE/LK
	LJvSnYglnc6zlXeHdxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9nvb-001VrZ-Iv; Tue, 18 Jan 2022 12:49:35 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9nvY-001Vqg-36; Tue, 18 Jan 2022 12:49:33 +0000
Received: by mail-vk1-f176.google.com with SMTP id d189so12373565vkg.3;
 Tue, 18 Jan 2022 04:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iDNGF1VjVomGlE1aVlmhPbvwByegTECQGcsrxubfQG0=;
 b=k95W8pyJtobN5JeUKeMCN92Rn2VktHZ9AcJqr6vu5dWhesSuWjNjhKInzDV9SS5Ufz
 5/Sqv8gtsX8LFQXMPFUYCgDn36sFE3YbLlU9SNn4uHRs04DzJD9zc3J7uXejl9OaydNj
 Eg4izd5sc+d/IgaXzWUuAWdSSHv3A8wgRLKtXJ9ZkPu7DHd3b2NUDBWSMY2zkbuKa5NX
 7XUENXQK+3HfwGsSpsCTz18KGYvV1AXsxWYM+TVsFSxxrLCWZyglOmYeAvcEjrfwqt6B
 dNh4MAt5wlcROPsnRpDNv+j5xtAxM4AwPmXlVwxl597wgyciQ14puVt4m3Hzp952zIna
 zh5A==
X-Gm-Message-State: AOAM533EqUxm1CMH8adrDnu6b2S0CG1Hd9dmw7YUy7RNRmq8Bwrm3mKI
 ++C3/9JC3T1S9ZXDZjr3J6yAr2hcY+TitdKL
X-Google-Smtp-Source: ABdhPJz1c+WLuFnV57v3C2ZWbxVal2yKWRf8upoasYmUbY3aNjd4LZs/sA8AcG9lzuqTjnXVkWxUMA==
X-Received: by 2002:a1f:aed3:: with SMTP id x202mr7076376vke.40.1642510169774; 
 Tue, 18 Jan 2022 04:49:29 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id o12sm3648569uae.1.2022.01.18.04.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:49:27 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id y4so36304744uad.1;
 Tue, 18 Jan 2022 04:49:27 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr9266907vsu.5.1642510166831; 
 Tue, 18 Jan 2022 04:49:26 -0800 (PST)
MIME-Version: 1.0
References: <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
 <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
 <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
 <CAMuHMdUW8+Y_=uszD+JOZO3Lpa9oDayk+GO+cg276i2f2T285w@mail.gmail.com>
 <20220118120806.pbjsat4ulg3vnhsh@pengutronix.de>
In-Reply-To: <20220118120806.pbjsat4ulg3vnhsh@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 13:49:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkwV9XE_R5FZ=jPtDwLpDbEngG6+X2JmiDJCZJZvUjYA@mail.gmail.com>
Message-ID: <CAMuHMdWkwV9XE_R5FZ=jPtDwLpDbEngG6+X2JmiDJCZJZvUjYA@mail.gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
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
 Eric Auger <eric.auger@redhat.com>, netdev <netdev@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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
 Brian Norris <computersforpeace@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_044932_169027_E8D83638 
X-CRM114-Status: GOOD (  47.33  )
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

SGkgVXdlLAoKT24gVHVlLCBKYW4gMTgsIDIwMjIgYXQgMTowOCBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBPbiBUdWUsIEphbiAx
OCwgMjAyMiBhdCAxMDozNzoyNUFNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4g
PiBPbiBUdWUsIEphbiAxOCwgMjAyMiBhdCAxMDowOSBBTSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4g
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+IEZvciB0aGUgKGNs
a3xncGlvZHxyZWd1bGF0b3IpX2dldF9vcHRpb25hbCgpIHlvdSBkb24ndCBoYXZlIHRvIGNoZWNr
Cj4gPiA+IGFnYWluc3QgdGhlIG1hZ2ljIG5vdC1mb3VuZCB2YWx1ZSAoc28gbm8gaW1wbGVtZW50
YXRpb24gZGV0YWlsIG1hZ2ljCj4gPiA+IGxlYWtzIGludG8gdGhlIGNhbGxlciBjb2RlKSBhbmQg
anVzdCBwYXNzIGl0IHRvIHRoZSBuZXh0IEFQSSBmdW5jdGlvbi4KPiA+ID4gKEFuZCBteSBleHBl
Y3RhdGlvbiB3b3VsZCBiZSB0aGF0IGlmIHlvdSBjaG9zZSB0byByZXByZXNlbnQgbm90LWZvdW5k
IGJ5Cj4gPiA+ICh2b2lkICopNjYgaW5zdGVhZCBvZiBOVUxMLCB5b3Ugd29uJ3QgaGF2ZSB0byBh
ZGFwdCBhbnkgdXNlciwganVzdCB0aGUKPiA+ID4gZnJhbWV3b3JrIGludGVybmFsIGNoZWNrcy4g
VGhpcyBpcyBhIGdvb2QgdGhpbmchKQo+ID4KPiA+IEFoLCB0aGVyZSBpcyB0aGUgd3JvbmcgYXNz
dW1wdGlvbjogZHJpdmVycyBzb21ldGltZXMgZG8gbmVlZCB0byBrbm93Cj4gPiBpZiB0aGUgcmVz
b3VyY2Ugd2FzIGZvdW5kLCBhbmQgdGh1cyBkbyBuZWVkIHRvIGtub3cgYWJvdXQgKHZvaWQgKik2
NiwKPiA+IC1FTk9ERVYsIG9yIC1FTlhJTy4gIEkgYWxyZWFkeSBnYXZlIGV4YW1wbGVzIGZvciBJ
UlEgYW5kIGNsayBiZWZvcmUuCj4gPiBJIGNhbiBpbWFnaW5lIHRoZXNlIGV4aXN0IGZvciBncGlv
ZCBhbmQgcmVndWxhdG9yLCB0b28sIGFzIHNvb24gYXMKPiA+IHlvdSBnbyBiZXlvbmQgdGhlIHRy
aXZpYWwgImVuYWJsZSIgYW5kICJkaXNhYmxlIiB1c2UtY2FzZXMuCj4KPiBNeSBwcmVtaXNlIGlz
IHRoYXQgZXZlcnkgdXNlciB3aG8gaGFzIHRvIGNoZWNrIGZvciAibm90IGZvdW5kIgo+IGV4cGxp
Y2l0bHkgc2hvdWxkIG5vdCB1c2UgKGNsa3xncGlvZClfZ2V0X29wdGlvbmFsKCkgYnV0Cj4gKGNs
a3xncGlvZClfZ2V0KCkgYW5kIGRvIHByb3BlciAoYW5kIGV4cGxpY2l0KSBlcnJvciBoYW5kbGlu
ZyBmb3IKPiAtRU5PREVWLiAoY2xrfGdwaW9kKV9nZXRfb3B0aW9uYWwoKSBpcyBvbmx5IGZvciB0
aGVzZSB0cml2aWFsIHVzZS1jYXNlcy4KPgo+ID4gQW5kIDAvTlVMTCB2cy4gPiAwIGlzIHRoZSBu
YXR1cmFsIGNoZWNrIGhlcmU6IG1pc3NpbmcsIGJ1dCBub3QKPiA+IGFuIGVycm9yLgo+Cj4gRm9y
IG1lIGl0IGl0IDEwMCUgaXJyZWxldmFudCBpZiAibm90IGZvdW5kIiBpcyBhbiBlcnJvciBmb3Ig
dGhlIHF1ZXJ5Cj4gZnVuY3Rpb24gb3Igbm90LiBJIGp1c3QgaGF2ZSB0byBiZSBhYmxlIHRvIGNo
ZWNrIGZvciAibm90IGZvdW5kIiBhbmQKPiByZWFjdCBhY2NvcmRpbmdseS4KPgo+IEFuZCBhZGRp
bmcgYSBmdW5jdGlvbgo+Cj4gICAgICAgICBkZWYgcGxhdGZvcm1fZ2V0X2lycV9vcGlvbmFsKCk6
Cj4gICAgICAgICAgICAgICAgIHJldCA9IHBsYXRmb3JtX2dldF9pcnEoKQo+ICAgICAgICAgICAg
ICAgICBpZiByZXQgPT0gLUVOWElPOgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAw
Cj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQKPgo+IGl0J3Mgbm90IGEgdXNlZnVsIGFkZGl0
aW9uIHRvIHRoZSBBUEkgaWYgSSBjYW5ub3QgdXNlIDAgYXMgYSBkdW1teQo+IGJlY2F1c2UgaXQg
ZG9lc24ndCBzaW1wbGlmeSB0aGUgY2FsbGVyIGVub3VnaCB0byBqdXN0aWZ5IHRoZSBhZGRpdGlv
bmFsCj4gZnVuY3Rpb24uCj4KPiBUaGUgb25seSB0aGluZyBJIG5lZWQgdG8gYmUgYWJsZSBpcyB0
byBkaXN0aW5ndWlzaCB0aGUgY2FzZXMgInRoZXJlIGlzCj4gYW4gaXJxIiwgInRoZXJlIGlzIG5v
IGlycSIgYW5kIGFueXRoaW5nIGVsc2UgaXMgInRoZXJlIGlzIGEgcHJvYmxlbSBJCj4gY2Fubm90
IGhhbmRsZSBhbmQgc28gZm9yd2FyZCBpdCB0byBteSBjYWxsZXIiLiBUaGUgc2VtYW50aWMgb2YK
PiBwbGF0Zm9ybV9nZXRfaXJxKCkgaXMgYWJsZSB0byBzYXRpc2Z5IHRoaXMgcmVxdWlyZW1lbnRb
MV0sIHNvIHdoeSBpbnRyb2R1Y2UKPiBwbGF0Zm9ybV9nZXRfaXJxX29waW9uYWwoKSBmb3IgdGhl
IHNtYWxsIGFkdmFudGFnZSB0aGF0IEkgY2FuIGNoZWNrIGZvcgo+IG5vdC1mb3VuZCB1c2luZwo+
Cj4gICAgICAgICBpZiAoIWlycSkKPgo+IGluc3RlYWQgb2YKPgo+ICAgICAgICAgaWYgKGlycSAh
PSAtRU5YSU8pCj4KPiA/IFRoZSBzZW1hbnRpYyBvZiBwbGF0Zm9ybV9nZXRfaXJxKCkgaXMgZWFz
aWVyICgiRWl0aGVyIGEgdXNhYmxlCj4gbm9uLW5lZ2F0aXZlIGlycSBudW1iZXIgb3IgYSBuZWdh
dGl2ZSBlcnJvciBudW1iZXIiKSBjb21wYXJlZCB0bwo+IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9u
YWwoKSAoIkVpdGhlciBhIHVzYWJsZSBwb3NpdGl2ZSBpcnEgbnVtYmVyIG9yIGEKPiBuZWdhdGl2
ZSBlcnJvciBudW1iZXIgb3IgMCBtZWFuaW5nIG5vdCBmb3VuZCIpLiBVc2FnZSBvZgo+IHBsYXRm
b3JtX2dldF9pcnEoKSBpc24ndCBoYXJkZXIgb3IgbW9yZSBleHBlbnNpdmUgKG5laXRoZXIgZm9y
IGEgaHVtYW4KPiByZWFkZXIgbm9yIGZvciBhIG1hY2hpbmcgcnVubmluZyB0aGUgcmVzdWx0aW5n
IGNvbXBpbGVkIGNvZGUpLgo+IEZvciBhIGh1bWFuIHJlYWRlcgo+Cj4gICAgICAgICBpZiAoaXJx
ICE9IC1FTlhJTykKPgo+IGlzIGV2ZW4gZWFzaWVyIHRvIHVuZGVyc3RhbmQgYmVjYXVzZSBmb3IK
Pgo+ICAgICAgICAgaWYgKCFpcnEpCj4KPiB0aGV5IGhhdmUgdG8gY2hlY2sgd2hlcmUgdGhlIHZh
bHVlIGNvbWVzIGZyb20sIHNlZSBpdCdzCj4gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIGFu
ZCB1bmRlcnN0YW5kIHRoYXQgMCBtZWFucyBub3QtZm91bmQuCgoidklSUSB6ZXJvIGRvZXMgbm90
IGV4aXN0LiIKCj4gVGhpcyBmdW5jdGlvbiBqdXN0IGFkZHMgb3ZlcmhlYWQgYmVjYXVzZSBhcyBh
IGlycSBmcmFtZXdvcmsgdXNlciBJIGhhdmUKPiB0byB1bmRlcnN0YW5kIGFub3RoZXIgZnVuY3Rp
b24uIEZvciBtZSB0aGUgYWRkZWQgYmVuZWZpdCBpcyB0b28gc21hbGwgdG8KPiBqdXN0aWZ5IHRo
ZSBhZGRpdGlvbmFsIGZ1bmN0aW9uLiBBbmQgeW91IGJyZWFrIG91dC1vZi10cmVlIGRyaXZlcnMu
Cj4gVGhlc2UgYXJlIGFsbCBubyBtYWpvciBjb3VudGVyIGFyZ3VtZW50cywgYnV0IGFzIHRoZSBh
ZHZhbnRhZ2UgaXNuJ3QKPiBtYWpvciBlaXRoZXIsIHRoZXkgc3RpbGwgbWF0dGVyLgo+Cj4gQmVz
dCByZWdhcmRzCj4gVXdlCj4KPiBbMV0gdGhlIG9ubHkgYW5ub3lpbmcgdGhpbmcgaXMgdGhlIGVy
cm9yIG1lc3NhZ2UuCgpTbyB0aGVyZSdzIHN0aWxsIGEgbmVlZCBmb3IgdHdvIGZ1bmN0aW9ucy4K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
