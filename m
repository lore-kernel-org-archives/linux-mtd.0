Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A57C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 10:54:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EEF23340
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 10:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EEF23340
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1nWKcU7x2SKw91q2orjDUDBdKyIaEe6LCJv2YXV1FTY=; b=U0CtjRY+XyW50VdXSV4g7l4LI
	Ecmh8Bk0Mp0VKNC+pcpUcWlVUwABNqGOaAike1ESm0sEsQkQ0xOoiWf7as9lc3pJ/62gXUFgKa413
	1vAEe1SyYkViBAOlgsTomj/SLCLbBx2R+NYvJMBgTlt6pD2GHU3Tqn7cZIDJOD8lNehHOHO6+5J1I
	Q00fRoWD6/My6Dl3+yH9eJ7UxuQkO4xZWk3/JX4jxIxuRuPbhn/SNpuof+ybv3J4A5abhk5Ktq6l0
	ipUvLWnaUV9YqisBWut8HEUTGCujQEmvbFpmDKhEBXdqYqXqWDiY0yDrsncM8YN8H8DJQvA+MUfrW
	6jOS9Vdbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmE9G-0000Pp-40; Mon, 07 Dec 2020 10:53:42 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmE9C-0000Ne-Ka
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 10:53:39 +0000
X-Originating-IP: 109.220.208.103
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 30BCA1BF20E;
 Mon,  7 Dec 2020 10:53:31 +0000 (UTC)
Date: Mon, 7 Dec 2020 11:53:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: ping // [PATCH] mtd:cfi_cmdset_0002: fix atomic sleep bug when
 CONFIG_MTD_XIP=y
Message-ID: <20201207115228.0a6de398@xps13>
In-Reply-To: <a02e1364-3b82-039a-4b65-e2a216663dd4@huawei.com>
References: <20201127130731.99270-1-nixiaoming@huawei.com>
 <a02e1364-3b82-039a-4b65-e2a216663dd4@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_055338_889370_DAAFC66A 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: wangle6@huawei.com, vigneshr@ti.com, tudor.ambarus@microchip.com,
 richard@nod.at, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb21pbmcsCgpYaWFvbWluZyBOaSA8bml4aWFvbWluZ0BodWF3ZWkuY29tPiB3cm90ZSBv
