Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093C1C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mODdp10czUtlvBHyipPywCJUULX3bw0wSHtKYId5c0=; b=bgVZub/Dnw/fVa
	yZTFCOfKRqEBL5FkB7P5dhZ7dVTVA1aXIIcKL9Z0IfqJIhZ3y8s2OHl4YY5MRFaI0aTLVnjUeThSQ
	2poi2xYr5y6JxxriEO9e8tnIFDV++PvRz7OO32CWDBSoixeUuhnxXoTAAnMY6gKT9C/KfIpsNiy7G
	aLEeWKDI3sN1Y7w0Ud1O7PrUOEs+PWbIYn+srz396nv+xdRJLP+uK0If0v87uYcKin2eSNT7LhjlE
	P+3u86GIXnO5WH9cGe2zImvfIZoq5WoYrLExkPpXuwdsNphCiZsqQxAeKGqGT8X4+u4eMvf95Rpmc
	DitFExKLx9AJ681Yn0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgkE-004NAf-0g;
	Wed, 24 Jan 2024 17:08:58 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgk9-004N6l-2W
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 17:08:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08AE824000D;
	Wed, 24 Jan 2024 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706116131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=romx/hMVnXU+YClTIP+lZWzqpiWykqr15lDUZgoS4EA=;
	b=QNHpXucdZFKUH+WLTfvF90rOkNfXLjgudSf0YujzPsNFqCRFdlnOYITnw7FwgwAzwfnany
	rJru6oMuuk7LQtuIrcycjfXUIiqErr899+3mJ6PDDFXwWT7N26SvMeHBUoNVkLBV2w1lrW
	3WZ5A/bfMUJd9lwObX33vRQyZ84IEvXiRRV7/83OzO2bSyzqpK/p4GWoVXUClVqQ7zZmKt
	xt3cCvp0FDTFpz21scmoOfYenTt5hC3Ly8DM6S/x9Qo6qYtE1UpcqBT/DEspq+eAcI/Our
	UV9WFuL5o0WcLX0zay0GZQMecgpFxnppXok1ahg4uf32zTf4xdSXK60hh04jPg==
Date: Wed, 24 Jan 2024 18:08:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ezra Buehler <ezra@easyb.ch>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, Daniel
 Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>,
 quic_sridsn@quicinc.com, quic_mdalam@quicinc.com
Subject: Re: [PATCH v2] mtd: spinand: add support for ESMT F50x1G41LB
Message-ID: <20240124180848.3647d5c9@xps-13>
In-Reply-To: <CAM1KZS=tvEi6fed=BoynpkjfzZqKGb-wv+CVbVmAPYz5tNaNkQ@mail.gmail.com>
References: <20220413083824.247136-1-gch981213@gmail.com>
	<20220413145843.46a3d9b5@xps13>
	<CAJsYDV+3J0ipbR+N-xE=DH-WXsjierdHe_pJtKf1Xbt7fdaiWw@mail.gmail.com>
	<CAM1KZS=tvEi6fed=BoynpkjfzZqKGb-wv+CVbVmAPYz5tNaNkQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_090854_039622_AB1916D5 
X-CRM114-Status: GOOD (  20.75  )
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

