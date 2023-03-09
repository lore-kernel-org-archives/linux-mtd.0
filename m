Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFECC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDn9mLe6INHh3Fn7LpMkfcuVQKea9XynpHKJVTm/W9I=; b=GzLRy5qBfUjSKb
	e9MvqFca0NUoJEVckagDixq/FUMzjilbWDUPVlES2qj3uvulGQV0dLCrN1xzE2+chIujJrgD6TDhU
	8YJ7b1fF+08UYo0Fg/ICAhRgZdmW8YXVuqSWdl9QjwoHy9VK2hQ4f8PnHM/1ErFabXgUgT7cNeriG
	l9Ar9RxOOH9yoQdIzxPHoVHu8GYuBsSuKWTiQ9Bv+7ESxodAdtSh0Og32cD6Uo8By7NG0UWr7n2S2
	dHgcn1h/xV+iFMJQuyLFFpr1di+Z7ZkDCZFUzTuGup2NvJZ+ai2XiENkoQbiVxfbIO4m5B+diBuRf
	ZIONNBOT0k4nYROl/Oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGBH-00A3hO-Dv; Thu, 09 Mar 2023 13:19:39 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGBB-00A3fI-MX; Thu, 09 Mar 2023 13:19:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D29391BF203;
	Thu,  9 Mar 2023 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678367968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCS0grjDle8LqIHXYUqxgW9dQGLLuD8q9UNKbRuhYbk=;
	b=Xwei8LaM7A3PtmP2nNF4x28yyM+iJOS9s9PrMxCrGzZC58KjSVM8cHaBeXrAZI/NtfH/9j
	r01nhfdqw3Y5E4seWycsQrKTDFGGLW5n7wwD+gr+9XPRGo17l49ulVlJXO+zEXIj6W/wVp
	xHnGPGBF0BnN6CjB6Mu7s0CWOOvq/3wpWShvMBXpv9A0NVrQOjh4c49bXdwQz2Qj8hWt33
	zxizmlPdNsdJMSab2n/Xqmakf0DwsfvgnyFw9d/JVszhf957LuH1cfuu0MN5C7gxIvLwp6
	eigmkj5aTAo76n4kZiDx68XnLa0GLX9JeCOa/Bk5Ds7ImdmzV7EC+0ot+vZz3Q==
Date: Thu, 9 Mar 2023 14:19:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3] nvmem: add explicit config option to read OF fixed
 cells
Message-ID: <20230309141920.1d3f774e@xps-13>
In-Reply-To: <e845b38c-d0eb-716c-dc51-b89582750f07@gmail.com>
References: <20230309112028.19215-1-zajec5@gmail.com>
	<20230309123513.43b7134f@xps-13>
	<e845b38c-d0eb-716c-dc51-b89582750f07@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_051934_072897_8EB28183 
