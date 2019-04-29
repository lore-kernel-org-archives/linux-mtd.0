Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E51FC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:14:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA9D21473
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q6T7V/1/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA9D21473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38jLOu8LFFVjMTKmIKxmxOpYD/XRv6VbAWUXyS8+e+s=; b=q6T7V/1/Q/lVjG
	ejv7kkHhqIEiXk52asRSq4Duq4I8GekoJJUFdNVOL6if1WEXc9mkE9xvYYgtWkG+2unIYaWSPmBtN
	YHwWjM2k41wa7W40VC8QVzOZyC28C+VGInE8fA9x7G+Zq1eISg/LGiU5jPNdgrXGnaG5iI18C+D5D
	trBgJtTM1hUllBYu5aibxGzppQq64xC7UI5tnIKHoWtyd/ylGuqyCAX6I8GMMviD7tqW1PZYxo7at
	Y8IOJg6bQaRNf/8xMgCIBpIdJa3692YdpMth/tv1L5ej36j/Wi0rN61iOp6tQIo70IJ+6yyhFNQ47
	3eG9R8XVXBVukyI855MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2Mw-0008Ct-0W; Mon, 29 Apr 2019 09:14:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2Ms-0008Bk-1N; Mon, 29 Apr 2019 09:14:36 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 92D201C001E;
 Mon, 29 Apr 2019 09:14:26 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:14:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH 4/5] mtd: rawnand: mtk: Fix wrongly assigned oob buffer
 pointer issue
