Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B9C32751
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 10:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD9C21E6A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 10:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JOExx+io"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD9C21E6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhHKPe6NghSPOZ/Lop+oC3Ak6l3uhDnLl8xe+oKObSE=; b=JOExx+ioZaeAMa
	MNhHZ1F7PWhP2U48K6NpUf5soVMm0M1SBrni4Qy5kxrDsQCUu+Msn6i6RdhXB5hiv4uQvBI1W0oIL
	HRTaSyulH0fzWbIi8WsxnvUxtQnWySn0B3sdrY8lSSH6i1s2czexaqoXjTIO85dwE9erUR8sD1OE0
	WPB9hhC/2jHvCPF9sUy0/fMW/RS8VsVP//ju2C1oOfb0VDy3QTLKWBFdbihgjdvfqsZEDjGA7AasC
	jTr7kHBXnYsco61MayQ1vCZp8qrSpIGqZevQbL+DZUw4ZjMYH8O6/Lk67C5pZmgF9E03/E6kPSPQK
	CFp8R4UWx/gWFuxOJQGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvInp-0008Lh-Ga; Wed, 07 Aug 2019 10:04:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvInm-0008Ky-Aw
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 10:04:16 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C5EB5E0012;
 Wed,  7 Aug 2019 10:04:08 +0000 (UTC)
Date: Wed, 7 Aug 2019 12:04:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 6/8] mtd: spinand: micron: Turn driver implementation
 generic