biBNb24sIDcgRGVjIDIwMjAgMTg6NDg6MzMKKzA4MDA6Cgo+IHBpbmcKPiAKPiBPbiAyMDIwLzEx
LzI3IDIxOjA3LCBYaWFvbWluZyBOaSB3cm90ZToKPiA+IFdoZW4gQ09ORklHX01URF9YSVA9eSwg
bG9jYWxfaXJxX2Rpc2FibGUoKSBpcyBjYWxsZWQgaW4geGlwX2Rpc2FibGUoKS4KPiA+IFRvIGF2
b2lkIHNsZWVwIGluIGludGVycnVwdCBjb250ZXh0LCB3ZSBuZWVkIHRvIGNhbGwgbG9jYWxfaXJx
X2VuYWJsZSgpCj4gPiBiZWZvcmUgc2NoZWR1bGUoKS4KPiA+IAo+ID4gVGhlIHByb2JsZW0gY2Fs
bCBzdGFjayBpcyBhcyBmb2xsb3dzOgo+ID4gYnVnMToKPiA+IAlkb193cml0ZV9vbmV3b3JkX3Jl
dHJ5KCkKPiA+IAkJeGlwX2Rpc2FibGUoKQo+ID4gCQkJbG9jYWxfaXJxX2Rpc2FibGUoKQo+ID4g
CQlkb193cml0ZV9vbmV3b3JkX29uY2UoKQo+ID4gCQkJc2NoZWR1bGUoKQo+ID4gYnVnMjoKPiA+
IAlkb193cml0ZV9idWZmZXIoKQo+ID4gCQl4aXBfZGlzYWJsZSgpCj4gPiAJCQlsb2NhbF9pcnFf
ZGlzYWJsZSgpCj4gPiAJCWRvX3dyaXRlX2J1ZmZlcl93YWl0KCkKPiA+IAkJCXNjaGVkdWxlKCkK
PiA+IGJ1ZzM6Cj4gPiAJZG9fZXJhc2VfY2hpcCgpCj4gPiAJCXhpcF9kaXNhYmxlKCkKPiA+IAkJ
CWxvY2FsX2lycV9kaXNhYmxlKCkKPiA+IAkJc2NoZWR1bGUoKQo+ID4gYnVnNDoKPiA+IAlkb19l
cmFzZV9vbmVibG9jaygpCj4gPiAJCXhpcF9kaXNhYmxlKCkKPiA+IAkJCWxvY2FsX2lycV9kaXNh
YmxlKCkKPiA+IAkJc2NoZWR1bGUoKQo+ID4gCj4gPiBGaXhlczogMDJiMTVlMzQzYWVlICgiW01U
RF0gWElQIGZvciBBTUQgQ0ZJIGZsYXNoLiIpCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZyAjIHYyLjYuMTMKPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW9taW5nIE5pIDxuaXhpYW9taW5nQGh1
YXdlaS5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAy
LmMgfCAxNiArKysrKysrKysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiBpbmRleCBh
MWYzZTEwMzFjM2QuLjEyYzM3NzZmMDkzYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21k
c2V0XzAwMDIuYwo+ID4gQEAgLTE2ODIsNyArMTY4MiwxMSBAQCBzdGF0aWMgaW50IF9feGlwcmFt
IGRvX3dyaXRlX29uZXdvcmRfb25jZShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKPiA+ICAgCQkJc2V0
X2N1cnJlbnRfc3RhdGUoVEFTS19VTklOVEVSUlVQVElCTEUpOwo+ID4gICAJCQlhZGRfd2FpdF9x
dWV1ZSgmY2hpcC0+d3EsICZ3YWl0KTsKPiA+ICAgCQkJbXV0ZXhfdW5sb2NrKCZjaGlwLT5tdXRl
eCk7Cj4gPiArCQkJaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9YSVApKQo+ID4gKwkJCQlsb2Nh
bF9pcnFfZW5hYmxlKCk7Cj4gPiAgIAkJCXNjaGVkdWxlKCk7Cj4gPiArCQkJaWYgKElTX0VOQUJM
RUQoQ09ORklHX01URF9YSVApKQo+ID4gKwkJCQlsb2NhbF9pcnFfZGlzYWJsZSgpOwoKVGhlIGZp
eCByZWFsbHkgc2VlbXMgc3RyYW5nZSB0byBtZS4gSSB3aWxsIGxldCBWaWduZXNoIGRlY2lkZSBi
dXQgSQp0aGluayB3ZSBzaG91bGQgY29uc2lkZXIgdXBkYXRpbmcvZml4aW5nIHhpcF9kaXNhYmxl
IGluc3RlYWQuCgo+ID4gICAJCQlyZW1vdmVfd2FpdF9xdWV1ZSgmY2hpcC0+d3EsICZ3YWl0KTsK
PiA+ICAgCQkJdGltZW8gPSBqaWZmaWVzICsgKEhaIC8gMik7IC8qIEZJWE1FICovCj4gPiAgIAkJ
CW11dGV4X2xvY2soJmNoaXAtPm11dGV4KTsKPiA+IEBAIC0xOTYyLDcgKzE5NjYsMTEgQEAgc3Rh
dGljIGludCBfX3hpcHJhbSBkb193cml0ZV9idWZmZXJfd2FpdChzdHJ1Y3QgbWFwX2luZm8gKm1h
cCwKPiA+ICAgCQkJc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19VTklOVEVSUlVQVElCTEUpOwo+ID4g
ICAJCQlhZGRfd2FpdF9xdWV1ZSgmY2hpcC0+d3EsICZ3YWl0KTsKPiA+ICAgCQkJbXV0ZXhfdW5s
b2NrKCZjaGlwLT5tdXRleCk7Cj4gPiArCQkJaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9YSVAp
KQo+ID4gKwkJCQlsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gPiAgIAkJCXNjaGVkdWxlKCk7Cj4gPiAr
CQkJaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9YSVApKQo+ID4gKwkJCQlsb2NhbF9pcnFfZGlz
YWJsZSgpOwo+ID4gICAJCQlyZW1vdmVfd2FpdF9xdWV1ZSgmY2hpcC0+d3EsICZ3YWl0KTsKPiA+
ICAgCQkJdGltZW8gPSBqaWZmaWVzICsgKEhaIC8gMik7IC8qIEZJWE1FICovCj4gPiAgIAkJCW11
dGV4X2xvY2soJmNoaXAtPm11dGV4KTsKPiA+IEBAIC0yNDYxLDcgKzI0NjksMTEgQEAgc3RhdGlj
IGludCBfX3hpcHJhbSBkb19lcmFzZV9jaGlwKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3Qg
ZmxjaGlwICpjaGlwKQo+ID4gICAJCQlzZXRfY3VycmVudF9zdGF0ZShUQVNLX1VOSU5URVJSVVBU
SUJMRSk7Cj4gPiAgIAkJCWFkZF93YWl0X3F1ZXVlKCZjaGlwLT53cSwgJndhaXQpOwo+ID4gICAJ
CQltdXRleF91bmxvY2soJmNoaXAtPm11dGV4KTsKPiA+ICsJCQlpZiAoSVNfRU5BQkxFRChDT05G
SUdfTVREX1hJUCkpCj4gPiArCQkJCWxvY2FsX2lycV9lbmFibGUoKTsKPiA+ICAgCQkJc2NoZWR1
bGUoKTsKPiA+ICsJCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1hJUCkpCj4gPiArCQkJCWxv
Y2FsX2lycV9kaXNhYmxlKCk7Cj4gPiAgIAkJCXJlbW92ZV93YWl0X3F1ZXVlKCZjaGlwLT53cSwg
JndhaXQpOwo+ID4gICAJCQltdXRleF9sb2NrKCZjaGlwLT5tdXRleCk7Cj4gPiAgIAkJCWNvbnRp
bnVlOwo+ID4gQEAgLTI1NjAsNyArMjU3MiwxMSBAQCBzdGF0aWMgaW50IF9feGlwcmFtIGRvX2Vy
YXNlX29uZWJsb2NrKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+
ID4gICAJCQlzZXRfY3VycmVudF9zdGF0ZShUQVNLX1VOSU5URVJSVVBUSUJMRSk7Cj4gPiAgIAkJ
CWFkZF93YWl0X3F1ZXVlKCZjaGlwLT53cSwgJndhaXQpOwo+ID4gICAJCQltdXRleF91bmxvY2so
JmNoaXAtPm11dGV4KTsKPiA+ICsJCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1hJUCkpCj4g
PiArCQkJCWxvY2FsX2lycV9lbmFibGUoKTsKPiA+ICAgCQkJc2NoZWR1bGUoKTsKPiA+ICsJCQlp
ZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1hJUCkpCj4gPiArCQkJCWxvY2FsX2lycV9kaXNhYmxl
KCk7Cj4gPiAgIAkJCXJlbW92ZV93YWl0X3F1ZXVlKCZjaGlwLT53cSwgJndhaXQpOwo+ID4gICAJ
CQltdXRleF9sb2NrKCZjaGlwLT5tdXRleCk7Cj4gPiAgIAkJCWNvbnRpbnVlOwo+ID4gICAKPiAK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
