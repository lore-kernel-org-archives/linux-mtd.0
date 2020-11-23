Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFBBC56202
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:39:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3B920729
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0fQD0g3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3B920729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c03M+A0eX9XxMz33Mchg/E0OZF/nsZCRreZ57zk/D54=; b=r0fQD0g3aN2gsB2dcs1/4/jrF
	/DnaXPW9ZNqGvKGXgqSGjwQCx9oASrt6z7/9eYphbYqJ8GRcRaCSVLdXrHEvgBCH07Cy+XnHBH3ym
	COXqAiJxINpkIMUVDo25qNZVdKryZHI06NQchBYx8Kv7qYa3MRzaog8TzEPgiNu48OR4uTQzybqE9
	l2W/Fx64qixS/O0Xy4OQfouZOQNAnA95nL4mywXE/LCF4EFMn4VS8cSmolNQZK4XNiG27xwe7319t
	62NNh8hyj7NupaXRcSO7fB5HVqpLFl1hyYKemYoehVKTRC+HWQReTLivWcTi8IPAPTKDygeRTdy4O
	Ktdx2x9JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh7Mf-0008V3-0H; Mon, 23 Nov 2020 08:38:25 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh7Mc-0008UQ-L2
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 08:38:23 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E26E4200016;
 Mon, 23 Nov 2020 08:38:15 +0000 (UTC)
Date: Mon, 23 Nov 2020 09:38:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] mtd: parser: cmdline: Fix parsing of part-names with
 colons
