Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBA1C004C9
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398792075E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lAo11L6D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398792075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Iih2Ytac0ZM8X5UoFk93D+e8rJ02u0e2hYkFAGeMuA=; b=lAo11L6DNdYx4B
	x7SvIS+6oRdy9on7maY3ia3YURpC6wPgMDhg4o2BB3YOt7QerPOtkpTZbsbFgWW7rYNaqFXcUnI2i
	jgIf4xaLjgyxlenb4BseRjsX5/rLjjryl72OdN5XJTkNIt2LK2uV2A/QWXT3uSsm+I0o6l9o3w07g
	FoaMefBY9jRnU/jS68KcV4SXaAOcDzelkzoC0Nm/KqeznPit3aNHhfn8bdJcnayHQS1SV6p8TY3SB
	wXPmPtAxgsQgDVea+HVnS4cJQ6AZQxgbfGMH6J7K/Ms0YQS2Umbc3tOIdYYUEAEc+MlGzPJLAu/hj
	A+3NkEkAsBPmUyZZFa5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2Ci-0003c7-9P; Mon, 29 Apr 2019 09:04:04 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2Ce-0003as-AD; Mon, 29 Apr 2019 09:04:02 +0000
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2097510000F;
 Mon, 29 Apr 2019 09:03:42 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:03:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH 1/5] mtd: rawnand: mtk: Correct low level time
 calculation of r/w cycle
