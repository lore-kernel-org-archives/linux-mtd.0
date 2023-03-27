Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBC0C761A6
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zq4Gd1ziUfGSXzNSjJqQzPu0xTya4d6fFssMl3s4x9I=; b=k0uBED4ZO8YX3C
	Sk8UZsCf9svPKxpg58hg9AtfWZbnjBi/ZAKW9saSySh36+BpPLov1/x8PlAT76MWYZvTvzqND7jDj
	+//KA8RdT65oLVDvPg4aTsjjQAjE3L7cOlb3gDuko+V48LlpF5E9XZBG6eEmbYLzuFE/nuYV1GWBp
	xWYb3+nXrBbiQ+xdAAReLeOkv4XzHZwv4jxPoNbqjEAYTlyHZgdnFeklLSKLBOvjXPsQy7qGtZx9M
	nBgZ/mdm4G0bycIJjBjvd2PWeHS3KyRXPJdepDqEDvn+k/6XPKcU/BRU90+wqqjhvTzXbF/ywo0Nl
	vZpXNqD/C4qRPO4DCYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pghxZ-00ABWQ-0l;
	Mon, 27 Mar 2023 08:12:09 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pghxW-00ABUr-1N
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 08:12:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C6281C0015;
	Mon, 27 Mar 2023 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679904719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhvzASfzINt429FFDENdwaX1DAN8o/J7JPa/K12PqeE=;
	b=KtBVpLqLxvlJs8VA5ludhzfGeipr1FWpr3sHAGZ3b3nWk8iyPaq8kzNPhZGhJmjiod+8LB
	rvro547hpD376hvjvWR5ia9QivFHApEOtdEN/7R6yW+iNlxTv/8NIHzCb4XFbPRI+udoJz
	0KCOyrK19k/RKZ7RyyFC7yWknSlFCg6rjdMu4UX4tOFUpfPF6e8ZgRFKvUk6f3iBk5yKfA
	D28+bEjlL3UkXOEF9j4pPpHoID2r+79ciMCxRHNYoUlGqH4gQCttfI9kjplPGiQTReJKGQ
	56COzZAup502YD32YBhgNaW1Qk9QtcgwZqZBilBN0x2L6G21Nn9RXGdENtlR0g==
Date: Mon, 27 Mar 2023 10:11:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: do not support EDO mode
Message-ID: <20230327101156.0ec2816a@xps-13>
In-Reply-To: <fcb600af-88dc-55a7-917e-4cf4673c2973@foss.st.com>
References: <20230324160918.826452-1-christophe.kerello@foss.st.com>
	<20230324172528.4d3ccd4b@xps-13>
	<f4c32aa5-e5b1-6465-7708-ef0281baf0af@foss.st.com>
	<fcb600af-88dc-55a7-917e-4cf4673c2973@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_011206_633590_474A2F5D 
X-CRM114-Status: GOOD (  18.30  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBN
b24sIDI3IE1hciAyMDIzIDEwOjAyOjEzICswMjAwOgoKPiBIZWxsbyBNaXF1ZWwsCj4gCj4gT24g
My8yNC8yMyAxNzozNCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOgo+ID4gSGVsbG8gTWlxdWVs
LAo+ID4gCj4gPiBPbiAzLzI0LzIzIDE3OjI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4g
SGkgQ2hyaXN0b3BoZSwKPiA+Pgo+ID4+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3
cm90ZSBvbiBGcmksIDI0IE1hciAyMDIzIDE3OjA5OjE4ICswMTAwOgo+ID4+ICAKPiA+Pj4gRk1D
MiBjb250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgRURPIG1vZGUgKHRpbWluZ3MgbW9kZSA0IGFu
ZCA1KS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJp
c3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gPj4+IEZpeGVzOiAyY2Q0NTdmMzI4YzEgKCJt
dGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGFkZCBTVE0zMiBGTUMyIE5BTkQgPj4+IGZsYXNoIGNv
bnRyb2xsZXIgZHJpdmVyIikKPiA+Pj4gLS0tCj4gPj4+IMKgIGRyaXZlcnMvbXRkL25hbmQvcmF3
L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMyArKysKPiA+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgPj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9u
YW5kLmMKPiA+Pj4gaW5kZXggNWQ2MjcwNDhjNDIwLi4zYWJiNjNkMDBhMGIgMTAwNjQ0Cj4gPj4+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+IEBAIC0xNTMxLDYg
KzE1MzEsOSBAQCBzdGF0aWMgaW50ID4+PiBzdG0zMl9mbWMyX25mY19zZXR1cF9pbnRlcmZhY2Uo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPiA+Pj4gwqDCoMKgwqDCoCBpZiAo
SVNfRVJSKHNkcnQpKQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoc2Ry
dCk7Cj4gPj4+ICvCoMKgwqAgaWYgKHNkcnQtPnRSQ19taW4gPCAzMDAwMCkgIAo+ID4+Cj4gPj4g
V2hlbiBpbnRyb2R1Y2luZyBOVi1ERFIgc3VwcG9ydCB3ZSBhcyB3ZWxsIGFkZGVkIGEgdGltaW5n
cy5tb2RlIGZpZWxkLAo+ID4+IHBlcmhhcHMgeW91IGNvdWxkIHVzZSBpdD8gIAo+ID4gCj4gPiBZ
ZXMsIEkgY2FuIHVzZSBpdC4gSXQgd2lsbCBiZSBkb25lIGluIFYyLgo+ID4gCj4gPiBSZWdhcmRz
LAo+ID4gQ2hyaXN0b3BoZSBLZXJlbGxvLgo+ID4gICAKPiAKPiBJIGhhZCBhIGxvb2sgYXQgS2Vy
bmVsIExUUywgYW5kIHRpbWluZ3MubW9kZSB3YXMgaW50cm9kdWNlZCBvbiBLZXJuZWwgTFRTIDUu
MTAuIEFzIHRoaXMgcGF0Y2ggaGFzIGFsc28gdG8gYmUgYXBwbGllZCBvbiBLZXJuZWwgTFRTIDUu
NCwgbXkgcHJvcG9zYWwgaXMgdG8gc2VuZCBhIG5ldyBwYXRjaCBzZXQuIFRoZSBmaXJzdCBwYXRj
aCB3aWxsIGJlIHRoZSBjdXJyZW50IHBhdGNoIChmaXggZm9yIGFsbCBLZXJuZWwgTFRTKSBhbmQg
dGhlIHNlY29uZCBwYXRjaCB3aWxsIHVzZSB0aW1pbmdzLm1vZGUgaW5zdGVhZCBvZiBjaGVja2lu
ZyB0UkNfbWluIHRpbWluZ3MgZm9yIG5leHQgS2VybmVsIGRlbGl2ZXJ5LiBJcyB0aGlzIHByb3Bv
c2FsIGFjY2VwdGFibGU/CgpXb3JrcyBmb3IgbWUhCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
