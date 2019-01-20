Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3814C676ED
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 15:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA14320880
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 15:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMqOlJ3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA14320880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHJAiSH49fDjxzLmxk2rBzmcuIm4ED5N1/l1iiDL8zo=; b=ZMqOlJ3X2qtQtv
	3US5v7ikcgCVk1rPRPSS+a0gxhFaV1SUjADklUxzVbMnPD04h5KfAtxo9JUIZ4XsedfQY2m8KjGre
	Kunl8/I7I9iNZd2IOR74ewJXHBRAVuzSdbCjJnKhrH/lg4srFEjlleP7kv+adDougS0qZGSC6derT
	QswfKc2D8wnb3Gn8zl9BIJFKNvqRgpqK9uODuk2emIQHSCnv848m7DAWJvvCJnMujI4cgL3lWbVMp
	DpFwEVpTzahlnZQyhk3BP+u7ZpUUO1fcZPrdKDXYc8x/16SuejisOu4v07D4BF5GBXZTcqS3Hq767
	xoYNnhig+RhO73nZPlEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glEyv-00018e-VA; Sun, 20 Jan 2019 15:25:53 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glEys-00018J-Np
 for linux-mtd@lists.infradead.org; Sun, 20 Jan 2019 15:25:52 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 5F1EF2074A; Sun, 20 Jan 2019 16:25:49 +0100 (CET)
Received: from xps13 (unknown [77.136.42.183])
 by mail.bootlin.com (Postfix) with ESMTPSA id E31FC206A7;
 Sun, 20 Jan 2019 16:25:48 +0100 (CET)
Date: Sun, 20 Jan 2019 16:25:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation hook
 function pointer
Message-ID: <20190120162548.54cd26d9@xps13>
In-Reply-To: <20190118234236.0d296130@bbrezillon>
References: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118234236.0d296130@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_072550_905337_AD1A0805 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>, "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQmVhbiwKCkZvciB0aGUgY2hhbmdlcyEKCkJvcmlzIEJyZXppbGxvbiA8YmJyZXppbGxvbkBr
ZXJuZWwub3JnPiB3cm90ZSBvbiBGcmksIDE4IEphbiAyMDE5CjIzOjQyOjQ4ICswMTAwOgoKPiBP
biBGcmksIDE4IEphbiAyMDE5IDIyOjExOjM0ICswMDAwCj4gIkJlYW4gSHVvIChiZWFuaHVvKSIg
PGJlYW5odW9AbWljcm9uLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGlzIHBhdGNoIGlzIHRvIGFkZCBh
IGNhbGxiYWNrIGZ1bmN0aW9uIHBvaW50ZXIKPiA+IGZvciBwcmVwYXJhdGlvbiByb3V0aW5lIG9m
IGVyYXNlIGluIG5hbmRfbWFudWZhY3R1cmVyX29wcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
QmVhbiBIdW8gPGJlYW5odW9AbWljcm9uLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L2ludGVybmFscy5oIHwgMiArKwo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
YmFzZS5jIHwgNSArKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlcm5hbHMuaCBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oCj4gPiBpbmRleCBmYmY2Y2EwLi44MzgyOTQ4
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmgKPiA+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oCj4gPiBAQCAtNDIsNiArNDIsNyBA
QAo+ID4gICAqCSAgICAgaXMgaGVyZSB0byBsZXQgdmVuZG9yIHNwZWNpZmljIGNvZGUgcmVsZWFz
ZSB0aG9zZSByZXNvdXJjZXMuCj4gPiAgICogQGZpeHVwX29uZmlfcGFyYW1fcGFnZTogYXBwbHkg
dmVuZG9yIHNwZWNpZmljIGZpeHVwcyB0byB0aGUgT05GSSBwYXJhbWV0ZXIKPiA+ICAgKgkJCSAg
IHBhZ2UuIFRoaXMgaXMgY2FsbGVkIGFmdGVyIHRoZSBjaGVja3N1bSBpcyB2ZXJpZmllZC4KPiA+
ICsgKiBAZXJhc2VfcHJlOiBwcmVwYXJhdGlvbiBiZWZvcmUgYWN0dWFsbHkgZXJhc2UgYSBwaHlz
aWNhbCBibG9jay4KCldoYXQgYWJvdXQgInByZXBhcmUgYSBwaHlzaWNhbCBlcmFzZSBibG9jayBi
ZWZvcmUgZXJhc3VyZSIgPwoKPiA+ICAgKi8KPiA+ICBzdHJ1Y3QgbmFuZF9tYW51ZmFjdHVyZXJf
b3BzIHsKPiA+ICAJdm9pZCAoKmRldGVjdCkoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCk7Cj4gPiBA
QCAtNDksNiArNTAsNyBAQCBzdHJ1Y3QgbmFuZF9tYW51ZmFjdHVyZXJfb3BzIHsKPiA+ICAJdm9p
ZCAoKmNsZWFudXApKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApOwo+ID4gIAl2b2lkICgqZml4dXBf
b25maV9wYXJhbV9wYWdlKShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4gIAkJCQkgICAgICBz
dHJ1Y3QgbmFuZF9vbmZpX3BhcmFtcyAqcCk7Cj4gPiArCWludCAoKmVyYXNlX3ByZSkoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgaW50IHBhZ2UpOyAgCj4gCj4gTGV0J3MgbW92ZSB0aGlzIGhvb2sg
dG8gbmFuZF9jaGlwIGFuZCBuYW1lIGl0IC0+cHJlX2VyYXNlKCkgb3IKPiAtPmVyYXNlX3ByZXBh
cmF0aW9uKCkuICAKPiAKPiA+ICB9Owo+ID4gIAo+ID4gIC8qKgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9iYXNlLmMKPiA+IGluZGV4IGNjYTRiMjQuLmQ0NDZkMWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmMKPiA+IEBAIC00MjQ2LDYgKzQyNDYsMTEgQEAgaW50IG5hbmRfZXJhc2Vf
bmFuZChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5zdHIsCj4g
PiAgCQkgICAgKHBhZ2UgKyBwYWdlc19wZXJfYmxvY2spKQo+ID4gIAkJCWNoaXAtPnBhZ2VidWYg
PSAtMTsKPiA+ICAKPiA+ICsJCWlmIChjaGlwLT5tYW51ZmFjdHVyZXIuZGVzYyAmJiBjaGlwLT5t
YW51ZmFjdHVyZXIuZGVzYy0+b3BzICYmCj4gPiArCQkgICAgY2hpcC0+bWFudWZhY3R1cmVyLmRl
c2MtPm9wcy0+ZXJhc2VfcHJlKQo+ID4gKwkJCWNoaXAtPm1hbnVmYWN0dXJlci5kZXNjLT5vcHMt
PmVyYXNlX3ByZShjaGlwLAo+ID4gKwkJCQkJCXBhZ2UgJiBjaGlwLT5wYWdlbWFzayk7Cj4gPiAr
Cj4gPiAgCQlpZiAoY2hpcC0+bGVnYWN5LmVyYXNlKQo+ID4gIAkJCXN0YXR1cyA9IGNoaXAtPmxl
Z2FjeS5lcmFzZShjaGlwLAo+ID4gIAkJCQkJCSAgICBwYWdlICYgY2hpcC0+cGFnZW1hc2spOyAg
Cj4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
