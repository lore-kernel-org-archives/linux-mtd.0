Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C750C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5BB20844
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pd7/64gw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A5BB20844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7el/PAAaGM6vUV0XwaxR0GzhIOtYsWYIlSjc086/ZU=; b=Pd7/64gwbVhmpr
	41zRKj8ZBEXDE20DkZw3Z/2Brr/JDolmr5q6lfyB4ZNfUBY4vBZ+CtJKhbacBymC2yvgpdBTRoCa0
	I7ishRge2u0xxDg6SJ+cICfok0yS83C6eKjaf0uhVtljWqF/2SjDnAGIfRKAYr+miROAx+k8sE5NT
	8eRVRJv58OQ8cN1WrO1jtlv7LHJhw+MAuiPa587R6DsjmlnJnRxTzTeilOayS1zg0epOZwicfTuEL
	bW0EcfLTqPB4EccrzQX1TlSdXexEatlH/19VkVA1wqplLavWMfKabGGqQEcTlsd4badE/C3z+Ur8q
	Y9e63wsmwj6f5uUxNCRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1Uw-0003I5-2t; Tue, 05 Feb 2019 14:14:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1Us-0003Hk-7N
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:14:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4551527FB12;
 Tue,  5 Feb 2019 14:14:41 +0000 (GMT)
Date: Tue, 5 Feb 2019 15:14:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
Message-ID: <20190205151437.33f4d990@collabora.com>
In-Reply-To: <20190205135946.64eda55c@xps13>
References: <20190129153700.18717-1-martink@posteo.de>
 <20190205135946.64eda55c@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_061446_405785_65589D06 
X-CRM114-Status: GOOD (  20.17  )
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
Cc: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>, richard@nod.at,
 Martin Kepplinger <martin.kepplinger@ginzinger.com>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Martin Kepplinger <martink@posteo.de>,
 han.xu@nxp.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCA1IEZlYiAyMDE5IDEzOjU5OjQ2ICswMTAwCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBNYXJ0aW4sCj4gCj4gTWFydGluIEtlcHBs
