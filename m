Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E9BC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 14:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC226608FE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 14:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC226608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yA4VmPdR/IzJTCeBOOA9mm4unfeuZNkjpeaOoKV8PVc=; b=2mwPsmhTpSrR4F
	RtYzNkeGKSPX9p7pLVUTtSDRUo9ySEMEP9qbtoxFpNvVqo2RkYkZmpOii5oLVdYWY1A4tiVuFdyLv
	bTVhK2dCziAWTOqStsst3OW+Krv+kask3Nt3nSQnpoRbCSx5sgdRNb0w0L2uLStWWCx6NlYPYqX2q
	pH/iBZ9CESPnf+5vafrpeCSxy5fO0uZZbPNKnKBYhn3kv591J4yYQohfjskbvIRl/307frG2pt4Em
	2UkP6y9MPut6dG+nbwhCJFWyqFIqtAMZQmHxIZIuS5Slh1lon36wo1ar6aDi8qdIAlT2NVgDXfV03
	ylLUzh4aA+x6Mg5VjQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfjo9-00568u-FT; Wed, 27 Oct 2021 14:21:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfjo6-005676-2Z; Wed, 27 Oct 2021 14:21:35 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDBB760D42;
 Wed, 27 Oct 2021 14:21:32 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mfjo2-001vW7-MU; Wed, 27 Oct 2021 15:21:30 +0100
Date: Wed, 27 Oct 2021 15:21:28 +0100
Message-ID: <874k92blav.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, <joe@perches.com>,
 Rob Herring <robh+dt@kernel.org>, maxime coquelin
 <mcoquelin.stm32@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 michael turquette <mturquette@baylibre.com>,
 stephen boyd <sboyd@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 "david s . miller" <davem@davemloft.net>, david airlie <airlied@linux.ie>,
 daniel vetter <daniel@ffwll.ch>, thierry reding <thierry.reding@gmail.com>,
 sam ravnborg <sam@ravnborg.org>,
 yannick fertre <yannick.fertre@foss.st.com>, "philippe\
 cornu" <philippe.cornu@foss.st.com>, benjamin gaignard
 <benjamin.gaignard@linaro.org>, vinod koul <vkoul@kernel.org>,
 ohad ben-cohen <ohad@wizery.com>,
 bjorn andersson <bjorn.andersson@linaro.org>, baolin wang
 <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>, "lars-peter\
 clausen" <lars@metafoo.de>, olivier moysan <olivier.moysan@foss.st.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, Thomas Gleixner
 <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 "Mauro Carvalho\ Chehab" <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones
 <lee.jones@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "Richard\ Weinberger" <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Jakub\ Kicinski" <kuba@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Matt Mackall <mpm@selenic.com>, "Alessandro\
 Zummo" <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Viresh Kumar <viresh.kumar@linaro.org>, "Ahmad\
 Fatoum" <a.fatoum@pengutronix.de>, Jagan Teki <jagan@amarulasolutions.com>,
 dillon min <dillon.minfei@gmail.com>, Marek Vasut <marex@denx.de>,
 "Laurent\ Pinchart" <laurent.pinchart@ideasonboard.com>, Sebastian Reichel
 <sre@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, pascal Paillet
 <p.paillet@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "Jose\ Abreu" <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dmaengine@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
