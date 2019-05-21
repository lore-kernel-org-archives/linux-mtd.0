Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57862C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3362173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJoXPq8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3362173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Y5S0mpw5VqoE9Y5Ik7DQbsQKCFFEYsqeXfSx8wxhOk=; b=uJoXPq8STCcGLg
	Ob2dSCMVO3/rqX7RX/9j4nNaqHFsUVrsD+9NHyTqggMyF7ECNuEC8ORWqqYlJM7yQdCpvDTwP1bT0
	6cZGh5Bx/TpuJWiN9vg4P7V8Xgx5npMyFsKna4Z0DCvlB5U/O02Kh/rL6A/5pPkIMuxzPmg+CQcwZ
	PYCQKt5OkS0uGpCx/njBFLD1iyIpV8Va1ixloQHavrLnXT4aGghSiS8x6dz+1tVTW7OEX0LnpbI9o
	B2Q6Ucq1lV9hOb7adb3k1r+9xokNdFguvHmHFm8w5lkpWWSCAdRb+5btzirSp/V/qlNp2ObCOCov1
	ysfuK850wPzr9wLVJr+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0Qk-0000Vf-BX; Tue, 21 May 2019 08:47:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0Qh-0000TN-8U
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:47:29 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9DB0EFF816;
 Tue, 21 May 2019 08:47:14 +0000 (UTC)
Date: Tue, 21 May 2019 10:47:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v2] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190521104713.4b3a7769@xps13>
In-Reply-To: <OFDCB9EA90.C6F8EA4C-ON48258401.000981AF-48258401.000ED713@mxic.com.tw>
References: <1558076001-29579-1-git-send-email-masonccyang@mxic.com.tw>
 <20190520143438.46248bfc@xps13>
 <OFDCB9EA90.C6F8EA4C-ON48258401.000981AF-48258401.000ED713@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_014727_615813_1090F910 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgbWFzb25jY3lhbmdAbXhpYy5jb20udHcsCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90
