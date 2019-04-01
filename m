Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAB8C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5601520880
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D9xd99IT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5601520880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCtqnZRPtCQ2DPChNLY6SVJk/5+cn6La4twRsfEA+ZU=; b=D9xd99IT5TlQk6
	MYS+LtTRVoLP3KsdEbhH2nrjq0gznlGh8B4X2oS2ZCssmFL1hrRABCEWqP+lwzjF0rnFr7Tx1bR01
	AiiBuELYlDSUWNoTKNkHxiGgQeu4jeukyjQL85S7pdVINXYw0+qt5+Ta9OMmwV1GgiBDvEfMiANUV
	JwjrsEj7GYi5kpo+ToOoFFrfgeoW90q6pkFPGJXxzF6GARgyE3nXzjbX4MuzsI2RC7iZhzP08dWWx
	Ajh6kLYha+gTPj/UKzqEIWnqXr0fey+YIAtatjsLbvnL6wQUDZstRYb7HEZWtSgJn44BU+cjoesE8
	GMruzA8jL0TofJ5ZWKRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAyrz-0000Mu-UY; Mon, 01 Apr 2019 15:29:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAyrq-0000Dk-C3; Mon, 01 Apr 2019 15:29:00 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D845C1BF204;
 Mon,  1 Apr 2019 15:28:52 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:28:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 00/15] mtd: rawnand: 5th batch of cleanups
