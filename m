Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC1BC282CC
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 12:59:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB39F20818
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 12:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3XqoX7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB39F20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsHBBYsIhhSo5CZHOg6/IR8TX/DdCHg3RycBT1UKeHk=; b=F3XqoX7dL47cuI
	/jvEi49nPE8FcVR2u3lIenMmXGspbQsaECHX/W6agBYi6tXmHG7GsZsKG2qKYr47kNAnNb19JnWg1
	G2Hhs8WvZppPq1+8YOKPz0yggcLIfrKcTmeLgRPxbmkFISHLvTae78eKDfXchZKC/uJyg7kJHQpsL
	XES+s3DCXjzpSSW0Qfyc7GTslnUHrxpXwWnGVClqqQ7wDBEhm4XiKYm2oy3V/OvD9iRe15vXW9V0l
	x0hP+h7raAHCX0znL/tenT8joOr6yxPzSb9kePBI9+S59skp9VttJ4PxA+WJt+DvjSo+Rt+sbZcXQ
	cs0WNaZqGevWU4fc8L/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr0KP-0003Kw-Tj; Tue, 05 Feb 2019 12:59:53 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr0KM-0003Kc-Og
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 12:59:52 +0000
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 18BC7240002;
 Tue,  5 Feb 2019 12:59:46 +0000 (UTC)
