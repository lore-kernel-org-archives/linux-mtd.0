Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE9C25B10
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSvJCA7pUtnmi/zlnFkdjoC42QyQVlC3LFAU0nJmrXA=; b=bWeX1HreNGTfbo
	ITdDb9+cnWN/lxGV2w+0hVKSQa5rv9AFPMeEON4SVtf1arqeUZMM2Bz/2KsKNXSmc9THYix3vCoEG
	1mDhI0YfacN0F7v29AIGAY65pbTeCns1bm3HLyBS2w0mToiMmSdtut8w98CNJrMRiM/nRez06SpPV
	NHMQNwkl7ZD7OeuDxFl7f6v/9zzpw73qQYmo8+a0B+VCc0go9GIsr9yvVKSkxRIL8tMFc7F0ObIdT
	iMO14zVRPTjkAQ+R+g8ED1lzub0Gr7SattBbiWdC5KxVbOIU5J/BxnNPLonIxPkyA45sqqHg4sg4j
	R4VAyOhbfmgGhcusfu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Qgn-0000000C9On-3BeG;
	Mon, 13 May 2024 08:05:41 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Qgh-0000000C9Mp-0lYn;
	Mon, 13 May 2024 08:05:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C90EC0005;
	Mon, 13 May 2024 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715587529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iyoZN19SXhcNpowY087583lyuLXsiKEVgwfckAcf1+w=;
	b=f3DMme5dxtAT4mt5HSyw2dTwDS4cj1aQP7DTsF7JEASt6rAPey2MD6dQjtqCv/f//7ygwr
	80tVcE3yboCLUBnrFQNlSPQbNERb3wwFmlBAzZULm6qLGkekBcWFHmAR+nso3/P5/3xKUi
	jeo8olmnvjtndE9Z8cObUyAS+2gNhW5Uv3rCLkHEncVjQ2OFRVXHs1lDRzno4Td6rkDMdf
	XX3MudMxRzLYEKTNr8IbYiINhlFGkBVlnKNAg19ttCrWo7nXUqBsYV3UhNtI8o0A55+6oO
	9WX0VTKscxls9YA1fYGNpPorXUQ22t0JENtl1Og8jDDN/lrQznxUw6FTyswgOA==
Date: Mon, 13 May 2024 10:05:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 UNGLinuxDriver@microchip.com, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240513100523.4a23d58c@xps-13>
In-Reply-To: <20240513-timing-snippet-38983a6b3e2f@spud>
References: <20240510123018.3902184-1-robh@kernel.org>
	<20240513095504.37776289@xps-13>
	<20240513-timing-snippet-38983a6b3e2f@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_010535_504932_939FB635 
X-CRM114-Status: GOOD (  18.33  )
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

SGkgQ29ub3IsCgpjb25vckBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMTMgTWF5IDIwMjQgMDg6
NTk6MzQgKzAxMDA6Cgo+IE9uIE1vbiwgTWF5IDEzLCAyMDI0IGF0IDA5OjU1OjA0QU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBSb2IsCj4gPiAKPiA+IHJvYmhAa2VybmVsLm9y
ZyB3cm90ZSBvbiBGcmksIDEwIE1heSAyMDI0IDA3OjMwOjE0IC0wNTAwOgo+ID4gICAKPiA+ID4g
QWRkIGFub3RoZXIgYmF0Y2ggb2YgdmFyaW91cyAic2ltcGxlIiBzeXNjb24gY29tcGF0aWJsZXMg
d2hpY2ggd2VyZQo+ID4gPiB1bmRvY3VtZW50ZWQgb3Igc3RpbGwgZG9jdW1lbnRlZCB3aXRoIG9s
ZCB0ZXh0IGJpbmRpbmdzLiBSZW1vdmUgdGhlIG9sZAo+ID4gPiB0ZXh0IGJpbmRpbmcgZG9jcyBm
b3IgdGhlIG9uZXMgd2hpY2ggd2VyZSBkb2N1bWVudGVkLiAgCj4gPiAKPiA+IC4uLgo+ID4gICAK
PiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hdG1lbC1uYW5kLnR4dCAgICB8ICA5
IC0tLS0tLSAgCj4gPiAKPiA+IEkgZG9uJ3Qga25vdyBob3cgdXNlZnVsIGFyZSB0aGVzZSBjb21w
YXRpYmxlcywgYnV0IGlmIEkgdGFrZSB0aGUgY2FzZQo+ID4gb2YgYXRtZWwsc2FtYTVkMy1uZmMt
aW8sIGl0IGlzIG9ubHkgZGVzY3JpYmVkIGluIHRoaXMgZmlsZSwgd2hpbGUKPiA+IHNldmVyYWwg
RFRTSSByZWZlcmVuY2UgaXQuIEFmdGVyIHRoaXMgY2hhbmdlIHRoZXkgd2lsbCBubyBsb25nZXIg
YmUKPiA+IHJlZmVyZW5jZWQgYXQgYWxsIGJ1dCBzdGlsbCBpbiB1c2UuIElzIHRoaXMgaW50ZW5k
ZWQ/IFNoYWxsIHRoZXNlCj4gPiBjb21wYXRpYmxlcyBiZSB0b3RhbGx5IGRyb3BwZWQgZnJvbSB0
aGUgZGV2aWNlIHRyZWVzIGFzIHdlbGw/Cj4gPiAKPiA+ICQgZ2l0IGdyZXAgLWMgYXRtZWwsc2Ft
YTVkMy1uZmMtaW8gYXJjaC8KPiA+IGFyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hNWQy
LmR0c2k6MQo+ID4gYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL3NhbWE1ZDMuZHRzaToxCj4g
PiBhcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtYTVkNC5kdHNpOjEKPiA+IGFyY2gvYXJt
L2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hN2c1LmR0c2k6MSAgCj4gCj4gYXRtZWwsc2FtYTVkMy1u
ZmMtaW8gaXMgYWRkZWQgdG8gdGhlIHN5c2NvbiB5YW1sIGJpbmRpbmcgaW4gdGhpcyBwYXRjaCwK
PiBzbyBpdCdzIGEgbW92ZSBub3QgYSByZW1vdmFsLCBubz8KCkFoIHNvcnJ5LCBJIG1pc3NlZCB0
aGUgYWRkaXRpb25zIGluIHRoaXMgZmlsZSwgZmluZSB0aGVuLCBzb3JyeSBmb3IgdGhlCm1pc3Vu
ZGVyc3RhbmRpbmcuCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gIyBtdGQKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
