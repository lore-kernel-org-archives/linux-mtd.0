Return-Path: <SRS0=Gd7z=SS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E75C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 16:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2062064A
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 16:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aYZONbtU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2062064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4AG4T9RNCe/Za9TYmSRB4882YbKZ8xrgCBxSqzPke0=; b=aYZONbtUSPGxrf
	CUQx/dgtdS2hloIj7wD6K5PevTG5zZ8rELuDIrhpL16sjsrvQVznz5tgRzrcCpShunT5janMObY5b
	QLZhQQKAKUlFH3XWFBtU9yLFGfkT1NzzNVflhgjWgf206MyQ+E7x9Fn/S4HAVb3ESs6s10NZ+Rv72
	xf83KvXCKPjsWAmBk+puIoBmf/dGZiD6UDJ9rSPz13tggqZCx+MBPZTZCM95qBn4mjZmSF00KpRrL
	OneIMbKptGyAmbSRE5O0u4uJ61Fh4rIfGEtOEnXnzf9WvWahy/hRozscZ6xILn1mscRzsty/z/+aT
	MrV90BZfr6alu3kJKZPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGRLS-0004Xi-Ly; Tue, 16 Apr 2019 16:54:06 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGRLK-0004Qc-7B; Tue, 16 Apr 2019 16:54:00 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EF47720008;
 Tue, 16 Apr 2019 16:53:46 +0000 (UTC)
Date: Tue, 16 Apr 2019 18:53:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Message-ID: <20190416185345.5553923f@xps13>
In-Reply-To: <20190415091420.3fb86ef7@collabora.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190414110549.5c91829d@collabora.com>
 <20190415085859.21f69396@xps13>
 <20190415091420.3fb86ef7@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_095358_560334_1F7928C5 