aW5nZXIgPG1hcnRpbmtAcG9zdGVvLmRlPiB3cm90ZSBvbiBUdWUsIDI5IEphbiAyMDE5Cj4gMTY6
Mzc6MDAgKzAxMDA6Cj4gCj4gPiBGcm9tOiBNYXJ0aW4gS2VwcGxpbmdlciA8bWFydGluLmtlcHBs
aW5nZXJAZ2luemluZ2VyLmNvbT4KPiA+IAo+ID4gRGlzYWJsZSBCQ0ggc29mdCByZXNldCBhY2Nv
cmRpbmcgdG8gTVgyMyBlcnJhdHVtICMyODQ3ICgiQkNIIHNvZnQKPiA+IHJlc2V0IG1heSBjYXVz
ZSBidXMgbWFzdGVyIGxvY2sgdXAiKSBmb3IgTVgyOCB0b28uIEl0IGhhcyB0aGUgc2FtZQo+ID4g
cHJvYmxlbS4KPiA+IAo+ID4gT2JzZXJ2ZWQgcHJvYmxlbTogb25jZSBwZXIgMTAwLDAwMCsgTVgy
OCByZWJvb3RzIE5BTkQgcmVhZCBmYWlsZWQgb24KPiA+IERNQSB0aW1lb3V0IGVycm9yczoKPiA+
IFsgICAgMS43NzA4MjNdIFVCSTogYXR0YWNoaW5nIG10ZDMgdG8gdWJpMAo+ID4gWyAgICAyLjc2
ODA4OF0gZ3BtaV9uYW5kOiBETUEgdGltZW91dCwgbGFzdCBETUEgOjEKPiA+IFsgICAgMy45NTgw
ODddIGdwbWlfbmFuZDogQkNIIHRpbWVvdXQsIGxhc3QgRE1BIDoxCj4gPiBbICAgIDQuMTU2MDMz
XSBncG1pX25hbmQ6IEVycm9yIGluIEVDQy1iYXNlZCByZWFkOiAtMTEwCj4gPiBbICAgIDQuMTYx
MTM2XSBVQkkgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC0xMTAgd2hpbGUgcmVhZGluZyA2
NAo+ID4gYnl0ZXMgZnJvbSBQRUIgMDowLCByZWFkIG9ubHkgMCBieXRlcywgcmV0cnkKPiA+IFsg
ICAgNC4xNzEyODNdIHN0ZXAgMSBlcnJvcgo+ID4gWyAgICA0LjE3Mzg0Nl0gZ3BtaV9uYW5kOiBD
aGlwOiAwLCBFcnJvciAtMQo+ID4gCj4gPiBXaXRob3V0IEJDSCBzb2Z0IHJlc2V0IHdlIHN1Y2Nl
c3NmdWxseSBleGVjdXRlZCAxLDAwMCwwMDAgTVgyOAo+ID4gcmVib290cy4KPiA+IAo+ID4gSSBo
YXZlIGEgcXVvdGUgZnJvbSBOWFAgcmVnYXJkaW5nIHRoaXMgcHJvYmxlbSwgZnJvbSBKdWx5IDE4
dGggMjAxNjoKPiA+IAo+ID4gIkFzIHRoZSBpLk1YMjMgYW5kIGkuTVgyOCBhcmUgb2YgdGhlIHNh
bWUgZ2VuZXJhdGlvbiwgdGhleSBzaGFyZQo+ID4gbWFueSBjaGFyYWN0ZXJpc3RpY3MuIFVuZm9y
dHVuYXRlbHksIGFsc28gdGhlIGVycmF0YXMgbWF5IGJlIHNoYXJlZC4KPiA+IEluIGNhc2Ugb2Yg
dGhlIGRvY3VtZW50ZWQgZXJyYXRhcyBhbmQgdGhlIHdvcmthcm91bmRzLCB5b3UgY2FuIGFsc28K
PiA+IGFwcGx5IHRoZSB3b3JrYXJvdW5kIHNvbHV0aW9uIG9mIG9uZSBkZXZpY2Ugb24gdGhlIG90
aGVyIG9uZS4gVGhpcwo+ID4gaGF2ZSBiZWVuIHJlcG9ydGVkLCBidXQgSeKAmW0gYWZyYWlkIHRo
YXQgdGhlcmUgYXJlIG5vdCBhbiBlc3RpbWF0ZWQKPiA+IGRhdGUgZm9yIHVwZGF0aW5nIHRoZSBF
cnJhdGEgZG9jdW1lbnRzLgo+ID4gUGxlYXNlIGFjY2VwdCBvdXIgYXBvbG9naWVzIGZvciBhbnkg
aW5jb252ZW5pZW5jZXMgdGhpcyBtYXkgY2F1c2UuIgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
YW5mcmVkIFNjaGxhZWdsIDxtYW5mcmVkLnNjaGxhZWdsQGdpbnppbmdlci5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJ0aW4gS2VwcGxpbmdlciA8bWFydGluLmtlcHBsaW5nZXJAZ2luemluZ2Vy
LmNvbT4KPiA+IC0tLQo+ID4gCj4gPiBUaGlzIGlzIHNvbWV0aGluZyB3ZSBoYXZlIGluIG91ciB0
cmVlIGZvciB5ZWFycyBhbmQgaXMgcnVubmluZyBvbgo+ID4gcHJvZHVjdGlvbiBzeXN0ZW1zIGFu
ZCBJIGhvcGUgdGhhdCB0aGlzIGhlbHBzIG90aGVycyB0b28uCj4gPiAKPiA+IHRoYW5rcwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFydGluICAKPiAKPiBUaGFua3MgZm9yIHNo
YXJpbmcgdGhpcy4KPiAKPiBPbiBteSBzaWRlIHRoZSBwYXRjaCBsb29rcyBvaywgbWF5YmUgYW4g
QWNrZWQtYnkgZnJvbSBIYW4gd291bGQgYmUKPiBncmVhdD8KPiAKPiBSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAKPiBCb3JpcywgZG8geW91
IHdhbnQgdG8gdGFrZSB0aGlzPyBJZiB5b3UgZG9uJ3QgaGF2ZSBtb3JlIGZpeGVzIHRvIHNlbmQK
PiBJIGNhbiBxdWV1ZSBpdCB0byBuYW5kL25leHQuCgpJJ2xsIHRha2UgaXQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
