Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35771C33CA4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 09:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AABA20721
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 09:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WXrg5gv8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AABA20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0yrr54vOR6j4eQyR3zYfwGwzZfSiATts4lD/VrQUyY=; b=WXrg5gv8VCncry
	J3Ghd1DMOhO2kFVpHDnC+lr1b9Ei6nZHmIcL0fzpkEu0JKCzAZNXhHY8ZIHI745aQGt4AbDNeLuES
	wdSas0R/SAEyb31y0NMXC2jSa6Pxjh1OL13wWvLbfxWA4P2EkXXK19EfKy3+ZdlueH3QrOWFVoUqt
	tGqbpgubPIZ3MRid4wuR0xlCQuG8TdKRZWnFpSWd1YnMD0wDPBcAmBa8IETORr9ROA9+z7Q7VsO4Q
	f+OVr3XqjUCQzR07QsDqMku3EDRVP0WM5C1TiLzaSX0nGwi9fUGpZK3UtZbsxmDcs85RnEnecBOD2
	Il9kjd+sLkepXUBGR9JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipr1I-0000Qi-ON; Fri, 10 Jan 2020 09:55:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipr1E-0000Pw-PX
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 09:55:54 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 008D3C000B;
 Fri, 10 Jan 2020 09:55:44 +0000 (UTC)
Date: Fri, 10 Jan 2020 10:55:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: implement proper partition handling
Message-ID: <20200110105543.29235890@xps13>
In-Reply-To: <20200110104626.0531d556@collabora.com>
References: <20191230111948.27005-1-miquel.raynal@bootlin.com>
 <1651325521.16954.1578526458487.JavaMail.zimbra@nod.at>
 <20200109191304.636c82e7@xps13>
 <1737779363.17836.1578595384783.JavaMail.zimbra@nod.at>
 <20200109194556.34cf67dc@xps13>
 <20200109201355.707c5b0d@collabora.com>
 <20200109202358.2a428a8d@xps13>
 <20200109203722.4423ed09@collabora.com>
 <20200110092855.79f18339@xps13>
 <20200110104626.0531d556@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_015553_099680_1F17CFE0 