ZSBvbiBUdWUsIDIxIE1heSAyMDE5IDEwOjQyOjA2ICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gIAo+
ID4gPiBBZGQgc3VwcG9ydCBmb3IgTWFjcm9uaXggTkFORCByZWFkIHJldHJ5Lgo+ID4gPiAKPiA+
ID4gTWFjcm9uaXggTkFORHMgc3VwcG9ydCBzcGVjaWZpYyByZWFkIG9wZXJhdGlvbiBmb3IgZGF0
YSByZWNvdmVyeSwKPiA+ID4gd2hpY2ggY2FuIGJlIGVuYWJsZWQvZGlzYWJsZWQgd2l0aCBhIFNF
VC9HRVRfRkVBVFVSRS4KPiA+ID4gRHJpdmVyIGNoZWNrcyBieXRlIDE2NyBvZiBWZW5kb3IgQmxv
Y2tzIGluIE9ORkkgcGFyYW1ldGVyIHBhZ2UgdGFibGUKPiA+ID4gdG8gc2VlIGlmIHRoaXMgaGln
aC1yZWxpYWJpbGl0eSBmdW5jdGlvbiBpcyBzdXBwb3J0ZWQuCj4gPiA+IAo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4KPiA+ID4gLS0tCj4g
PiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMgfCA1NyAgIAo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDU3
IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX21hY3Jvbml4LmMgICAKPiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3Lwo+ID4gbmFu
ZF9tYWNyb25peC5jICAKPiA+ID4gaW5kZXggZTI4N2U3MS4uMWE0ZGM5MiAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+ID4gPiBAQCAtMTcsNiArMTcsNjIg
QEAKPiA+ID4gCj4gPiA+ICAjaW5jbHVkZSAiaW50ZXJuYWxzLmgiCj4gPiA+IAo+ID4gPiArI2Rl
ZmluZSBNQUNST05JWF9SRUFEX1JFVFJZX0JJVCBCSVQoMCkKPiA+ID4gKyNkZWZpbmUgTUFDUk9O
SVhfUkVBRF9SRVRSWV9NT0RFIDYgIAo+ID4gCj4gPiBDYW4geW91IG5hbWUgdGhpcyBkZWZpbmUg
TUFDUk9OSVhfTlVNX1JFQURfUkVUUllfTU9ERVM/ICAKPiAKPiBva2F5LCB3aWxsIGZpeC4KPiAK
PiA+ICAgCj4gPiA+ICsKPiA+ID4gK3N0cnVjdCBuYW5kX29uZmlfdmVuZG9yX21hY3Jvbml4IHsK
PiA+ID4gKyAgIHU4IHJlc2VydmVkWzFdOyAgCj4gPiAKPiA+IERvIHlvdSBuZWVkIHRoaXMgIlsx
XSIgPyAgCj4gCj4gb2theSwganVzdCB1OCByZXNlcnZlZDsKPiAKPiA+ICAgCj4gPiA+ICsgICB1
OCByZWxpYWJpbGl0eV9mdW5jOwo+ID4gPiArfSBfX3BhY2tlZDsKPiA+ID4gKwo+ID4gPiArLyoK
PiA+ID4gKyAqIE1hY3Jvbml4IE5BTkRzIHN1cHBvcnQgdXNpbmcgU0VUL0dFVF9GRUFUVVJFUyB0
byBlbnRlci9leGl0IHJlYWQgICAKPiByZXRyeSBtb2RlCj4gPiA+ICsgKi8KPiA+ID4gK3N0YXRp
YyBpbnQgbWFjcm9uaXhfbmFuZF9zZXR1cF9yZWFkX3JldHJ5KHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsIGludCAgIAo+IG1vZGUpCj4gPiA+ICt7Cj4gPiA+ICsgICB1OCBmZWF0dXJlW09ORklfU1VC
RkVBVFVSRV9QQVJBTV9MRU5dOwo+ID4gPiArICAgaW50IHJldCwgZmVhdHVyZV9hZGRyID0gT05G
SV9GRUFUVVJFX0FERFJfUkVBRF9SRVRSWTsKPiA+ID4gKwo+ID4gPiArICAgaWYgKGNoaXAtPnBh
cmFtZXRlcnMuc3VwcG9ydHNfc2V0X2dldF9mZWF0dXJlcyAmJgo+ID4gPiArICAgICAgIHRlc3Rf
Yml0KGZlYXR1cmVfYWRkciwgY2hpcC0+cGFyYW1ldGVycy5zZXRfZmVhdHVyZV9saXN0KSAmJgo+
ID4gPiArICAgICAgIHRlc3RfYml0KGZlYXR1cmVfYWRkciwgY2hpcC0+cGFyYW1ldGVycy5nZXRf
ZmVhdHVyZV9saXN0KSkgewo+ID4gPiArICAgICAgZmVhdHVyZVswXSA9IG1vZGU7Cj4gPiA+ICsg
ICAgICByZXQgPSAgbmFuZF9zZXRfZmVhdHVyZXMoY2hpcCwgZmVhdHVyZV9hZGRyLCBmZWF0dXJl
KTsKPiA+ID4gKyAgICAgIGlmIChyZXQpCj4gPiA+ICsgICAgICAgICBwcl9lcnIoIkZhaWxlZCB0
byBzZXQgcmVhZCByZXRyeSBtb2RlZDolZFxuIiwgbW9kZSk7ICAKPiA+IAo+ID4gRG8geW91IGhh
dmUgdG8gY2FsbCBuYW5kX2dldF9mZWF0dXJlcygpIG9uIGVycm9yPyAgCj4gCj4gb2theQo+IAo+
ID4gICAKPiA+ID4gKwo+ID4gPiArICAgICAgcmV0ID0gIG5hbmRfZ2V0X2ZlYXR1cmVzKGNoaXAs
IGZlYXR1cmVfYWRkciwgZmVhdHVyZSk7Cj4gPiA+ICsgICAgICBpZiAocmV0IHx8IGZlYXR1cmVb
MF0gIT0gbW9kZSkKPiA+ID4gKyAgICAgICAgIHByX2VycigiRmFpbGVkIHRvIHZlcmlmeSByZWFk
IHJldHJ5IG1vZGVkOiVkKCVkKVxuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICBtb2RlLCBmZWF0
dXJlWzBdKTsgIAo+ID4gCj4gPiBpZiByZXQgPT0gMCBidXQgZmVhdHVyZVswXSAhPSBtb2RlLCBz
aG91bGRuJ3QgeW91IHJldHVybiBhbiBlcnJvcj8gIAo+IAo+IG9rYXksIHdpbGwgZml4Lgo+IAo+
ID4gICAKPiA+ID4gKyAgIH0KPiA+ID4gKwo+ID4gPiArICAgcmV0dXJuIHJldDsgIAo+ID4gCj4g
PiBUaGlzIHdpbGwgcHJvZHVjZSBhIFdhcm5pbmcgYXQgY29tcGlsZSB0aW1lIChyZXQgbWF5IGJl
IHVzZWQKPiA+IHVuaW5pdGlhbGl6ZWQpLiBIYXZlIHlvdSB0ZXN0ZWQgaXQ/ICAKPiAKPiBUb29s
IGNoYWluIEkgdXNlZCBpcyAiZ2NjLWFybS1saW51eC1nbnVlYWJpIiBhbmQgbm8gV2FybmluZyBh
dCBjb21waWxlIAo+IHRpbWUuCgpXaGF0J3MgdGhlIG91dHB1dCBvZjoKZ2NjLWFybS1saW51eC1n
bnVlYWJpIC12Cj8KCj4gCj4gUGF0Y2ggaXQgdG86Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+ICAK
PiAgc3RhdGljIGludCBtYWNyb25peF9uYW5kX3NldHVwX3JlYWRfcmV0cnkoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCwgaW50IAo+IG1vZGUpCj4gIHsKPiAgICAgICAgICB1OCBmZWF0dXJlW09ORklf
U1VCRkVBVFVSRV9QQVJBTV9MRU5dOwo+ICAgICAgICAgIGludCByZXQsIGZlYXR1cmVfYWRkciA9
IE9ORklfRkVBVFVSRV9BRERSX1JFQURfUkVUUlk7Cj4gCj4gICAgICAgICAgaWYgKGNoaXAtPnBh
cmFtZXRlcnMuc3VwcG9ydHNfc2V0X2dldF9mZWF0dXJlcyAmJgo+ICAgICAgICAgICAgICB0ZXN0
X2JpdChmZWF0dXJlX2FkZHIsIGNoaXAtPnBhcmFtZXRlcnMuc2V0X2ZlYXR1cmVfbGlzdCkgJiYK
PiAgICAgICAgICAgICAgdGVzdF9iaXQoZmVhdHVyZV9hZGRyLCBjaGlwLT5wYXJhbWV0ZXJzLmdl
dF9mZWF0dXJlX2xpc3QpKSB7Cj4gCj4gICAgICAgICAgICAgICAgICBmZWF0dXJlWzBdID0gbW9k
ZTsKPiAgICAgICAgICAgICAgICAgIHJldCA9ICBuYW5kX3NldF9mZWF0dXJlcyhjaGlwLCBmZWF0
dXJlX2FkZHIsIGZlYXR1cmUpOwoKICAgICAgICAgICAgICAgICAgICAgICAgIF4gZXh0cmEgc3Bh
Y2UsIHBsZWFzZSBiZSBjYXJlZnVsIHdpdGggdGhlCiAgICAgICAgICAgICAgICAgICAgICAgICB0
eXBvcywgYW5kIHJ1biBjaGVja3BhdGNoLnBsIC0tc3RyaWN0IGJlZm9yZQogICAgICAgICAgICAg
ICAgICAgICAgICAgc2VuZGluZyBwYXRjaGVzLgoKPiAgICAgICAgICAgICAgICAgIGlmIChyZXQp
IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJGYWlsZWQgdG8gc2V0IHJlYWQg
cmV0cnkgbW9kZWQ6JWRcbiIsIAo+IG1vZGUpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIGVycl9vdXQ7Cj4gICAgICAgICAgICAgICAgICB9Cj4gCj4gICAgICAgICAgICAgICAgICBy
ZXQgPSAgbmFuZF9nZXRfZmVhdHVyZXMoY2hpcCwgZmVhdHVyZV9hZGRyLCBmZWF0dXJlKTsKPiAg
ICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcHJf
ZXJyKCJGYWlsZWQgdG8gZ2V0IHJlYWQgcmV0cnkgbW9kZWQ6JWRcbiIsIAo+IG1vZGUpOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9vdXQ7Cj4gICAgICAgICAgICAgICAgICB9
IGVsc2UgaWYgKGZlYXR1cmVbMF0gIT0gbW9kZSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBwcl9lcnIoIkZhaWxlZCB0byB2ZXJpZnkgcmVhZCByZXRyeSAKPiBtb2RlZDolZCglZClcbiIs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kZSwgZmVhdHVyZVswXSk7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlPOwoKVGhhdCdzIG5vdCB3aGF0IEkg
bWVhbnQuIFlvdSBjYW4ga2VlcCB0aGUgZm9ybWVyIGNvbmRpdGlvbiBidXQgaWYgIXJldAp0aGVu
IHJldCA9IC1FSU8gZm9yIGluc3RhbmNlLgoKPiAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAg
ICB9Cj4gCj4gIGVycl9vdXQ6Cj4gICAgICAgICAgcmV0dXJuIHJldDsKCkFnYWluLCBkbyBub3Qg
anVtcCB0byBhIHNpbmdsZSByZXR1cm4gY2FsbCwgZGlyZWN0bHkgZG8gdGhlIHJldHVybiBmcm9t
CnRoZSBwb2ludCB3aGVyZSB5b3Ugd2FudCB0byBxdWl0IHRoZSBmdW5jdGlvbi4KClRoZSBwcm9i
bGVtIHNob3VsZCBiZSB0aGF0IHJldCBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkLCB0aGUgY29t
cGlsZXIKc2hvdWxkIHRlbGwgeW91IHRoYXQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
