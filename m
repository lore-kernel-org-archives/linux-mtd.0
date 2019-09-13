Return-Path: <SRS0=17bk=XI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4722DC49ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Sep 2019 12:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B49C20830
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Sep 2019 12:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cHTDDOMY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B49C20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsV2qr05qxC4lvQIXN0jJ/ASMniNA/iQl6pjrFYjwf4=; b=cHTDDOMYBqwTSa
	ODZhBbilXTMrQvxXyKlcUDhwmlYoqGoMRpcguHZ5FMCxc5MGZ6EBLn+rPsNZK61rx0huXzsGb+5qE
	U3/ZkVOD+JqjDjNfd3Oa0pgrO5gnBYDLA4QhCpwYPLjZ5QBMTHE5tLksC9YD7f8hz2xB95Z4pLVhR
	FkCtr9WeI2q38jOjwB6vR6H3mxieWoGkT8bIS3GSTQFA+3Bx33xSLOVdSLnkIawfyEYqIh1ph/nSU
	i1+p9TnI3i4UPpOcGB3ksk8RSQ5OV6YiA0QB7Y+wPlACaxD0HaswQLYRZGdqTqnB3WNuys/a3QaOX
	dB9dOwh5vS3xPKpLbWSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8l0r-0003gq-7P; Fri, 13 Sep 2019 12:49:21 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8l0o-0003gR-15
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2019 12:49:20 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D2E30240016;
 Fri, 13 Sep 2019 12:49:04 +0000 (UTC)
Date: Fri, 13 Sep 2019 14:49:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [v5 2/2] dt-bindings: mtd: Add Cadence NAND controller driver
Message-ID: <20190913144903.0323a23a@xps13>
In-Reply-To: <20190911150422.GA4973@global.cadence.com>
References: <20190725145804.8886-1-piotrs@cadence.com>
 <20190725145955.13951-1-piotrs@cadence.com>
 <20190830114638.33dc4eb2@xps13>
 <20190911150422.GA4973@global.cadence.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_054918_389476_1CDD4890 