Message-ID: <20201123093814.1c24dd25@xps13>
In-Reply-To: <20201122001533.985641-1-sven@narfation.org>
References: <20201122001533.985641-1-sven@narfation.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_033822_822333_37425C72 
X-CRM114-Status: GOOD (  19.76  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, rminnich@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU3ZlbiwKClN2ZW4gRWNrZWxtYW5uIDxzdmVuQG5hcmZhdGlvbi5vcmc+IHdyb3RlIG9uIFN1
biwgMjIgTm92IDIwMjAgMDE6MTU6MzMKKzAxMDA6Cgo+IFNvbWUgZGV2aWNlcyAoZXNwZWNpYWxs
eSBRQ0Egb25lcykgYXJlIGFscmVhZHkgdXNpbmcgaGFyZGNvZGVkIHBhcnRpdGlvbgo+IG5hbWVz
IHdpdGggY29sb25zIGluIGl0LiBUaGUgT3Blbk1lc2ggQTYyIGZvciBleGFtcGxlIHByb3ZpZGVz
IGZvbGxvd2luZwo+IG10ZCByZWxldmFudCBpbmZvcm1hdGlvbiB2aWEgY21kbGluZToKPiAKPiAg
IHJvb3Q9MzE6MTEgbXRkcGFydHM9c3BpMC4wOjI1NmsoMDpTQkwxKSwxMjhrKDA6TUlCSUIpLDM4
NGsoMDpRU0VFKSw2NGsoMDpDRFQpLDY0aygwOkREUlBBUkFNUyksNjRrKDA6QVBQU0JMRU5WKSw1
MTJrKDA6QVBQU0JMKSw2NGsoMDpBUlQpLDY0ayhjdXN0b20pLDY0aygwOktFWVMpLDB4MDAyYjAw
MDAoa2VybmVsKSwweDAwYzgwMDAwKHJvb3RmcyksMTU1NTJrKGluYWN0aXZlKSByb290ZnNuYW1l
PXJvb3RmcyByb290d2FpdAo+IAo+IFRoZSBjaGFuZ2UgdG8gc3BsaXQgb25seSBvbiB0aGUgbGFz
dCBjb2xvbiBiZXR3ZWVuIG10ZC1pZCBhbmQgcGFydGl0aW9ucwo+IHdpbGwgY2F1c2UgbmV3cGFy
dCB0byBzZWUgZm9sbG93aW5nIHN0cmluZyBmb3IgdGhlIGZpcnN0IHBhcnRpdGlvbjoKPiAKPiAg
IEtFWVMpLDB4MDAyYjAwMDAoa2VybmVsKSwweDAwYzgwMDAwKHJvb3RmcyksMTU1NTJrKGluYWN0
aXZlKQo+IAo+IFN1Y2ggYSBwYXJ0aXRpb24gbGlzdCBjYW5ub3QgYmUgcGFyc2VkIGFuZCB0aHVz
IHRoZSBkZXZpY2UgZmFpbHMgdG8gYm9vdC4KPiAKPiBBdm9pZCB0aGlzIGJlaGF2aW9yIGJ5IG1h
a2luZyBzdXJlIHRoYXQgdGhlIHN0YXJ0IG9mIHRoZSBmaXJzdCBwYXJ0LW5hbWUKPiAoIigiKSB3
aWxsIGFsc28gYmUgdGhlIGxhc3QgYnl0ZSB0aGUgbXRkLWlkIHNwbGl0IGFsZ29yaXRobSBpcyB1
c2luZyBmb3IKPiBpdHMgY29sb24gc2VhcmNoLgoKTmljZS4KClJvbiwgY2FuIHlvdSBnaXZlIHRo
aXMgcGF0Y2ggYSBzaG90IGFuZCBhbnN3ZXIgd2l0aCB5b3VyIFRlc3RlZC1ieTogdG8KdGhpcyB0
aHJlYWQgaWYgaXQgc3RpbGwgd29ya3MgZm9yIHlvdT8gCgo+IEZpeGVzOiBlYjEzZmEwMjI3NDEg
KCJtdGQ6IHBhcnNlcjogY21kbGluZTogU3VwcG9ydCBNVEQgbmFtZXMgY29udGFpbmluZyBvbmUg
b3IgbW9yZSBjb2xvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IFN2ZW4gRWNrZWxtYW5uIDxzdmVuQG5h
cmZhdGlvbi5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3BhcnNlcnMvY21kbGluZXBhcnQuYyB8
IDEzICsrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9jbWRsaW5l
cGFydC5jIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9jbWRsaW5lcGFydC5jCj4gaW5kZXggYTc5ZTRk
ODY2YjA4Li42NTVjNmQ1OWJkMDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9j
bWRsaW5lcGFydC5jCj4gKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9jbWRsaW5lcGFydC5jCj4g
QEAgLTIyNiw3ICsyMjYsNyBAQCBzdGF0aWMgaW50IG10ZHBhcnRfc2V0dXBfcmVhbChjaGFyICpz
KQo+ICAJCXN0cnVjdCBjbWRsaW5lX210ZF9wYXJ0aXRpb24gKnRoaXNfbXRkOwo+ICAJCXN0cnVj
dCBtdGRfcGFydGl0aW9uICpwYXJ0czsKPiAgCQlpbnQgbXRkX2lkX2xlbiwgbnVtX3BhcnRzOwo+
IC0JCWNoYXIgKnAsICptdGRfaWQsICpzZW1pY29sOwo+ICsJCWNoYXIgKnAsICptdGRfaWQsICpz
ZW1pY29sLCAqb3Blbl9wYXJlbnRoOwo+ICAKPiAgCQkvKgo+ICAJCSAqIFJlcGxhY2UgdGhlIGZp
cnN0ICc7JyBieSBhIE5VTEwgY2hhciBzbyBzdHJyY2hyIGNhbiB3b3JrCj4gQEAgLTIzNiw2ICsy
MzYsMTMgQEAgc3RhdGljIGludCBtdGRwYXJ0X3NldHVwX3JlYWwoY2hhciAqcykKPiAgCQlpZiAo
c2VtaWNvbCkKPiAgCQkJKnNlbWljb2wgPSAnXDAnOwo+ICAKPiArCQkvKiBtYWtlIHN1cmUgdGhh
dCBwYXJ0LW5hbWVzIHdpdGggIjoiIHdpbGwgbm90IGJlIGhhbmRsZWQgYXMKPiArCQkgKiBwYXJ0
IG9mIHRoZSBtdGQtaWQgd2l0aCBhbiAiOiIKCldlIHByZWZlciB0aGlzIHN0eWxlIG9mIG11bHRp
bGluZSBjb21tZW50IGluIE1URDoKCgkvKgoJICogU29tZXRoaW5nLgoJICogU29tZXRoaW5nIGVs
c2UuCgkgKi8KCj4gKwkJICovCj4gKwkJb3Blbl9wYXJlbnRoID0gc3RyY2hyKHMsICcoJyk7Cj4g
KwkJaWYgKG9wZW5fcGFyZW50aCkKPiArCQkJKm9wZW5fcGFyZW50aCA9ICdcMCc7Cj4gKwo+ICAJ
CW10ZF9pZCA9IHM7Cj4gIAo+ICAJCS8qCj4gQEAgLTI0NSw2ICsyNTIsMTAgQEAgc3RhdGljIGlu
dCBtdGRwYXJ0X3NldHVwX3JlYWwoY2hhciAqcykKPiAgCQkgKi8KPiAgCQlwID0gc3RycmNocihz
LCAnOicpOwo+ICAKPiArCQkvKiBSZXN0b3JlIHRoZSAnKCcgbm93LiAqLwo+ICsJCWlmIChvcGVu
X3BhcmVudGgpCj4gKwkJCSpvcGVuX3BhcmVudGggPSAnKCc7Cj4gKwo+ICAJCS8qIFJlc3RvcmUg
dGhlICc7JyBub3cuICovCj4gIAkJaWYgKHNlbWljb2wpCj4gIAkJCSpzZW1pY29sID0gJzsnOwoK
T3RoZXJ3aXNlIExHVE0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
