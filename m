Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1288FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 10:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGI4+q2b9KTVtMx92b6ndxSLLaqJ3kznzHZo8osDxD8=; b=wsolMwiGIRR8Ei
	w72amz59ZyjIYOpuxchhrU0klhBQH3tObRFrn7ezqU2Pi7wK3D4I2nUEhfDpphj/3ABgjxCZgb5CJ
	qGu7Ky6GYdQHcc2w+YOWGVE9kHVAlMVPqo4ed0JA3H1TwgY0C7knSioVZG08OizEe8e1FmhvT5ONv
	guFJedxW8wWBIZP/z9KZT+BDxtxD/B1fIDGAm6HXqln/oFLMpDzwLorFzzCBsMcIt283jAH0g6qIO
	3ciouq6Itg7s/AXPxYuoALsK5GIfOYtnWRHR+HPO2yRiWDQxvXzTbgdH2M2rQahekP0Tli0HWUUOZ
	z4xFRGcBgncrfC+m8FmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxnkH-004laI-76; Thu, 16 Dec 2021 10:12:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxnWE-004fNu-7G
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 09:57:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 071FAFF80F;
 Thu, 16 Dec 2021 09:57:40 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:57:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael
 Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211216105739.395a174d@xps13>
In-Reply-To: <20211216100147.46c307ff@xps13>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
 <20211215200548.75630b61@collabora.com>
 <Ybo/r8neydqTxN6N@sirena.org.uk> <20211216100147.46c307ff@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_015746_449918_42D272DA 
X-CRM114-Status: GOOD (  23.83  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gVGh1LCAxNiBEZWMgMjAyMSAxMDow
MTo0NyArMDEwMDoKCj4gSGkgTWFyaywKPiAKPiBicm9vbmllQGtlcm5lbC5vcmcgd3JvdGUgb24g
V2VkLCAxNSBEZWMgMjAyMSAxOToxOToxMSArMDAwMDoKPiAKPiA+IE9uIFdlZCwgRGVjIDE1LCAy
MDIxIGF0IDA4OjA1OjQ4UE0gKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+ICAgCj4g
PiA+IFRoZXJlJ3MgYWxzbyBhIHNlY29uZCBvcHRpb24gdGhhdCBkb2Vzbid0IGludm9sdmUgcGF0
Y2hpbmcgZXhpc3RpbmcKPiA+ID4gdXNlcnM6IGFkZCBhIHNwaV9tZW1fY29udHJvbGxlcl9jYXBz
IHRvIHRoZSBzcGlfY29udHJvbGxlciBzdHJ1Y3QsIGFuZAo+ID4gPiBjaGVjayB0aGlzIGluc3Rh
bmNlIGluIHlvdXIgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkKPiA+ID4gaW1wbGVtZW50
YXRpb24uIE5vdGUgdGhhdCB0aGUgYnVzd2lkdGggY2hlY2sgZG9uZSBpbiB0aGUgZ2VuZXJpYwo+
ID4gPiBoZWxwZXIgaXMgYWxyZWFkeSBiYXNlZCBvbiBjYXBzIGV4cG9zZWQgYnkgdGhlIGNvbnRy
b2xsZXIKPiA+ID4gdGhyb3VnaCBzcGlfY29udHJvbGxlci5tb2RlX2JpdHMgKHtSWC9UWH1fe0RV
QUwsUVVBRCxPQ1RBTH0gYml0cykuICAgIAo+ID4gCj4gPiBUaGlzIGFwcHJvYWNoIGlzIHF1aXRl
IG5pY2UgZm9yIHRoaW5ncyBsaWtlIHRoaXMgLSBoYXZpbmcgdGhpbmdzIGFzIGRhdGEKPiA+IHJh
dGhlciB0aGFuIGNvZGUuICBUaGUgb25seSBpc3N1ZSBpcyBpZiBhbnkgb2YgdGhlIGNhcHMgZW5k
IHVwIHZhcnlpbmcKPiA+IGJ5IG9wZXJhdGlvbiBhbmQgd2UgbmVlZCBkaWZmZXJlbnQgY2FwYWJp
bGl0aWVzIGJ1dCB0aGF0IGRvZXNuJ3QgbG9vawo+ID4gdG9vIGxpa2VseSBoZXJlIEkgdGhpbms/
ICAKPiAKPiBJbmRlZWQgdGhhdCB3YXMgdGhlIG1haW4gcG9pbnQgb2YgdGhlIG9yaWdpbmFsIHJl
dmlldyBmcm9tIEJvcmlzLCB0aGUKPiBjYXBhYmlsaXRpZXMgc2hvdWxkIGJlIGZpeGVkIG9uIHRo
ZSBjb250cm9sbGVyJ3MgbGlmZXRpbWUuIFNvIEkgYmVsaWV2ZQo+IHdlIGFyZSBzYWZlLgo+IAo+
IEkgdGhpbmsgSSBhbSBnb2luZyB0byBwcm9wb3NlIHRoZSBmb2xsb3dpbmc6Cj4gCWNvbnN0IHN0
cnVjdCBzcGlfY29udHJvbGxlcl9tZW1fb3BzICptZW1fb3BzOwo+ICsJc3RydWN0IHNwaV9jb250
cm9sbGVyX21lbV9jYXBzIG1lbV9jYXBzOwo+IAo+IEFzIHRoZSBzdHJ1Y3R1cmUgaXMgbm90IHN1
cHBvc2VkIHRvIGVubGFyZ2UgZHJhbWF0aWNhbGx5IGluIHRoZSBuZWFyCj4gZnV0dXJlLCBJIGd1
ZXNzIGl0J3MgZmluZSB0byBoYXZlIGl0IGRlZmluZWQgc3RhdGljYWxseS4gUGxlYXNlIHRlbGwg
bWUKPiBpZiB5b3UgcHJlZmVyIGEgKm1lbV9jYXBzIHBvaW50ZXIuCgpBY3R1YWxseSBhcyB0aGUg
c3BpLW1lbS5oIGhlYWRlciBpcyBub3QgaW5jbHVkZWQgaW4gc3BpLmgsIGl0IG1ha2VzCmRlZmlu
aW5nIGEgc3RhdGljIG1lbV9jYXBzIGVudHJ5IGhhcmRlci4gSSdsbCBnbyBmb3IgYW5vdGhlciBh
cHByb2FjaC4KTWF5YmUgcHV0dGluZyB0aGUgY2FwYWJpbGl0aWVzIHdpdGhpbiB0aGUgc3BpX2Nv
bnRyb2xsZXJfbWVtX29wcwpzdHJ1Y3R1cmUsIGFzIHRoZXNlIGFyZSBoaWdobHkgcmVsYXRlZC4K
Cj4gSSdsbCBzZW5kIGEgcHJvcG9zYWwgc29vbi4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
