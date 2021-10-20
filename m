Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FE6C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:24:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E3E610FF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8E3E610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FonBa1pQXIzgnvaaXLegeYIK3z4ofDzCpfO4vj676w=; b=Ojd/AnUZOuL2+P
	ZOUUhzMMNwUe9ymuuB65jRdWrmijILfr4nTzgjy0dXwsWbSUjMCrYT8/qPosP4wNexNliPF7Vi9BV
	0FfgmbJEQVoFk180yDxFtRCk8dJxsGf+R/MR3O7UkRBWm1PxL20JtoK/mk8mcRFjl99S1S/dZ6mR2
	eiEWKuEKL5U8IjCNZzASsJaDa996hfK8dMZPPSgVslvVo06njcTLKPcuRATxaOkp6cWGWehmhidrj
	6yuh81dW7y9uHzR5gk2ZpzYZrKzRYY7Gd8QkBfaqpszQVT9qtlkzUeilwVVHXmR0E4ORMCpdZIBpX
	a5G6VIuNzNMSGizjTqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5wp-003c1j-1S; Wed, 20 Oct 2021 07:23:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5wl-003bzP-5a
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 07:23:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4ACDB2000F;
 Wed, 20 Oct 2021 07:23:32 +0000 (UTC)
Date: Wed, 20 Oct 2021 09:23:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211020092331.68e46e16@xps13>
In-Reply-To: <20211020071235.in3omswo2jqrahrd@skn-laptop>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011160546.707b737b@collabora.com>
 <20211015082206.244a2316@xps13>
 <20211019180800.3v7emokse6lkpjvk@skn-laptop>
 <20211020085250.030ef244@collabora.com>
 <20211020090058.58af1087@collabora.com>
 <20211020071235.in3omswo2jqrahrd@skn-laptop>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_002335_504555_D608D267 
X-CRM114-Status: GOOD (  26.34  )
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

