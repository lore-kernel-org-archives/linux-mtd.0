Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B891C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpn6LZ8G6HdCEcTI3LDOU5zgKavK48hkIldYclm1blE=; b=zcYLoVKgqWNbHJ
	Qz+asMkbiTeA+tkgzXfABBxfAsgRVoSIj+gwGqX4m+uE+YLUjNIuAZI0Wy+REBFSCXM9hKw7uCWeV
	XDIjRvwhwytrQt89W3J19ejcohLCbAGBGBE9IcMe+6pXx3LbmeoADXzCAoXp6Wsf1r4ZuF/j+R4Tv
	hpssAdEY97wM6exWF/QguqJjPtldVc5ePeVyHSNR4cDdMg60kWQwlXzOuvM0N+ZaMJAARwu0SgdGs
	Du/d1Xpug7T5NEcB/RTHOSD7szlclOc++LflPcDsNNMdeSl+e+4Lg5wuJ0EUBycyDLo06+rXWNNl8
	33AQUOYhcDKzDdEgJtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzwjo-009cKo-AP; Wed, 22 Dec 2021 08:12:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzwjl-009cJv-6k
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 08:12:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0124D6000C;
 Wed, 22 Dec 2021 08:12:24 +0000 (UTC)
Date: Wed, 22 Dec 2021 09:12:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Boris Brezillon
 <boris.brezillon@collabora.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v8 01/14] spi: spi-mem: reject partial cycle transfers in
Message-ID: <20211222091223.5bf11221@xps13>
In-Reply-To: <20211221184148.pw4blwxdvxcoerjo@ti.com>
References: <20211221174844.56385-1-miquel.raynal@bootlin.com>
 <20211221174844.56385-2-miquel.raynal@bootlin.com>
 <20211221184148.pw4blwxdvxcoerjo@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_001237_402643_4E7DE01E 
X-CRM114-Status: GOOD (  12.93  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBXZWQsIDIyIERlYyAyMDIxIDAw
OjExOjUwICswNTMwOgoKPiBIaSwKPiAKPiBPbiAyMS8xMi8yMSAwNjo0OFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gRnJvbTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+ID4g
Cj4gPiBJbiA4RC04RC04RCBtb2RlIHR3byBieXRlcyBhcmUgdHJhbnNmZXJyZWQgcGVyIGN5Y2xl
LiBTbyBhbiBvZGQgbnVtYmVyCj4gPiBvZiBieXRlcyBjYW5ub3QgYmUgdHJhbnNmZXJyZWQgYmVj
YXVzZSBpdCB3b3VsZCBsZWF2ZSBhIHJlc2lkdWFsIGhhbGYKPiA+IGN5Y2xlIGF0IHRoZSBlbmQu
IENvbnNpZGVyIHN1Y2ggYSB0cmFuc2ZlciBpbnZhbGlkIGFuZCByZWplY3QgaXQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPiA+IFJldmll
d2VkLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiAgCj4gCj4gU29ycnks
IEkgZGlkbid0IHJlYWxpemUgdGhpcyBiZWZvcmUuIFRoaXMgcGF0Y2ggd291bGQgYnJlYWsgYSBj
b3VwbGUgb2YgCj4gU1BJIE5PUiBmbGFzaGVzLiBZb3UgbmVlZCBwYXRjaCAxLCAyLCBhbmQgMyBm
cm9tIG15IHNlcmllcyBhcyB3ZWxsIHRvIAo+IG1ha2Ugc3VyZSB0aGlzIGRvZXMgbm90IGhhcHBl
bi4gU2luY2UgdGhvc2UgcGF0Y2hlcyBoYXZlIHNvbWUgcGVuZGluZyAKPiBjb21tZW50cywgY2Fu
IHlvdSBqdXN0IGRyb3AgdGhpcyBwYXRjaCBhbmQgSSB3aWxsIHJlLXJvbGwgaXQgb24gdG9wIG9m
IAo+IHlvdXIgc2VyaWVzIGxhdGVyIHdoZW4gSSBjYW4gZmluZCBzb21lIHRpbWUgZm9yIGl0PyBB
Z2Fpbiwgc29ycnkgZm9yIG5vdCAKPiBub3RpY2luZyB0aGlzIGJlZm9yZS4KClllcyBubyBwcm9i
bGVtLCBJIG1pZ2h0IGFzIHdlbGwgZHJvcCBpdCB3aGVuIGFwcGx5aW5nLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
