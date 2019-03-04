Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6DDC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:59:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F0820830
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+dM+9bv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OZ1ZSTDx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F0820830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YFa3SKJ+1GxQJ+D3HiKDVkIr/FgTQJanQemGi0S1/g=; b=b+dM+9bv2lmLPH
	IMeKYKAw1qAIbXFSYlVuD9xJe3YyMMg5TmOelgupZ+8tb7aSLZYjiGymb3loqcdqJKgd9zfRhB3UW
	Jqtk8cTsahd+p8ji2bsC1A9EtRFuBpiWNLggPTB+KoyKWl9K8ejqVAynDU3x/ZYSDHM+8GigYhRoa
	PzyOu/R9hI0d6jdVKAM/dKyjs0JajSSbaRHWkqmi6G9A2vpYYluwXhNGVDlLy4B/oytHQi2xtbNjH
	X5Ty4x7Tl0HRVfa0Jz7EQL6a4H2pEANB1F38VIzeeR7hSo0gkAPniZ06PEH65KV4IdDZGWFWnutUC
	4ygbN/5X7EnGH/xm/IdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0soN-0000yG-VG; Mon, 04 Mar 2019 18:59:39 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0soL-0000xt-Au
 for linux-mtd@bombadil.infradead.org; Mon, 04 Mar 2019 18:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1IEwi0V1yXalHgsh2V2EV86BSmKSusTabLZbov/YzZo=; b=OZ1ZSTDxS+9csa3VZI+Mij+l20
 CgaPlt1vr04hUHQ2vIpKGlRe5XrwWaATs9oiydv5m1XuSmDkomh64ar5O3yATO+oPGFFaZwKy5Ebb
 GPhAy0ggNuOdPxyarPDrOOs5yxZprCM+MJSGKWj6p1f+Bnht/opYlboF9eHUdXKOiWa65HKFWWNvy
 DPnWtjHNIfrlruTrU4udkBai45RBdvsxfgU/jYJm+z97iB+kkok5T/TT2uJjZZJs7CYxjUgm5ikUH
 5bvSOhtk3ReaqEvL+hGw9pv+/u8QO3e8J+p4A1Zcpn/Ii4T0iWVLTPEUxRyJKuN0H2yzmIHZhQBfm
 IonRK7mg==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0soI-00082r-AW
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 18:59:35 +0000
X-Originating-IP: 77.136.15.76
Received: from xps13 (76.15.136.77.rev.sfr.net [77.136.15.76])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B8CA7E0002;
 Mon,  4 Mar 2019 18:58:55 +0000 (UTC)
Date: Mon, 4 Mar 2019 19:58:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
Message-ID: <20190304195852.45c056f6@xps13>
In-Reply-To: <1551723830.4932.3@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-2-paul@crapouillou.net>
 <20190304105014.0cceea0a@xps13> <1551723830.4932.3@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_135934_719061_4C5A18BA 