SGkgRXpyYSwKCmV6cmFAZWFzeWIuY2ggd3JvdGUgb24gVHVlLCAyMyBKYW4gMjAyNCAxOTo1NDow
NiArMDIwMDoKCj4gSGkgQ2h1YW5ob25nIEd1bywKPiAKPiBPbiBXZWQsIDEzIEFwciAyMDIyIDIy
OjUwOjQzICswODAwIENodWFuaG9uZyBHdW8gPGdjaDk4MTIxM0BnbWFpbC5jb20+IHdyb3RlOgo+
ID4gVGhlaXIgZGV2aWNlIElEIGFyZW4ndCBjb25mbGljdGluZyB5ZXQsIHNvIG5vdGhpbmcgd2ls
bCBoYXBwZW4KPiA+IGF0IHRoZSBtb21lbnQuICAKPiAKPiBTaW5jZSBjb21taXQgYWEwOGJmMTg3
ZjMyICgibXRkOiBzcGluYW5kOiBlc210OiBhZGQgc3VwcG9ydCBmb3IKPiBGNTBEMkc0MUtBIikg
d2UgaGF2ZSBhIGNvbmZsaWN0IHdpdGggdGhlIEdpZ2FEZXZpY2UgR0Q1RjFHUTVVRXh4Rwo+ICht
YW51ZmFjdHVyZXIgSUQgMHhDOCwgZGV2aWNlIElEIDB4NTEpLCBwcmV2ZW50aW5nIG91ciBib2Fy
ZCBmcm9tCj4gYm9vdGluZy4KPiAKPiA+IFRoZXJlIGlzIGEgc29sdXRpb24gZm9yIGZ1dHVyZSBj
b25mbGljdDogUmVjZW50IFNQSS1OQU5EIGNoaXBzCj4gPiBjb250YWluIGEgcGFyYW1ldGVyIHBh
Z2Ugd2hpY2ggaGFzIHRoZSBleGFjdCBjaGlwIHZlbmRvcgo+ID4gYW5kIG1vZGVsLiBXZSBjYW4g
ZG8gb25lIG1vcmUgZGV0ZWN0aW9uIHdpdGggdGhlIHBhcmFtZXRlcgo+ID4gcGFnZSBjb250ZW50
Lgo+ID4gV2luYm9uZCBXMjVOMDFLViBpcyBhIDJrKzk2IFNQSS1OQU5EIHdpdGggNC1iaXQgRUND
Lgo+ID4gSXQgdXNlcyB0aGUgZXhhY3Qgc2FtZSBjaGlwIGlkIGFzIHRoZSBjdXJyZW50IFcyNU4w
MUdWCj4gPiAoMmsrNjQgMS1iaXQgRUNDKS4gV2UgbmVlZCB0byBzdXBwb3J0IGRldGVjdGlvbiB1
c2luZwo+ID4gcGFyYW1ldGVyIHBhZ2UgZm9yIHRoaXMgY3JhenkgZGVjaXNpb24gYnkgV2luYm9u
ZCBhbnl3YXkuCj4gPiBJJ2xsIHRyeSB0byBjb2RlIHNvbWV0aGluZyBmb3IgdGhpcyB3aXRoIG15
IGZyZWUgdGltZS4KPiA+Cj4gPiBNeSBjdXJyZW50IGlkZWEgaXM6IFdlIGZpcnN0IGRvIGEgZGV0
ZWN0aW9uIGJhc2VkIG9uIGNoaXAgaWQuCj4gPiBJZiB0aGF0IGZhaWxlZCwgdHJ5IHRvIHJlYWQg
dGhlIHBhcmFtZXRlciBwYWdlLiBJZiB3ZSBnb3QgYQo+ID4gdmFsaWQgb25lLCBtYXRjaCB0aGUg
Y2hpcCB2ZW5kb3IgYW5kIG1vZGVsIHN0cmluZy4gIAo+IAo+IEFjY29yZGluZyB0byB0aGUgZGF0
YXNoZWV0cywgdGhlIEVTTVQgY2hpcHMgYWN0dWFsbHkgaGF2ZSBhIDUgYnl0ZSBJRCwKPiB0aGUg
bGFzdCAzIGJ5dGVzIGJlaW5nIDB4N0YgKEpFREVDIE1ha2VyIENvZGUgQ29udGludWF0aW9uIENv
ZGUpLiBXaHkKPiBjYW4ndCB3ZSBzaW1wbHkgZXh0ZW5kIHRoZSBJRCBpbiBlc210LmMgKGFzIHlv
dSBoYWQgaXQgaW4geW91ciBvcmlnaW5hbAo+IHBhdGNoKSBhbmQgaW5jcmVhc2UgU1BJTkFORF9N
QVhfSURfTEVOIHRvIDU/IE9yLCBhbHRlcm5hdGl2ZWx5LCBvbmx5Cj4gZXh0ZW5kIHRoZSBJRCB0
byA0IGJ5dGVzPwo+IAo+IElmIHRoYXQgaXMgdGhlIHdheSB0byBnbywgSSB3b3VsZCBiZSBoYXBw
eSB0byBwcm92aWRlIHRoZSBwYXRjaGVzLgoKUGxlYXNlIHNlbmQgdGhlIHBhdGNoZXMuIENodWFu
aG9uZyBjYW4geW91IHRlc3QgdGhlbT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
