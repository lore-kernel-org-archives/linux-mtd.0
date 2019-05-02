Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D66C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 12:00:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19A52085A
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 12:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h9SXB+lZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19A52085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fB1v+IT9q1HtU4kYZEbZ3vEelXCj0JyS0oG69XWUNXw=; b=h9SXB+lZToxlL2
	1eZyBL/KEU6tlpd+XgV3Qt2w+CqQT+zL78GLu2XGHw7PwrquJ2EH17K4g1ba4hzjz7W85U71Uy/zb
	CduhQ7B2RCFdyAB+dV2TaAvOfseKEQ6mgNDuL76Mj7djfy2IgtPALA8efLoPa3II3AQJZsc3iu9DA
	6pDNvdGMrbIohr+TJm3lr8iDN1Xo3ETtQB61OxTzyGLIyt6QQAenIzOMgqoeZrZQjW7uxkqgUIX68
	6hZ41DudU+SBsciV17fOMgN1YwYl6dH6alf0T3zr4TlUq7yYC6dRUuiA8NubpKvAOle06dfdUBTHn
	1soydMg55AzkmdU2CiaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMANd-0005fU-Bn; Thu, 02 May 2019 12:00:01 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMANa-0005f6-Dq
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 12:00:00 +0000
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AA0E860003;
 Thu,  2 May 2019 11:59:46 +0000 (UTC)
Date: Thu, 2 May 2019 13:59:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH 3/4] mtd: spinand: Enabled support to detect
 parameter page
Message-ID: <20190502135945.61bd6ceb@xps13>
In-Reply-To: <MN2PR08MB5951A622B36705BC26CE36E2B8340@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB5951E8D99AA1FBD972131388B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
 <20190430095508.706fa125@xps13>
 <MN2PR08MB5951A622B36705BC26CE36E2B8340@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_045958_617216_59AE3715 
X-CRM114-Status: GOOD (  20.60  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNzaGl2YW11
cnRoeUBtaWNyb24uY29tPiB3cm90ZSBvbgpUaHUsIDIgTWF5IDIwMTkgMTE6Mzc6MTAgKzAwMDA6
Cgo+IEhpIE1pcXVlbCwKPiAKPiA+IAo+ID4gSGkgU2hpdmFtdXJ0aHksCj4gPiAKPiA+ICJTaGl2
YW11cnRoeSBTaGFzdHJpIChzc2hpdmFtdXJ0aHkpIiA8c3NoaXZhbXVydGh5QG1pY3Jvbi5jb20+
IHdyb3RlCj4gPiBvbgo+ID4gVHVlLCAyNiBNYXIgMjAxOSAxMDo1MjowMCArMDAwMDoKPiA+ICAg
Cj4gPiA+IFNvbWUgb2YgdGhlIFNQSSBOQU5EIGRldmljZXMgaGFzIHBhcmFtZXRlciBwYWdlIHdo
aWNoIGlzIHNpbWlsYXIgdG8gT05GSQo+ID4gPiB0YWJsZS4KPiA+ID4KPiA+ID4gQnV0LCBpdCBt
YXkgbm90IGJlIHNlbGYgc3VmZmljaWVudCB0byBwcm9wYWdhdGUgYWxsIHRoZSByZXF1aXJlZAo+
ID4gPiBwYXJhbWV0ZXJzLiBGaXh1cCBmdW5jdGlvbiBoYXMgYmVlbiBhZGRlZCBpbiBzdHJ1Y3Qg
bWFudWZhY3R1cmVyIHRvCj4gPiA+IGFjY29tbW9kYXRlIHRoaXMuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFNoaXZhbXVydGh5IFNoYXN0cmkgPHNzaGl2YW11cnRoeUBtaWNyb24uY29tPgo+
ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDExMyAgCj4gPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0gIAo+ID4gPiAgaW5jbHVkZS9saW51
eC9tdGQvc3BpbmFuZC5oIHwgICA1ICsrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ID4g
aW5kZXggOTg1YWQ1MmNkYWE3Li40MDg4MmExZDJiYzEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9j
b3JlLmMKPiA+ID4gQEAgLTU3NCw2ICs1NzQsMTA4IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9sb2Nr
X2Jsb2NrKHN0cnVjdCAgCj4gPiBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdTggbG9jaykgIAo+
ID4gPiAgCXJldHVybiBzcGluYW5kX3dyaXRlX3JlZ19vcChzcGluYW5kLCBSRUdfQkxPQ0tfTE9D
SywgbG9jayk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICsvKioKPiA+ID4gKyAqIHNwaW5hbmRfcmVh
ZF9wYXJhbV9wYWdlX29wIC0gUmVhZCBwYXJhbWV0ZXIgcGFnZSBvcGVyYXRpb24KPiA+ID4gKyAq
IEBzcGluYW5kOiB0aGUgc3BpbmFuZCBkZXZpY2UKPiA+ID4gKyAqIEBwYWdlOiBwYWdlIG51bWJl
ciB3aGVyZSBwYXJhbWV0ZXIgcGFnZSB0YWJsZXMgY2FuIGJlIGZvdW5kCj4gPiA+ICsgKiBAcGFy
YW1ldGVyczogYnVmZmVyIHVzZWQgdG8gc3RvcmUgdGhlIHBhcmFtZXRlciBwYWdlICAKPiA+IAo+
ID4gRG9lcyBub3QgbWF0Y2ggdGhlIHByb3RvdHlwZSAgCj4gCj4gSSB3aWxsIGZpeCB0aGlzIGlu
IG5leHQgdmVyc2lvbi4KPiAKPiA+ICAgCj4gPiA+ICsgKiBAbGVuOiBsZW5ndGggb2YgdGhlIGJ1
ZmZlcgo+ID4gPiArICoKPiA+ID4gKyAqIFJlYWQgcGFyYW1ldGVyIHBhZ2UKPiA+ID4gKyAqCj4g
PiA+ICsgKiBSZXR1cm5zIDAgb24gc3VjY2VzcywgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG90aGVy
d2lzZS4KPiA+ID4gKyAqLwo+ID4gPiArc3RhdGljIGludCBzcGluYW5kX3BhcmFtZXRlcl9wYWdl
X3JlYWQoc3RydWN0IG5hbmRfZGV2aWNlICpiYXNlLCAgCj4gPiAKPiA+IFBsZWFzZSB1c2UgYSBz
cGluYW5kIHN0cnVjdHVyZSBhcyBwYXJhbWV0ZXIsIHlvdSBkb24ndCBuZWVkIGEKPiA+IG5hbmRf
ZGV2aWNlIGhlcmUgKHNhbWUgZm9yIG90aGVyIHNwaW5hbmQgZnVuY3Rpb25zKS4gIAo+IAo+IFRo
aXMgZnVuY3Rpb24gaXMgaGVscGVyIGZ1bmN0aW9uIGZvciBnZW5lcmljIE9ORkkgbGF5ZXIuCj4g
RnJvbSBnZW5lcmljIE9ORkkgbGF5ZXIsIEkgY2FuIGdldCBvbmx5IG5hbmRfZGV2aWNlLgoKSG93
IGRvIHlvdSBoYW5kbGUgaWYgdGhlIFNQSSBOQU5EIGNvcmUgaXMgbm90IGNvbXBpbGVkLWluPwoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
