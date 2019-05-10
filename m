Return-Path: <SRS0=FkjY=TK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2ACC04A6B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 09:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B37F2175B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 09:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s22Q/04I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B37F2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTnkT+zCRgkgg5Cb9FIK+fVf27MWRasmjIKY0GxwZQs=; b=s22Q/04IcragOv
	IZnmsjFkhS0nfv9vla3UcQbe+ZW5jPM3SnXQWmqtNh0Da92kfDF71FFgt7Qv4sEyB1yrztJDLn2Op
	fx0wXjBL12LkQmUqwGksgqHiAxbwdAOqX7mj7jDQgTv/urcEK0NGTNqWybk60GQj6QZ4GkNy74GfS
	VulpDkaRyWGJSSaeF8MiHXFN9IHktCFUbB5LwH7e953G6c/4iMFWHSoNuBhMUBmVGi9FtbIxuDYPF
	l0/GMRo/PJeqcdnpcKYyAkB8KCkG2t0bCjefPQ6Yl/6W63iWyiFjG+70X7siOOZOWaU12q4fv8/H+
	7+rqok6PVA3UX0m+AOMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP1aL-0004q8-FZ; Fri, 10 May 2019 09:12:57 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP1aH-0004pT-Ec
 for linux-mtd@lists.infradead.org; Fri, 10 May 2019 09:12:55 +0000
