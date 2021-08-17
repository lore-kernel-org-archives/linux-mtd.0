Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FBAC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:04:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F84F60F38
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F84F60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEd/n2A3j4uOPsjPUHx7n0DE51hTH5NGlYLz/xc+YsY=; b=o9Kq0wyEFQeRYF
	VTNtVvm3kSq2p5py/xCypzlVzEcoruv5ibDdY9tZBguD+BNans/jtM0LGFHHFjcR6WVgNCq95D3Lb
	rfXxTClx7S3YszD/4syC7qUoKi92/NRPojPQH1uxGRGGaxEu0e679ZcAF6PUYaaU3UvlC8eNppfPv
	AQk3yKD8z1OlEjwo60u6lrM2JzERxGzaNOZIlwwXtNl8S1iIlVY3A8oI2bVje1QvDyWfIfwNJ7ICn
	xuxvWLYW8BFkOatWbtscTwJk5UDDIlRjWHAApQgjIL4hxw9j16bW8+zZ20Jn322izAYfnsUcoKZce
	XNxT155HxwMSywYQuhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvx7-001ysz-R4; Tue, 17 Aug 2021 10:04:13 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvx2-001yrn-7i
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 10:04:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A8D524000F;
 Tue, 17 Aug 2021 10:04:02 +0000 (UTC)
Date: Tue, 17 Aug 2021 12:04:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>, <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] mtd: mtdconcat: Check existence of _read|_write from
 subdev'master device before assigning
Message-ID: <20210817120401.1ccf98bd@xps13>
In-Reply-To: <8b315831-84c5-38f3-d3b7-bb53f52c28b8@huawei.com>
References: <20210817024552.1691649-1-chengzhihao1@huawei.com>
 <8b315831-84c5-38f3-d3b7-bb53f52c28b8@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_030408_456560_EAD25286 
X-CRM114-Status: GOOD (  20.72  )
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

SGkgWmhpaGFvLAoKWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGUg
b24gVHVlLCAxNyBBdWcgMjAyMQoxMDo0NTo1NSArMDgwMDoKCj4g5ZyoIDIwMjEvOC8xNyAxMDo0
NSwgWmhpaGFvIENoZW5nIOWGmemBkzoKPiBIaSBNaXF1ZWwsCj4gSSBmb3VuZCBhIGJldHRlciB3
YXkgdG8gZml4IHRoZSAiV0FSTklORyIgb24gX3JlYWR8X3JlYWRfb29iIGNoZWNraW5nLiBTaW5j
ZSBzdWItbXRkIGRldmljZSBoYXMgYmVlbiByZWdpc3RlcmVkIHN1Y2Nlc3NmdWxseSwgd2UgY2Fu
IGNoZWNrIGFnYWluc3QgdGhlIGV4aXN0ZW5jZSBvZiBfcmVhZHxfcmVhZF9vb2IgY2FsbGJhY2tz
IGJ5IHN1YmRldidzIG1hc3RlciBkZXZpY2UuCj4gQlRXLCBmaXggbWlzc2luZyBzcGFjZSBiZXR3
ZWVuIHRoZSBTSEExIGFuZCB0aGUgc3ViamVjdCBzdWdnZXN0ZWQgYnkgU3RlcGhlbi4KCkkgYW0g
YSBiaXQgbG9zdCwgSSBuZWVkIHRvIHNlZSB0aGUgYmlnIHBpY3R1cmUgYWdhaW4uIEkgd2lsbCBk
cm9wIHRoZQpjdXJyZW50IHBhdGNoZXMgdGhhdCBhcHBsaWVkLCBwbGVhc2UgcmVzZW5kIHRoZSBm
dWxsIHNlcmllcyB3aXRoIGEKY2hhbmdlbG9nLgoKPiA+IFNpbmNlIDI0MzFjNGY1YjQ2YzMgKCJt
dGQ6IEltcGxlbWVudCBtdGRfe3JlYWQsd3JpdGV9KCkgYXMgd3JhcHBlcnMKPiA+IGFyb3VuZCBt
dGRfe3JlYWQsd3JpdGV9X29vYigpIikgZG9uJ3QgYWxsb3cgX3dyaXRlfF9yZWFkIGFuZAo+ID4g
X3dyaXRlX29vYnxfcmVhZF9vb2IgZXhpc3RpbmcgYXQgdGhlIHNhbWUgdGltZS4gV2Ugc2hvdWxk
IGNoZWNrIHRoZQoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAsIHdlCgo+ID4gZXhpc3RlbmNlIG9mIGNhbGxiYWNrcyAiX3JlYWQgYW5kIF93cml0ZSIg
ZnJvbSBzdWJkZXYncyBtYXN0ZXIgZGV2aWNlCj4gPiAoV2UgY2FuIHRydXN0IG1hc3RlciBkZXZp
Y2Ugc2luY2UgaXQgaGFzIGJlZW4gcmVnaXN0ZXJlZCkgYmVmb3JlCj4gPiBhc3NpZ25pbmcsIG90
aGVyd2lzZSBmb2xsb3dpbmcgd2FybmluZyBvY2N1cnMgd2hpbGUgbWFraW5nCj4gPiBjb25jYXRl
bmF0ZWQgZGV2aWNlOgo+ID4KPiA+ICAgIFdBUk5JTkc6IENQVTogMiBQSUQ6IDY3MjggYXQgZHJp
dmVycy9tdGQvbXRkY29yZS5jOjU5NQo+ID4gICAgYWRkX210ZF9kZXZpY2UrMHg3Zi8weDdiMAo+
ID4KPiA+IEZpeGVzOiAyNDMxYzRmNWI0NmMzICgibXRkOiBJbXBsZW1lbnQgbXRkX3tyZWFkLHdy
aXRlfSgpIGFyb3VuZCAuLi4iKQoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KV3JvbmcgY29tbWl0IG1lc3NhZ2UKCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+ID4gLS0t
CgpBbHNvLCBwbGVhc2Ugc2hvcnRlbiBhIGJpdCB0aGUgdHdvIGNvbW1pdCB0aXRsZXMsIGxpa2U6
CgptdGQ6IG10ZGNvbmNhdDogSnVkZ2UgY2FsbGJhY2sgZXhpc3RlbmNlIGJhc2VkIG9uIHRoZSBt
YXN0ZXIKCkZpbmFsbHksIGluIHRoZSBvdGhlciBwYXRjaCwgdGhlcmUgaXMgYSB0eXBvIGluIHRo
ZSBleGFtcGxlCnJlcHJvZHVjZS5jIChjb21iaW5lIG1pc3NwZWxsZWQpLgoKPiA+ICAgZHJpdmVy
cy9tdGQvbXRkY29uY2F0LmMgfCA2ICsrKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9tdGRjb25jYXQuYyBiL2RyaXZlcnMvbXRkL210ZGNvbmNhdC5jCj4gPiBpbmRleCBhZjUxZWVl
NmI1ZTguLmY2ODVhNTgxZGY0OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvbmNh
dC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb25jYXQuYwo+ID4gQEAgLTY5NCw2ICs2OTQs
MTAgQEAgc3RydWN0IG10ZF9pbmZvICptdGRfY29uY2F0X2NyZWF0ZShzdHJ1Y3QgbXRkX2luZm8g
KnN1YmRldltdLAkvKiBzdWJkZXZpY2VzIHRvIGMKPiA+ICAgCQljb25jYXQtPm10ZC5fYmxvY2tf
bWFya2JhZCA9IGNvbmNhdF9ibG9ja19tYXJrYmFkOwo+ID4gICAJaWYgKHN1YmRldl9tYXN0ZXIt
Pl9wYW5pY193cml0ZSkKPiA+ICAgCQljb25jYXQtPm10ZC5fcGFuaWNfd3JpdGUgPSBjb25jYXRf
cGFuaWNfd3JpdGU7Cj4gPiArCWlmIChzdWJkZXZfbWFzdGVyLT5fcmVhZCkKPiA+ICsJCWNvbmNh
dC0+bXRkLl9yZWFkID0gY29uY2F0X3JlYWQ7Cj4gPiArCWlmIChzdWJkZXZfbWFzdGVyLT5fd3Jp
dGUpCj4gPiArCQljb25jYXQtPm10ZC5fd3JpdGUgPSBjb25jYXRfd3JpdGU7ICAKPiA+ICAgPiAg
IAljb25jYXQtPm10ZC5lY2Nfc3RhdHMuYmFkYmxvY2tzID0gc3ViZGV2WzBdLT5lY2Nfc3RhdHMu
YmFkYmxvY2tzOwo+ID4gICA+IEBAIC03NTUsOCArNzU5LDYgQEAgc3RydWN0IG10ZF9pbmZvICpt
dGRfY29uY2F0X2NyZWF0ZShzdHJ1Y3QgbXRkX2luZm8gKnN1YmRldltdLAkvKiBzdWJkZXZpY2Vz
IHRvIGMgIAo+ID4gICAJY29uY2F0LT5tdGQubmFtZSA9IG5hbWU7ICAKPiA+ICAgPiAgIAljb25j
YXQtPm10ZC5fZXJhc2UgPSBjb25jYXRfZXJhc2U7ICAKPiA+IC0JY29uY2F0LT5tdGQuX3JlYWQg
PSBjb25jYXRfcmVhZDsKPiA+IC0JY29uY2F0LT5tdGQuX3dyaXRlID0gY29uY2F0X3dyaXRlOwo+
ID4gICAJY29uY2F0LT5tdGQuX3N5bmMgPSBjb25jYXRfc3luYzsKPiA+ICAgCWNvbmNhdC0+bXRk
Ll9sb2NrID0gY29uY2F0X2xvY2s7Cj4gPiAgIAljb25jYXQtPm10ZC5fdW5sb2NrID0gY29uY2F0
X3VubG9jazsgIAo+IAo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