Date: Tue, 5 Feb 2019 13:59:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
Message-ID: <20190205135946.64eda55c@xps13>
In-Reply-To: <20190129153700.18717-1-martink@posteo.de>
References: <20190129153700.18717-1-martink@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_045950_950653_4386F0D7 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: bbrezillon@kernel.org, Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 richard@nod.at, Martin Kepplinger <martin.kepplinger@ginzinger.com>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, han.xu@nxp.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIEtlcHBsaW5nZXIgPG1hcnRpbmtAcG9zdGVvLmRlPiB3cm90ZSBv
biBUdWUsIDI5IEphbiAyMDE5CjE2OjM3OjAwICswMTAwOgoKPiBGcm9tOiBNYXJ0aW4gS2VwcGxp
bmdlciA8bWFydGluLmtlcHBsaW5nZXJAZ2luemluZ2VyLmNvbT4KPiAKPiBEaXNhYmxlIEJDSCBz
b2Z0IHJlc2V0IGFjY29yZGluZyB0byBNWDIzIGVycmF0dW0gIzI4NDcgKCJCQ0ggc29mdAo+IHJl
c2V0IG1heSBjYXVzZSBidXMgbWFzdGVyIGxvY2sgdXAiKSBmb3IgTVgyOCB0b28uIEl0IGhhcyB0
aGUgc2FtZQo+IHByb2JsZW0uCj4gCj4gT2JzZXJ2ZWQgcHJvYmxlbTogb25jZSBwZXIgMTAwLDAw
MCsgTVgyOCByZWJvb3RzIE5BTkQgcmVhZCBmYWlsZWQgb24KPiBETUEgdGltZW91dCBlcnJvcnM6
Cj4gWyAgICAxLjc3MDgyM10gVUJJOiBhdHRhY2hpbmcgbXRkMyB0byB1YmkwCj4gWyAgICAyLjc2
ODA4OF0gZ3BtaV9uYW5kOiBETUEgdGltZW91dCwgbGFzdCBETUEgOjEKPiBbICAgIDMuOTU4MDg3
XSBncG1pX25hbmQ6IEJDSCB0aW1lb3V0LCBsYXN0IERNQSA6MQo+IFsgICAgNC4xNTYwMzNdIGdw
bWlfbmFuZDogRXJyb3IgaW4gRUNDLWJhc2VkIHJlYWQ6IC0xMTAKPiBbICAgIDQuMTYxMTM2XSBV
Qkkgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC0xMTAgd2hpbGUgcmVhZGluZyA2NAo+IGJ5
dGVzIGZyb20gUEVCIDA6MCwgcmVhZCBvbmx5IDAgYnl0ZXMsIHJldHJ5Cj4gWyAgICA0LjE3MTI4
M10gc3RlcCAxIGVycm9yCj4gWyAgICA0LjE3Mzg0Nl0gZ3BtaV9uYW5kOiBDaGlwOiAwLCBFcnJv
ciAtMQo+IAo+IFdpdGhvdXQgQkNIIHNvZnQgcmVzZXQgd2Ugc3VjY2Vzc2Z1bGx5IGV4ZWN1dGVk
IDEsMDAwLDAwMCBNWDI4IHJlYm9vdHMuCj4gCj4gSSBoYXZlIGEgcXVvdGUgZnJvbSBOWFAgcmVn
YXJkaW5nIHRoaXMgcHJvYmxlbSwgZnJvbSBKdWx5IDE4dGggMjAxNjoKPiAKPiAiQXMgdGhlIGku
TVgyMyBhbmQgaS5NWDI4IGFyZSBvZiB0aGUgc2FtZSBnZW5lcmF0aW9uLCB0aGV5IHNoYXJlIG1h
bnkKPiBjaGFyYWN0ZXJpc3RpY3MuIFVuZm9ydHVuYXRlbHksIGFsc28gdGhlIGVycmF0YXMgbWF5
IGJlIHNoYXJlZC4KPiBJbiBjYXNlIG9mIHRoZSBkb2N1bWVudGVkIGVycmF0YXMgYW5kIHRoZSB3
b3JrYXJvdW5kcywgeW91IGNhbiBhbHNvCj4gYXBwbHkgdGhlIHdvcmthcm91bmQgc29sdXRpb24g
b2Ygb25lIGRldmljZSBvbiB0aGUgb3RoZXIgb25lLiBUaGlzIGhhdmUKPiBiZWVuIHJlcG9ydGVk
LCBidXQgSeKAmW0gYWZyYWlkIHRoYXQgdGhlcmUgYXJlIG5vdCBhbiBlc3RpbWF0ZWQgZGF0ZSBm
b3IKPiB1cGRhdGluZyB0aGUgRXJyYXRhIGRvY3VtZW50cy4KPiBQbGVhc2UgYWNjZXB0IG91ciBh
cG9sb2dpZXMgZm9yIGFueSBpbmNvbnZlbmllbmNlcyB0aGlzIG1heSBjYXVzZS4iCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWFuZnJlZCBTY2hsYWVnbCA8bWFuZnJlZC5zY2hsYWVnbEBnaW56aW5nZXIu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLZXBwbGluZ2VyIDxtYXJ0aW4ua2VwcGxpbmdl
ckBnaW56aW5nZXIuY29tPgo+IC0tLQo+IAo+IFRoaXMgaXMgc29tZXRoaW5nIHdlIGhhdmUgaW4g
b3VyIHRyZWUgZm9yIHllYXJzIGFuZCBpcyBydW5uaW5nIG9uCj4gcHJvZHVjdGlvbiBzeXN0ZW1z
IGFuZCBJIGhvcGUgdGhhdCB0aGlzIGhlbHBzIG90aGVycyB0b28uCj4gCj4gdGhhbmtzCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFydGluCgpUaGFua3MgZm9yIHNoYXJpbmcgdGhp
cy4KCk9uIG15IHNpZGUgdGhlIHBhdGNoIGxvb2tzIG9rLCBtYXliZSBhbiBBY2tlZC1ieSBmcm9t
IEhhbiB3b3VsZCBiZQpncmVhdD8KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgoKQm9yaXMsIGRvIHlvdSB3YW50IHRvIHRha2UgdGhpcz8gSWYg
eW91IGRvbid0IGhhdmUgbW9yZSBmaXhlcyB0byBzZW5kIEkKY2FuIHF1ZXVlIGl0IHRvIG5hbmQv
bmV4dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