SGkgU2VhbiwKCnNlYW5AZ2Vhbml4LmNvbSB3cm90ZSBvbiBXZWQsIDIwIE9jdCAyMDIxIDA5OjEy
OjM1ICswMjAwOgoKPiBPbiBXZWQsIE9jdCAyMCwgMjAyMSBhdCAwOTowMDo1OEFNICswMjAwLCBC
b3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBPbiBXZWQsIDIwIE9jdCAyMDIxIDA4OjUyOjUwICsw
MjAwCj4gPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3
cm90ZToKPiA+ICAgCj4gCj4gWyAuLi4gXQo+ID4gPiA+IAo+ID4gPiA+IEhpIEJvcmlzIGFuZCBN
aXF1ZWwsCj4gPiA+ID4gCj4gPiA+ID4gZ3BtaS1uYW5kLmMgc2V0cyBOQU5EX1NLSVBfQkJUU0NB
TiBzbyB3ZSB3b24ndCBnZXQgdGhlcmUgYW5kIHBvcHVsYXRlCj4gPiA+ID4gc3VzcGVuZCByZXN1
bWUgaG9va3MgOigKPiA+ID4gPiBHdWVzcyB0aGVyZSBpcyBvdGhlciBkcml2ZXJzIHRoYXQgZG9l
cyB0aGUgc2FtZSB0aGluZy4uLiAgICAKPiA+IAo+ID4gQWN0dWFsbHksIHRoaXMgdmVyc2lvbiBp
cyBldmVuIGNsZWFuZXI6Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiBpbmRl
eCAzZDZjNmU4ODA1MjAuLjk4YzM5YjdmNjI3OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYwo+ID4gQEAgLTYyMjIsOCArNjIyMiw2IEBAIHN0YXRpYyBpbnQgbmFuZF9zY2FuX3Rh
aWwoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ICAgICAgICAgbXRkLT5fc3luYyA9IG5hbmRf
c3luYzsKPiA+ICAgICAgICAgbXRkLT5fbG9jayA9IG5hbmRfbG9jazsKPiA+ICAgICAgICAgbXRk
LT5fdW5sb2NrID0gbmFuZF91bmxvY2s7Cj4gPiAtICAgICAgIG10ZC0+X3N1c3BlbmQgPSBuYW5k
X3N1c3BlbmQ7Cj4gPiAtICAgICAgIG10ZC0+X3Jlc3VtZSA9IG5hbmRfcmVzdW1lOwo+ID4gICAg
ICAgICBtdGQtPl9yZWJvb3QgPSBuYW5kX3NodXRkb3duOwo+ID4gICAgICAgICBtdGQtPl9ibG9j
a19pc3Jlc2VydmVkID0gbmFuZF9ibG9ja19pc3Jlc2VydmVkOwo+ID4gICAgICAgICBtdGQtPl9i
bG9ja19pc2JhZCA9IG5hbmRfYmxvY2tfaXNiYWQ7Cj4gPiBAQCAtNjI2MSwxNCArNjI1OSwyMCBA
QCBzdGF0aWMgaW50IG5hbmRfc2Nhbl90YWlsKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiAg
ICAgICAgICAgICAgICAgZ290byBlcnJfZnJlZV9pbnRlcmZhY2VfY29uZmlnOwo+ID4gIAo+ID4g
ICAgICAgICAvKiBDaGVjaywgaWYgd2Ugc2hvdWxkIHNraXAgdGhlIGJhZCBibG9jayB0YWJsZSBz
Y2FuICovCj4gPiAtICAgICAgIGlmIChjaGlwLT5vcHRpb25zICYgTkFORF9TS0lQX0JCVFNDQU4p
Cj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiAtCj4gPiAtICAgICAgIC8qIEJ1aWxk
IGJhZCBibG9jayB0YWJsZSAqLwo+ID4gLSAgICAgICByZXQgPSBuYW5kX2NyZWF0ZV9iYnQoY2hp
cCk7Cj4gPiAtICAgICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgICAgZ290byBlcnJfZnJl
ZV9zZWN1cmVfcmVnaW9uczsKPiA+ICsgICAgICAgaWYgKGNoaXAtPm9wdGlvbnMgJiBOQU5EX1NL
SVBfQkJUU0NBTikgewo+ID4gKyAgICAgICAgICAgICAgIC8qIEJ1aWxkIGJhZCBibG9jayB0YWJs
ZSAqLwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IG5hbmRfY3JlYXRlX2JidChjaGlwKTsKPiA+
ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290
byBlcnJfZnJlZV9zZWN1cmVfcmVnaW9uczsKPiA+ICsgICAgICAgfQo+ID4gIAo+ID4gKyAgICAg
ICAvKgo+ID4gKyAgICAgICAgKiBQb3B1bGF0ZSB0aGUgc3VzcGVuZC9yZXN1bWUgaG9va3MgYWZ0
ZXIgdGhlIEJCVCBoYXMgYmVlbiBzY2FubmVkIHRvCj4gPiArICAgICAgICAqIGF2b2lkIHVzaW5n
IHRoZSBzdXNwZW5kIGxvY2sgYW5kIHJlc3VtZSB3YWl0cXVldWUgd2hpY2ggYXJlIG9ubHkKPiA+
ICsgICAgICAgICogaW5pdGlhbGl6ZWQgd2hlbiBtdGRfZGV2aWNlX3JlZ2lzdGVyKCkgaXMgY2Fs
bGVkLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgbXRkLT5fc3VzcGVuZCA9IG5hbmRfc3Vz
cGVuZDsKPiA+ICsgICAgICAgbXRkLT5fcmVzdW1lID0gbmFuZF9yZXN1bWU7Cj4gPiAgICAgICAg
IHJldHVybiAwOwo+ID4gIAo+ID4gIGVycl9mcmVlX3NlY3VyZV9yZWdpb25zOiAgCj4gCj4gV2h5
IGlzIHRoZSBncG1pLW5hbmQuYyBhbmQgb3RoZXIgZHJpdmVycyBzZXQgTkFORF9TS0lQX0JCVFND
QU4gYW5kIHRoZW4KPiBjYWxsIG5hbmRfY3JlYXRlX2JidCgpIGRpcmVjdGx5Pwo+IAo+IFRvIG1l
IGl0IGxvb2tzIGxpa2UgbGVnYWN5IGxlZnRvdmVyLi4uCgpJdCBpcy4uLgoKODg1ZDcxZTU4Mzhm
ICgibXRkOiBncG1pOiBmaXggdGhlIE5VTEwgcG9pbnRlciIpIGFkZGVkIHRoaXMgZmxhZyB0bwph
dm9pZCBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvbiBjaGlwLT5idWZmZXItPmRhdGFidWYg
b24gbXgyMywKd2hpY2ggSUlSQyBkb2VzIG5vdCBleGlzdCBhbnltb3JlLgoKSSBiZWxpZXZlIHdl
IGNvdWxkIGdldCByaWQgb2YgaXQuIEJ1dCBhbnl3YXksIEkgbGlrZSB0aGUgImNsZWFudXAiCnBy
b3Bvc2VkIGJ5IEJvcmlzIHNvIElNSE8geW91IGNhbiBhZGQgdGhlc2UgdHdvIHBhdGNoZXMgdG8g
dGhlIHNlcmllcy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
