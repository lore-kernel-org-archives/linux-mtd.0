Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2E5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 14:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79CA60F38
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 14:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E79CA60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S3hDf/Zumkj5vwzM0dEeb16Kq+Cm4Dg+zzxwbA6Lah0=; b=p91Kb9S4x6qwx6R/NAwIyIWRLr
	5Qs1eY+JLKh/spkezyIaT3yg63JiIBvLHzqQ+g1tT4UjxBOjHLKKZeyVEkVng5OyEDSb7ffJ0DqMJ
	oxdorBvsXtyIP08w9XO13XIUO0wUycRNArpP62ogatiWGCdiUsQtoZ22z3rr4h0TQxZErdxt4xgXP
	mOoh/GusOI5SUE12YTKSMIWwQ6GsLSMmyLF7WIsNiNckghnRB4xAqVZz7FHkWxwcNbhUiXdvJXcIn
	IVgKSovbKKZqzSimgdYfzdClscZw1lyBw8zDG3kVd7U5L/U3X7tDfHDykhmfGEMpNNjnOeKQfXw/v
	qD4haB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfjV9-0053W3-OH; Wed, 27 Oct 2021 14:01:59 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfjV5-0053Uh-5B; Wed, 27 Oct 2021 14:01:56 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RB7hVo012181; 
 Wed, 27 Oct 2021 15:56:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SonikwPLivf5Wf37m9QGw9Dbl0nfvPwQE843HNWkcTc=;
 b=WzTh3e1T+lbbR0asJHNFou5wy8ymDy2S+R6rPJyrqAzstKAMap8J47xdHxMl2RgiS0FA
 GmPrGi2x3OeVUYtOCqe6mJeZ8Qnqgr3AqxOk450p67gxTAT52rOaRO+ShqQ7sCyKWJnI
 akk/0WBtQxfWvGvmNBBFHNJxGj2edblZplh16L99+Icve2UKQ3u0Y7rBt6zEBSDWSZG4
 hjGa2jeJcZtnU6/w30poOeFwKUFpEn8VYHXLg/vCxFZY0lY9ng2HR45n3c8vhiJwnllz
 Jwmg2Jsob0VeZLHlpEugPKm678F0Rb6n0r6pPAbgzUx5bSgYL/7OoJXo5clDxcl3kg2U lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bxputnapf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 15:56:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BC43100034;
 Wed, 27 Oct 2021 15:56:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3742D22D168;
 Wed, 27 Oct 2021 15:56:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 27 Oct
 2021 15:56:35 +0200
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <joe@perches.com>
CC: Rob Herring <robh+dt@kernel.org>, maxime coquelin
 <mcoquelin.stm32@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 michael turquette <mturquette@baylibre.com>,
 stephen boyd <sboyd@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 "david s . miller" <davem@davemloft.net>,
 david airlie <airlied@linux.ie>, daniel vetter <daniel@ffwll.ch>,
 thierry reding <thierry.reding@gmail.com>, sam ravnborg <sam@ravnborg.org>,
 yannick fertre <yannick.fertre@foss.st.com>, "philippe
 cornu" <philippe.cornu@foss.st.com>, benjamin gaignard
 <benjamin.gaignard@linaro.org>,
 vinod koul <vkoul@kernel.org>, ohad ben-cohen <ohad@wizery.com>,
 bjorn andersson <bjorn.andersson@linaro.org>, baolin wang
 <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>, "lars-peter
 clausen" <lars@metafoo.de>, olivier moysan <olivier.moysan@foss.st.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, Thomas Gleixner
 <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones
 <lee.jones@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Matt Mackall <mpm@selenic.com>, "Alessandro
 Zummo" <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Viresh Kumar <viresh.kumar@linaro.org>, "Ahmad
 Fatoum" <a.fatoum@pengutronix.de>, Jagan Teki <jagan@amarulasolutions.com>,
 dillon min <dillon.minfei@gmail.com>, Marek Vasut <marex@denx.de>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Sebastian Reichel
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
 <p.paillet@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>,
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
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
 <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Message-ID: <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
Date: Wed, 27 Oct 2021 15:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_04,2021-10-26_01,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_070155_523692_6D2AC680 
X-CRM114-Status: GOOD (  22.87  )
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

