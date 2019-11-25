Return-Path: <SRS0=NFBb=ZR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E204C432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2019 14:16:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5226820740
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2019 14:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJbHWB92"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5226820740
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fSMWqO7Niyj10uEMvSSDZrUkwjGfFICSP82dZY7z7I=; b=CJbHWB92EmqCX6
	bADrZnJQIyf/fu5+SIGI+5dZ3kVG9TTLTNQaFfKQV9UO4EWfS3wjb7hwHA8Jaj/QrbAIIFE20l05q
	nQmESOtDmYR/pwQkIWJbobuNGu/Oto78R60XDe7mRXZmNlJPmiRuaiV5/vYgvjB/jm39717zGMwJG
	ockr0G8KCTsmgxAQm4wGZJLSR2UZAw2S+rV2In0IhH7TseMLf0CcLGsDOKgLK6J8SDLHR+nzfDbPT
	thIX8yC+yb2GeOW5GkGBJCSFDR98GAsuu4svKYn1lRi1zqO2/SGHh8eUW501sryYnktKECcj62u8J
	D2aHZLVu5dF1RnFaO4dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZF9T-0003nX-Pz; Mon, 25 Nov 2019 14:15:43 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZF9M-0003my-8o
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2019 14:15:39 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 992E44000D;
 Mon, 25 Nov 2019 14:15:24 +0000 (UTC)
Date: Mon, 25 Nov 2019 15:15:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: mtd: Describe mtd-concat devices
Message-ID: <20191125151523.0766b3b7@xps13>
In-Reply-To: <20191118221341.GA30937@bogus>
References: <20191113171505.26128-1-miquel.raynal@bootlin.com>
 <20191113171505.26128-4-miquel.raynal@bootlin.com>
 <20191118221341.GA30937@bogus>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_061536_590092_A4BB6F4A 