Message-ID: <20190401172850.3f4377f7@xps13>
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_082858_800016_4A9E9E90 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: Vignesh R <vigneshr@ti.com>, Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBNb24sICA0IE1hciAyMDE5CjIxOjE1OjA3ICswMTAwOgoKPiBIZWxsbywKPiAKPiBUaGlzIHRp
bWUgSSBhbSB0aGUgb25lIHdobyBzZW5kIHRoZSBjbGVhbnVwcyBvbiBiZWhhbGYgb2YgQm9yaXMs
IEkKPiBqdXN0IHRvb2sgaGlzIHBhdGNoZXMgYmVjYXVzZSBJIG5lZWRlZCB0aGVtIGZvciBteSAn
Z2VuZXJpYyBFQ0MKPiBlbmdpbmUnIHdvcmsuIEJldHdlZW4gdGhpcyBjbGVhbnVwIHNlcmllcyBh
bmQgdGhlIEVDQyBlbmdpbmUgc2VyaWVzCj4gdGhlcmUgd2lsbCBiZSBhbiBhZGRpdGlvbmFsIG9u
ZSwgdG8gcHJlcGFyZSB0aGUgZmllbGQuCj4gCj4gUGF0Y2ggMSBhZGRzIGEgZmllbGQgdG8gdGhl
IG1lbW9yZyBzdHJ1Y3R1cmUsIHBhdGNoIDIgJiAzIGFkZCBoZWxwZXJzCj4gaW4gdGhlIHJhdyBO
QU5EIGNvcmUsIGZvbGxvd2luZyBwYXRjaGVzIGFyZSBnZW5lcmFsIGNsZWFudXBzIGluIHRoZQo+
IHJhdyBOQU5EIGFyZWEgdGhhdCBwcmVwYXJlcyB0aGUgdXNlIG9mIHRoZSAoZ2VuZXJpYykgTkFO
RCBjb3JlIHNoYXJlZAo+IGJldHdlZW4gcmF3IE5BTkRzIGFuZCBTUEktTkFORHMgYW5kIGZpbmFs
bHkgYSBmZXcgbmFuZF9jaGlwIGVudHJpZXMKPiBhcmUgZHJvcHBlZC4KPiAKPiBSZWdhcmRzLAo+
IE1pcXXDqGwKPiAKPiBDaGFuZ3MgZm9yIHYyCj4gPT09PT09PT09PT09PQo+ICogRml4ZWQgdGhl
IGluY29uc2lzdGVuY2llcyBiZXR3ZWVuIHBhdGNoIDcgYW5kIDEzIHBvaW50ZWQgb3V0IGJ5IEZy
aWVkZXIuCj4gKiBGaXhlZCB0aGUgZGVyaXZhdGlvbiBvZiBtZW1vcmctPnBhZ2VzX3Blcl9lcmFz
ZWJsb2NrLgo+ICogQWRkZWQgRnJpZWRlciBSZXZpZXdlZC1ieSB0YWdzLgo+IAo+IAo+IEJvcmlz
IEJyZXppbGxvbiAoMTUpOgo+ICAgbXRkOiBuYW5kOiBBZGQgbWF4X2JhZF9lcmFzZWJsb2Nrc19w
ZXJfbHVuIGluZm8gdG8gbWVtb3JnCj4gICBtdGQ6IG5hbmQ6IEFkZCBhIGhlbHBlciByZXR1cm5p
bmcgdGhlIG51bWJlciBvZiBlcmFzZWJsb2NrcyBwZXIgdGFyZ2V0Cj4gICBtdGQ6IG5hbmQ6IEFk
ZCBhIGhlbHBlciB0byByZXRyaWV2ZSB0aGUgbnVtYmVyIG9mIHBhZ2VzIHBlciB0YXJnZXQKPiAg
IG10ZDogc3BpbmFuZDogSW1wbGVtZW50IG10ZC0+X21heF9iYWRfYmxvY2tzCj4gICBtdGQ6IHJh
d25hbmQ6IFVzZSBuYW5kX3RvX210ZCgpIGluIG5hbmRfe3NldCxnZXR9X2ZsYXNoX25vZGUoKQo+
ICAgbXRkOiByYXduYW5kOiBQcmVwYXJlIHRoaW5ncyB0byByZXVzZSB0aGUgZ2VuZXJpYyBOQU5E
IGxheWVyCj4gICBtdGQ6IHJhd25hbmQ6IEZpbGwgbWVtb3JnIGR1cmluZyBkZXRlY3Rpb24KPiAg
IG10ZDogcmF3bmFuZDogSW5pdGlhbGl6ZSB0aGUgbmFuZF9kZXZpY2Ugb2JqZWN0Cj4gICBtdGQ6
IHJhd25hbmQ6IFByb3ZpZGUgYSBoZWxwZXIgdG8gZ2V0IGNoaXAtPmRhdGFfYnVmCj4gICBtdGQ6
IHJhd25hbmQ6IE1vdmUgYWxsIHBhZ2UgY2FjaGUgcmVsYXRlZCBmaWVsZHMgdG8gYSBzdWItc3Ry
dWN0Cj4gICBtdGQ6IHJhd25hbmQ6IFVzZSBuYW5kZGV2X210ZF9tYXhfYmFkX2Jsb2NrcygpCj4g
ICBtdGQ6IHJhd25hbmQ6IEdldCByaWQgb2YgY2hpcC0+Yml0c19wZXJfY2VsbAo+ICAgbXRkOiBy
YXduYW5kOiBHZXQgcmlkIG9mIGNoaXAtPmNoaXBzaXplCj4gICBtdGQ6IHJhd25hbmQ6IEdldCBy
aWQgb2YgY2hpcC0+bnVtY2hpcHMKPiAgIG10ZDogcmF3bmFuZDogR2V0IHJpZCBvZiBjaGlwLT5l
Y2Nfe3N0cmVuZ3RoLHN0ZXB9X2RzCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvY29yZS5jICAgICAg
ICAgICAgICAgICAgICAgICB8ICAzNCArKysKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwv
bmFuZC1jb250cm9sbGVyLmMgIHwgICA4ICstCj4gIC4uLi9tdGQvbmFuZC9yYXcvYmNtNDd4eG5m
bGFzaC9vcHNfYmNtNDcwNi5jICB8ICAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jICAgICAgfCAgIDcgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVu
YWxpLmMgICAgICAgICAgICAgICAgIHwgICA2ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2Rp
c2tvbmNoaXAuYyAgICAgICAgICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9m
c2xfZWxiY19uYW5kLmMgICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
ZnNsX2lmY19uYW5kLmMgICAgICAgICAgIHwgICA0ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLW5hbmQuYyAgICB8ICAxNyArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9oaXNpNTA0X25hbmQuYyAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvaW50ZXJuYWxzLmggICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2p6NDc0MF9uYW5kLmMgICAgICAgICAgICB8ICAgNyArLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9tYXJ2ZWxsX25hbmQuYyAgICAgICAgICAgfCAgNDkgKystLQo+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9tdGtfbmFuZC5jICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9hbWQuYyAgICAgICAgICAgICAgIHwgIDExICstCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICB8IDI1MyArKysrKysrKysrKy0tLS0t
LS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYyAgICAgICAgICAgICAgIHwgIDQ1
ICsrLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9lc210LmMgICAgICAgICAgICAgIHwg
IDEwICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHluaXguYyAgICAgICAgICAgICB8
ICA5MCArKysrLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfamVkZWMuYyAgICAgICAg
ICAgICB8ICAyNyArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jICAgICAg
ICAgICAgfCAgMTQgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9vbmZpLmMgICAgICAg
ICAgICAgIHwgIDM1ICsrLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX3NhbXN1bmcuYyAg
ICAgICAgICAgfCAgNDIgKy0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfdG9zaGliYS5j
ICAgICAgICAgICB8ICAxOSArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMgICAg
ICAgICAgICAgICAgfCAgMTEgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
ICAgICAgICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMg
ICAgICAgICAgICAgICB8ICAgOSArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5k
LmMgICAgICAgICAgICAgfCAgMTUgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFfbmFu
ZC5jICAgICAgICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZp
Y2UuYyAgICAgICAgICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25p
eC5jICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9u
LmMgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hp
YmEuYyAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS93aW5i
b25kLmMgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgaW5jbHVkZS9saW51eC9tdGQvbmFuZC5o
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMyICsrLQo+ICBpbmNsdWRlL2xpbnV4L210ZC9yYXdu
YW5kLmggICAgICAgICAgICAgICAgICAgfCAgOTcgKysrKy0tLQo+ICAzOCBmaWxlcyBjaGFuZ2Vk
LCA1NDggaW5zZXJ0aW9ucygrKSwgMzUwIGRlbGV0aW9ucygtKQo+IAoKQXBwbGllZCB0byBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdApv
biBuYW5kL25leHQuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
