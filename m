Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63656C83F2C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAjwXks9kDJbqHz4BZSSclkz6qA7FztJe5t9LEJpfaQ=; b=jA2z9jFczRamfY
	HYTYrIaJqHgIFSiVBH7B7XreLXcsdQDPaXQqoOMtfFBTNkIdC+WT9ssVdFwysXyeNhc9XJSe5dKI0
	3nrxrJeP/zj4gBnVq0GumUaggH+jH+8CpODmhEKUXQ6bUbacRnNZoAKtR5QF5dPW6Z3RQ+dJiYPNe
	yd5wihZYrQ/Va6V/7hgI3P4DSchu7SRLV8t6vXPbo/XSq3VCfnuS9FCsQgNU26cnCPagIgJDlfefp
	UcNYGjdRJPWMdnDJn9QhUzcp/thXrwphD3PdF/IFtKof8jD0v0qbnGRjcBY7+tQqIMnZSusCppFRH
	vZjrF0HD0FpPUbfxW2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAcb-004H7U-0R;
	Mon, 04 Sep 2023 14:32:09 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAcY-004H6c-1C
	for linux-mtd@lists.infradead.org;
	Mon, 04 Sep 2023 14:32:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2082060004;
	Mon,  4 Sep 2023 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693837918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3BueW+5ouWvJdqGn30lncsv3tQGn2v6ujqAYNE8/yQ=;
	b=B8zsWGfaRq+NOXojK+ZQW9UC5UkQP+7AMKTkP44ekYibvMe8O0rKxFED0FyK0QngteUilU
	M1L/aPpI2YzaxJVrTJx4qog1Li4fyXycnvBg1ky9JL8pBJUuamU0ySrWuR37Wjt4kne19F
	XHqC6Y1aXFPMlauWCFk8Y71VhAd11FuIP0ULlX/D47pTkaiTeZ48UBNdf5gKfBL+6a+x2p
	OM3M7S9rPrGvTXiuwKJCVCmvafJK+WM+isK3sBN6XGMdfZKEcCZ0tbICwWLHhpDVFIf33s
	MevfU36nI3nbJWLBnHbHVjeRPtmhapP8mUrPwZOtSlJ876DORsFVWRcr6/DB1g==
Date: Mon, 4 Sep 2023 16:31:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
Message-ID: <20230904163156.4bdb8c06@xps-13>
In-Reply-To: <90a53eda-bbeb-dffa-0f90-6fd229f555e6@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
	<20230822122534.872646-3-mmkurbanov@sberdevices.ru>
	<20230822153556.630e65b9@xps-13>
	<01925ff8-1d19-a729-429a-89866fad319f@sberdevices.ru>
	<20230823104143.760cc5bc@xps-13>
	<f873d775-cda9-302d-a651-0113c7c7dc84@sberdevices.ru>
	<20230823133956.0a505a20@xps-13>
	<ccf3099f-0e10-a87c-be83-4a414f01dca7@sberdevices.ru>
	<90a53eda-bbeb-dffa-0f90-6fd229f555e6@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_073206_574661_5AD4AD5E 