In-Reply-To: <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
 <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
 <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: patrice.chotard@foss.st.com,
 krzysztof.kozlowski@canonical.com, joe@perches.com, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, airlied@linux.ie, daniel@ffwll.ch,
 thierry.reding@gmail.com, sam@ravnborg.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, benjamin.gaignard@linaro.org, vkoul@kernel.org,
 ohad@wizery.com, bjorn.andersson@linaro.org, baolin.wang7@gmail.com,
 jic23@kernel.org, lars@metafoo.de, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, tglx@linutronix.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, hugues.fruchet@foss.st.com, fabrice.gasnier@foss.st.com,
 lee.jones@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, kuba@kernel.org, srinivas.kandagatla@linaro.org,
 kishon@ti.com, linus.walleij@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, mathieu.poirier@linaro.org, mpm@selenic.com, a.
 zummo@towertech.it, alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, wim@linux-watchdog.org, linux@roeck-us.net,
 geert+renesas@glider.be, viresh.kumar@linaro.org, a.fatoum@pengutronix.de,
 jagan@amarulasolutions.com, dillon.minfei@gmail.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, sre@kernel.org, dmitry.torokhov@gmail.com,
 paul@crapouillou.net, fabien.dessenne@foss.st.com,
 christophe.roullier@foss.st.com, gabriel.fernandez@foss.st.com,
 lionel.debieve@foss.st.com, amelie.delaunay@foss.st.com,
 pierre-yves.mordret@foss.st.com, ludovic.barre@foss.st.com,
 christophe.kerello@foss.st.com, p.paillet@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, erwan.leray@foss.st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dri-devel@lists
 .freedesktop.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_072134_188630_B8EDEA2F 
X-CRM114-Status: GOOD (  29.96  )
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

