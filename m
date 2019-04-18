Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E709C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:25:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC9A2171F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PowcThxR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC9A2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3Vh4Ml3VGbR2L7Of15xSSH/6G1r/j4TNcNI6g4KaHQ=; b=PowcThxR/bwkhy
	y3E39OfiScnCUq5xDpYLGrnaLe5B3j5ATqPzWN0vPjmo7RHcz1t8nnqGQ3DUFHVfzPUWxyucEKh9F
	jEQowA8+IxFZ9nX/sOdXtZuDGfvBszbHeHp/RygKKrrRk/y3w5osQlB6CfXWyI9dQA4AwuJcivXgN
	ncg6c3UpvVO9yDUVzGBBoouiQBGsjDf9UvU/v9wiyV3YMMZCfNroqA11L+ZlCYIR9NRYmwwJyZ5DJ
	5QwiMfpMeY86S/2zaDw/4/NKx45Dgnsu+WFAQJrfHftqwqbkSiYBsrSIzKUNWnd4mlMt7dHaqE79u
	2BzeDsN78AyB2E0KebKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9ql-0003ti-9R; Thu, 18 Apr 2019 16:25:23 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9qh-0003tE-O8
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:25:21 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 53E061C0007;
 Thu, 18 Apr 2019 16:25:13 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:25:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v6 0/7] mtd: rawnand: Support bad block markers in
 first, second or last page