Message-ID: <20190807120408.031b8d1b@xps13>
In-Reply-To: <20190722055621.23526-7-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-7-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_030414_694413_96EA1095 
X-CRM114-Status: GOOD (  21.65  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDIyIEp1
bCAyMDE5IDA3OjU2OjE5ICswMjAwOgoKPiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KPgoKSSBhbSBub3Qgc3VyZSB0aGUgInR1cm4gaW1wbGVtZW5h
dGF0aW9uIGdlbmVyaWMiIHRpdGxlIGRlc2NyaWJlcyB3aGF0CnlvdSBkby4KIAo+IERyaXZlciBp
cyByZWRlc2lnbmVkIHVzaW5nIHBhcmFtZXRlciBwYWdlIHRvIHN1cHBvcnQgTWljcm9uIFNQSSBO
QU5ECj4gZmxhc2hlcy4KClJlZGVzaWduZWQgaXMgcGVyaGFwcyBhIGJpdCB0b28gbXVjaC4KCiIK
PiBUaGUgcmVhc29uIHdoeSBzcGluYW5kX3NlbGVjdF9vcF92YXJpYW50IGdsb2JhbGl6ZWQgaXMg
dGhhdCB0aGUgTWljcm9uCj4gZHJpdmVyIG5vIGxvbmdlciBjYWxsaW5nIHNwaW5hbmRfbWF0Y2hf
YW5kX2luaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2hpdmFtdXJ0aHkgU2hhc3RyaSA8c3NoaXZh
bXVydGh5QG1pY3Jvbi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAg
IHwgIDIgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgfCA2MSArKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgg
ICB8ICA0ICsrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDE4IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBpbmRleCA3YWU3NmRhYjkxNDEuLmFhZTcxNWQz
ODhiNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBAQCAtOTIwLDcgKzkyMCw3IEBAIHN0YXRpYyB2
b2lkIHNwaW5hbmRfbWFudWZhY3R1cmVyX2NsZWFudXAoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpz
cGluYW5kKQo+ICAJCXJldHVybiBzcGluYW5kLT5tYW51ZmFjdHVyZXItPm9wcy0+Y2xlYW51cChz
cGluYW5kKTsKPiAgfQo+ICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICoKPiAr
Y29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKgo+ICBzcGluYW5kX3NlbGVjdF9vcF92YXJpYW50KHN0
cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCQkJICBjb25zdCBzdHJ1Y3Qgc3BpbmFu
ZF9vcF92YXJpYW50cyAqdmFyaWFudHMpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9zcGkvbWljcm9uLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+IGluZGV4
IDk1YmM1MjY0ZWJjMS4uNmZkZTkzZWMyM2ExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvc3BpL21pY3Jvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiBA
QCAtOTAsMjIgKzkwLDEwIEBAIHN0YXRpYyBpbnQgbWljcm9uX2VjY19nZXRfc3RhdHVzKHN0cnVj
dCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCXJldHVybiAtRUlOVkFMOwo+ICB9Cj4gIAo+
IC1zdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyBtaWNyb25fc3BpbmFuZF90YWJsZVtd
ID0gewo+IC0JU1BJTkFORF9JTkZPKCJNVDI5RjJHMDFBQkFHRCIsIDB4MjQsCj4gLQkJICAgICBO
QU5EX01FTU9SRygxLCAyMDQ4LCAxMjgsIDY0LCAyMDQ4LCA0MCwgMiwgMSwgMSksCj4gLQkJICAg
ICBOQU5EX0VDQ1JFUSg4LCA1MTIpLAo+IC0JCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRT
KCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+IC0JCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50
cywKPiAtCQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiAtCQkgICAgIDAsCj4g
LQkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl9vb2JsYXlvdXRfb3BzLAo+IC0JCQkJICAg
ICBtaWNyb25fZWNjX2dldF9zdGF0dXMpKSwKPiAtfTsKPiAtCgpJIGRvbid0IGtub3cgaWYgaXQg
aXMgd2lzZSB0byBkcm9wIHRoaXMgc3RydWN0dXJlLgoKPiAgc3RhdGljIGludCBtaWNyb25fc3Bp
bmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICB7Cj4gKwljb25z
dCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3A7Cj4gIAl1OCAqaWQgPSBzcGluYW5kLT5pZC5kYXRhOwo+
IC0JaW50IHJldDsKPiAgCj4gIAkvKgo+ICAJICogTWljcm9uIFNQSSBOQU5EIHJlYWQgSUQgbmVl
ZCBhIGR1bW15IGJ5dGUsCj4gQEAgLTExNCwxNiArMTAyLDU1IEBAIHN0YXRpYyBpbnQgbWljcm9u
X3NwaW5hbmRfZGV0ZWN0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAgCWlmIChp
ZFsxXSAhPSBTUElOQU5EX01GUl9NSUNST04pCj4gIAkJcmV0dXJuIDA7Cj4gIAo+IC0JcmV0ID0g
c3BpbmFuZF9tYXRjaF9hbmRfaW5pdChzcGluYW5kLCBtaWNyb25fc3BpbmFuZF90YWJsZSwKPiAt
CQkJCSAgICAgQVJSQVlfU0laRShtaWNyb25fc3BpbmFuZF90YWJsZSksIGlkWzJdKTsKCkkgYW0g
bm90IHN1cmUgdGhpcyBpcyB0aGUgcmlnaHQgc29sdXRpb24uIEkgd291bGQga2VlcCB0aGlzIGNh
bGwgYW5kCm92ZXJ3cml0ZSB3aGF0IHlvdSBuZWVkIHRvIG92ZXJ3cml0ZSB3aXRoIHRoZSBmaXh1
cCBob29rLgoKPiAtCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiArCXNwaW5hbmQtPmZsYWdz
ID0gMDsKPiArCXNwaW5hbmQtPmVjY2luZm8uZ2V0X3N0YXR1cyA9IG1pY3Jvbl9lY2NfZ2V0X3N0
YXR1czsKPiArCXNwaW5hbmQtPmVjY2luZm8ub29ibGF5b3V0ID0gJm1pY3Jvbl9vb2JsYXlvdXRf
b3BzOwo+ICsKPiArCW9wID0gc3BpbmFuZF9zZWxlY3Rfb3BfdmFyaWFudChzcGluYW5kLAo+ICsJ
CQkJICAgICAgICZyZWFkX2NhY2hlX3ZhcmlhbnRzKTsKPiArCWlmICghb3ApCj4gKwkJcmV0dXJu
IC1FTk9UU1VQUDsKPiArCj4gKwlzcGluYW5kLT5vcF90ZW1wbGF0ZXMucmVhZF9jYWNoZSA9IG9w
Owo+ICsKPiArCW9wID0gc3BpbmFuZF9zZWxlY3Rfb3BfdmFyaWFudChzcGluYW5kLAo+ICsJCQkJ
ICAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cyk7Cj4gKwlpZiAoIW9wKQo+ICsJCXJldHVybiAt
RU5PVFNVUFA7Cj4gKwo+ICsJc3BpbmFuZC0+b3BfdGVtcGxhdGVzLndyaXRlX2NhY2hlID0gb3A7
Cj4gKwo+ICsJb3AgPSBzcGluYW5kX3NlbGVjdF9vcF92YXJpYW50KHNwaW5hbmQsCj4gKwkJCQkg
ICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyk7Cj4gKwlzcGluYW5kLT5vcF90ZW1wbGF0ZXMu
dXBkYXRlX2NhY2hlID0gb3A7Cj4gIAo+ICAJcmV0dXJuIDE7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2
b2lkIG1pY3Jvbl9maXh1cF9wYXJhbV9wYWdlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCwKPiArCQkJCSAgICBzdHJ1Y3QgbmFuZF9vbmZpX3BhcmFtcyAqcCkKPiArewo+ICsJLyoKPiAr
CSAqIEFzIHBlciBNaWNyb24gZGF0YXNoZWV0cyB2ZW5kb3JbODNdIGlzIGRlZmluZWQgYXMKPiAr
CSAqIGRpZV9zZWxlY3RfZmVhdHVyZQo+ICsJICovCj4gKwlpZiAocC0+dmVuZG9yWzgzXSAmJiAh
cC0+aW50ZXJsZWF2ZWRfYml0cykKPiArCQlzcGluYW5kLT5iYXNlLm1lbW9yZy5wbGFuZXNfcGVy
X2x1biA9IDEgPDwgcC0+dmVuZG9yWzBdOwo+ICsKPiArCXNwaW5hbmQtPmJhc2UubWVtb3JnLm50
YXJnZXRzID0gcC0+bHVuX2NvdW50Owo+ICsJc3BpbmFuZC0+YmFzZS5tZW1vcmcubHVuc19wZXJf
dGFyZ2V0ID0gMTsKPiArCj4gKwkvKgo+ICsJICogQXMgcGVyIE1pY3JvbiBkYXRhc2hlZXRzLAo+
ICsJICogdmVuZG9yWzgyXSBpcyBFQ0MgbWF4aW11bSBjb3JyZWN0YWJpbGl0eQo+ICsJICovCj4g
KwlzcGluYW5kLT5iYXNlLmVjY3JlcS5zdHJlbmd0aCA9IHAtPnZlbmRvcls4Ml07Cj4gKwlzcGlu
YW5kLT5iYXNlLmVjY3JlcS5zdGVwX3NpemUgPSA1MTI7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFjdHVyZXJfb3BzIG1pY3Jvbl9zcGluYW5kX21hbnVmX29w
cyA9IHsKPiAgCS5kZXRlY3QgPSBtaWNyb25fc3BpbmFuZF9kZXRlY3QsCj4gKwkuZml4dXBfcGFy
YW1fcGFnZSA9IG1pY3Jvbl9maXh1cF9wYXJhbV9wYWdlLAo+ICB9Owo+ICAKPiAgY29uc3Qgc3Ry
dWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyIG1pY3Jvbl9zcGluYW5kX21hbnVmYWN0dXJlciA9IHsK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oIGIvaW5jbHVkZS9saW51
eC9tdGQvc3BpbmFuZC5oCj4gaW5kZXggZmVhODIwYTIwYmM5Li5kZGIyMTk0MjczYTggMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4gKysrIGIvaW5jbHVkZS9saW51
eC9tdGQvc3BpbmFuZC5oCj4gQEAgLTQ2MSw0ICs0NjEsOCBAQCBpbnQgc3BpbmFuZF9tYXRjaF9h
bmRfaW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKmRldiwKPiAgaW50IHNwaW5hbmRfdXBkX2Nm
ZyhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIHU4IG1hc2ssIHU4IHZhbCk7Cj4gIGlu
dCBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCB1
bnNpZ25lZCBpbnQgdGFyZ2V0KTsKPiAgCj4gK2NvbnN0IHN0cnVjdCBzcGlfbWVtX29wICoKPiAr
c3BpbmFuZF9zZWxlY3Rfb3BfdmFyaWFudChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQs
Cj4gKwkJCSAgY29uc3Qgc3RydWN0IHNwaW5hbmRfb3BfdmFyaWFudHMgKnZhcmlhbnRzKTsKPiAr
Cj4gICNlbmRpZiAvKiBfX0xJTlVYX01URF9TUElOQU5EX0ggKi8KCgoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
