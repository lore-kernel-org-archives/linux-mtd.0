Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29EFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 06:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DePf3t6ans0ktQyH7uxT8PApiKfmd7uh38Krx+ZRoU8=; b=PmA1/0nN6uv1qi
	GenAIrpKo6hhdda0K05TMU47DPXVnaJfrFwdXWG7K4D+xyF4387OnnL4Dmw3Ps9jqteVaO4eLcPh9
	B8mjpzOJIyTOwy7dERZG7zEa1vPjX/TnMZ4atSGxFR7Zsflzj5dQmxhPxmHaRarzfqS7FiSUhS9sJ
	dc4D4fUzHDpSseEEVfGyjGHoDJg64M0P3NkpFPYJXwND6C8TsxAWPalyzToJvPXDo+rVg8c6GIhmR
	Qc0oeWmk48g5Wxqp+4VO6f8S3Lp4c2lwWe7ltFnORxcuUsFuJ0/EyN7s/FX9nhWRTaLSOQFkBfZZY
	v4iU7BL9Tp/EBMX5CGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8GWj-007zyw-KZ; Fri, 14 Jan 2022 06:57:33 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8GWe-007zxJ-TH; Fri, 14 Jan 2022 06:57:31 +0000
Received: (Authenticated sender: peter@korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6952FFF805;
 Fri, 14 Jan 2022 06:57:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8GWI-0002SW-Ku; Fri, 14 Jan 2022 07:57:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>,  Andrew Lunn <andrew@lunn.ch>,  Ulf
 Hansson <ulf.hansson@linaro.org>,  Vignesh Raghavendra <vigneshr@ti.com>,
 KVM list <kvm@vger.kernel.org>,  "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-iio@vger.kernel.org,  Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,  ALSA Development Mailing List
 <alsa-devel@alsa-project.org>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Jaroslav Kysela <perex@perex.cz>,
 Guenter Roeck <groeck@chromium.org>,  Thierry Reding
 <thierry.reding@gmail.com>,  MTD Maling List
 <linux-mtd@lists.infradead.org>,  Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org,  Jiri Slaby <jirislaby@kernel.org>,
 openipmi-developer@lists.sourceforge.net,  "David S. Miller"
 <davem@davemloft.net>,  Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,  Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>,  Joakim Zhang
 <qiangqing.zhang@nxp.com>,  Kamal Dasu <kdasu.kdev@gmail.com>,  Lee Jones
 <lee.jones@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>,  Daniel
 Lezcano <daniel.lezcano@linaro.org>,  Kishon Vijay Abraham I
 <kishon@ti.com>,  Geert Uytterhoeven <geert@linux-m68k.org>,  "open
 list\:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,  Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,  bcm-kernel-feedback-list
 <bcm-kernel-feedback-list@broadcom.com>,  Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,  Robert Richter
 <rric@kernel.org>,  Saravanan Sekar <sravanhome@gmail.com>,  Corey Minyard
 <minyard@acm.org>,  Linux PM list <linux-pm@vger.kernel.org>,  Liam
 Girdwood <lgirdwood@gmail.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  John Garry <john.garry@huawei.com>,  William
 Breathitt Gray <vilhelm.gray@gmail.com>,  Mark Gross
 <markgross@kernel.org>,  Hans de Goede <hdegoede@redhat.com>,  Alex
 Williamson <alex.williamson@redhat.com>,  Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>,  Sebastian Reichel <sre@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  Takashi Iwai <tiwai@suse.com>,
 platform-driver-x86@vger.kernel.org,  Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-edac@vger.kernel.org,  Sergey Shtylyov <s.shtylyov@omp.ru>,  Mun
 Yew Tham <mun.yew.tham@intel.com>,  Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  "open list\:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>,  Cornelia Huck
 <cohuck@redhat.com>,  Linux MMC List <linux-mmc@vger.kernel.org>,  Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,  linux-spi
 <linux-spi@vger.kernel.org>,  Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>,  Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>,  Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Richard Weinberger
 <richard@nod.at>,  Niklas =?utf-8?Q?S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,  Brian Norris
 <computersforpeace@gmail.com>,  netdev@vger.kernel.org
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
References: <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
Date: Fri, 14 Jan 2022 07:57:06 +0100
In-Reply-To: <20220113194358.xnnbhsoyetihterb@pengutronix.de> ("Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Thu, 13 Jan 2022 20:43:58
 +0100")
Message-ID: <87ilum954t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_225729_285835_CAB90A5D 
X-CRM114-Status: GOOD (  15.83  )
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

Pj4+Pj4gIlV3ZSIgPT0gVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4gd3JpdGVzOgoKID4gVGhlIHN1YnN5c3RlbXMgcmVndWxhdG9yLCBjbGsgYW5kIGdw
aW8gaGF2ZSB0aGUgY29uY2VwdCBvZiBhIGR1bW15CiA+IHJlc291cmNlLiBGb3IgcmVndWxhdG9y
LCBjbGsgYW5kIGdwaW8gdGhlcmUgaXMgYSBzZW1hbnRpYyBkaWZmZXJlbmNlCiA+IGJldHdlZW4g
dGhlIHJlZ3VsYXIgX2dldCgpIGZ1bmN0aW9uIGFuZCB0aGUgX2dldF9vcHRpb25hbCgpIHZhcmlh
bnQuCiA+IChPbmUgbWlnaHQgcmV0dXJuIHRoZSBkdW1teSByZXNvdXJjZSwgdGhlIG90aGVyIHdv
bid0LiBVbmZvcnR1bmF0ZWx5CiA+IHdoaWNoIG9uZSBpbXBsZW1lbnRzIHdoaWNoIGlzbid0IHRo
ZSBzYW1lIGZvciB0aGVzZSB0aHJlZS4pIFRoZQogPiBkaWZmZXJlbmNlIGJldHdlZW4gcGxhdGZv
cm1fZ2V0X2lycSgpIGFuZCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgaXMKID4gb25seSB0
aGF0IHRoZSBmb3JtZXIgbWlnaHQgZW1pdCBhbiBlcnJvciBtZXNzYWdlIGFuZCB0aGUgbGF0ZXIg
d29uJ3QuCgogPiBUbyBwcmV2ZW50IHBlb3BsZSdzIGV4cGVjdGF0aW9ucyB0aGF0IHRoZXJlIGlz
IGEgc2VtYW50aWMgZGlmZmVyZW5jZQogPiBiZXR3ZWVuIHRoZXNlIHRvbywgcmVuYW1lIHBsYXRm
b3JtX2dldF9pcnFfb3B0aW9uYWwoKSB0bwogPiBwbGF0Zm9ybV9nZXRfaXJxX3NpbGVudCgpIHRv
IG1ha2UgdGhlIGFjdHVhbCBkaWZmZXJlbmNlIG1vcmUgb2J2aW91cy4KCiA+IFRoZSAjZGVmaW5l
IGZvciB0aGUgb2xkIG5hbWUgY2FuIGFuZCBzaG91bGQgYmUgcmVtb3ZlZCBvbmNlIGFsbCBwYXRj
aGVzCiA+IGN1cnJlbnRseSBpbiBmbHV4IHN0aWxsIHJlbHlpbmcgb24gcGxhdGZvcm1fZ2V0X2ly
cV9vcHRpb25hbCgpIGFyZQogPiBmaXhlZC4KCiA+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpGb3IgaTJjLW9jb3Jlcy5j
OgoKQWNrZWQtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