Message-ID: <20190418182511.4991decd@xps13>
In-Reply-To: <20190417123631.22545-1-frieder.schrempf@kontron.de>
References: <20190417123631.22545-1-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_092520_082896_394E4FD5 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2NocmVtcGYsCgpTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24u
ZGU+IHdyb3RlIG9uIFdlZCwgMTcgQXByCjIwMTkgMTI6MzY6MzMgKzAwMDA6Cgo+IEZyb206IEZy
aWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4KPiAKPiBDdXJyZW50
bHkgc3VwcG9ydGVkIGJhZCBibG9jayBtYXJrZXIgcG9zaXRpb25zIHdpdGhpbiB0aGUgYmxvY2sg
YXJlOgo+ICogaW4gZmlyc3QgcGFnZSBvbmx5Cj4gKiBpbiBsYXN0IHBhZ2Ugb25seQo+ICogaW4g
Zmlyc3Qgb3Igc2Vjb25kIHBhZ2UKPiAKPiBBZnRlciBzb21lIGNsZWFudXAgYW5kIHByZXBhcmF0
aW9uIGluIHBhdGNoZXMgMSB0byA0IHdlIG1ha2UgaXQKPiBwb3NzaWJsZSB0byBzZXQgTkFORF9C
Qk1fRklSU1RQQUdFLCBOQU5EX0JCTV9TRUNPTkRQQUdFIGFuZAo+IE5BTkRfQkJNX0xBU1RQQUdF
IGluZGVwZW5kZW50bHkgb2YgZWFjaCBvdGhlciAocGF0Y2ggNSkuCj4gCj4gU29tZSBFU01UIE5B
TkRzIGFyZSBrbm93biB0byBoYXZlIGJlZW4gc2hpcHBlZCBieSB0aGUgbWFudWZhY3R1cmVyCj4g
d2l0aCBiYWQgYmxvY2sgbWFya2VycyBpbiB0aGUgZmlyc3Qgb3IgbGFzdCBwYWdlLCBpbnN0ZWFk
IG9mIHRoZQo+IGZpcnN0IG9yIHNlY29uZCBwYWdlLgo+IAo+IEFsc28gdGhlIGRhdGFzaGVldHMg
Zm9yIEN5cHJlc3MvU3BhbnNpb24vQU1EIE5BTkRzIGNsYWltIHRoYXQgdGhlCj4gZmlyc3QsIHNl
Y29uZCAqYW5kKiBsYXN0IHBhZ2UgbmVlZHMgdG8gYmUgY2hlY2tlZC4KPiAKPiBUaGVyZWZvcmUg
aW4gcGF0Y2ggNiBhbmQgNyB3ZSBzZXQgYWxsIHRocmVlIGZsYWdzIGZvcgo+IEFNRC9TcGFuc2lv
bi9DeXByZXNzIGFuZCBFU01UIGNoaXBzLgo+IC0tLQo+IENoYW5nZXMgaW4gdjY6Cj4gPT09PT09
PT09PT09PT0KPiAqIE5vbmUgKHY1IHdhcyBtaXNzaW5nIHNvbWUgb2YgdGhlIG1lbnRpb25lZCBm
aXhlcykKPiAKPiBDaGFuZ2VzIGluIHY1Ogo+ID09PT09PT09PT09PT09Cj4gKiBSZWJhc2Ugb250
byBjdXJyZW50IG5hbmQvbmV4dAo+ICogRml4IG5hbmRfYmJtX2dldF9uZXh0X3BhZ2UoKSBkb2Nz
Cj4gKiBVc2UgaW5jbHVzaXZlIHZhbHVlcyBmb3Igc3RhcnQgcGFnZSBpbiBuYW5kX2JibV9nZXRf
bmV4dF9wYWdlKCkKPiAqIFJldHVybiAtRUlOVkFMIGZyb20gbmFuZF9iYm1fZ2V0X25leHRfcGFn
ZSgpIHdoZW4gbm8gbW9yZSBwYWdlcyBhcmUgYXZhaWxhYmxlCj4gKiBJbXByb3ZlIGNvZGUgc3R5
bGUgaW4gbmFuZF9ibG9ja19iYWQoKQo+ICogQWRkIHBhcmVudGhlc2VzIGluIHNjYW5fYmxvY2tf
ZmFzdCgpIGFuZCBuYW5kX2RlZmF1bHRfYmxvY2tfbWFya2JhZCgpCj4gKiBVbnNpZ24gYmFkYmxv
Y2twb3MgZmllbGQgaW4gc3RydWN0IG5hbmRfY2hpcCBhbmQgc3RydWN0IG9uZW5hbmRfY2hpcAo+
ICogQWRkIFItYiB0YWdzCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiA9PT09PT09PT09PT09PQo+ICog
TW92ZSBvbmVuYW5kIGNoYW5nZXMgdG8gc2VwYXJhdGUgcGF0Y2gKPiAqIEFkZCBtaXNzaW5nIGJh
ZGJsb2NrcG9zIGZpZWxkIHRvIG9uZW5hbmRfY2hpcCBzdHJ1Y3QKPiAqIE1vdmUgY2xlYW51cCBv
ZiBiYWRibG9ja3BvcyBmaWVsZCBhbmQgZmxhZ3MgdG8gc2VwYXJhdGUgcGF0Y2gKPiAqIE1vdmUg
YXNzaWduZW1udCBvZiBiYWRibG9ja3BvcyBmcm9tIG9uZW5hbmRfYmJ0LmMgdG8gb25lbmFuZF9i
YXNlLmMKPiAqIEZpeCBpbmNvcnJlY3QgdXNhZ2Ugb2YgYmJ0X29wdGlvbnMgaW4gbmFuZF9iYnQu
Ywo+ICogQWRkIFItYiB0YWdzCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiA9PT09PT09PT09PT09PQo+
ICogRml4IGJpdCBvZmZzZXRzIGZvciBuZXcgZmxhZ3MgaW4gbmFuZF9jaGlwLT5vcHRpb25zCj4g
KiBNb3ZlIHNlcGFyYXRpb24gb2YgZmxhZ3MgZm9yIGZpcnN0IGFuZCBzZWNvbmQgcGFnZSBtYXJr
ZXJzIHRvIGEKPiAgIHNlcGFyYXRlIHBhdGNoCj4gKiBGaXggY292ZXIgbGV0dGVyCj4gKiBGaXgg
Uy1vLWIgdGFnCj4gKiBBZGQgUi1iIHRhZ3MKPiAKPiBDaGFuZ2VzIGluIHYyOgo+ID09PT09PT09
PT09PT09Cj4gKiBSZWJhc2Ugb24gNS4wLXJjMQo+ICogQWRkIHBhdGNoIHRvIG1vdmUgYmFkIGJs
b2NrIG1hcmtlciBwb3NpdGlvbiBpbmZvIHRvIGEgY29tbW9uIHBsYWNlIGFuZAo+ICAgcmVuYW1l
L3ByZXBhcmUgZXhpc3RpbmcgZmxhZ3MKPiAqIGltcHJvdmUvcmVuYW1lIGZ1bmN0aW9uIG5hbmRf
YmJtX2dldF9uZXh0X3BhZ2UoKSB0byB1c2UgbmV3IGZsYWdzCj4gLS0tCj4gRnJpZWRlciBTY2hy
ZW1wZiAoNyk6Cj4gICBtdGQ6IHJhd25hbmQ6IEFsd2F5cyBzdG9yZSBpbmZvIGFib3V0IGJhZCBi
bG9jayBtYXJrZXJzIGluIGNoaXAgc3RydWN0Cj4gICBtdGQ6IG9uZW5hbmQ6IFN0b3JlIGJhZCBi
bG9jayBtYXJrZXIgcG9zaXRpb24gaW4gY2hpcCBzdHJ1Y3QKPiAgIG10ZDogbmFuZDogQ2xlYW51
cCBmbGFncyBhbmQgZmllbGRzIGZvciBiYWQgYmxvY2sgbWFya2VyIHBvc2l0aW9uCj4gICBtdGQ6
IG5hbmQ6IE1ha2UgZmxhZ3MgZm9yIGJhZCBibG9jayBtYXJrZXIgcG9zaXRpb24gbW9yZSBncmFu
dWxhcgo+ICAgbXRkOiByYXduYW5kOiBTdXBwb3J0IGJhZCBibG9jayBtYXJrZXJzIGluIGZpcnN0
LCBzZWNvbmQgb3IgbGFzdCBwYWdlCj4gICBtdGQ6IHJhd25hbmQ6IEVTTVQ6IEFsc28gdXNlIHRo
ZSBsYXN0IHBhZ2UgZm9yIGJhZCBibG9jayBtYXJrZXJzCj4gICBtdGQ6IHJhd25hbmQ6IEFNRDog
QWxzbyB1c2UgdGhlIGxhc3QgcGFnZSBmb3IgYmFkIGJsb2NrIG1hcmtlcnMKPiAKPiAgZHJpdmVy
cy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIHwgIDUgKy0KPiAgZHJpdmVycy9tdGQv
bmFuZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMgIHwgIDMgLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvaW50ZXJuYWxzLmggICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2FtZC5jICAgICAgICAgfCAgOCArKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMgICAgICAgIHwgNjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2JidC5jICAgICAgICAgfCAyOCArKysrKy0tLS0tLQo+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2VzbXQuYyAgICAgICAgfCAgOSArKystCj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfaHluaXguYyAgICAgICB8ICA0ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfbWFjcm9uaXguYyAgICB8ICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
bWljcm9uLmMgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfc2Ftc3Vu
Zy5jICAgICB8ICA0ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfdG9zaGliYS5jICAg
ICB8ICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMgICAgICAgICB8ICA0
ICstCj4gIGluY2x1ZGUvbGludXgvbXRkL2JibS5oICAgICAgICAgICAgICAgICB8IDE0ICstLS0t
LQo+ICBpbmNsdWRlL2xpbnV4L210ZC9vbmVuYW5kLmggICAgICAgICAgICAgfCAgMyArKwo+ICBp
bmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAgICAgICAgfCAxNyArKysrKystCj4gIDE2
IGZpbGVzIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkKPiAKClNl
cmllcyBhcHBsaWVkIHRvIApodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9tdGQvbGludXguZ2l0IApicmFuY2ggbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