X-CRM114-Status: GOOD (  24.25  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBN
b24sIDA0IE1hciAyMDE5IDE5OjIzOjUwCiswMTAwOgoKPiBPbiBNb24sIE1hciA0LCAyMDE5IGF0
IDEwOjUwIEFNLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiA+IEhpIFBhdWwsCj4gPiAKPiA+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3Uu
bmV0IDxtYWlsdG86cGF1bEBjcmFwb3VpbGxvdS5uZXQ+PiA+IHdyb3RlIG9uIFNhdCwgIDkgRmVi
IDIwMTkgMTY6MjI6NTgKPiA+IC0wMzAwOgo+ID4gICAKPiA+PiAgVGhlIEpaNDc0MCBFQ0MgaGFy
ZHdhcmUgaXMgbm90IEJDSCBidXQgUmVlZC1Tb2xvbW9uLCBzbyBpdCBtYWtlcyA+PiBtb3JlCj4g
Pj4gIHNlbnNlIHRvIHVzZSB0aGUgbW9yZSBnZW5lcmljIEVDQyB0ZXJtLiAgCj4gPj4gPj4gIFNp
Z25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0ID4+IDxtYWls
dG86cGF1bEBjcmFwb3VpbGxvdS5uZXQ+PiAgCj4gPj4gIC0tLSAgCj4gPj4gPj4gIENoYW5nZXM6
Cj4gPj4gPj4gIHYzOiBOZXcgcGF0Y2gKPiA+PiA+PiAgdjQ6IE5vIGNoYW5nZQo+ID4+ID4+ICAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsano0NzgwLW5hbmQudHh0ICAgIHwg
MTggPj4gKysrKysrKysrLS0tLS0tLS0tICAKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pICAKPiA+PiA+PiAgZGlmZiAtLWdpdCA+PiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxqejQ3ODAtbmFuZC50eHQg
Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsano0Nzgw
LW5hbmQudHh0ICAKPiA+PiAgaW5kZXggYTViOTQwZjE4YmY2Li41YTQ1Y2M1NGY0NmQgMTAwNjQ0
Cj4gPj4gIC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5p
YyxqejQ3ODAtbmFuZC50eHQKPiA+PiAgKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dAo+ID4+ICBAQCAtMSw0ICsxLDQgQEAK
PiA+PiAgLSogSW5nZW5pYyBKWjQ3ODAgTkFORC9CQ0gKPiA+PiAgKyogSW5nZW5pYyBKWjQ3ODAg
TkFORC9FQ0MgIAo+ID4+ID4+ICAgVGhpcyBmaWxlIGRvY3VtZW50cyB0aGUgZGV2aWNlIHRyZWUg
YmluZGluZ3MgZm9yIE5BTkQgZmxhc2ggPj4gZGV2aWNlcyBvbiB0aGUgIAo+ID4+ICAgSlo0Nzgw
LiBOQU5EIGRldmljZXMgYXJlIGNvbm5lY3RlZCB0byB0aGUgTkVNQyBjb250cm9sbGVyID4+IChk
ZXNjcmliZWQgaW4KPiA+PiAgQEAgLTE0LDEwICsxNCwxMCBAQCBSZXF1aXJlZCBOQU5EIGNvbnRy
b2xsZXIgZGV2aWNlIHByb3BlcnRpZXM6Cj4gPj4gICAgIGFuIG9mZnNldCBvZiAwIGFuZCBhIHNp
emUgb2YgMHgxMDAwMDAwIChpLmUuIHRoZSB3aG9sZSBORU1DID4+IGJhbmspLiAgCj4gPj4gPj4g
ICBPcHRpb25hbCBOQU5EIGNvbnRyb2xsZXIgZGV2aWNlIHByb3BlcnRpZXM6ICAKPiA+PiAgLS0g
aW5nZW5pYyxiY2gtY29udHJvbGxlcjogVG8gbWFrZSB1c2Ugb2YgdGhlIGhhcmR3YXJlIEJDSCA+
PiBjb250cm9sbGVyLCB0aGlzCj4gPj4gIC0gIHByb3BlcnR5IG11c3QgY29udGFpbiBhIHBoYW5k
bGUgZm9yIHRoZSBCQ0ggY29udHJvbGxlciBub2RlLiBUaGUgPj4gcmVxdWlyZWQKPiA+PiAgKy0g
aW5nZW5pYyxiY2gtY29udHJvbGxlcjogVG8gbWFrZSB1c2Ugb2YgdGhlIGhhcmR3YXJlIEVDQyA+
PiBjb250cm9sbGVyLCB0aGlzCj4gPj4gICsgIHByb3BlcnR5IG11c3QgY29udGFpbiBhIHBoYW5k
bGUgZm9yIHRoZSBFQ0MgY29udHJvbGxlciBub2RlLiBUaGUgPj4gcmVxdWlyZWQgIAo+ID4gCj4g
PiBJIHRoaW5rIHRoZXJlIGlzIGFscmVhZHkgYSAnZWNjLWVuZ2luZScgcHJvcGVydHkgdXNlZCBi
eSBNVEsgYW5kIEF0bWVsCj4gPiBOQU5EIGNvbnRyb2xsZXJzIHRvIHBvaW50IHRvIHRoZSBFQ0Mg
ZW5naW5lIGJsb2NrLiBQbGVhc2UgdXNlIHRoaXMKPiA+IHByb3BlcnR5IGluc3RlYWQgb2YgdGhl
IGluZ2VuaWMgc3BlY2lmaWMgb25lLiAgCj4gCj4gaW5nZW5pYyxiY2gtY29udHJvbGxlciBpcyBh
bHJlYWR5IGluIHRoZSBkZXZpY2V0cmVlIEFCSS4gSSBjYW4ndCBjaGFuZ2UgaXQgbm93Li4uCgpP
aCwgcmlnaHQuLi4KCldlbGwsIHNhbWUgdGhpbmcgYXMgYmVmb3JlLCBtYXliZSB5b3UgY2FuIGNo
YW5nZSBpdCBhbmQga2VlcCB0aGUgZHJpdmVyCmJhY2t3YXJkIGNvbXBhdGlibGU/IEkgZG9uJ3Qg
d2FudCBuZXcgRFQgdG8gdXNlIHRoaXMgcHJvcGVydHkgYmVjYXVzZQppdCBpcyBub3QgZ2VuZXJp
YyBhbmQgd2UgbXVzdCBoYXZlIGEgd2F5IGZyb20gdGhlIGNvcmUgdG8gZmluZCB0aGUgRUNDCmVu
Z2luZSBoYW5kbGUgd2hlbiB0aGUgY29udHJvbGxlciBkb2VzIG5vdCBlbWJlZCBvbmUgaXRzZWxm
ICh0aHVzLCB0aGUKZWNjLWVuZ2luZSBwcm9wZXJ0eSB3aGljaCBpcyBhcm91bmQgZm9yIHF1aXRl
IHNvbWUgdGltZSBhbHJlYWR5KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
