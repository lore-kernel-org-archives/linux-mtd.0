Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EB4C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FB36113B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45FB36113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2qn+onZOkW8KYhBc0yWIswWbYIR6fNM8Fdeiqm1Ks0=; b=vEoN0M638OBaJM
	/5VLqrOhtScXU7PQAi71xZ50ErLalXxk1KFEAw6/WjuI1jiFLhQ7hVo/I8C1hr7zgLjRC3T10KFK3
	C1NdvyoRfo1JYbPUUiuKn1ajvvfXeZ2LCAu7y3av58Px7xXNtt+V2l2/OceZRXoL1vefnifwaeLoP
	kur+eMFsP9rZLC2j/FY1VEmjLBoJXX0slS64ZHtHsKUeRBuZFEyHBIsqUn01zE2bDiBQe611Z0SQQ
	Jc6i+uB1GjhWMUMKHgDqYJl9mVqcYUQbPSu7Y0nASnnDrxfRyo73d2IIv5MzzlR+5d8uPdnEGfF6r
	aX3CdOSBOUvfdSqu3nsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC59Z-00DFA8-Af; Fri, 06 Aug 2021 19:05:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC59W-00DF9P-2u
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 19:05:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AFE49C0003;
 Fri,  6 Aug 2021 19:05:01 +0000 (UTC)
Date: Fri, 6 Aug 2021 21:05:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 09/13] mtd: spinand: Add support for write volatile
 configuration register op
