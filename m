Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9988CC04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCDD20863
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4E81kj4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCDD20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyjlha3PhIp/HvQy6z3zCCSMT5Fbv+CaRgT9QVCsy/Y=; b=K4E81kj48nbhGF
	SGlL+WsBQzUkY0JiBs3PejQBv85FV66Pm6re2LFEtFcJd5TFX5pAMXLEFggkxhI0uadGWDig2op1r
	XxwJ1/sEdKbkdRToT8YDA6f7pBNFGcUg15/G030L13edZJd8vxincb+s43rtLlPNb6Hch/sRQMHh/
	FM+kZlzEeNNX4DtZ1Dn/pXOARf9sKxM7cjrzSebjqXfRN37CH4oF2XVsXnokHy24Qlg8ICjoj+eoU
	OzpKfLjs4kskvWKenTxTP1WSVigq1or1E4bX5+oxLsYcQC5GfRedJeDG17vmpC4+tIGVr/MhRQMDN
	kBJAi+B5XJSEKqeaJNyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0X3-0003Mx-HT; Tue, 21 May 2019 08:54:01 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0Ww-0003Ct-0m
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:53:57 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BC2E420015;
 Tue, 21 May 2019 08:53:50 +0000 (UTC)
Date: Tue, 21 May 2019 10:53:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: brcmnand: fallback to detected
 ecc-strength, ecc-step-size
Message-ID: <20190521105349.3b6562f2@xps13>
In-Reply-To: <63bbd3eb-60c1-042c-633c-cfa6fbef528c@gmail.com>
References: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
 <1558379144-28283-2-git-send-email-kdasu.kdev@gmail.com>
 <63bbd3eb-60c1-042c-633c-cfa6fbef528c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_015354_477204_162C42BB 
X-CRM114-Status: GOOD (  18.18  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmxvcmlhbiwKCkZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiB3cm90
ZSBvbiBNb24sIDIwIE1heSAyMDE5CjEyOjExOjQyIC0wNzAwOgoKPiBPbiA1LzIwLzE5IDEyOjA1
IFBNLCBLYW1hbCBEYXN1IHdyb3RlOgo+ID4gVGhpcyBjaGFuZ2Ugc3VwcG9ydHMgbmFuZC1lY2Mt
c3RlcC1zaXplIGFuZCBuYW5kLWVjYy1zdHJlbmd0aCBmaWVsZHMgaW4KPiA+IGJyY21uYW5kIERU
IG5vZGUgdG8gYmUgb3B0aW9uYWwuCj4gPiBzZWU6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKPiA+IAo+ID4gSWYgYm90aCBuYW5kLWVjYy1z
dHJlbmd0aCBhbmQgbmFuZC1lY2Mtc3RlcC1zaXplIGFyZSBub3Qgc3BlY2lmaWVkIGluCj4gPiBk
ZXZpY2UgdHJlZSBub2RlIGZvciBOQU5ELCByYXcgTkFORCBsYXllciBkb2VzIGRldGVjdCBFQ0Mg
aW5mb3JtYXRpb24gYnkKPiA+IHJlYWRpbmcgT05GSSBleHRlbmRlZCBwYXJhbWV0ZXIgcGFnZSBm
b3IgcGFydHMgdXNpbmcgT05GSSA+PSAyLjEuCj4gPiBJbiBjYXNlIG9mIG5vbi1PTkZJIE5BTkQg
cGFydHMgdGhlcmUgY291bGQgYmUgYSBuYW5kX2lkIHRhYmxlIGVudHJ5IHdpdGgKPiA+IEVDQyBp
bmZvcm1hdGlvbi4gSWYgdGhlcmUgaXMgdmFsaWQgZGV2aWNlIHRyZWUgZW50cnkgZm9yIG5hbmQt
ZWNjLXN0cmVuZ3RoCj4gPiBhbmQgbmFuZC1lY2Mtc3RlcC1zaXplIGZpZWxkcyBpdCBzdGlsbCBz
aGFsbCBvdmVycmlkZSB0aGUgZGV0ZWN0ZWQgdmFsdWVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAxMSArKysrKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4gaW5kZXggY2UwYjhmZi4uYTRkMjA1NyAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+IEBAIC0yMTQ0
LDYgKzIxNDQsMTcgQEAgc3RhdGljIGludCBicmNtbmFuZF9zZXR1cF9kZXYoc3RydWN0IGJyY21u
YW5kX2hvc3QgKmhvc3QpCj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICAJfQo+ID4gIAo+ID4g
KwlpZiAoY2hpcC0+ZWNjLm1vZGUgIT0gTkFORF9FQ0NfTk9ORSAmJgo+ID4gKwkgICAgKCFjaGlw
LT5lY2Muc2l6ZSB8fCAhY2hpcC0+ZWNjLnN0cmVuZ3RoKSkgewo+ID4gKwkJaWYgKGNoaXAtPmJh
c2UuZWNjcmVxLnN0ZXBfc2l6ZSAmJiBjaGlwLT5iYXNlLmVjY3JlcS5zdHJlbmd0aCkgewo+ID4g
KwkJCS8qIHVzZSBkZXRlY3RlZCBFQ0MgcGFyYW1ldGVycyAqLwo+ID4gKwkJCWNoaXAtPmVjYy5z
aXplID0gY2hpcC0+YmFzZS5lY2NyZXEuc3RlcF9zaXplOwo+ID4gKwkJCWNoaXAtPmVjYy5zdHJl
bmd0aCA9IGNoaXAtPmJhc2UuZWNjcmVxLnN0cmVuZ3RoOwo+ID4gKwkJCXByX2luZm8oIlVzaW5n
IEVDQyBzdGVwLXNpemUgJWQsIHN0cmVuZ3RoICVkXG4iLAo+ID4gKwkJCQljaGlwLT5lY2Muc2l6
ZSwgY2hpcC0+ZWNjLnN0cmVuZ3RoKTsgIAo+IAo+IE5pdDogc2hvdWxkIG5vdCB3ZSB1c2UgZGV2
X2luZm8oJmhvc3QtPnBkZXYtPmRldikgZm9yIHByaW50aW5nIHRoZQo+IG1lc3NhZ2UgaW4gY2Fz
ZSB3ZSBoYXZlIG11bHRpcGxlIE5BTkQgY29udHJvbGxlcnMgb24gY2hpcCwgdGhhdCB3YXkgd2UK
PiBjYW4gc3RpbGwgZGlmZmVyZW50aWF0ZSB0aGVtIGZyb20gdGhlIHByaW50cz8KCldpdGggdGhl
IGFib3ZlIGNoYW5nZWQKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
