Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CAEC10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODBs9sGYxTmYc713snnt5rke3xv28aSI5NbfGULAWRE=; b=1i8OTuwlI+Qqw1
	nSzvWAP1UBjMLcUDjwtKNhViyXdeZ/iu+jZYo7ese/nF2d1Gp354cwG6Tv2euk3DGVF+tiuiXER07
	wpGx3FdS+LZLtxd5nJ8RJWrPCmJUAy6Abq1QZ5ML+CY0jZYRFkWybg6Q2QLJWJfob8e7doN+zVRdT
	wn3zR/nPGRQ5dL2JfSKxQoVsvaxcoaMLZptLikmo9g13wvjnTVWiNjvGAT0hiqfhhI4VpPEymS3jP
	9j7CGK0am8Z/byGI0d2yGSLgztuSKPhDiRzY9aeUzYUICuY26t5DwPm0I2SA0RkyUygUyq0lDQ612
	hyKCle9zA/dPiPpEBnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Jy1-0000000AvsY-035B;
	Tue, 07 May 2024 12:30:45 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Jxx-0000000AvrJ-20AX
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 12:30:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA2BF1BF20E;
	Tue,  7 May 2024 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715085037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UF3Lp0ClfQg7UafugEz3LZzKA+AYQTo1RwZcYDd/u/I=;
	b=f+86aHQ9/4kQaoi6fdD6zZBLzLkKboLXMU0h+AlHjwCllBT6zAM0QIp01d4/fXngxLsRkd
	RzOESzsd+XyRS3L0wgOFvRd5+1fefDH/V1cRwlJCjqYKiQ4lxtLH6Ss35TTjSGwXRyWzLl
	kc4qzLeO8FSA/NTrBCCOGCeBtZ8sP7uUxAkIPo1QVT7VDtBSQEgeq+sBzjQMMNloUivl6q
	9GH/rsWc1chHwCNgN1DWcsdWwCLZR5p4CEvbLniFYfgtbTku/DMdCVXLTourrfm7Hctm0z
	GxRa80wuI0YB98YXHDeRT2i6aaE93JBOIsuYjRgel7+LMh+MPbFq1kRojwwhOQ==
Date: Tue, 7 May 2024 14:30:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand_ecc_is_strong_enough() doesn't trigger
Message-ID: <20240507143036.1cf1a3fd@xps-13>
In-Reply-To: <Zhe2JtvvN1M4Ompw@pengutronix.de>
References: <Zhe2JtvvN1M4Ompw@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_053041_818394_DBEA67A3 
X-CRM114-Status: GOOD (  13.72  )
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

SGksCgpzLmhhdWVyQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFRodSwgMTEgQXByIDIwMjQgMTI6
MDY6MzAgKzAyMDA6Cgo+IEhpLAo+IAo+IEkgYW0gY3VycmVudGx5IHdvcmtpbmcgd2l0aCBhIE5B
TkQgY2hpcCByZXF1aXJpbmcgNCBiaXQgY29ycmVjdGlvbiBwZXIKPiA1MTIgYnl0ZSBkYXRhIHdo
aWxlIG15IE5BTkQgZHJpdmVyIG9ubHkgc3VwcG9ydHMgMSBiaXQgY29ycmVjdGlvbiwgc28KPiBJ
IHdvdWxkIGFzc3VtZSB0aGlzIHRvIHRyaWdnZXI6Cj4gCj4gCS8qIEVDQyBzYW5pdHkgY2hlY2s6
IHdhcm4gaWYgaXQncyB0b28gd2VhayAqLwo+IAlpZiAoIW5hbmRfZWNjX2lzX3N0cm9uZ19lbm91
Z2goJmNoaXAtPmJhc2UpKQo+IAkJcHJfd2FybigiV0FSTklORzogJXM6IHRoZSBFQ0MgdXNlZCBv
biB5b3VyIHN5c3RlbSAoJWRiLyVkQikgaXMgdG9vIHdlYWsgY29tcGFyZWQgdG8gdGhlIG9uZSBy
ZXF1aXJlZCBieSB0aGUgTkFORCBjaGlwICglZGIvJWRCKVxuIiwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBtdGQtPm5hbWUsIGNoaXAtPmVjYy5zdHJlbmd0aCwgY2hpcC0+ZWNjLnNpemUsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgbmFuZGRldl9nZXRfZWNjX3JlcXVpcmVtZW50cygmY2hp
cC0+YmFzZSktPnN0cmVuZ3RoLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIG5hbmRkZXZfZ2V0
X2VjY19yZXF1aXJlbWVudHMoJmNoaXAtPmJhc2UpLT5zdGVwX3NpemUpOwo+IAo+IG5hbmRfZWNj
X2lzX3N0cm9uZ19lbm91Z2goKSB3b3JrcyBvbiBuYW5kLT5lY2MuY3R4LmNvbmYuc3RlcF9zaXpl
LCBidXQKPiB0aGlzIG9ubHkgZXZlciBzZWVtcyB0byBiZSBpbml0aWFsaXplZCBieSB0aGUgdmFy
aW91cyBlY2Mtc3ctKgo+IGFsZ29yaXRobXMuCj4gCj4gVGhpcyB3YXMgY2hhbmdlZCBpbiA4YzEy
NjcyMGZlMTAgKCJtdGQ6IHJhd25hbmQ6IFVzZSB0aGUgRUNDIGZyYW1ld29yawo+IG5hbmRfZWNj
X2lzX3N0cm9uZ19lbm91Z2goKSBoZWxwZXIiKS4gQmVmb3JlIHRoaXMgcGF0Y2ggdGhlIGluaXRp
YWxpemVkCj4gdmFsdWVzIGluICYoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCktPmVjYyB3ZXJlIHVz
ZWQgKGFuZCB3aGljaCBhcmUgc3RpbGwKPiB1c2VkIGluIHRoZSB3YXJuaW5nIG1lc3NhZ2UgYWJv
dmUpLgo+IAo+IERvIHlvdSBoYXZlIGEgZGlyZWN0aW9uIGhvdyB0aGlzIHNob3VsZCBiZSBmaXhl
ZD8KCkkgbG9va2VkIGludG8gaXQsIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoZSBFQ0MgdmFsdWVz
IGFyZSBwcm9wYWdhdGVkIHRvCnRoZSB1cHBlciBsYXllcnMuIElmIG90aGVyIHBlb3BsZSBhcmUg
Zm9sbG93aW5nIHRoZSB0aHJlYWQsIGhlcmUgaXMgdGhlCnByb3Bvc2FsOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDA1MDcwODU4NDIuMTA4ODQ0LTEtbWlxdWVsLnJheW5h
bEBib290bGluLmNvbS9ULyN1CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