X-CRM114-Status: GOOD (  24.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 BrianNorris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGlvdHIsCgpQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBXZWQs
IDExIFNlcCAyMDE5IDE2OjA0OjI0CiswMTAwOgoKPiBIaSBNaXF1ZWwKPiAKPiBUaGUgMDgvMzAv
MjAxOSAxMTo0NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+RVhURVJOQUwgTUFJTAo+ID4KPiA+
Cj4gPkhpIFBpb3RyLAo+ID4KPiA+UGlvdHIgU3Jva2EgPHBpb3Ryc0BjYWRlbmNlLmNvbT4gd3Jv
dGUgb24gVGh1LCAyNSBKdWwgMjAxOSAxNTo1OTo1NQo+ID4rMDEwMDoKPiA+ICAKPiA+PiBEb2N1
bWVudCB0aGUgYmluZGluZ3MgdXNlZCBieSBDYWRlbmNlIE5BTkQgY29udHJvbGxlciBkcml2ZXIK
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFNyb2thIDxwaW90cnNAY2FkZW5jZS5jb20+
Cj4gPj4gLS0tCj4gPj4gQ2hhbmdlcyBmb3IgdjU6Cj4gPj4gLSByZXBsYWNlICJfIiBieSAiLSIg
aW4gYWxsIHByb3BlcnRpZXMKPiA+PiAtIGNoYW5nZSBjb21wYXRpYmxlIG5hbWUgZnJvbSBjZG5z
LGhwbmZjIHRvIGNkbnMsaHAtbmZjCj4gPj4gQ2hhbmdlcyBmb3IgdjQ6Cj4gPj4gLSBhZGQgY29t
bWl0IG1lc3NhZ2UKPiA+PiBDaGFuZ2VzIGZvciB2MzoKPiA+PiAtIGFkZCB1bml0IHN1ZmZpeCBm
b3IgYm9hcmRfZGVsYXkKPiA+PiAtIG1vdmUgY2hpbGQgZGVzY3JpcHRpb24gdG8gcHJvcGVyIHBs
YWNlCj4gPj4gLSByZW1vdmUgcHJlZml4IGNhZGVuY2VfIGZvciByZWcgYW5kIHNkbWEgZmllbGRz
Cj4gPj4gQ2hhbmdlcyBmb3IgdjI6Cj4gPj4gLSByZW1vdmUgY2hpcCBkZXBlbmRlbmRzIHBhcmFt
ZXRlcnMgZnJvbSBkdHMgYmluZGluZ3MKPiA+PiAtIGFkZCBuYW1lcyBmb3IgcmVnaXN0ZXIgcmFu
Z2VzIGluIGR0cyBiaW5kaW5ncwo+ID4+IC0gYWRkIGdlbmVyaWMgYmluZGluZ3MgdG8gZGVzY3Jp
YmUgTkFORCBjaGlwIHJlcHJlc2VudGF0aW9uCj4gPj4gLS0tCj4gPj4gIC4uLi9iaW5kaW5ncy9t
dGQvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIudHh0ICAgICAgIHwgNTAgKysrKysrKysrKysrKysr
KysrKysrKwo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQo+ID4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jYWRl
bmNlLW5hbmQtY29udHJvbGxlci50eHQKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY2FkZW5jZS1uYW5kLWNvbnRy
b2xsZXIudHh0Cj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiBpbmRleCAwMDAwMDAwMDAw
MDAuLjQyMzU0N2EzZjk5Mwo+ID4+IC0tLSAvZGV2L251bGwKPiA+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4dAo+
ID4+IEBAIC0wLDAgKzEsNTAgQEAKPiA+PiArKiBDYWRlbmNlIE5BTkQgY29udHJvbGxlcgo+ID4+
ICsKPiA+PiArUmVxdWlyZWQgcHJvcGVydGllczoKPiA+PiArICAtIGNvbXBhdGlibGUgOiAiY2Ru
cyxocC1uZmMiCj4gPj4gKyAgLSByZWcgOiBDb250YWlucyB0d28gZW50cmllcywgZWFjaCBvZiB3
aGljaCBpcyBhIHR1cGxlIGNvbnNpc3Rpbmcgb2YgYQo+ID4+ICsJICBwaHlzaWNhbCBhZGRyZXNz
IGFuZCBsZW5ndGguIFRoZSBmaXJzdCBlbnRyeSBpcyB0aGUgYWRkcmVzcyBhbmQKPiA+PiArCSAg
bGVuZ3RoIG9mIHRoZSBjb250cm9sbGVyIHJlZ2lzdGVyIHNldC4gVGhlIHNlY29uZCBlbnRyeSBp
cyB0aGUKPiA+PiArCSAgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBTbGF2ZSBETUEgZGF0YSBw
b3J0Lgo+ID4+ICsgIC0gcmVnLW5hbWVzOiBzaG91bGQgY29udGFpbiAicmVnIiBhbmQgInNkbWEi
Cj4gPj4gKyAgLSBpbnRlcnJ1cHRzIDogVGhlIGludGVycnVwdCBudW1iZXIuCj4gPj4gKyAgLSBj
bG9ja3M6IHBoYW5kbGUgb2YgdGhlIGNvbnRyb2xsZXIgY29yZSBjbG9jayAobmZfY2xrKS4KPiA+
PiArCj4gPj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gPj4gKyAgLSBkbWFzOiBzaGFsbCByZWZl
cmVuY2UgRE1BIGNoYW5uZWwgYXNzb2NpYXRlZCB0byB0aGUgTkFORCBjb250cm9sbGVyCj4gPj4g
KyAgLSBjZG5zLGJvYXJkLWRlbGF5LXBzIDogRXN0aW1hdGVkIEJvYXJkIGRlbGF5LiBUaGUgdmFs
dWUgaW5jbHVkZXMgdGhlIHRvdGFsCj4gPj4gKyAgICByb3VuZCB0cmlwIGRlbGF5IGZvciB0aGUg
c2lnbmFscyBhbmQgaXMgdXNlZCBmb3IgZGVjaWRpbmcgb24gdmFsdWVzCj4gPj4gKyAgICBhc3Nv
Y2lhdGVkIHdpdGggZGF0YSByZWFkIGNhcHR1cmUuIFRoZSBleGFtcGxlIGZvcm11bGEgZm9yIFNE
UiBtb2RlIGlzCj4gPj4gKyAgICB0aGUgZm9sbG93aW5nOgo+ID4+ICsgICAgYm9hcmQgZGVsYXkg
PSBSRSNQQUQgZGVsYXkgKyBQQ0IgdHJhY2UgdG8gZGV2aWNlICsgUENCIHRyYWNlIGZyb20gZGV2
aWNlCj4gPj4gKyAgICArIERRIFBBRCBkZWxheQo+ID4+ICsKPiA+PiArQ2hpbGQgbm9kZXMgcmVw
cmVzZW50IHRoZSBhdmFpbGFibGUgTkFORCBjaGlwcy4KPiA+PiArCj4gPj4gK1JlcXVpcmVkIHBy
b3BlcnRpZXMgb2YgTkFORCBjaGlwczoKPiA+PiArICAtIHJlZzogc2hhbGwgY29udGFpbiB0aGUg
bmF0aXZlIENoaXAgU2VsZWN0IGlkcyBmcm9tIDAgdG8gbWF4IHN1cHBvcnRlZCBieQo+ID4+ICsg
ICAgdGhlIGNhZGVuY2UgbmFuZCBmbGFzaCBjb250cm9sbGVyCj4gPj4gKwo+ID4+ICsKPiA+PiAr
U2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC50eHQgZm9yIG1v
cmUgZGV0YWlscyBvbgo+ID4+ICtnZW5lcmljIGJpbmRpbmdzLgo+ID4+ICsKPiA+PiArRXhhbXBs
ZToKPiA+PiArCj4gPj4gK25hbmRfY29udHJvbGxlcjogbmFuZC1jb250cm9sbGVyIEA2MDAwMDAw
MCB7Cj4gPj4gKwkgIGNvbXBhdGlibGUgPSAiY2RucyxocC1uZmMiOwo+ID4+ICsJICByZWcgPSA8
MHg2MDAwMDAwMCAweDEwMDAwPiwgPDB4ODAwMDAwMDAgMHgxMDAwMD47Cj4gPj4gKwkgIHJlZy1u
YW1lcyA9ICJyZWciLCAic2RtYSI7Cj4gPj4gKwkgIGNsb2NrcyA9IDwmbmZfY2xrPjsKPiA+PiAr
CSAgY2Rucyxib2FyZC1kZWxheS1wcyA9IDw0ODMwPjsgIAo+ID4KPiA+QXJlIHlvdSBzdXJlIHlv
dSB3YW50IHRvIGV4cG9ydCB0aGlzIHRvIHRoZSB1c2VyPyBOb3Qgc3VyZSBpdCBpcyBlYXNpbHkK
PiA+dW5kZXJzdGFuZGFibGUgYW5kIHR1bmFibGUuLi4gSSdtIG5vdCBhZ2FpbnN0IGJ1dCBJIHdv
dWxkIGhhdmUgdHJvdWJsZXMKPiA+dHVuaW5nIGl0IG15c2VsZiwgdW5sZXNzIHVzaW5nIHRoZSBk
b2N1bWVudGVkIHZhbHVlLiBNYXliZSB5b3Ugc2hvdWxkCj4gPmV4cGxhaW4gbW9yZSBob3cgdG8g
ZGVyaXZlIGl0PyAgCj4gSSBuZWVkIHRvIGV4cG9ydCB0aGlzIHBhcmFtZXRlciBzb21laG93LiBU
aGUgZGVmYXVsdCB2YWx1ZSBtYXkgbm90IGJlCj4gdmFsaWQgZm9yIG90aGVyIHBsYXRmb3Jtcy4g
VGhpcyB2YWx1ZSBkZXBlbmRzIG9uIHBsYXRmb3JtLCBhbmQgbWF5IGJlIGRpZmZlcmVudCBvbiBk
aWZmZXJlbnQgU29Dcy4gU28gSSB0aGluayB0aGUgRFRTIGlzIHRoZSBiZXN0IHBsYWNlIHRvIHB1
dCBzdWNoIGNvbmZpZ3VyYXRpb24KPiBwYXJhbWV0ZXIuCgpXaGF0IGFib3V0IGEgZGlmZmVyZW50
IGNvbXBhdGlibGUgaWYgaXQgZGVwZW5kcyBvbiB0aGUgU29DPwoKVGhpcyB3YXkgeW91IGNhbiBy
ZXRyaWV2ZSBhIGRpZmZlcmVudCBkcml2ZXIgZGF0YSBzdHJ1Y3R1cmUgYW5kIGF2b2lkCnRoZSBw
YWluIGZvciB0aGUgdXNlci4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
