Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EB0C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 13:30:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0762175B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 13:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KLYvJMwB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E0762175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m841UMS9XPK4UD2v+oSQcdR+6/LSc8cORk6xC6OuyGA=; b=KLYvJMwBBbLfdN
	WUQ6HAZx4+nN+hxZJK/9/iydqsECnvSAtIU5RU24Iob6hHTObohMEAnRI7+nLQqXqlfjttdepr0bJ
	YOsmNcIzhUNMI3nUfwdrAZT1oZ0qoLjYsbCHwRSHjUPmQp5PJSu6O+Ib/0Qs7aaqtO8SuOE9ZAOjE
	MaRp0ndmQISIKhtT1ROxF1H5R0VO9rBlbhGobQcgQAh9s8VEiE1qHHFO/ZdU4FiXXRqg4KsOADK5P
	eSlaNKvvNZDulREGLz9A1JxQ22dwynFVvaFS+bB9CHwxYgR8h2gOf002bl478T7la3MV2H14RzW7B
	nFdF4jznRbZ4sEo2hEzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr0oB-0000Tg-W1; Tue, 05 Feb 2019 13:30:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr0o3-0000SP-NL
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 13:30:38 +0000
X-Originating-IP: 90.88.22.177
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D9DE620008;
 Tue,  5 Feb 2019 13:30:23 +0000 (UTC)
Date: Tue, 5 Feb 2019 14:30:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: wen yang <yellowriver2010@hotmail.com>
Subject: Re: [PATCH] mtd: rawnand: jz4780: fix object reference leaks in
 jz4780_bch_get
Message-ID: <20190205143023.307207b6@xps13>
In-Reply-To: <HK0PR02MB36349BDCE693F67F150B0172B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
References: <HK0PR02MB36349BDCE693F67F150B0172B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_053031_914164_98BFC222 
X-CRM114-Status: GOOD (  19.12  )
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "harveyhuntnexus@gmail.com" <harveyhuntnexus@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgd2VuLAoKd2VuIHlhbmcgPHllbGxvd3JpdmVyMjAxMEBob3RtYWlsLmNvbT4gd3JvdGUgb24g
VHVlLCA1IEZlYiAyMDE5CjA5OjM2OjQ4ICswMDAwOgoKPiBvZl9maW5kX2RldmljZV9ieV9ub2Rl
KCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIHN0cnVjdCBkZXZpY2UKPiB3aGVuIGl0IGZpbmRz
IGEgbWF0Y2ggdmlhIGdldF9kZXZpY2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2FsbAo+IGdldF9k
ZXZpY2UoKSB0d2ljZS4KPiBXZSBhbHNvIHNob3VsZCBtYWtlIHN1cmUgdG8gZHJvcCB0aGUgcmVm
ZXJlbmNlIHRvIHRoZSBkZXZpY2UKPiB0YWtlbiBieSBvZl9maW5kX2RldmljZV9ieV9ub2RlKCkg
b24gZHJpdmVyIHVuYmluZC4KPiAKPiBGaXhlczogYWUwMmFiMDBhYTNjICgibXRkOiBuYW5kOiBq
ejQ3ODA6IGRyaXZlciBmb3IgTkFORCBkZXZpY2VzIG9uIEpaNDc4MCBTb0NzIikKPiBTaWduZWQt
b2ZmLWJ5OiBXZW4gWWFuZyA8eWVsbG93cml2ZXIyMDEwQGhvdG1haWwuY29tPgo+IFN1Z2dlc3Rl
ZC1ieTogQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+Cj4gQ2M6IEhhcnZl
eSBIdW50IDxoYXJ2ZXlodW50bmV4dXNAZ21haWwuY29tPgo+IENjOiBCb3JpcyBCcmV6aWxsb24g
PGJicmV6aWxsb25Aa2VybmVsLm9yZz4KPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4K
PiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgo+IENjOiBCcmlhbiBO
b3JyaXMgPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4KPiBDYzogTWFyZWsgVmFzdXQgPG1h
cmVrLnZhc3V0QGdtYWlsLmNvbT4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9qejQ3ODBfYmNoLmMgfCAxMyArKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9qejQ3ODBfYmNoLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9qejQ3
ODBfYmNoLmMKPiBpbmRleCA3MjAxODI3Li5kMGNlNWRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2p6NDc4MF9iY2guYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2p6
NDc4MF9iY2guYwo+IEBAIC0yNzksMTcgKzI3OSwyNCBAQCBzdGF0aWMgc3RydWN0IGp6NDc4MF9i
Y2ggKmp6NDc4MF9iY2hfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gIHsKPiAgCXN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7Cj4gIAlzdHJ1Y3Qgano0NzgwX2JjaCAqYmNoOwo+ICsJ
aW50IHJldDsKPiAgCj4gIAlwZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShucCk7Cj4gLQlp
ZiAoIXBkZXYgfHwgIXBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpKQo+ICsJaWYgKCFwZGV2KQo+
ICAJCXJldHVybiBFUlJfUFRSKC1FUFJPQkVfREVGRVIpOwo+IC0KPiAtCWdldF9kZXZpY2UoJnBk
ZXYtPmRldik7Cj4gKwlpZiAoIXBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpKSB7Cj4gKwkJcmV0
ID0gLUVQUk9CRV9ERUZFUjsKPiArCQlnb3RvIGVycl9wdXRfZGV2aWNlOwo+ICsJfQo+ICAKPiAg
CWJjaCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+ICAJY2xrX3ByZXBhcmVfZW5hYmxl
KGJjaC0+Y2xrKTsKPiAgCj4gIAlyZXR1cm4gYmNoOwo+ICsKPiArZXJyX3B1dF9kZXZpY2U6Cj4g
KwlwdXRfZGV2aWNlKCZwZGV2LT5kZXYpOwo+ICsJcmV0dXJuIEVSUl9QVFIocmV0KTsKCldoaWxl
IHRoZXJlIGlzIG9ubHkgb25lIHVzZXIgb2YgdGhpcyBsYWJlbCwgSSB0aGluayB3ZSBkb24ndCB3
YW50IGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
