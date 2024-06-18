Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0690C2BA18
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yolyXGXjTco+o04LEmpeip3CwSQ/A4pJ8XFFdKtnig=; b=VhwoSu0iqPezLl
	Numg8/EfbGOMQkdfv+QrgP0wINuHRcFrIrpFM+QDQrY+TFHweQpJctcRp4WSVusy9mmgFE25aBtJm
	+RqgXoiUlUh+NEgifzbVWS6d9p4/8Ls9cglc1xp7RHhPL49fbSjkLRrwHSm5Uo2ykqQ6lmpaLOxv8
	SgmHStCgbNt8ZDeQHmijz5Oi2lZ3KP5bUs+nDmFlizDQY2dhRblB/rZdMJEeMAQ8+clwZFrs1Mbq2
	5HFKiHHu5Sf4vmRhfzq1eholpclalFeVJjcabEdGgTYtRfhCXII6TgYlaOk9+KBjC6Du9Nn6SOSNw
	lcx9BnHz4fahRsXhHRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbaP-0000000Fpaf-3iag;
	Tue, 18 Jun 2024 16:21:33 +0000
Received: from forward502b.mail.yandex.net ([178.154.239.146])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJba9-0000000FpWD-25J3;
	Tue, 18 Jun 2024 16:21:20 +0000
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c16:2014:0:640:2712:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id CAAFA5F059;
	Tue, 18 Jun 2024 19:21:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xKLHl69CYiE0-BWlTE6hu;
	Tue, 18 Jun 2024 19:21:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1718727666; bh=3ZVPPTGo8cq6QNmgKbHqK8ZqZExCe+h2ikFe65E6vfw=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=puzpn+qwZpDWr34Mz2VDbCLKw+CF3X4x7FJmlcrAAYOz4Dezeyqid/LQR6ZMsxokZ
	 7Lly2NZd33KM9/c+ruY7aecmDl3Muygsbv231bG9Mdy1tKuDl4h48bTcb1nYvZrRgL
	 GDbEpeWFZbA42dWJbNJtICRIsfhgB5fX4MxOwzTY=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>,  Stephen Boyd <sboyd@kernel.org>, Vinod Koul
 <vkoul@kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Thierry Reding
 <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Mark Brown <broonie@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>,  "Wu,
 Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, Olof Johansson
 <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org,  devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 linux-pwm@vger.kernel.org,  linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-sound@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
Date: Tue, 18 Jun 2024 19:20:58 +0300
In-Reply-To: <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	 <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_092118_210406_AD874C23 
X-CRM114-Status: GOOD (  18.02  )
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

SGVsbG8gQW5keSEKT24gTW9uLCAyMDI0LTA2LTE3IGF0IDEyOjU4ICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6Cj4gT24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMTE6MzjigK9BTSBOaWtpdGEg
U2h1YmluIHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK25pa2l0YS5zaHViaW4ubWFxdWVmZWwubWVA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IFRoZSBnb2FsIGlzIHRvIHJlY2lldmUgQUNLcyBm
b3IgYWxsIHBhdGNoZXMgaW4gc2VyaWVzIHRvIG1lcmdlIGl0Cj4gPiB2aWEgQXJuZCBicmFuY2gu
Cj4gCj4gJ3JlY2VpdmUnCj4gCj4gPiBVbmZvcnR1bmF0ZWx5LCBDTEsgc3Vic3lzdGVtIHN1ZGRl
bmx5IHdlbnQgc2lsZW50IG9uIGNsayBwb3J0aW9uIG9mCj4gPiBzZXJpZXMgVjIgcmVyb2xsLAo+
ID4gdHJpZWQgdG8gcGluZyB0aGVtIGZvciBhYm91dCBhIG1vbnRoIGJ1dCBubyBsdWNrLgo+ID4g
Cj4gPiBMaW5rOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQwOC1lcDkzeHgt
Y2xrLXYyLTEtYWRjZDY4YzEzNzUzQG1hcXVlZmVsLm1lCj4gPiAKPiA+IFNvbWUgY2hhbmdlcyBz
aW5jZSBsYXN0IHZlcnNpb24gKHY5KSAtIHNlZSAiQ2hhbmdlcyBpbiB2MTAiLCBtb3N0bHkKPiA+
IGNvc21ldGljLgo+IAo+IC4uLgo+IAo+ID4gUGF0Y2hlcyBzaG91bGQgYmUgZm9ybWF0ZWQgd2l0
aCAnLS1oaXN0b2dyYW0nCj4gCj4gJ2Zvcm1hdHRlZCcKPiAKPiAuLi4KPiAKPiA+IENoYW5nZXMg
aW4gdjEwOgo+ID4gCj4gPiBSZW9yZGVyZWQgU29CIHRhZ3MgdG8gbWFrZSBzdXJlIHRoZXkgYXBw
ZWFyIGJlZm9yZSBSYiBhbmQgQWNrZWQKPiA+IHRhZ3MuCj4gCj4gVGhpcyBpcyBub3QgcmVxdWly
ZWQuIFRoZSBpbXBvcnRhbmNlIGlzIG9ubHkgdGhlIG9yZGVyIG9mIFNvQnMKPiB0aGVtc2VsdmVz
LiBJZiB0aGV5IGFyZSBpbnRlcmxlYXZlZCB3aXRoIG90aGVyIHRhZ3MsIGl0J3MgZmluZS4KCkFo
IC0gb2suIEp1c3Qgc2F3IHNvbWVvbmUgd2FzIGNvbXBsYWluaW5nIGFib3V0IGI0IHJlb3JkZXJp
bmcgdGhlbS4gCgo+IAo+IC4uLgo+IAo+IAo+IEhvcGVmdWxseSB0byBzZWUgdGhpcyBzZXJpZXMg
YmVpbmcgZXZlbnR1YWxseSBhcHBsaWVkIHNvb24uCj4gQXJuZD8gKERvIHdlIGhhdmUgYWxsIG5l
Y2Vzc2FyeSBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMnIHRhZ3MsIGJ0dz8pCj4gCj4gCgpBcyBpIHNl
ZSBmcm9tIG15IHBlcnNwZWN0aXZlIG9ubHkgdGhyZWUgbGVmdDoKCkNsayBzdWJzeXN0ZW06Cgot
IGNsazogZXA5M3h4OiBhZGQgRFQgc3VwcG9ydCBmb3IgQ2lycnVzIEVQOTN4eAoKRE1BIHN1YnN5
c3RlbSAoYnV0IHRoZSBvbmx5IHJlcXVlc3QgZnJvbSBWaW5vZCwgYXMgZmFyIGFzIGkgcmVtZW1i
ZXIsCndhcyBmaXhpbmcgY29tbWl0cyB0aXRsZXMpOgoKLSBkbWFlbmdpbmU6IGNpcnJ1czogQ29u
dmVydCB0byBEVCBmb3IgQ2lycnVzIEVQOTN4eAotIGRtYWVuZ2luZTogY2lycnVzOiByZW1vdmUg
cGxhdGZvcm0gY29kZQoKQmVzaWRlIHRoYXQgdGFncyBtaXNzaW5nIG9uIHBsYXRmb3JtIGNvZGUg
cmVtb3ZhbCAod2hpY2ggY2FuIGJlIEFja2VkCmJ5IEFybmQgaGltc2VsZiBpIGJlbGlldmUpIGFu
ZCBkdHNpL2R0cyBmaWxlcyAoc2FtZSA/KS4KCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