X-Originating-IP: 90.88.28.253
Received: from xps13 (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr
 [90.88.28.253]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BCECA6000B;
 Fri, 10 May 2019 09:12:37 +0000 (UTC)
Date: Fri, 10 May 2019 11:12:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190510111121.54f42e70@xps13>
In-Reply-To: <OF5E2BF75D.98A43E33-ON482583F6.002E7A65-482583F6.0030A2DE@mxic.com.tw>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
 <20190510094528.6008e8da@xps13>
 <OF5E2BF75D.98A43E33-ON482583F6.002E7A65-482583F6.0030A2DE@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_021253_791605_750FF2D7 
X-CRM114-Status: GOOD (  23.34  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBGcmksIDEwIE1heSAy
MDE5IDE2OjUxOjIwICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gCj4gPiA+IEFkZCBhIGRyaXZl
ciBmb3IgTWFjcm9uaXggTkFORCByZWFkIHJldHJ5LiAgCj4gPiAKPiA+ICJBZGQgc3VwcG9ydCBm
b3IgTWFjcm9uaXggTkFORCByZWFkIHJldHJ5LiI/IFRoaXMgaXMgbm90IGEgIm5ldyBkcml2ZXIi
Lgo+ID4gICAKPiA+ID4gCj4gPiA+IE1hY3Jvbml4IE5BTkQgc3VwcG9ydHMgc3BlY2ZpY2FsIHJl
YWQgZm9yIGRhdGEgcmVjb3ZlcnkgYW5kIGVuYWJsZWQgIAo+ID4gCj4gPiAKPiA+IE1hY3Jvbml4
IE5BTkRzIHN1cHBvcnQgc3BlY2lmaWMgcmVhZCBvcGVyYXRpb24gZm9yIGRhdGEgcmVjb3Zlcnks
Cj4gPiB3aGljaCBjYW4gYmUgZW5hYmxlZCB3aXRoIGEgU0VUX0ZFQVRVUkUuCj4gPiAgIAo+ID4g
PiBEcml2ZXIgY2hlY2sgYnl0ZSAxNjcgb2YgVmVuZG9yIEJsb2NrcyBpbiBPTkZJIHBhcmFtZXRl
ciBwYWdlIHRhYmxlICAKPiA+IAo+ID4gICAgICAgICAgY2hlY2tzCj4gPiAgIAo+ID4gPiB0byBz
ZWUgaWYgdGhpcyBoaWdoIHJlbGlhYmlsaXR5IGZ1bmN0aW9uIGlzIHN1cHBvcnQgb3Igbm90LiAg
Cj4gPiAKPiA+ICAgICAgICAgICAgICAgICAgaGlnaC1yZWxpYWJpbGl0eSBmdW5jdGlvbj8gbm90
IHN1cmUgaXQgaXMgRW5nbGlzaAo+ID4gICAgICAgICAgICAgICAgICBhbnl3YXkuCj4gPiAKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdXBwb3J0ZWQK
PiA+ICAgCj4gCj4gb2theSwgdGhhbmtzIGZvciB5b3VyIHJldmlldywgd2lsbCBwYXRjaCBpdCB0
bzoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBZGQgc3VwcG9ydCBmb3IgTWFjcm9uaXggTkFORCByZWFk
IHJldHJ5Lgo+IAo+IE1hY3Jvbml4IE5BTkRzIHN1cHBvcnQgc3BlY2lmaWMgcmVhZCBvcGVyYXRp
b24gZm9yIGRhdGEgcmVjb3ZlcnksCj4gd2hpY2ggY2FuIGJlIGVuYWJsZWQgd2l0aCBhIFNFVF9G
RUFUVVJFLgo+IERyaXZlciBjaGVja3MgYnl0ZSAxNjcgb2YgVmVuZG9yIEJsb2NrcyBpbiBPTkZJ
IHBhcmFtZXRlciBwYWdlIHRhYmxlCj4gdG8gc2VlIGlmIHRoaXMgaGlnaC1yZWxpYWJpbGl0eSBm
dW5jdGlvbiBpcyBzdXBwb3J0ZWQuCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKRmluZSBieSBtZS4KClsu
Li5dCgo+ID4gPiArICAgaW50IHJldDsKPiA+ID4gKwo+ID4gPiArICAgaWYgKG1vZGUgPiBNQUNS
T05JWF9SRUFEX1JFVFJZX01PREUpCj4gPiA+ICsgICAgICBtb2RlID0gTUFDUk9OSVhfUkVBRF9S
RVRSWV9NT0RFOwo+ID4gPiArCj4gPiA+ICsgICBmZWF0dXJlWzBdID0gbW9kZTsKPiA+ID4gKyAg
IHJldCA9ICBuYW5kX3NldF9mZWF0dXJlcyhjaGlwLCBPTkZJX0ZFQVRVUkVfQUREUl9SRUFEX1JF
VFJZLCAgIAo+IGZlYXR1cmUpOwo+ID4gCj4gPiBEb24ndCB5b3UgbWlzcyB0byBzZWxlY3QvZGVz
ZWxlY3QgdGhlIHRhcmdldD8gIAo+IAo+IG5hbmRfc2VsZWN0X3RhcmdldCgpIGFuZCBuYW5kX2Rl
c2VsZWN0X3RhcmdldCgpIGFyZSBhbHJlYWR5IGluIAo+IG5hbmRfZG9fcmVhZF9vcHMoKS4KClJp
Z2h0Cgo+IAo+ID4gICAKPiA+ID4gKyAgIGlmIChyZXQpCj4gPiA+ICsgICAgICBwcl9lcnIoInNl
dCBmZWF0dXJlIGZhaWxlZCB0byByZWFkIHJldHJ5IG1vZGVkOiVkXG4iLCBtb2RlKTsgIAo+ID4g
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gc2V0IHJlYWQgcmV0cnkgbW9k
ZTogJWRcbiIKPiA+IAo+ID4gSSB0aGluayB5b3UgY2FuIGFib3J0IHRoZSBvcGVyYXRpb24gd2l0
aCBhIG5lZ2F0aXZlIHJldHVybiBjb2RlIGluIHRoaXMKPiA+IGNhc2UuCj4gPiAgIAo+IAo+IEFm
dGVyIHNldCBmZWF0dXJlIG9wZXJhdGlvbiwgdGhpcyBOQU5EIGRldmljZSBuZWVkIGEgZ2V0IGZl
YXR1cmUgY29tbWFuZCAKCllvdSBuZWVkIHRvIGFkZCBhIGNvbW1lbnQgZm9yIHRoaXMuCgo+IG9y
Cj4gU1cgcmVzZXQgY29tbWFuZCB0byBleGl0IHJlYWQgcmV0cnkgbW9kZS4KPiBUaGVyZWZvcmUs
IHNldCBmZWF0dXJlcyBjb21tYW5kIGZvbGxvd2VkIGJ5IGdldCBmZWF0dXJlIGNvbW1hbmQgaXMg
bmVlZGVkLgoKSW4gdGhpcyBjYXNlIHlvdSBtdXN0IGNoZWNrIGZpcnN0IHRoYXQgYm90aCBzZXQg
YW5kIGdldCBhcmUgc3VwcG9ydGVkLgoKPiAKPiA+ID4gKwo+ID4gPiArICAgcmV0ID0gIG5hbmRf
Z2V0X2ZlYXR1cmVzKGNoaXAsIE9ORklfRkVBVFVSRV9BRERSX1JFQURfUkVUUlksICAgCj4gZmVh
dHVyZSk7Cj4gPiAKPiA+IElmIHRoZSBvcGVyYXRpb24gc3VjY2VlZGVkIGJ1dCB0aGUgY29udHJv
bGxlciBjYW5ub3QgZ2V0IHRoZSBmZWF0dXJlCj4gPiB5b3UgZG9uJ3Qgd2FudCB0byBhYm9ydCB0
aGUgb3BlcmF0aW9uLiBZb3Ugc2hvdWxkIGNoZWNrIGlmIGdldF9mZWF0dXJlcwo+ID4gaXMgc3Vw
cG9ydGVkLCBpZiB5ZXMgeW91IGNhbiByZWx5IG9uIHRoZSBiZWxvdyB0ZXN0Lgo+ID4gICAKPiAK
PiBJIHRob3VnaHQgaXQgaGFzIGJlZW4gY2hlY2sgaW4gbWFjcm9uaXhfbmFuZF9vbmZpX2luaXQo
KSBhbmQgc2V0IGJ5Cj4gc2V0X2JpdChPTkZJX0ZFQVRVUkVfQUREUl9SRUFEX1JFVFJZLCBwLT5n
ZXRfZmVhdHVyZV9saXN0KTsKCllvdSBvbmx5IGNoZWNrZWQgdGhhdCB0aGUgb3BlcmF0aW9uIGNh
biBiZSBkb25lLCB5b3UgY2Fubm90IGtub3cgaW4KYWR2YW5jZSBpZiBpdCB3aWxsIGFjdHVhbGx5
IHN1Y2NlZWQuCgo+IAo+IHJpZ2h0ID8KPiAKPiA+ID4gKyAgIGlmIChyZXQgfHwgZmVhdHVyZVsw
XSAhPSBtb2RlKQo+ID4gPiArICAgICAgcHJfZXJyKCJnZXQgZmVhdHVyZSBmYWlsZWQgdG8gcmVh
ZCByZXRyeSBtb2RlZDolZCglZClcbiIsCj4gPiA+ICsgICAgICAgICAgICAgbW9kZSwgZmVhdHVy
ZVswXSk7ICAKPiA+IAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIHZlcmlm
eSByZWFkIHJldHJ5IG1vZGUuLi4iCj4gPiAKPiA+ICAgICAgICAgICAgICAgICBBbHNvIHJldHVy
biBzb21ldGhpbmcgbmVnYXRpdmUgaGVyZS4KPiA+ICAgCj4gPiA+ICsKPiA+ID4gKyAgIHJldHVy
biByZXQ7ICAKPiA+IAo+ID4gQW5kIGlmIGFsbCB3ZW50IHJpZ2h0LCByZXR1cm4gMCBhdCB0aGUg
ZW5kLgo+ID4gICAKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIHZvaWQgbWFjcm9uaXhf
bmFuZF9vbmZpX2luaXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ID4gK3sKPiA+ID4gKyAg
IHN0cnVjdCBuYW5kX3BhcmFtZXRlcnMgKnAgPSAmY2hpcC0+cGFyYW1ldGVyczsKPiA+ID4gKwo+
ID4gPiArICAgaWYgKHAtPm9uZmkpIHsKPiA+ID4gKyAgICAgIHN0cnVjdCBuYW5kX29uZmlfdmVu
ZG9yX21hY3Jvbml4ICpteGljID0KPiA+ID4gKyAgICAgICAgICAgICh2b2lkICopcC0+b25maS0+
dmVuZG9yOyAgCj4gPiAKPiA+IFBsZWFzZSBwdXQgZXZlcnl0aGluZyBvbiB0aGUgc2FtZSBsaW5l
ICAKPiAKPiBJdCB3aWxsIG92ZXIgODAgY2hhci4KCkkga25vdywgdGhhdCdzIGZpbmUgaGVyZS4K
Cj4gCj4gPiAgIAo+ID4gPiArCj4gPiA+ICsgICAgICBpZiAobXhpYy0+cmVsaWFiaWxpdHlfZnVu
YyAmIE1BQ1JPTklYX1JFQURfUkVUUllfQklUKSB7Cj4gPiA+ICsgICAgICAgICBjaGlwLT5yZWFk
X3JldHJpZXMgPSBNQUNST05JWF9SRUFEX1JFVFJZX01PREUgKyAxOyAgCj4gPiAKPiA+IFdoeSAr
MSBoZXJlLCBJIGFtIG1pc3Npbmcgc29tZXRoaW5nPyAgCj4gCj4gIAo+IFdpdGhvdXQgKyAxLCBy
ZWFkIHJldHJ5IG1vZGUgaXMgdXAgdG8gNCByYXRoZXIgdGhhbiA1Lgo+IEJ1dCB0aGlzIE5BTkQg
ZGV2aWNlIHN1cHBvcnQgcmVhZCByZXRyeSBtb2RlIHVwIHRvIDUuCj4gCgpJZiB0aGVyZSBhcmUg
NSBtb2RlcywgeW91IG5lZWQgdG8gc2V0IDUgdG8gY2hpcC0+cmVhZF9yZXRyaWVzLCBub3QgNi4K
CklmIG9ubHkgNCBtb2RlcyBhcmUgdXNlZCwgdGhlcmUgaXMgcHJvYmFibHkgYSBidWcgaW4gdGhl
IGNvcmUgdGhhdAptdXN0IGJlIGZpeGVkLCBwbGVhc2UgZG8gbm90IHdvcmthcm91bmQgaXQgaW4g
dGhlIGRyaXZlciEKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