SGkgTWFyYwoKK0pvZSBQZXJjaGVzCgpPbiAxMC8yNy8yMSA4OjExIEFNLCBQYXRyaWNlIENIT1RB
UkQgd3JvdGU6Cj4gSGkgTWFyYwo+IAo+IE9uIDEwLzIwLzIxIDE6MzkgUE0sIE1hcmMgWnluZ2ll
ciB3cm90ZToKPj4gT24gV2VkLCAyMCBPY3QgMjAyMSAwODo0NTowMiArMDEwMCwKPj4gS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPiB3cm90ZToK
Pj4+Cj4+PiBPbiAyMC8xMC8yMDIxIDA4OjUwLCBwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20g
d3JvdGU6Cj4+Pj4gRnJvbTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4+Pj4KPj4+PiBOb3QgYWxsIEBzdC5jb20gZW1haWwgYWRkcmVzcyBhcmUgY29uY2Vy
bmVkLCBvbmx5IHBlb3BsZSB3aG8gaGF2ZQo+Pj4+IGEgc3BlY2lmaWMgQGZvc3Muc3QuY29tIGVt
YWlsIHdpbGwgc2VlIHRoZWlyIGVudHJ5IHVwZGF0ZWQuCj4+Pj4gRm9yIHNvbWUgcGVvcGxlLCB3
aG8gbGVmdCB0aGUgY29tcGFueSwgcmVtb3ZlIHRoZWlyIGVtYWlsLgo+Pj4+Cj4+Pgo+Pj4gUGxl
YXNlIHNwbGl0IHNpbXBsZSBhZGRyZXNzIGNoYW5nZSBmcm9tIG1haW50YWluZXIgdXBkYXRlcyAo
cmVtb3ZhbCwKPj4+IGFkZGl0aW9uKS4KPj4+Cj4+PiBBbHNvIHdvdWxkIGJlIG5pY2UgdG8gc2Vl
IGhlcmUgZXhwbGFpbmVkICp3aHkqIGFyZSB5b3UgZG9pbmcgdGhpcy4KPj4KPj4gQW5kIHdoeSB0
aGlzIGNhbid0IGJlIGRvbmUgd2l0aCBhIHNpbmdsZSB1cGRhdGUgdG8gLm1haWxtYXAsIGxpa2UK
Pj4gYW55b25lIGVsc2UgZG9lcy4KPiAKPiBUaGFua3MgZm9yIHRoZSB0aXBzLCB5ZXMsIGl0IHdp
bGwgYmUgc2ltcGxlci4KPiAKPiBUaGFua3MKPiBQYXRyaWNlCj4gCj4+Cj4+IAlNLgo+PgoKSSBt
YWRlIGEgdHJ5IGJ5IHVwZGF0aW5nIC5tYWlsbWFwIHdpdGggYWRkaW5nIGEgbmV3IGVudHJ5IHdp
dGggbXkgQGZvc3Muc3QuY29tIGVtYWlsIDoKCiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3Jn
PiA8cGFsaS5yb2hhckBnbWFpbC5jb20+CiBQYW9sbyAnQmxhaXNvcmJsYWRlJyBHaWFycnVzc28g
PGJsYWlzb3JibGFkZUB5YWhvby5pdD4KK1BhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPiA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KIFBhdHJpY2sgTW9jaGVsIDxt
b2NoZWxAZGlnaXRhbGltcGxhbnQub3JnPgogUGF1bCBCdXJ0b24gPHBhdWxidXJ0b25Aa2VybmVs
Lm9yZz4gPHBhdWwuYnVydG9uQGltZ3RlYy5jb20+CgpCdXQgd2hlbiBydW5uaW5nIC4vc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3N0aS55YW1sLCBieSBvbGQgZW1haWwgaXMgc3RpbGwgZGlzcGxheWVkCgpSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPiAobWFpbnRhaW5lcjpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVO
RUQgREVWSUNFIFRSRUUgQklORElOR1MpClBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QHN0LmNvbT4gKGluIGZpbGUpCmRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3Q6
T1BFTiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTKQpsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3QpCgpCeSBkZWZhdWx0LCB0aGUgZ2V0X21h
aW50YWluZXIucGwgc2NyaXB0IGlzIHVzaW5nIC5tYWlsbWFwIGZpbGUgKCRlbWFpbF91c2VfbWFp
bG1hcCA9IDEpLgoKSXQgc2VlbXMgdGhlcmUgaXMgYW4gaXNzdWUgd2l0aCBnZXRfbWFpbnRhaW5l
ci5wbCBhbmQgbWFpbnRhaW5lciBuYW1lL2UtbWFpbCBmb3VuZCBpbiB5YW1sIGZpbGUgPwoKVGhh
bmtzClBhdHJpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
