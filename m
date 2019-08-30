Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34028C3A5A4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 09:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A5C21670
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 09:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qyzyougm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A5C21670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkVEuSUEaDHugyXQLoiZW0mba9QmPzpuCOModsFETSI=; b=QyzyougmJafJGO
	1JEWawbLeS74ArjGPBndxCIE13UfQwV4+efZazvzH9uI0zhbc0H/RYMEOAQTwGdCLLIBuwhJjUqvO
	9t0P+zW0hRtesTsamRTFILJhKkcsRlKijrP2tS+63x102i/yjsIPGGBEelL0ONlQhXOhU61xJaWN9
	+CaFieeZF48IXkKw5/tknZi2RcG61wOvZ2mSu9n0j9TKMgYA+M0UPjWupzl7fb6k6f7phhM6hj8Bb
	LZUohooaPVHPTfMoBJIp5qdUgnZoNT39pRJ+kG5xD3fZviZ2vcfxDF6lBvZ8xVdeKkE1NmSzbdleI
	3YKcEZQjd4fyMui98/LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3dUg-0006v7-Nl; Fri, 30 Aug 2019 09:46:58 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3dUe-0006ul-10
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 09:46:57 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6B671100003;
 Fri, 30 Aug 2019 09:46:40 +0000 (UTC)
Date: Fri, 30 Aug 2019 11:46:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [v5 2/2] dt-bindings: mtd: Add Cadence NAND controller driver
Message-ID: <20190830114638.33dc4eb2@xps13>
In-Reply-To: <20190725145955.13951-1-piotrs@cadence.com>
References: <20190725145804.8886-1-piotrs@cadence.com>
 <20190725145955.13951-1-piotrs@cadence.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_024656_371801_23AA86E3 
X-CRM114-Status: GOOD (  20.87  )
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

SGkgUGlvdHIsCgpQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBUaHUs
IDI1IEp1bCAyMDE5IDE1OjU5OjU1CiswMTAwOgoKPiBEb2N1bWVudCB0aGUgYmluZGluZ3MgdXNl
ZCBieSBDYWRlbmNlIE5BTkQgY29udHJvbGxlciBkcml2ZXIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
aW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPgo+IC0tLQo+IENoYW5nZXMgZm9yIHY1Ogo+
IC0gcmVwbGFjZSAiXyIgYnkgIi0iIGluIGFsbCBwcm9wZXJ0aWVzCj4gLSBjaGFuZ2UgY29tcGF0
aWJsZSBuYW1lIGZyb20gY2RucyxocG5mYyB0byBjZG5zLGhwLW5mYwo+IENoYW5nZXMgZm9yIHY0
Ogo+IC0gYWRkIGNvbW1pdCBtZXNzYWdlCj4gQ2hhbmdlcyBmb3IgdjM6Cj4gLSBhZGQgdW5pdCBz
dWZmaXggZm9yIGJvYXJkX2RlbGF5IAo+IC0gbW92ZSBjaGlsZCBkZXNjcmlwdGlvbiB0byBwcm9w
ZXIgcGxhY2UKPiAtIHJlbW92ZSBwcmVmaXggY2FkZW5jZV8gZm9yIHJlZyBhbmQgc2RtYSBmaWVs
ZHMKPiBDaGFuZ2VzIGZvciB2MjoKPiAtIHJlbW92ZSBjaGlwIGRlcGVuZGVuZHMgcGFyYW1ldGVy
cyBmcm9tIGR0cyBiaW5kaW5ncwo+IC0gYWRkIG5hbWVzIGZvciByZWdpc3RlciByYW5nZXMgaW4g
ZHRzIGJpbmRpbmdzCj4gLSBhZGQgZ2VuZXJpYyBiaW5kaW5ncyB0byBkZXNjcmliZSBOQU5EIGNo
aXAgcmVwcmVzZW50YXRpb24KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL210ZC9jYWRlbmNlLW5hbmQt
Y29udHJvbGxlci50eHQgICAgICAgfCA1MCArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4
dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIudHh0Cj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQyMzU0N2EzZjk5Mwo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFu
ZC1jb250cm9sbGVyLnR4dAo+IEBAIC0wLDAgKzEsNTAgQEAKPiArKiBDYWRlbmNlIE5BTkQgY29u
dHJvbGxlcgo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArICAtIGNvbXBhdGlibGUgOiAi
Y2RucyxocC1uZmMiCj4gKyAgLSByZWcgOiBDb250YWlucyB0d28gZW50cmllcywgZWFjaCBvZiB3
aGljaCBpcyBhIHR1cGxlIGNvbnNpc3Rpbmcgb2YgYQo+ICsJICBwaHlzaWNhbCBhZGRyZXNzIGFu
ZCBsZW5ndGguIFRoZSBmaXJzdCBlbnRyeSBpcyB0aGUgYWRkcmVzcyBhbmQKPiArCSAgbGVuZ3Ro
IG9mIHRoZSBjb250cm9sbGVyIHJlZ2lzdGVyIHNldC4gVGhlIHNlY29uZCBlbnRyeSBpcyB0aGUK
PiArCSAgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBTbGF2ZSBETUEgZGF0YSBwb3J0Lgo+ICsg
IC0gcmVnLW5hbWVzOiBzaG91bGQgY29udGFpbiAicmVnIiBhbmQgInNkbWEiCj4gKyAgLSBpbnRl
cnJ1cHRzIDogVGhlIGludGVycnVwdCBudW1iZXIuCj4gKyAgLSBjbG9ja3M6IHBoYW5kbGUgb2Yg
dGhlIGNvbnRyb2xsZXIgY29yZSBjbG9jayAobmZfY2xrKS4KPiArCj4gK09wdGlvbmFsIHByb3Bl
cnRpZXM6Cj4gKyAgLSBkbWFzOiBzaGFsbCByZWZlcmVuY2UgRE1BIGNoYW5uZWwgYXNzb2NpYXRl
ZCB0byB0aGUgTkFORCBjb250cm9sbGVyCj4gKyAgLSBjZG5zLGJvYXJkLWRlbGF5LXBzIDogRXN0
aW1hdGVkIEJvYXJkIGRlbGF5LiBUaGUgdmFsdWUgaW5jbHVkZXMgdGhlIHRvdGFsCj4gKyAgICBy
b3VuZCB0cmlwIGRlbGF5IGZvciB0aGUgc2lnbmFscyBhbmQgaXMgdXNlZCBmb3IgZGVjaWRpbmcg
b24gdmFsdWVzCj4gKyAgICBhc3NvY2lhdGVkIHdpdGggZGF0YSByZWFkIGNhcHR1cmUuIFRoZSBl
eGFtcGxlIGZvcm11bGEgZm9yIFNEUiBtb2RlIGlzCj4gKyAgICB0aGUgZm9sbG93aW5nOgo+ICsg
ICAgYm9hcmQgZGVsYXkgPSBSRSNQQUQgZGVsYXkgKyBQQ0IgdHJhY2UgdG8gZGV2aWNlICsgUENC
IHRyYWNlIGZyb20gZGV2aWNlCj4gKyAgICArIERRIFBBRCBkZWxheQo+ICsKPiArQ2hpbGQgbm9k
ZXMgcmVwcmVzZW50IHRoZSBhdmFpbGFibGUgTkFORCBjaGlwcy4KPiArCj4gK1JlcXVpcmVkIHBy
b3BlcnRpZXMgb2YgTkFORCBjaGlwczoKPiArICAtIHJlZzogc2hhbGwgY29udGFpbiB0aGUgbmF0
aXZlIENoaXAgU2VsZWN0IGlkcyBmcm9tIDAgdG8gbWF4IHN1cHBvcnRlZCBieQo+ICsgICAgdGhl
IGNhZGVuY2UgbmFuZCBmbGFzaCBjb250cm9sbGVyCj4gKwo+ICsKPiArU2VlIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC50eHQgZm9yIG1vcmUgZGV0YWlscyBvbgo+
ICtnZW5lcmljIGJpbmRpbmdzLgo+ICsKPiArRXhhbXBsZToKPiArCj4gK25hbmRfY29udHJvbGxl
cjogbmFuZC1jb250cm9sbGVyIEA2MDAwMDAwMCB7Cj4gKwkgIGNvbXBhdGlibGUgPSAiY2Rucyxo
cC1uZmMiOwo+ICsJICByZWcgPSA8MHg2MDAwMDAwMCAweDEwMDAwPiwgPDB4ODAwMDAwMDAgMHgx
MDAwMD47Cj4gKwkgIHJlZy1uYW1lcyA9ICJyZWciLCAic2RtYSI7Cj4gKwkgIGNsb2NrcyA9IDwm
bmZfY2xrPjsKPiArCSAgY2Rucyxib2FyZC1kZWxheS1wcyA9IDw0ODMwPjsKCkFyZSB5b3Ugc3Vy
ZSB5b3Ugd2FudCB0byBleHBvcnQgdGhpcyB0byB0aGUgdXNlcj8gTm90IHN1cmUgaXQgaXMgZWFz
aWx5CnVuZGVyc3RhbmRhYmxlIGFuZCB0dW5hYmxlLi4uIEknbSBub3QgYWdhaW5zdCBidXQgSSB3
b3VsZCBoYXZlIHRyb3VibGVzCnR1bmluZyBpdCBteXNlbGYsIHVubGVzcyB1c2luZyB0aGUgZG9j
dW1lbnRlZCB2YWx1ZS4gTWF5YmUgeW91IHNob3VsZApleHBsYWluIG1vcmUgaG93IHRvIGRlcml2
ZSBpdD8KClRoZSByZXN0IGxvb2tzIGZpbmUsIGxldCdzIHNlZSBpZiBSb2IgYWdyZWVzLiBNYXli
ZSBoZSB3aWxsIHJlcXVlc3QgYQp5YW1sIHNjaGVtYTsgaW4gdGhpcyBjYXNlIHlvdSBjYW4gY2hl
Y2sgc3VueGkgTkFORCBiaW5kaW5ncyB3aGljaAphbHJlYWR5IGhhdmUgYmVlbiBjb252ZXJ0ZWQu
Cgo+ICsJICBpbnRlcnJ1cHRzID0gPDIgMD47Cj4gKwkgIG5hbmRAMCB7Cj4gKwkgICAgICByZWcg
PSA8MD47Cj4gKwkgICAgICBsYWJlbCA9ICJuYW5kLTEiOwo+ICsJICB9Owo+ICsJICBuYW5kQDEg
ewo+ICsJICAgICAgcmVnID0gPDE+Owo+ICsJICAgICAgbGFiZWwgPSAibmFuZC0yIjsKPiArCSAg
fTsKPiArCj4gK307CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