X-CRM114-Status: GOOD (  22.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDQgU2Vw
IDIwMjMgMTc6MjA6NTkgKzAzMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAyNC4wOC4yMDIzIDEy
OjM1LCBNYXJ0aW4gS3VyYmFub3Ygd3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMjMuMDguMjAyMyAx
NDozOSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+PiBIaSBNYXJ0aW4sCj4gPj4KPiA+PiBtbWt1
cmJhbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMjMgQXVnIDIwMjMgMTQ6MzM6NTcg
KzAzMDA6Cj4gPj4KPiA+Pj4gSGkgTWlxdWVsLAo+ID4+Pgo+ID4+PiBPbiAyMy4wOC4yMDIzIDEx
OjQxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4+Pj4gSGkgTWFydGluLAo+ID4+Pj4KPiA+Pj4+
IEkgZG9uJ3QgdGhpbmsgdGhlIGZvdXIgYnl0ZXMgaGF2ZSBhbnkgImJhZCBibG9jayBzcGVjaWZp
YyIgbWVhbmluZy4gSW4KPiA+Pj4+IHByYWN0aWNlLCB0aGUgZGF0YXNoZWV0IHN0YXRlczoKPiA+
Pj4+Cj4gPj4+PiAJVmFsdWUgcHJvZ3JhbW1lZCBmb3IgYmFkIGJsb2NrIGF0IHRoZSBmaXJzdCBi
eXRlIG9mIHNwYXJlCj4gPj4+PiAJYXJlYTogMDBoCj4gPj4+Pgo+ID4+Pj4gU28gb25seSB0aGUg
Zmlyc3QgYnl0ZSBpcyB1c2VkIHRvIG1hcmsgdGhlIGJsb2NrIGJhZCwgdGhlIHJlc3QgaXMKPiA+
Pj4+IHByb2JhYmx5IG1hcmtlZCAicmVzZXJ2ZWQiIGZvciBzaW1wbGljaXR5LiBJIGJlbGlldmUg
d2Ugc2hvdWxkIGtlZXAgdGhlCj4gPj4+PiBjdXJyZW50IGxheW91dCBiZWNhdXNlIGl0IHdvdWxk
IG90aGVyd2lzZSBicmVhayB1c2VycyBmb3Igbm8gcmVhbAo+ID4+Pj4gcmVhc29uLiAgCj4gPj4+
Cj4gPj4+IEkgYWdyZWUgd2l0aCB5b3UgdGhhdCB0aGlzIGNhbiBicmVhayB0aGUgd29yayBvZiB1
c2VycyB3aG8gdXNlIE9PQi4KPiA+Pj4gSG93ZXZlciwgSSBiZWxpZXZlIGl0IHdvdWxkIGJlIG1v
cmUgYXBwcm9wcmlhdGUgdG8gdXNlIGFuIG9mZnNldCBvZiA0LAo+ID4+PiBhcyB0aGUgbWljcm9u
IGNoaXAgY2FuIHVzZSBhbGwgNCBieXRlcyBmb3IgYWRkaXRpb25hbCBkYXRhIGFib3V0IHRoZQo+
ID4+PiBiYWQgYmxvY2suIFNvLCB0aGVyZSBpcyBhIG5vbi16ZXJvIHByb2JhYmlsaXR5IG9mIGxv
c2luZyBPT0IgZGF0YSBpbgo+ID4+PiB0aGUgcmVzZXJ2ZWQgYXJlYSAoMiBieXRlcykgd2hlbiB0
aGUgaGFyZHdhcmUgY2hpcCBhdHRlbXB0cyB0byBtYXJrCj4gPj4+IHRoZSBibG9jayBhcyBiYWQu
Cj4gPj4KPiA+PiBJcyB0aGlzIHJlYWxseSBhIHByb2Nlc3MgdGhlIGNoaXAgY2FuIGRvPyBBcmVu
J3QgYmFkIGJsb2NrcyBmYWN0b3J5Cj4gPj4gbWFya2VkIG9ubHk/Cj4gPiAKPiA+IEFjdHVhbGx5
LCB0aGVyZSBpcyBteSB1bmRlcnN0YW5kaW5nLCBJ4oCZbSBub3Qgc3VyZSBleGFjdGx5Lgo+IAo+
IEkgdGVzdGVkIHdpdGggYW4gb2Zmc2V0IG9mIDIsIG5vIHJlYWQvd3JpdGUgZXJyb3JzIHdlcmUg
ZGV0ZWN0ZWQKPiAoaW5jbHVkaW5nIHJlYWQvd3JpdGUgdG8gT09CKS4gQnV0IEkgZG9uJ3QgaGF2
ZSBhIGZsYXNoIGNoaXAgd2l0aAo+IGZhY3RvcnkgYmFkIGJsb2NrcyB5ZXQsIHdoZW4gSSBmaW5k
IHN1Y2ggYSBmbGFzaCwgSSB3aWxsIHJlcG9ydCB0aGUKPiByZXN1bHRzLgoKT2suCgo+IERvIEkg
bmVlZCB0byBzZW5kIHRoZSB2MyBvZiB0aGUgcGF0Y2ggd2l0aCBvbmx5IGZpcnN0IGNvbW1pdCAo
ImNvcnJlY3QKPiBiaXRtYXNrIGZvciBlY2Mgc3RhdHVzIik/CgpZZXMgcGxlYXNlLCB3aXRoIEZy
aWVkZXIncyBjb21tZW50cyBmaXhlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