X-CRM114-Status: GOOD (  21.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gTW9uLCAxOCBO
b3YgMjAxOSAxNjoxMzo0MSAtMDYwMDoKCj4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDY6MTU6
MDRQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEZyb206IEJlcm5oYXJkIEZyYXVl
bmRpZW5zdCA8a2VybmVsQG5vc3BhbS5vYmVsaWtzLmRlPgo+ID4gCj4gPiBUaGUgbWFpbiB1c2Ug
Y2FzZSB0byBjb25jYXRlbmF0ZSBNVEQgZGV2aWNlcyBpcyBwcm9iYWJseSBTUEktTk9SCj4gPiBm
bGFzaGVzIHdoZXJlIHRoZSBudW1iZXIgb2YgYWRkcmVzcyBiaXRzIGlzIGxpbWl0ZWQgdG8gMjQs
IHdoaWNoIGNhbgo+ID4gYWNjZXNzIGEgcmFuZ2Ugb2YgMTZNaUIuIEJvYXJkIG1hbnVmYWN0dXJl
cnMgbWlnaHQgd2FudCB0byBkb3VibGUgdGhlCj4gPiBTUEkgc3RvcmFnZSBzaXplIGJ5IGFkZGlu
ZyBhIHNlY29uZCBmbGFzaCBhc3NlcnRlZCB0aGFua3MgdG8gYSBzZWNvbmQKPiA+IGNoaXAgc2Vs
ZWN0cyB3aGljaCBlbmhhbmNlcyB0aGUgYWRkcmVzc2luZyBjYXBhYmlsaXRpZXMgdG8gMjUgYml0
cywKPiA+IDMyTWlCLiBIYXZpbmcgdHdvIGRldmljZXMgZm9yIHR3aWNlIHRoZSBzaXplIGlzIGdy
ZWF0IGJ1dCB3aXRob3V0IG1vcmUKPiA+IGdsdWUsIHdlIGNhbm5vdCBkZWZpbmUgcGFydGl0aW9u
IGJvdW5kYXJpZXMgc3ByZWFkIGFjcm9zcyB0aGUgdHdvCj4gPiBkZXZpY2VzLiBUaGlzIGlzIHRo
ZSBnYXAgbXRkLWNvbmNhdCBpbnRlbmRzIHRvIGFkZHJlc3MuCj4gPiAKPiA+IFRoZXJlIGFyZSB0
d28gb3B0aW9ucyB0byBkZXNjcmliZSBjb25jYXRlbmF0ZWQgZGV2aWNlczoKPiA+IDEvIE9uZSBm
bGFzaCBjaGlwIGlzIGRlc2NyaWJlZCBpbiB0aGUgRFQgd2l0aCB0d28gQ1M7Cj4gPiAyLyBUd28g
Zmxhc2ggY2hpcHMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgRFQgd2l0aCBvbmUgQ1MgZWFjaCwgYSB2
aXJ0dWFsCj4gPiBkZXZpY2UgaXMgYWxzbyBjcmVhdGVkIHRvIGRlc2NyaWJlIHRoZSBjb25jYXRl
bmF0aW9uLgo+ID4gCj4gPiBTb2x1dGlvbiAxLyBwcmVzZW50cyBhdCBsZWFzdCAzIGlzc3VlczoK
PiA+ICogVGhlIGhhcmR3YXJlIGRlc2NyaXB0aW9uIGlzIGFidXNlZDsKPiA+ICogVGhlIGNvbmNh
dGVuYXRpb24gb25seSB3b3JrcyBmb3IgU1BJIGRldmljZXMgKHdoaWxlIGl0IGNvdWxkIGJlCj4g
PiAgIGhlbHBmdWwgZm9yIGFueSBNVEQpOwo+ID4gKiBJdCB3b3VsZCByZXF1aXJlIGEgbG90IG9m
IHJld29yayBpbiB0aGUgU1BJIGNvcmUgYXMgbW9zdCBvZiB0aGUKPiA+ICAgbG9naWMgYXNzdW1l
cyB0aGVyZSBpcyBhbmQgdGhlcmUgYWx3YXlzIHdpbGwgYmUgb25seSBvbmUgQ1MgcGVyCj4gPiAg
IGNoaXAuICAKPiAKPiBUaGlzIHNlZW1zIG9rIGlmIGFsbCB0aGUgZGV2aWNlcyBhcmUgaWRlbnRp
Y2FsLgoKVGhpcyBpcyBub3QgYW4gb3B0aW9uIGZvciBNYXJrIGFuZCBJIGFncmVlIHdpdGggaGlt
IGFzIHdlIGFyZSBmYWtpbmcKdGhlIHJlYWxpdHk6IHRoZSB0d28gZGV2aWNlcyB3ZSB3YW50IHRv
IHZpcnR1YWxseSBjb25jYXRlbmF0ZSBtYXkgYmUKdHdvIHBoeXNpY2FsbHkgZGlmZmVyZW50IGRl
dmljZXMuIEJpbmRpbmcgdGhlbSBhcyBvbmUgaXMgbHlpbmcuCgo+ID4gU29sdXRpb24gMi8gYWxz
byBoYXMgY2F2ZWF0czoKPiA+ICogVGhlIHZpcnR1YWwgZGV2aWNlIGhhcyBubyBoYXJkd2FyZSBy
ZWFsaXR5Owo+ID4gKiBQb3NzaWJsZSBvcHRpbWl6YXRpb25zIGF0IHRoZSBoYXJkd2FyZSBsZXZl
bCB3aWxsIGJlIGhhcmQgdG8gZW5hYmxlCj4gPiAgIGVmZmljaWVudGx5IChpZS4gYSBjb21tb24g
ZGlyZWN0IG1hcHBpbmcgYWJzdHJhY3RlZCBieSBhIFNQSQo+ID4gICBtZW1vcmllcyBvcmllbnRl
ZCBjb250cm9sbGVyKS4gIAo+IAo+IFNvbWV0aGluZyBsaWtlIHRoaXMgbWF5IGJlIG5lY2Vzc2Fy
eSBpZiBkYXRhIGlzIGludGVybGVhdmVkIHJhdGhlciB0aGFuIAo+IGNvbmNhdGluYXRlZC4KClRo
aXMgaXMgc29tZXRoaW5nIHRoYXQgaXMgZ29ubmEgaGFwcGVuIHRvbywgaXQgaXMgY2FsbGVkICJk
dWFsCnBhcmFsbGVsIi4KCj4gU29sdXRpb24gMwo+IERlc2NyaWJlIGVhY2ggZGV2aWNlIGFuZCBw
YXJ0aXRpb24gc2VwYXJhdGVseSBhbmQgYWRkIGxpbmsocykgZnJvbSBvbmUgCj4gcGFydGl0aW9u
IHRvIHRoZSBuZXh0IAo+IAo+IGZsYXNoMCB7Cj4gICBwYXJ0aXRpb25zIHsKPiAgICAgY29tcGF0
aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAgICAgY29uY2F0LXBhcnRpdGlvbiA9IDwmZmxh
c2gxX3BhcnRpdGlvbnM+Owo+ICAgICAuLi4KPiAgIH07Cj4gfTsKPiAKPiBmbGFzaDEgewo+ICAg
Zmxhc2gxX3BhcnRpdGlvbjogcGFydGl0aW9ucyB7Cj4gICAgIGNvbXBhdGlibGUgPSAiZml4ZWQt
cGFydGl0aW9ucyI7Cj4gICAgIC4uLgo+ICAgfTsKPiB9OwoKSSBob25lc3RseSBkb24ndCBzZWUg
aG93IHRoaXMgaXMgZGlmZmVyZW50IGFzIHNvbHV0aW9uIDIvPyBJbiBvbmUgY2FzZQp3ZSBkZXNj
cmliZSB0aGUgcGFydGl0aW9uIGNvbmNhdGVuYXRpb24gaW4gb25lIHN1Ym5vZGUgYXMgYSAibGlu
ayIsIGluCnRoZSBvdGhlciB3ZSBjcmVhdGUgYSBzZXBhcmF0ZSBub2RlIHRvIGRlc2NyaWJlIHRo
ZSBsaW5rLiBBcmUgeW91CnN0cm9uZ2x5IG9wcG9zZWQgYXMgc29sdXRpb24gMi8/IEZyb20gYSBw
dXJlIGNvbmNlcHR1YWwgcG9pbnQgb2YgdmlldywKaXMgaXQgcmVhbGx5IGRpZmZlcmVudCB0aGFu
IDMvPwogCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