Message-ID: <20210806210500.3ead1600@xps13>
In-Reply-To: <20210713130538.646-10-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-10-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_120506_448077_C7E85ACB 
X-CRM114-Status: GOOD (  26.28  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUs
IDEzIEp1bCAyMDIxIDEzOjA1OjM0CiswMDAwOgoKPiBWb2xhdGlsZSBjb25maWd1cmF0aW9uIHJl
Z2lzdGVyIGFyZSBhIGRpZmZlcmVudCBzZXQgb2YgY29uZmlndXJhdGlvbgo+IHJlZ2lzdGVycywg
aS5lLiB0aGV5IGRpZmZlciBmcm9tIHRoZSBzdGF0dXMgcmVnaXN0ZXJzLiBBIGRpZmZlcmVudAo+
IFNQSSBpbnN0cnVjdGlvbiBpcyByZXF1aXJlZCB0byB3cml0ZSB0byB0aGVzZSByZWdpc3RlcnMu
IEFueSBjaGFuZ2VzCj4gdG8gdGhlIFZvbGF0aWxlIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgZ2V0
IHRyYW5zZmVycmVkIGRpcmVjdGx5IHRvCj4gdGhlIEludGVybmFsIENvbmZpZ3VyYXRpb24gUmVn
aXN0ZXIgYW5kIGluc3RhbnRseSByZWZsZWN0IG9uIHRoZQo+IGRldmljZSBvcGVyYXRpb24uCj4g
Cj4gSW4gV2luYm9uZCBXMzVOMDFKVywgdGhlc2Ugdm9sYXRpbGUgY29uZmlndXJhdGlvbiByZWdp
c3RlciBtdXN0IGJlCj4gY29uZmlndXJlZCBpbiBvcmRlciB0byBzd2l0Y2ggdG8gT2N0YWwgRFRS
IFNQSSBtb2RlLgo+IAo+IEFkZCBzdXBwb3J0IGZvciB3cml0aW5nIHRvIHZvbGF0aWxlIGNvbmZp
Z3VyYXRpb24gcmVnaXN0ZXJzIHVzaW5nIGEKPiBuZXcgV1JJVEVfVkNSX09QIHRlbXBsYXRlLgo+
IAo+IERhdGFzaGVldDogaHR0cHM6Ly93d3cud2luYm9uZC5jb20vZXhwb3J0L3NpdGVzL3dpbmJv
bmQvZGF0YXNoZWV0L1czNU4wMUpXX0RhdGFzaGVldF9CcmllZi5wZGYKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvc3BpL2NvcmUuYyAgICB8ICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJv
bmQuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9t
dGQvc3BpbmFuZC5oICAgIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gaW5kZXggODcxMWU4ODdiNzk1
Li5mNTc3ZTcyZGEyYzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gQEAgLTQ0Miw3ICs0NDIsNyBA
QCBzdGF0aWMgdm9pZCBzcGluYW5kX29uZGllX2VjY19zYXZlX3N0YXR1cyhzdHJ1Y3QgbmFuZF9k
ZXZpY2UgKm5hbmQsIHU4IHN0YXR1cykKPiAgCQllbmdpbmVfY29uZi0+c3RhdHVzID0gc3RhdHVz
Owo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHNwaW5hbmRfd3JpdGVfZW5hYmxlX29wKHN0cnVjdCBz
cGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAraW50IHNwaW5hbmRfd3JpdGVfZW5hYmxlX29wKHN0
cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAgewo+ICAJc3RydWN0IHNwaV9tZW1fb3Ag
b3AgPSBTUElOQU5EX1dSX0VOX0RJU19PUCh0cnVlKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQu
Ywo+IGluZGV4IDc2Njg0NDI4MzU0ZS4uYTcwNTJhOWNhMTcxIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dp
bmJvbmQuYwo+IEBAIC03LDYgKzcsNyBAQAo+ICAgKglCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJy
ZXppbGxvbkBib290bGluLmNvbT4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGludXgvZGVsYXku
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tdGQvc3BpbmFuZC5oPgo+IEBAIC0xMTQsNiArMTE1LDMz
IEBAIHN0YXRpYyBpbnQgd2luYm9uZF9zcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgd2luYm9uZF93
cml0ZV92Y3Jfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCB1OCByZWcsIHU4IHZh
bCkKCk1heWJlIGEgY29tbWVudCB0byB0ZWxsIHBlb3BsZSB3aGF0IHZjciBpcz8KCj4gK3sKPiAr
CWludCByZXQ7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSV9NRU1fT1AoU1BJX01FTV9P
UF9DTUQoMHg4MSwgMSksCj4gKwkJCQkJICBTUElfTUVNX09QX0FERFIoMywgcmVnLCAxKSwKPiAr
CQkJCQkgIFNQSV9NRU1fT1BfTk9fRFVNTVksCj4gKwkJCQkJICBTUElfTUVNX09QX0RBVEFfT1VU
KDEsIHNwaW5hbmQtPnNjcmF0Y2hidWYsIDEpKTsKPiArCj4gKwkqc3BpbmFuZC0+c2NyYXRjaGJ1
ZiA9IHZhbDsKPiArCj4gKwlyZXQgPSBzcGluYW5kX3dyaXRlX2VuYWJsZV9vcChzcGluYW5kKTsK
PiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlyZXQgPSBzcGlfbWVtX2V4ZWNf
b3Aoc3BpbmFuZC0+c3BpbWVtLCAmb3ApOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+
ICsKPiArCS8qCj4gKwkgKiBXcml0ZSBWQ1Igb3BlcmF0aW9uIGRvZXNuJ3Qgc2V0IHRoZSBidXN5
IGJpdCBpbiBTUiwgc28gY2FuJ3QgcGVyZm9ybQo+ICsJICogYSBzdGF0dXMgcG9sbC4gTWluaW11
bSB0aW1lIG9mIDUwbnMgaXMgbmVlZGVkIHRvIGNvbXBsZXRlIHRoZSB3cml0ZS4KPiArCSAqIFNv
LCBnaXZlIHRocmljZSB0aGUgbWluaW11bSByZXF1aXJlZCBkZWxheS4KCklzbid0IHRoZXJlIGFu
IG9mZmljaWFsIG1heGltdW0gdGltZT8KCj4gKwkgKi8KPiArCW5kZWxheSgxNTApOwo+ICsJcmV0
dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFjdHVy
ZXJfb3BzIHdpbmJvbmRfc3BpbmFuZF9tYW51Zl9vcHMgPSB7Cj4gIAkuaW5pdCA9IHdpbmJvbmRf
c3BpbmFuZF9pbml0LAo+ICB9Owo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9zcGlu
YW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPiBpbmRleCBkYWEyYWM1YzMxMTAu
LjIxYTRlNWFkY2Q1OSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPiBAQCAtNTYwLDUgKzU2MCw2IEBA
IGludCBzcGluYW5kX21hdGNoX2FuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCwKPiAgCj4gIGludCBzcGluYW5kX3VwZF9jZmcoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kLCB1OCBtYXNrLCB1OCB2YWwpOwo+ICBpbnQgc3BpbmFuZF9zZWxlY3RfdGFyZ2V0KHN0cnVj
dCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdW5zaWduZWQgaW50IHRhcmdldCk7Cj4gK2ludCBz
cGluYW5kX3dyaXRlX2VuYWJsZV9vcChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpOwo+
ICAKPiAgI2VuZGlmIC8qIF9fTElOVVhfTVREX1NQSU5BTkRfSCAqLwoKCgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