Message-ID: <20190429111425.0c91c2f3@xps13>
In-Reply-To: <20190429063834.45967-5-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-5-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_021434_379313_F022DD62 
X-CRM114-Status: GOOD (  13.92  )
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
biBNb24sIDI5IEFwciAyMDE5IDE0OjM4OjMzCiswODAwOgoKPiBPbmUgbWFpbiBnb2FsIG9mIHRo
ZSBmdW5jdGlvbiBtdGtfbmZjX3VwZGF0ZV9lY2Nfc3RhdHMgaXMgdG8gY2hlY2sKPiB3aGV0aGVy
IHNlY3RvcnMgYXJlIGFsbCBlbXB0eS4gSWYgdGhleSBhcmUgZW1wdHksIHNldCB0aGVzZSBzZWN0
b3JzJ3MKPiBkYXRhIGJ1ZmZlciBhbmQgb29iIGJ1ZmZlciBhcyAweGZmLgo+IAo+IEJ1dCBub3cs
IHRoZSBzZWN0b3Igb29iIGJ1ZmZlciBwb2ludGVyIGlzIHdyb25nbHkgYXNzaWduZWQuIFdlIGFs
d2F5cwo+IGRvIG1lbXNldCBmcm9tIHNlY3RvciAwLgo+IAo+IFRvIGZpeCB0aGlzIGlzc3VlLCBw
YXNzIHN0YXJ0IHNlY290ciBudW1iZXIgdG8gbWFrZSBvb2IgYnVmZmVyIHBvaW50ZXIKCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VjdG9yCgo+IGJlIHByb3Blcmx5IGFzc2lnbmVk
LgoKUGxlYXNlIHVzZSB1cHBlciBjYXNlIGZvciBwbGFpbiBFbmdsaXNoIGFjcm9ueW1zOiBOQU5E
LCBFQ0MsIE9PQiwgZXRjLgoKPiAKPiBGaXhlczogOTNkYjQ0NmE0MjRjICgibXRkOiBuYW5kOiBt
b3ZlIHJhdyBOQU5EIHJlbGF0ZWQgY29kZSB0byB0aGUgcmF3LyBzdWJkaXIiKQoKU2FtZSBjb21t
ZW50IGFzIGJlZm9yZSwgd3JvbmcgY29tbWl0IHBvaW50ZWQgaW4gdGhlIEZpeGVzIHRhZy4KCj4g
U2lnbmVkLW9mZi1ieTogWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgfCAyMSArKysrKysrKysrLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+IGluZGV4IDdhNWU4YzljZjYxYi4uY2Y1ZTUw
ZTcwNGFlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gQEAgLTg3MywxOSArODczLDIx
IEBAIHN0YXRpYyBpbnQgbXRrX25mY193cml0ZV9vb2Jfc3RkKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsIGludCBwYWdlKQo+ICAJcmV0dXJuIG10a19uZmNfd3JpdGVfcGFnZV9yYXcoY2hpcCwgTlVM
TCwgMSwgcGFnZSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgbXRrX25mY191cGRhdGVfZWNjX3N0
YXRzKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCB1OCAqYnVmLCB1MzIgc2VjdG9ycykKPiArc3RhdGlj
IGludCBtdGtfbmZjX3VwZGF0ZV9lY2Nfc3RhdHMoc3RydWN0IG10ZF9pbmZvICptdGQsIHU4ICpi
dWYsIHUzMiBzdGFydCwKPiArCQkJCSAgICB1MzIgc2VjdG9ycykKPiAgewo+ICAJc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCA9IG10ZF90b19uYW5kKG10ZCk7Cj4gIAlzdHJ1Y3QgbXRrX25mYyAqbmZj
ID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKGNoaXApOwo+ICAJc3RydWN0IG10a19uZmNfbmFu
ZF9jaGlwICptdGtfbmFuZCA9IHRvX210a19uYW5kKGNoaXApOwo+ICAJc3RydWN0IG10a19lY2Nf
c3RhdHMgc3RhdHM7Cj4gKwl1MzIgcmVnX3NpemUgPSBtdGtfbmFuZC0+ZmRtLnJlZ19zaXplOwo+
ICAJaW50IHJjLCBpOwo+ICAKPiAgCXJjID0gbmZpX3JlYWRsKG5mYywgTkZJX1NUQSkgJiBTVEFf
RU1QX1BBR0U7Cj4gIAlpZiAocmMpIHsKPiAgCQltZW1zZXQoYnVmLCAweGZmLCBzZWN0b3JzICog
Y2hpcC0+ZWNjLnNpemUpOwo+ICAJCWZvciAoaSA9IDA7IGkgPCBzZWN0b3JzOyBpKyspCj4gLQkJ
CW1lbXNldChvb2JfcHRyKGNoaXAsIGkpLCAweGZmLCBtdGtfbmFuZC0+ZmRtLnJlZ19zaXplKTsK
PiArCQkJbWVtc2V0KG9vYl9wdHIoY2hpcCwgc3RhcnQgKyBpKSwgMHhmZiwgcmVnX3NpemUpOwo+
ICAJCXJldHVybiAwOwo+ICAJfQo+ICAKPiBAQCAtOTA1LDcgKzkwNyw3IEBAIHN0YXRpYyBpbnQg
bXRrX25mY19yZWFkX3N1YnBhZ2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsCj4gIAl1MzIgc3BhcmUgPSBtdGtfbmFuZC0+c3BhcmVfcGVyX3NlY3RvcjsKPiAg
CXUzMiBjb2x1bW4sIHNlY3RvcnMsIHN0YXJ0LCBlbmQsIHJlZzsKPiAgCWRtYV9hZGRyX3QgYWRk
cjsKPiAtCWludCBiaXRmbGlwczsKPiArCWludCBiaXRmbGlwcyA9IDA7Cj4gIAlzaXplX3QgbGVu
Owo+ICAJdTggKmJ1ZjsKPiAgCWludCByYzsKPiBAQCAtOTcyLDE0ICs5NzQsMTEgQEAgc3RhdGlj
IGludCBtdGtfbmZjX3JlYWRfc3VicGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwKPiAgCWlmIChyYyA8IDApIHsKPiAgCQlkZXZfZXJyKG5mYy0+ZGV2LCAi
c3VicGFnZSBkb25lIHRpbWVvdXRcbiIpOwo+ICAJCWJpdGZsaXBzID0gLUVJTzsKPiAtCX0gZWxz
ZSB7Cj4gLQkJYml0ZmxpcHMgPSAwOwo+IC0JCWlmICghcmF3KSB7Cj4gLQkJCXJjID0gbXRrX2Vj
Y193YWl0X2RvbmUobmZjLT5lY2MsIEVDQ19ERUNPREUpOwo+IC0JCQliaXRmbGlwcyA9IHJjIDwg
MCA/IC1FVElNRURPVVQgOgo+IC0JCQkJbXRrX25mY191cGRhdGVfZWNjX3N0YXRzKG10ZCwgYnVm
LCBzZWN0b3JzKTsKPiAtCQkJbXRrX25mY19yZWFkX2ZkbShjaGlwLCBzdGFydCwgc2VjdG9ycyk7
Cj4gLQkJfQo+ICsJfSBlbHNlIGlmICghcmF3KSB7Cj4gKwkJcmMgPSBtdGtfZWNjX3dhaXRfZG9u
ZShuZmMtPmVjYywgRUNDX0RFQ09ERSk7Cj4gKwkJYml0ZmxpcHMgPSByYyA8IDAgPyAtRVRJTUVE
T1VUIDoKPiArCQkJbXRrX25mY191cGRhdGVfZWNjX3N0YXRzKG10ZCwgYnVmLCBzdGFydCwgc2Vj
dG9ycyk7Cj4gKwkJbXRrX25mY19yZWFkX2ZkbShjaGlwLCBzdGFydCwgc2VjdG9ycyk7Cj4gIAl9
Cj4gIAo+ICAJZG1hX3VubWFwX3NpbmdsZShuZmMtPmRldiwgYWRkciwgbGVuLCBETUFfRlJPTV9E
RVZJQ0UpOwoKV2l0aCB0aGlzIGFkZHJlc3NlZDoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