Message-ID: <20190429110341.208c096e@xps13>
In-Reply-To: <20190429063834.45967-2-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-2-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_020400_653928_3D9177FB 
X-CRM114-Status: GOOD (  16.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb2xlaSwKClhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBNb24sIDI5IEFwciAyMDE5IDE0OjM4OjMwCiswODAwOgoKPiBBdCBwcmVzZW50LCB0aGUgZmxv
dyBvZiBjYWxjdWxhdGluZyBBQyB0aW1pbmcgb2YgcmVhZC93cml0ZSBjeWNsZSBpbiBTRFIKPiBt
b2RlIGlzIHRoYXQ6Cj4gQXQgZmlyc3QsIGNhbGN1bGF0ZSBoaWdoIGhvbGQgdGltZSB3aGljaCBp
cyB2YWxpZCBmb3IgYm90aCByZWFkIGFuZCB3cml0ZQo+IGN5Y2xlIHVzaW5nIHRoZSBtYXggdmFs
dWUgYmV0d2VlbiB0UkVIX21pbiBhbmQgdFdIX21pbi4KPiBTZWNvbmRseSwgY2FsY3VsYXRlIFdF
IyBwdWxzZSB3aWR0aCB1c2luZyB0V1BfbWluLgo+IFRocmlkbHksIGNhbGN1bGF0ZSBSRSMgcHVs
c2Ugd2lkdGggdXNpbmcgdGhlIGJpZ2dlciBvbmUgYmV0d2VlbiB0UkVBX21heAo+IGFuZCB0UlBf
bWluLgo+IAo+IEJ1dCBOQU5EIFNQRUMgc2hvd3MgdGhhdCBDb250cm9sbGVyIHNob3VsZCBhbHNv
IG1lZXQgd3JpdGUvcmVhZCBjeWNsZSB0aW1lLgo+IFRoYXQgaXMgd3JpdGUgY3ljbGUgdGltZSBz
aG91bGQgYmUgbW9yZSB0aGFuIHRXQ19taW4gYW5kIHJlYWQgY3ljbGUgc2hvdWxkCj4gYmUgbW9y
ZSB0aGFuIHRSQ19taW4uIE9idmlvdXNseSwgd2UgZG8gbm90IGFjaGlldmUgdGhhdCBub3cuCj4g
Cj4gVGhpcyBwYXRjaCBjb3JyZWN0cyB0aGUgbG93IGxldmVsIHRpbWUgY2FsY3VsYXRpb24gdG8g
bWVldCBtaW5pbXVtCj4gcmVhZC93cml0ZSBjeWNsZSB0aW1lIHJlcXVpcmVkLiBBZnRlciBnZXR0
aW5nIHRoZSBoaWdoIGhvbGQgdGltZSwgV0UjIGxvdwo+IGxldmVsIHRpbWUgd2lsbCBiZSBwcm9t
aXNlZCB0byBtZWV0IHRXUF9taW4gYW5kIHRXQ19taW4gcmVxdWlyZW1lbnQsCj4gYW5kIFJFIyBs
b3cgbGV2ZWwgdGltZSB3aWxsIGJlIHByb21pc2VkIHRvIG1lZXQgdFJFQV9tYXgsIHRSUF9taW4g
YW5kCj4gdFJDX21pbiByZXF1aXJlbWVudC4KPiAKPiBGaXhlczogOTNkYjQ0NmE0MjRjICgibXRk
OiBuYW5kOiBtb3ZlIHJhdyBOQU5EIHJlbGF0ZWQgY29kZSB0byB0aGUgcmF3LyBzdWJkaXIiKQoK
VGhpcyBpcyBkZWZpbml0ZWx5IG5vdCB0aGUgZmF1bHR5IHBhdGNoLiBQbGVhc2UgdXNlIC0tZm9s
bG93IHdoZW4Kc2VhcmNoaW5nIGZvciB0aGUgY3VscHJpdCwgdG8gYXZvaWQgYmVpbmcgYmxvY2tl
ZCBieSB0aGUKcmVuYW1pbmcvbW92aW5nIHdvcmsuCgpBbHNvIGEgQ2M6IHN0YWJsZSBtaWdodCBi
ZSB3b3J0aC4KCj4gU2lnbmVkLW9mZi1ieTogWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRl
ay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgfCAxNCArKysr
KysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiBpbmRleCBiNmI0NjAyZjUxMzIuLmRk
ODU1Zjg2MGE0YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+IEBAIC01MDgsNyArNTA4
LDcgQEAgc3RhdGljIGludCBtdGtfbmZjX3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGludCBjc2xpbmUsCj4gIHsKPiAgCXN0cnVjdCBtdGtfbmZjICpuZmMgPSBu
YW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gIAljb25zdCBzdHJ1Y3QgbmFuZF9zZHJf
dGltaW5ncyAqdGltaW5nczsKPiAtCXUzMiByYXRlLCB0cG9lY3MsIHRwcmVjcywgdGMyciwgdHcy
ciwgdHdoLCB0d3N0LCB0cmx0Owo+ICsJdTMyIHJhdGUsIHRwb2VjcywgdHByZWNzLCB0YzJyLCB0
dzJyLCB0d2gsIHR3c3QgPSAwLCB0cmx0ID0gMDsKPiAgCj4gIAl0aW1pbmdzID0gbmFuZF9nZXRf
c2RyX3RpbWluZ3MoY29uZik7Cj4gIAlpZiAoSVNfRVJSKHRpbWluZ3MpKQo+IEBAIC01NDQsMTEg
KzU0NCwxOSBAQCBzdGF0aWMgaW50IG10a19uZmNfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNzbGluZSwKPiAgCXR3aCA9IERJVl9ST1VORF9VUCh0d2gg
KiByYXRlLCAxMDAwMDAwKSAtIDE7Cj4gIAl0d2ggJj0gMHhmOwo+ICAKPiAtCXR3c3QgPSB0aW1p
bmdzLT50V1BfbWluIC8gMTAwMDsKPiArCS8qIENhbGN1bGF0ZSBtaW4gbG93IGxldmVsIHRpbWlu
ZyBmb3Igd3JpdGUgY3ljbGUgKi8KPiArCWlmICgodHdoICsgMSkgKiAxMDAwMDAwIC8gcmF0ZSA8
IHRpbWluZ3MtPnRXQ19taW4gLyAxMDAwKQo+ICsJCXR3c3QgPSAodGltaW5ncy0+dFdDX21pbiAv
IDEwMDAgLSAodHdoICsgMSkgKiAxMDAwMDAwIC8gcmF0ZSkKPiArCQkJKiAxMDAwOwo+ICsJdHdz
dCA9IG1heCh0aW1pbmdzLT50V1BfbWluLCB0d3N0KSAvIDEwMDA7Cj4gIAl0d3N0ID0gRElWX1JP
VU5EX1VQKHR3c3QgKiByYXRlLCAxMDAwMDAwKSAtIDE7Cj4gIAl0d3N0ICY9IDB4ZjsKPiAgCj4g
LQl0cmx0ID0gbWF4KHRpbWluZ3MtPnRSRUFfbWF4LCB0aW1pbmdzLT50UlBfbWluKSAvIDEwMDA7
Cj4gKwkvKiBDYWxjdWxhdGUgbWluIGxvdyBsZXZlbCB0aW1pbmcgZm9yIHJlYWQgY3ljbGUgKi8K
PiArCWlmICgodHdoICsgMSkgKiAxMDAwMDAwIC8gcmF0ZSA8IHRpbWluZ3MtPnRSQ19taW4gLyAx
MDAwKQo+ICsJCXRybHQgPSAodGltaW5ncy0+dFJDX21pbiAvIDEwMDAgLSAodHdoICsgMSkgKiAx
MDAwMDAwIC8gcmF0ZSkKPiArCQkJKiAxMDAwOwo+ICsJdHJsdCA9IG1heDModHJsdCwgdGltaW5n
cy0+dFJFQV9tYXgsIHRpbWluZ3MtPnRSUF9taW4pIC8gMTAwMDsKPiAgCXRybHQgPSBESVZfUk9V
TkRfVVAodHJsdCAqIHJhdGUsIDEwMDAwMDApIC0gMTsKPiAgCXRybHQgJj0gMHhmOwo+ICAKCgpX
aXRoIHRoaXMgZml4ZWQsCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
