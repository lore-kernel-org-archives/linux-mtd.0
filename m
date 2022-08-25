Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13576C48BE4
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C6me4gi/Ej7F3WeugyUJIFI8XswNxH6RC7A5XiTqe4=; b=W2IiUzc9I6OUIOAqUn8B0ZKD8L
	56AT7uJVrobykRkHwPxaQiPf+CE9Kt2y3PeBPB4Ffd7xva88s9v6wy/WWxGQkz4ZB4km+wwQohj/o
	J5mwJjcP5FS2hWFfOGXHtENRKwoFobwVh1KJuB2z8jTRWtHVhA5oylt3rr52W5einH9P8MxOpZJFP
	2pPKqixGUE3QiU8J8d7aLx/YIA9cZ1eS1dC7tTbq0dRAecN+aoFPrA10xdFUKfP/ahBsLGsDAju3B
	zlRCtG3fZT8/sAynbCu/Xu0oFFxTMYa1SWTzjJbGU05aGp5nFWvnlBP8OZBm8MkINH6YOFC/5i768
	MGG0eFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR9S5-00BOb1-3y; Thu, 25 Aug 2022 09:47:05 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR9Rt-00BOOg-Ol; Thu, 25 Aug 2022 09:46:55 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D02C3402B;
	Thu, 25 Aug 2022 11:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661420808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmqCI6NdaD8MiJoPnI7CffU1uRQPtkasbItKLLzsgpU=;
	b=Cp5ZKGWQ5qk9vhOrmIFp2QnGnK6gL+V0zsuDCu+RGRapPXgaOatkBOhuW39Qx5zIcc7Hh1
	+furDz9au55yxHcxLGszruYKhuYDGYLdCSWYcin/WuI6GFw75J4DhX/YsA8lKa5cTXsthN
	aiuvWO+q1Oa6hSgLusApf/TwZn53tb6EAlZzJ7wi4Nn7zGHew/pY8L7SXXss53zntdvJVB
	3/UJe1Ru+nia/h+louFDx7RVfHXAIp3nMZA2UkMwcOkLIX7IU/xbxOCXZ2+pn1QA02o5cf
	feCCoG6ox/eKVXYJFFoXJs2ofwOiABU3afC8FZ3y/toka+q5ccyVifDiPX2dnA==
MIME-Version: 1.0
Date: Thu, 25 Aug 2022 11:46:48 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, "David S .
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ansuel
 Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/8] net: add helper eth_addr_add()
In-Reply-To: <0d9a0ce5-ab34-cf05-158e-e25fc5595b4d@gmail.com>
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-6-michael@walle.cc>
 <0d9a0ce5-ab34-cf05-158e-e25fc5595b4d@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d6fe1cfc6daa78868ba85553998c9c3d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_024653_979229_7837FD10 
X-CRM114-Status: GOOD (  13.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wMS0yNSAxMToyNCwgc2NocmllYiBSYWZhxYIgTWnFgmVja2k6Cj4gT24gMjguMTIu
MjAyMSAxNToyNSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gQWRkIGEgaGVscGVyIHRvIGFkZCBh
biBvZmZzZXQgdG8gYSBldGhlcm5ldCBhZGRyZXNzLiBUaGlzIGNvbWVzIGluIAo+PiBoYW5keQo+
PiBpZiB5b3UgaGF2ZSBhIGJhc2UgZXRoZXJuZXQgYWRkcmVzcyBmb3IgbXVsdGlwbGUgaW50ZXJm
YWNlcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUu
Y2M+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvZXRoZXJkZXZpY2UuaCB8IDE0ICsrKysrKysr
KysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2V0aGVyZGV2aWNlLmggYi9pbmNsdWRlL2xpbnV4L2V0aGVy
ZGV2aWNlLmgKPj4gaW5kZXggMmFkNzFjYzkwYjM3Li45ZDYyMWRjODUyOTAgMTAwNjQ0Cj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvZXRoZXJkZXZpY2UuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2V0
aGVyZGV2aWNlLmgKPj4gQEAgLTQ4Niw2ICs0ODYsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIGV0
aF9hZGRyX2luYyh1OCAqYWRkcikKPj4gICAJdTY0X3RvX2V0aGVyX2FkZHIodSwgYWRkcik7Cj4+
ICAgfQo+PiAgICsvKioKPj4gKyAqIGV0aF9hZGRyX2FkZCgpIC0gQWRkIChvciBzdWJ0cmFjdCkg
YW5kIG9mZnNldCB0by9mcm9tIHRoZSBnaXZlbiAKPj4gTUFDIGFkZHJlc3MuCj4+ICsgKgo+PiAr
ICogQG9mZnNldDogT2Zmc2V0IHRvIGFkZC4KPj4gKyAqIEBhZGRyOiBQb2ludGVyIHRvIGEgc2l4
LWJ5dGUgYXJyYXkgY29udGFpbmluZyBFdGhlcm5ldCBhZGRyZXNzIHRvIAo+PiBpbmNyZW1lbnQu
Cj4+ICsgKi8KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBldGhfYWRkcl9hZGQodTggKmFkZHIsIGxv
bmcgb2Zmc2V0KQo+PiArewo+PiArCXU2NCB1ID0gZXRoZXJfYWRkcl90b191NjQoYWRkcik7Cj4+
ICsKPj4gKwl1ICs9IG9mZnNldDsKPj4gKwl1NjRfdG9fZXRoZXJfYWRkcih1LCBhZGRyKTsKPj4g
K30KPiAKPiBQbGVhc2UgY2hlY2sgZXRoX2h3X2FkZHJfZ2VuKCkgd2hpY2ggY29udGFpbnMgaWRl
bnRpY2FsIGNvZGUgKwo+IGV0aF9od19hZGRyX3NldCgpLgo+IAo+IFlvdSBzaG91bGQgcHJvYmFi
bHkgbWFrZSBldGhfaHdfYWRkcl9nZW4oKSB1c2UgeW91ciBuZXcgZnVuY3Rpb24gYXMgYQo+IGhl
bHBlci4KCllvdSdkIG5lZWQgdG8gY29weSB0aGUgbWFjIGFkZHJlc3MgZmlyc3QgYmVjYXVzZSBl
dGhfYWRkcl9hZGQoKQptb2RpZmllcyB0aGUgbWFjIGFkZHJlc3MgaW4gcGxhY2UuIEkgZG9uJ3Qg
c2VlIHRoYXQgdGhpcyBpcwppbXByb3ZpbmcgYW55dGhpbmcuCgotbWljaGFlbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
