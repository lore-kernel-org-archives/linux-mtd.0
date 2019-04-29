Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DA0C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F0D21655
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BWoWtvO+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F0D21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ymHrsxD0ELTZHmbJ8ARvNq6/Ikc9procqV2ORdnNfk=; b=BWoWtvO+bGobIi
	U9L/jShhYfOhbV/7uajjCCgCYsCcrvCt590HZcGVYBPaAEBd4spE1w0vNvDLtFQaiS624qiRF73Ca
	oOckWXjUiylkVb61FrVpbINZ1LIJSqo5O6iYWUxsu8UjpBS0nPbeSE4kkS1FATur0IJ/63UQYjh57
	XcNuJ6ldTBQCQbMzVhGCqjYNdcU51nyJxeLpFWTohNFJTgkZQh8oqMtfSHYnbM5/XHDpp8jR3e/6K
	QzlzpkW3RXtcTvaeXV1zkDN2AUiCBkNUlN9yWCL5Y9ptDCZFDOhtSAeskVR+8Zh3zXo0lww2Xzoth
	S5L459zVKcYqubaQ1jaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2Je-0007Q2-Ae; Mon, 29 Apr 2019 09:11:14 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2Ja-0007Ot-JJ; Mon, 29 Apr 2019 09:11:12 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6529AFF802;
 Mon, 29 Apr 2019 09:11:07 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:11:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH 3/5] mtd: rawnand: mtk: Add validity check for CE# pin
 setting
Message-ID: <20190429111106.6a02110b@xps13>
In-Reply-To: <20190429063834.45967-4-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-4-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_021110_781162_BE69734E 
X-CRM114-Status: GOOD (  13.10  )
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
biBNb24sIDI5IEFwciAyMDE5IDE0OjM4OjMyCiswODAwOgoKPiBDdXJyZW50bHksIHdlIG9ubHkg
Y2hlY2sgaG93IG1hbnkgQ0UjIHBpbnMgYXJlIHNldCBpbiBkZXZpY2UgdHJlZS4KPiBCdXQgaXQg
c2hvdWxkIGJlIG5lY2Vzc2FyeSB0byBjaGVjayB3aGV0aGVyIENFIyBwaW4gc2V0dGluZyBpcwo+
IGR1cGxpY2F0ZWQgb3IgaWYgQ0UjIHBpbiBpbmRleCBleGNlZWRzIHRoZSBtYXhpbXVtIENFIyBu
dW1iZXIgdGhhdAo+IGNvbnRyb2xsZXIgc3VwcG9ydHMuCj4gCj4gU28sIGFkZCB2YWxpZGl0eSBj
aGVjayB0byBhdm9pZCB0aGVzZSBpbnZhbGlkIHNldHRpbmdzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIHwgMTMgKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tdGtfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+IGluZGV4IGEy
ZjdhZjUzNjM4MC4uN2E1ZThjOWNmNjFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L210a19uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4g
QEAgLTE2Miw2ICsxNjIsOCBAQCBzdHJ1Y3QgbXRrX25mYyB7Cj4gIAlzdHJ1Y3QgbGlzdF9oZWFk
IGNoaXBzOwo+ICAKPiAgCXU4ICpidWZmZXI7Cj4gKwo+ICsJdW5zaWduZWQgbG9uZyBhc3NpZ25l
ZF9jczsKPiAgfTsKPiAgCj4gIC8qCj4gQEAgLTEzNTEsNiArMTM1MywxNyBAQCBzdGF0aWMgaW50
IG10a19uZmNfbmFuZF9jaGlwX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXRrX25m
YyAqbmZjLAo+ICAJCQlkZXZfZXJyKGRldiwgInJlZyBwcm9wZXJ0eSBmYWlsdXJlIDogJWRcbiIs
IHJldCk7Cj4gIAkJCXJldHVybiByZXQ7Cj4gIAkJfQo+ICsKPiArCQlpZiAodG1wID49IE1US19O
QU5EX01BWF9OU0VMUykgewo+ICsJCQlkZXZfZXJyKGRldiwgImludmFsaWQgQ1M6ICV1XG4iLCB0
bXApOwo+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiArCQl9Cj4gKwo+ICsJCWlmICh0ZXN0X2FuZF9z
ZXRfYml0KHRtcCwgJm5mYy0+YXNzaWduZWRfY3MpKSB7Cj4gKwkJCWRldl9lcnIoZGV2LCAiQ1Mg
JXUgYWxyZWFkeSBhc3NpZ25lZFxuIiwgdG1wKTsKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJ
fQo+ICsKPiAgCQljaGlwLT5zZWxzW2ldID0gdG1wOwo+ICAJfQo+ICAKClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