T24gV2VkLCAyNyBPY3QgMjAyMSAxNDo1NjozNSArMDEwMCwKUGF0cmljZSBDSE9UQVJEIDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+IAo+IEhpIE1hcmMKPiAKPiArSm9lIFBl
cmNoZXMKPiAKPiBPbiAxMC8yNy8yMSA4OjExIEFNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4g
PiBIaSBNYXJjCj4gPiAKPiA+IE9uIDEwLzIwLzIxIDE6MzkgUE0sIE1hcmMgWnluZ2llciB3cm90
ZToKPiA+PiBPbiBXZWQsIDIwIE9jdCAyMDIxIDA4OjQ1OjAyICswMTAwLAo+ID4+IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4g
Pj4+Cj4gPj4+IE9uIDIwLzEwLzIwMjEgMDg6NTAsIHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNv
bSB3cm90ZToKPiA+Pj4+IEZyb206IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZv
c3Muc3QuY29tPgo+ID4+Pj4KPiA+Pj4+IE5vdCBhbGwgQHN0LmNvbSBlbWFpbCBhZGRyZXNzIGFy
ZSBjb25jZXJuZWQsIG9ubHkgcGVvcGxlIHdobyBoYXZlCj4gPj4+PiBhIHNwZWNpZmljIEBmb3Nz
LnN0LmNvbSBlbWFpbCB3aWxsIHNlZSB0aGVpciBlbnRyeSB1cGRhdGVkLgo+ID4+Pj4gRm9yIHNv
bWUgcGVvcGxlLCB3aG8gbGVmdCB0aGUgY29tcGFueSwgcmVtb3ZlIHRoZWlyIGVtYWlsLgo+ID4+
Pj4KPiA+Pj4KPiA+Pj4gUGxlYXNlIHNwbGl0IHNpbXBsZSBhZGRyZXNzIGNoYW5nZSBmcm9tIG1h
aW50YWluZXIgdXBkYXRlcyAocmVtb3ZhbCwKPiA+Pj4gYWRkaXRpb24pLgo+ID4+Pgo+ID4+PiBB
bHNvIHdvdWxkIGJlIG5pY2UgdG8gc2VlIGhlcmUgZXhwbGFpbmVkICp3aHkqIGFyZSB5b3UgZG9p
bmcgdGhpcy4KPiA+Pgo+ID4+IEFuZCB3aHkgdGhpcyBjYW4ndCBiZSBkb25lIHdpdGggYSBzaW5n
bGUgdXBkYXRlIHRvIC5tYWlsbWFwLCBsaWtlCj4gPj4gYW55b25lIGVsc2UgZG9lcy4KPiA+IAo+
ID4gVGhhbmtzIGZvciB0aGUgdGlwcywgeWVzLCBpdCB3aWxsIGJlIHNpbXBsZXIuCj4gPiAKPiA+
IFRoYW5rcwo+ID4gUGF0cmljZQo+ID4gCj4gPj4KPiA+PiAJTS4KPiA+Pgo+IAo+IEkgbWFkZSBh
IHRyeSBieSB1cGRhdGluZyAubWFpbG1hcCB3aXRoIGFkZGluZyBhIG5ldyBlbnRyeSB3aXRoIG15
IEBmb3NzLnN0LmNvbSBlbWFpbCA6Cj4gCj4gIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+
IDxwYWxpLnJvaGFyQGdtYWlsLmNvbT4KPiAgUGFvbG8gJ0JsYWlzb3JibGFkZScgR2lhcnJ1c3Nv
IDxibGFpc29yYmxhZGVAeWFob28uaXQ+Cj4gK1BhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQGZvc3Muc3QuY29tPiA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPiAgUGF0cmljayBNb2No
ZWwgPG1vY2hlbEBkaWdpdGFsaW1wbGFudC5vcmc+Cj4gIFBhdWwgQnVydG9uIDxwYXVsYnVydG9u
QGtlcm5lbC5vcmc+IDxwYXVsLmJ1cnRvbkBpbWd0ZWMuY29tPgo+IAo+IEJ1dCB3aGVuIHJ1bm5p
bmcgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vc3RpLnlhbWwsIGJ5IG9sZCBlbWFpbCBpcyBzdGlsbCBkaXNwbGF5ZWQKPiAK
PiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiAobWFpbnRhaW5lcjpPUEVOIEZJUk1X
QVJFIEFORCBGTEFUVEVORUQgREVWSUNFIFRSRUUgQklORElOR1MpCj4gUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPiAoaW4gZmlsZSkKPiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZyAob3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0UgVFJF
RSBCSU5ESU5HUykKPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3QpCj4g
Cj4gQnkgZGVmYXVsdCwgdGhlIGdldF9tYWludGFpbmVyLnBsIHNjcmlwdCBpcyB1c2luZyAubWFp
bG1hcCBmaWxlCj4gKCRlbWFpbF91c2VfbWFpbG1hcCA9IDEpLgo+IAo+IEl0IHNlZW1zIHRoZXJl
IGlzIGFuIGlzc3VlIHdpdGggZ2V0X21haW50YWluZXIucGwgYW5kIG1haW50YWluZXIKPiBuYW1l
L2UtbWFpbCBmb3VuZCBpbiB5YW1sIGZpbGUgPwoKVHJ5IHRoaXMgKHdhcm5pbmcgdGhvdWdoOiBt
eSBQZXJsLWZvbyBpcyBub24tZXhpc3RlbnQpLgoKCU0uCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9n
ZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKaW5kZXggMjA3NWRi
MGMwOGI4Li4yYTg0YTNmYjAxMzAgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvZ2V0X21haW50YWluZXIu
cGwKKysrIGIvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbApAQCAtOTg2LDYgKzk4Niw3IEBAIHN1
YiBnZXRfbWFpbnRhaW5lcnMgewogCSAgICBteSAoJG5hbWUsICRhZGRyZXNzKSA9IHBhcnNlX2Vt
YWlsKCRlbWFpbCk7CiAKIAkgICAgbXkgJHRtcF9lbWFpbCA9IGZvcm1hdF9lbWFpbCgkbmFtZSwg
JGFkZHJlc3MsICRlbWFpbF91c2VuYW1lKTsKKwkgICAgJHRtcF9lbWFpbCA9IG1haWxtYXBfZW1h
aWwoJHRtcF9lbWFpbCk7CiAJICAgIHB1c2hfZW1haWxfYWRkcmVzcygkdG1wX2VtYWlsLCAnJyk7
CiAJICAgIGFkZF9yb2xlKCR0bXBfZW1haWwsICdpbiBmaWxlJyk7CiAJfQoKLS0gCldpdGhvdXQg
ZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