X-CRM114-Status: GOOD (  31.88  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBGcmksIDEwIEphbgoyMDIwIDEwOjQ2OjI2ICswMTAwOgoKPiBPbiBGcmksIDEw
IEphbiAyMDIwIDA5OjI4OjU1ICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSBCb3JpcywKPiA+IAo+ID4gQm9yaXMgQnJlemls
bG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGUgb24gVGh1LCA5IEphbgo+
ID4gMjAyMCAyMDozNzoyMiArMDEwMDoKPiA+ICAgCj4gPiA+IE9uIFRodSwgOSBKYW4gMjAyMCAy
MDoyMzo1OCArMDEwMAo+ID4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPiB3cm90ZToKPiA+ID4gICAgIAo+ID4gPiA+IEhpIEJvcmlzLAo+ID4gPiA+IAo+ID4gPiA+
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlIG9u
IFRodSwgOSBKYW4KPiA+ID4gPiAyMDIwIDIwOjEzOjU1ICswMTAwOgo+ID4gPiA+ICAgICAgIAo+
ID4gPiA+ID4gT24gVGh1LCA5IEphbiAyMDIwIDE5OjQ1OjU2ICswMTAwCj4gPiA+ID4gPiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4gPiA+ICAg
ICAgICAgCj4gPiA+ID4gPiA+IEhpIFJpY2hhcmQsCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZSBvbiBUaHUsIDkgSmFuIDIw
MjAgMTk6NDM6MDQKPiA+ID4gPiA+ID4gKzAxMDAgKENFVCk6Cj4gPiA+ID4gPiA+ICAgICAgICAg
ICAKPiA+ID4gPiA+ID4gPiBNaXF1ZWwsCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gLS0t
LS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLSAgICAgICAgICAgIAo+ID4gPiA+ID4gPiA+ID4+
IFdoYXQgcHJvYmxlbSBkb2VzIHRoaXMgc29sdmU/Cj4gPiA+ID4gPiA+ID4gPj4gLi4uYmVzaWRl
IG9mIGEgbmljZSBkaWZmc3RhdCB3aGljaCByZW1vdmVzIG1vcmUgdGhhbiBpdCBhZGRzLiA6LSkg
ICAgICAgICAgICAgIAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBJdCBpcyBtdWNo
IGVhc2llciB0byBlc2NhbGFkZSB0byB0aGUgdG9wIG1vc3QgIm1hc3RlciIgZGV2aWNlIHdoZW4K
PiA+ID4gPiA+ID4gPiA+IHRoZXJlIGFyZSBtdWx0aXBsZSBsZXZlbHMgb2YgcGFydGl0aW9uaW5n
LCB3aGljaCB3YXMgbm90IGNsZWFubHkKPiA+ID4gPiA+ID4gPiA+IGRlc2NyaWJlZCBJTUhPLiBB
bHNvIGl0IGlzIGFscmVhZHkgdXNlZCBpbiB0aGUgTUxDLWluLXBzZXVkby1TTEMtbW9kZQo+ID4g
PiA+ID4gPiA+ID4gc2VyaWVzIDopICAgICAgICAgICAgICAKPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiBPay4gSW4gZmFjdCBJICJmb3VuZCIgdGhpcyBwYXRjaCBteSBsb29raW5nIGF0IHRo
ZSBTTEMgZW11bGF0aW9uIHBhdGNoZXMuCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgCj4gPiA+
ID4gPiA+ID4gPj4gPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgbXRkX2luZm8gKm10ZF9nZXRfbWFz
dGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ID4gPiA+ID4gPiA+ID4+ID4gK3sKPiA+ID4gPiA+
ID4gPiA+PiA+ICsJd2hpbGUgKG10ZC0+cGFyZW50KQo+ID4gPiA+ID4gPiA+ID4+ID4gKwkJbXRk
ID0gbXRkLT5wYXJlbnQ7Cj4gPiA+ID4gPiA+ID4gPj4gPiArCj4gPiA+ID4gPiA+ID4gPj4gPiAr
CXJldHVybiBtdGQ7Cj4gPiA+ID4gPiA+ID4gPj4gPiArfSAgICAgICAgICAgICAgCj4gPiA+ID4g
PiA+ID4gPj4gCj4gPiA+ID4gPiA+ID4gPj4gU28sIHBhcmVudCA9PSBtYXN0ZXI/ICAgICAgICAg
ICAgICAKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gdG9wIG1vc3QgcGFyZW50ICh0
aGUgb25lIHdpdGhvdXQgcGFyZW50KSA9PSBtYXN0ZXIgIQo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAKPiA+ID4gPiA+ID4gPiA+PiAKPiA+ID4gPiA+ID4gPiA+PiBXaGVuIEkgY3JlYXRl
IGEgTVREIG9udG9wIG9mIFVCSSB1c2luZyBnbHVlYmksIHdobyB3aWxsIGJlIHBhcmVudC9tYXN0
ZXI/ICAgICAgICAgICAgICAKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gSSBkb24n
dCByZWFsbHkgdW5kZXJzdGFuZCB0aGUgaXNzdWUgaGVyZT8gICAgICAgICAgICAgIAo+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+IExldCdzIHNheSBJIGhhdmUgbXRkMCB3aXRoIGFuIHViaSBh
bmQgYSB2b2x1bWUgInh4eCIuIEFmdGVyIGVuYWJsaW5nCj4gPiA+ID4gPiA+ID4gZ2x1ZWJpIGEg
bmV3IG10ZDEgd2lsbCBhcnJpdmUgb24gdGhlIHN5c3RlbS4KPiA+ID4gPiA+ID4gPiBUaGUgc3Rh
Y2tpbmcgaXMgbXRkMCAtPiB1YmkgKHZvbHVtZSB4eHgpIC0+IG10ZDEuICAgICAgICAgICAgCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGlzIGlzIG11Y2ggY2xlYXJlciwgdGhhbmtzIQo+ID4g
PiA+ID4gPiAgICAgICAgICAgCj4gPiA+ID4gPiA+ID4gSXMgbm93IGEgcmVsYXRpb25zaGlwIGJl
dHdlZW4gbXRkMSBhbmQgbXRkMD8gICAgICAgICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
IE5vIHRoZXJlIGlzIG5vbmUuIAo+ID4gPiA+ID4gPiAgICAgICAgICAgCj4gPiA+ID4gPiA+ID4g
SSdkIGV4cGVjdCBtdGQxJ3MgcGFyZW50IGJlaW5nIG10ZDAuICAgICAgICAgICAgCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBUaGlzIHdvdWxkIGJlIGEgbmV3IGZlYXR1cmUsIHJpZ2h0PyBJIGRv
bid0IHRoaW5rIGl0IGlzIHRoZSBjYXNlIHRvZGF5LiAgICAgICAgICAKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gV2UgZGVmaW5pdGVseSBkb24ndCB3YW50IG10ZDEgdG8gYXBwZWFyIGFzIGEgcGFydGl0
aW9uIG9mIG10ZDAgaW4gdGhhdAo+ID4gPiA+ID4gY2FzZSAoYmxvY2tzIGluIG10ZDEgY2FuJ3Qg
YmUgbWFwcGVkIHRvIGJsb2NrcyBpbiBtdGQwIHdpdGhvdXQgdGhlIFVCSQo+ID4gPiA+ID4gbGF5
ZXIgYmVpbmcgaW52b2x2ZWQpLiBNYXliZSBpdCdkIGJlIGNsZWFyZXIgaWYgd2UgbW92ZSB0aGUg
cGFyZW50Cj4gPiA+ID4gPiBmaWVsZCB0byBtdGRfcGFydCBhbmQgYWRkIGFuIE1URF9JU19QQVJU
SVRJT04gZmxhZy4gT3IgbWF5YmUgd2UgY2FuCj4gPiA+ID4gPiBqdXN0IGNob29zZSBhIGJldHRl
ciBuYW1lLiAgICAgICAgCj4gPiA+ID4gCj4gPiA+ID4gSSBwcmVmZXIgdGhlIG5hbWUgY2hhbmdl
LiBJIHRoaW5rIHRoZSBjdXJyZW50IHN0cnVjdCBvcmdhbml6YXRpb24KPiA+ID4gPiBpcyByaWdo
dC4gV2hhdCBkbyB5b3Ugc3VnZ2VzdD8gICAgICAKPiA+ID4gCj4gPiA+IEkgZG9uJ3QgaGF2ZSBh
IGJldHRlciBuYW1lLCBzb3JyeS4gICAgCj4gPiAKPiA+IEFjdHVhbGx5IEkgZmluZCAtPnBhcmVu
dCB0b3RhbGx5IGRlc2NyaXB0aXZlLCBhbmQgaW4gUmljaGFyZCdzIGV4YW1wbGUsCj4gPiBJIHdv
dWxkIG5vdCBjYWxsIG10ZDEgYXMgbXRkMCdzIHBhcmVudCwgaXQncyBtb3JlIGxpa2UgYSAidG9w
IHZpcnR1YWwKPiA+IGRldmljZSIgYnV0IGNlcnRhaW5seSBub3QgYSAiZGlyZWN0IiBwYXJlbnQu
ICAKPiAKPiBJdCBkZXBlbmRzIHdoYXQga2luZCBvZiBwYXJlbnRpbmcgd2UncmUgdGFsa2luZyBh
Ym91dCA6UC4gRnJvbSB0aGUKPiBkZXZpY2UgbW9kZWwgcGVyc3BlY3RpdmUsIG10ZDEncyBwYXJl
bnQgaXMgdWJpMC4gRnJvbSB0aGUgTVREIHBhcnRpdGlvbgo+IHBlcnNwZWN0aXZlLCBtdGQxIGhh
cyBubyBwYXJlbnQgKGl0J3MgYSBtYXN0ZXIgTVREIGRldmljZSkuIFRoZSBwcm9ibGVtCj4gaGVy
ZSBpcyB0aGF0ICdwYXJlbnQnIGlzIHZhZ3VlIGVub3VnaCB0aGF0IGl0IGxldHMgcGVvcGxlIHRo
aW5rIGl0J3MKPiByZXByZXNlbnRpbmcgbW9yZSB0aGFuIGEgcGFydGl0aW9uIC0+IHBhcnRpdGlv
bl9wYXJlbnQgcmVsYXRpb25zaGlwLAo+IGhlbmNlIG15IHN1Z2dlc3Rpb24gdG8gbW92ZSB0aGUg
ZmllbGQgdG8gbXRkX3BhcnQgc28gaXQgY2FuIGJlCj4gbmFtZXNwYWNlZCBpbiBtdGQtPnBhcnQu
cGFyZW50LgoKSSB0aGluayBvbmx5IFJpY2hhcmQgZ290IGNvbmZ1c2VkIDpwCgo+IAo+ID4gCj4g
PiBtdGQtPmRpcmVjdF9wYXJlbnQgd291bGQgd29yayBidXQgSSB0aGluayBpdCBpcyBhIGJpdCB0
b28gbG9uZyBhbmQgbW9zdAo+ID4gb2YgdGhlIHBlb3BsZSB3b3VsZCBub3QgdW5kZXJzdGFuZCB3
aHkgd2UgY2FsbCBpdCB0aGlzIHdheSwgaW5zdGVhZCBvZgo+ID4ganVzdCAicGFyZW50Ii4gIAo+
IAo+IC0+cGFydGl0aW9uX3BhcmVudCB3b3VsZCBiZSBtb3JlIGFjY3VyYXRlLCBidXQgSSBhZ3Jl
ZSB3aXRoIHlvdSwgSSdtICAKPiBub3QgYSBiaWcgZmFuIG9mIHRob3NlIGxvbmcgbmFtZXMuIE1h
eWJlIC0+Y29udGFpbmVyPwoKSSBkb24ndCBsaWtlIC0+Y29udGFpbmVyIHNvIG11Y2ggYXMgZm9y
IG1lIGl0IHdvdWxkIHJlZmVyIHRvIHRoaXMKInZpcnR1YWwgcGFyZW50IiBJIHdhcyB0YWxraW5n
IGFib3V0LCBpZS4gVUJJISBJIHRoaW5rIHlvdSBhcmUKcmlnaHQgc2F5aW5nIHRoYXQgdGhlIG1v
c3QgaW1wb3J0YW50IHRoaW5nIGlzIHRvIGJlIGNsZWFyIGluIHRoZQpkb2N1bWVudGF0aW9uIChJ
J2xsIHRyeSB0byBleHBsYWluIGJldHRlcikgYmVjYXVzZSBhbnkgd29yZCBjYW4KcmVmZXIgdG8g
YWxtb3N0IGFueSBjb25jZXB0IGRlcGVuZGluZyBvbiB0aGUgcGVyc29uIHJlYWRpbmcgaXQuCgo+
ID4gCj4gPiBJIHdvdWxkIGxpa2UgdG8gdGFrZSB0aGlzIHBhdGNoIGludG8gNS42LCBzbyBwbGVh
c2UgdGVsbCBtZSB3aGF0IHlvdQo+ID4gcHJlZmVyICgicGFyZW50IiBiZWluZyB0aGUgbW9zdCBz
dHJhaWdodGZvcndhcmQgYW5kIHNpbXBsZSBzb2x1dGlvbiB0bwo+ID4gbWUgOikgKSAgCj4gCj4g
SSB0aGluayB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgaGVyZSBpcyBkb2N1bWVudGluZyB3aGF0
IHRoaXMgZmllbGQKPiBpcyByZXByZXNlbnRpbmcgc28gcGVvcGxlIGNhbiByZWZlciB0byB0aGUg
ZG9jIGlmIHRoZXkgZ2V0IGNvbmZ1c2VkLgoKWWVzLCBJIHdpbGwgc3RpY2sgdG8gLT5wYXJlbnQu
IEFzIHdlIGFyZSBpbiB0aGUgTVREIHN0cnVjdHVyZSwgcG9pbnRpbmcKdGhlIGRpcmVjdCBNVEQg
cGFyZW50IHNlZW1zIGxvZ2ljIHRvIG1lLCBidXQgSSB3aWxsIGV4cGxhaW4gaW4gdGhlIGtkb2MK
dGhhdCBpdCBpcyB0aGUgcGFyZW50IGZyb20gdGhlIE1URCBwYXJ0aXRpb25pbmcgc2NoZW1lIHBv
aW50IG9mIHZpZXcsCmFuZCB0aGlzIGlzIG5vdCByZWxhdGVkIHRvIHRoZSBkZXZpY2UtbW9kZWwg
aGllcmFyY2h5IGF0IGFsbC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