X-CRM114-Status: GOOD (  31.03  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDkgTWFyIDIwMjMgMTM6
MDE6MTkgKzAxMDA6Cgo+IE9uIDkuMDMuMjAyMyAxMjozNSwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIGIvaW5jbHVk
ZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gPj4gaW5kZXggMDI2MmI4NjE5NGViLi5iM2MxNGNl
ODdhNjUgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4g
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gPj4gQEAgLTczLDYgKzcz
LDcgQEAgc3RydWN0IG52bWVtX2NlbGxfaW5mbyB7Cj4gPj4gICAgKiBAb3duZXI6CVBvaW50ZXIg
dG8gZXhwb3J0ZXIgbW9kdWxlLiBVc2VkIGZvciByZWZjb3VudGluZy4KPiA+PiAgICAqIEBjZWxs
czoJT3B0aW9uYWwgYXJyYXkgb2YgcHJlLWRlZmluZWQgTlZNRU0gY2VsbHMuCj4gPj4gICAgKiBA
bmNlbGxzOglOdW1iZXIgb2YgZWxlbWVudHMgaW4gY2VsbHMuCj4gPj4gKyAqIEB1c2VfZml4ZWRf
b2ZfY2VsbHM6CVJlYWQgZml4ZWQgTlZNRU0gY2VsbHMgZnJvbSBPRi4gIAo+ID4gCj4gPiBJJ20g
c3RpbGwgdW5oYXBweSB3aXRoIHRoZSBuYW1pbmcsIGVzcGVjaWFsbHkgc2luY2UgeW91IGV4cGxh
aW5lZCBpbgo+ID4gbW9yZSBkZXRhaWxzIHRoZSB3aG9sZSBwbGFuIHdoaWNoIGludm9sdmVzIHVz
aW5nIGEgY29udGFpbmVyIHRvIHB1dAo+ID4gdGhlc2UgZml4ZWQgY2VsbHMgZnJvbSBub3cgb24u
IEluIGJvdGggY2FzZXMgeW91IGV4dHJhY3QgY2VsbHMgZnJvbQo+ID4gZml4ZWQgT0Ygbm9kZXMg
YnV0IHRoaXMgYm9vbGVhbiBuZWVkcyB0byBiZSBzZXQgdG8gdHJ1ZSBpbiBvbmUKPiA+IGNhc2Us
IGFuZCBmYWxzZSBpbiB0aGUgb3RoZXIsIHdoaWNoIHdvdWxkIG5vdCBtYWtlIHNlbnNlLgo+ID4g
Cj4gPiBBbHNvLCByZWdhcmRpbmcgdGhlIGJpbmRpbmdzIGNoYW5nZXMsIEknbSBmYWlybHkgaGFw
cHkgd2l0aCB0aGUgaWRlYSwKPiA+IGJ1dCBpZiB3ZSBnbyB0aGlzIHdheSBJIHdvdWxkIHByZWZl
ciBhIGZ1bGwgc2VyaWVzIGluc3RlYWQgb2YKPiA+IGluZGl2aWR1YWwgY2hhbmdlcyB3aXRoOgo+
ID4gCj4gPiAtIHRoZSBib29sZWFuIHlvdSBpbnRyb2R1Y2UgaGVyZSAocmVuYW1lZCwgYXQgdGhl
IHZlcnkgbGVhc3QpCj4gPiAtIHRoZSBuZXcgYmluZGluZ3MgIAo+IAo+IEkgYXNzdW1lIHlvdSBt
ZWFuIGZpeGVkLWxheW91dC55YW1sPwoKWWVzIQoKPiA+IC0gdGhlIHVwZGF0ZSBvZiB0aGUgY3Vy
cmVudCBwcm92aWRlciBiaW5kaW5ncyB0byB0YWtlIHRoZSBuZXcgYmluZGluZ3MKPiA+ICAgIGlu
dG8gYWNjb3VudCBhbmQgZGVwcmVjYXRlIHRoZSBvbGQgb25lcyBvZmZpY2lhbGx5ICAKPiAKPiBX
aGF0IGhhcyB0byBiZSB1cGRhdGVkIGluIGN1cnJlbnQgcHJvY2Vkcz8gSXQgc2VlbXMgdG8gbWUg
dGhhdDoKPiAxLiBDdXJyZW50IE5WTUVNIHByb3ZpZGVycyByZWZlcmVuY2UgbnZtZW0ueWFtbAo+
IDIuIG52bWVtLnlhbWwgcmVmZXJlbmNlcyBudm1lbS1sYXlvdXQueWFtbAo+IDMuIG52bWVtLWxh
eW91dC55YW1sIHJlZmVyZW5jZXMgZml4ZWQtbGF5b3V0LnlhbWwKPiAKPiB3aGF0IGVsc2UgaXMg
bWlzc2luZz8KClRoYXQncyB0aGUgdGhlb3J5LCBidXQgdGhlbiBwcm92aWRlciBiaW5kaW5ncyBz
aG91bGQgcmVmbGVjdCB0aGUKY2hhbmdlcyBhcyB3ZWxsIGluIHRoZWlyIG93biBiaW5kaW5nIGRv
Y3VtZW50cy4KCklPVywgdGhpcyBvbmUgKGFuZCBhbGwgaXRzIGNvdXNpbnMpIGJlY29tZXMgbGVn
YWN5IGFuZCBtdXN0IGJlIHVwZGF0ZWQ6CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9p
bXgtb2NvdHAueWFtbCNMOTIKCihhbmQgdGhlcmUgYXJlIG1hbnkgZmlsZXMgdG8gdXBkYXRlIHRo
ZW4pCgo+IAo+IAo+ID4gLSBzdXBwb3J0IGZvciB0aGUgbmV3IGJpbmRpbmdzIGluIHRoZSBjb3Jl
ICAKPiAKPiBQbGVhc2UsIGRvbid0IGdldCBtZSB3cm9uZywgYnV0IEknbSBub3QgZ29pbmcgdG8g
c3BlbmQgbW9yZSBob3VycyBvbgo+IGFjdHVhbCBjb2Rpbmcgd2l0aG91dCBhcHByb3ZhbCBvZiBj
aG9zZW4gcGF0aC4KCldlbGwsIHlvdSB3YW50IHRvIG1ha2UgdGhlIGJpbmRpbmdzIGV2b2x2ZS4g
SnVzdCB1cGRhdGluZyBhIHNpbmdsZQpiaW5kaW5nIGZpbGUgaXMgbm90IGVub3VnaCwgSSBiZWxp
ZXZlIHdlIHNob3VsZCBhdCBsZWFzdCBwcm92aWRlIGZ1bGwKc3VwcG9ydCBmb3IgdGhlIG5ldyBk
ZXNjcmlwdGlvbi4gQnV0IG9mIGNvdXJzZSBJJ20gZmluZSBkaXNjdXNzaW5nIHdoYXQKZGVzY3Jp
cHRpb24gd2Ugd2FudCBmaXJzdC4KCj4gSSdsbCBuZWVkIHRvIGhhdmUKPiBbUEFUQ0ggVjJdIGR0
LWJpbmRpbmdzOiBudm1lbTogbGF5b3V0czogYWRkIGZpeGVkLWxheW91dAo+IHJldmlld2VkL2Fj
a2VkIGZpcnN0LiBJZiB5b3UgY2FuIGRvIHRoYXQgdGhhdCdzIGdyZWF0Lgo+IAo+IAo+ID4+ICAg
ICogQGtlZXBvdXQ6CU9wdGlvbmFsIGFycmF5IG9mIGtlZXBvdXQgcmFuZ2VzIChzb3J0ZWQgYXNj
ZW5kaW5nIGJ5IHN0YXJ0KS4KPiA+PiAgICAqIEBua2VlcG91dDoJTnVtYmVyIG9mIGVsZW1lbnRz
IGluIHRoZSBrZWVwb3V0IGFycmF5Lgo+ID4+ICAgICogQHR5cGU6CVR5cGUgb2YgdGhlIG52bWVt
IHN0b3JhZ2UKPiA+PiBAQCAtMTAzLDYgKzEwNCw3IEBAIHN0cnVjdCBudm1lbV9jb25maWcgewo+
ID4+ICAgCXN0cnVjdCBtb2R1bGUJCSpvd25lcjsKPiA+PiAgIAljb25zdCBzdHJ1Y3QgbnZtZW1f
Y2VsbF9pbmZvCSpjZWxsczsKPiA+PiAgIAlpbnQJCQluY2VsbHM7Cj4gPj4gKwlib29sCQkJdXNl
X2ZpeGVkX29mX2NlbGxzOwo+ID4+ICAgCWNvbnN0IHN0cnVjdCBudm1lbV9rZWVwb3V0ICprZWVw
b3V0Owo+ID4+ICAgCXVuc2lnbmVkIGludAkJbmtlZXBvdXQ7Cj4gPj4gICAJZW51bSBudm1lbV90
eXBlCQl0eXBlOyAgCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAo+IAoKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