X-CRM114-Status: GOOD (  24.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDE1IEFwcgoyMDE5IDA5OjE0OjIwICswMjAwOgoKPiBPbiBNb24sIDE1
IEFwciAyMDE5IDA4OjU4OjU5ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSBCb3JpcywKPiA+IAo+ID4gQm9yaXMgQnJlemls
bG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGUgb24gU3VuLCAxNCBBcHIK
PiA+IDIwMTkgMTE6MDU6NDkgKzAyMDA6Cj4gPiAgIAo+ID4gPiBPbiBUaHUsICA0IEFwciAyMDE5
IDE4OjIxOjEwICswMjAwCj4gPiA+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+IHdyb3RlOgo+ID4gPiAgICAgCj4gPiA+ID4gQWxsd2lubmVyIE5BTkQgY29udHJvbGxl
cnMgY2FuIG1ha2UgdXNlIG9mIERNQSB0byBlbmhhbmNlIHRoZSBJL08KPiA+ID4gPiB0aHJvdWdo
cHV0IHRoYW5rcyB0byBFQ0MgcGlwZWxpbmluZy4gRE1BIGhhbmRsaW5nIHdpdGggc3VuOGkgTkFO
RCBJUAo+ID4gPiA+IGlzIGEgYml0IGRpZmZlcmVudCB0aGFuIHdpdGggdGhlIG9sZGVyIFNvQ3Ms
IGhlbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2YKPiA+ID4gPiBhIG5ldyBjb21wYXRpYmxlIHRvIGhh
bmRsZToKPiA+ID4gPiAqIHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIHJlZ2lzdGVyIG9mZnNldHMs
Cj4gPiA+ID4gKiB0aGUgYnVyc3QgbGVuZ3RoIGNoYW5nZSBmcm9tIDQgdG8gbWluaW11bSA4LAo+
ID4gPiA+ICogZHJpdmUgU1JBTSBhY2Nlc3NlcyB0aHJvdWdoIHRoZSBBSEIgYnVzIGluc3RlYWQg
b2YgdGhlIE1CVVMuICAgICAgCj4gPiA+IAo+ID4gPiBIbSwgbm93IHRoYXQgeW91IGtub3cgTUJV
UyBhY2Nlc3NlcyBhcmUgd29ya2luZyBmaW5lIChJSVJDLCB0aGF0J3Mgd2hhdAo+ID4gPiB5b3Ug
dXNlZCBmb3IgdGhlIFNQTCBETUEtYmFzZWQgaW1wbGVtZW50YXRpb24pLCB3aHkgbm90IGRpcmVj
dGx5IHVzZQo+ID4gPiBNQlVTIGFjY2Vzc2VzIG9uIEEzMz8gSSBtZWFuLCBpdCdzIGxpa2VseSBm
YXN0ZXIgdGhhbiBnb2luZyB0aHJvdWdoCj4gPiA+IHRoZSBETUEgZW5naW5lICh3aGljaCBpcyBz
aGFyZWQgYnkgc2V2ZXJhbCBJUHMpLCBhbmQgQUZBSVIsIHRoZSBNQlVTCj4gPiA+IHNldHVwIGlz
IHByZXR0eSBzaW1wbGUuICAgIAo+ID4gCj4gPiBCZWNhdXNlIGFsbCB0aGUgZHJpdmVyIGlzIGFs
cmVhZHkgaW4gc2hhcGUgdG8gdXNlIHRoZSBleHRlcm5hbCBETUEKPiA+IGVuZ2luZSBhbmQgaXQg
d2FzIHZlcnkgZWFzeSBhbmQgcXVpY2sgKGhhdmUgYSBsb29rIGF0IHRoZSBkaWZmIG9mIHRoZQo+
ID4gdjMpIHRvIHVzZSBpdCBhZ2Fpbi4gIAo+IAo+IFllcywgSSBzZWUgdGhhdC4gSSBtaWdodCBi
ZSB3cm9uZyBidXQgSSdkIGV4cGVjdCB0aGUgTURNQSB2ZXJzaW9uIHRvIGJlCj4ganVzdCBhcyBz
aW1wbGUgYXMgdGhpcyBvbmUuCj4gCj4gPiAKPiA+IEhvd2V2ZXIsIHRoZSBjaG9pY2UgSSBhbSBk
ZXNjcmliaW5nIGhlcmUgaXMgbm90IERNQSB2cy4gTUJVUyAob3IgTURNQSksCj4gPiBpdCBpcyBN
QlVTIHZzLiBBSEIsIGl0IGlzIGp1c3QgYWJvdXQgdGhlIGJ1cyB0aGF0IHdpbGwgYWNjZXNzIHRo
ZSBTUkFNCj4gPiAodGhpcyBpcyB3aGF0IHdlIGhhdmUgdW5kZXJzdG9vZCB3aXRoIE1heGltZSBm
cm9tIHRoZSBkYXRhc2hlZXRzIGFuZAo+ID4gdGhlIHRlc3RzIHdlIGhhdmUgZG9uZSkuICAKPiAK
PiBZZXMsIHNvcnJ5LCBJIG1lYW50IE1ETUEgdnMgc2hhcmVkIERNQSBlbmdpbmUsIGJ1dCBJIGd1
ZXNzIE1CVVMgaXMgb25seQo+IHVzZWQgdGhyb3VnaCBNRE1BIGFjY2Vzc2VzIGFueXdheSwgcmln
aHQ/CgpJIGhhdmUgbm8gcHJvb2YgdGhhdCBJIGFjdHVhbGx5IHVzZWQgTUJVUywgYnV0IHRoZXJl
IGlzIGEgYml0IHdoaWNoIGNhbgpiZSBzZXQgdG8gdXNlIE1CVVMgdG8gYWNjZXNzIHRoZSBTUkFN
IGV2ZW4gd2hlbiBub3QgdXNpbmcgTURNQS4gSW4gdGhpcwpjYXNlLCBNQlVTIHBheWxvYWQgbGVu
Z3RoIGhhZCB0byBiZSBmaWxsZWQgb3IgdGhlIG9wZXJhdGlvbiB3b3VsZCBub3QKc3VjY2VlZC4g
SG93ZXZlciB3aGVuIHVzaW5nIEFIQiwgdGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhpcyBleHRyYQpj
b25maWd1cmF0aW9uLiBUaGF0J3Mgd2h5IEkgZGVjaWRlZCB0byB1c2UgdGhlIEFIQi4KCj4gCj4g
PiBGb3IgdGhpcyBjaG9pY2UsIHdlIHRlc3RlZCB3aXRoIGJvdGggYnVzZXM6IG5vCj4gPiB0aHJv
dWdocHV0IGNoYW5nZSBzbyB3ZSB0aGluayB0aGF0IGl0IGlzIG5vdCBhIGJvdHRsZW5lY2sgYW55
d2F5LiAgCj4gCj4gV2VsbCwgeW91J2QgbmVlZCB0byB0ZXN0IHdpdGggYSBsb3Qgb2YgdHJhZmZp
YyBnb2luZyB0aHJvdWdoIHRoZSBETUEKPiBlbmdpbmUgdG8gY2hlY2sgaWYgdGhhdCBtYWtlcyBh
IGRpZmZlcmVuY2UuCgpUcnVlLCBJIHByb2JhYmx5IGRpZG4ndCBzdHJlc3NlZCB0aGUgcGxhdGZv
cm0gZW5vdWdoIHRvIHNlZSB0aGUKZGlmZmVyZW5jZS4KCj4gCj4gQW55d2F5LCBpdCB3YXMganVz
dCBhIHN1Z2dlc3Rpb24sIGtlZXAgaXQgbGlrZSB0aGF0IGlmIHlvdSB0aGluayB1c2luZwo+IE1E
TUEgaXMgbm90IHdvcnRod2hpbGUuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
