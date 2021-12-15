Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3400C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRkVZR9GYW2nq2MXRZcVaiKgf6EXeMCNv3Ac6GFHK6M=; b=mV8MBwg0ru0T0z
	wkywU4/3jTCizEBN0nQiuAt9ydNEr1YhgHiTkaxDnb+JyawNkGx2SOsrxo1EzkGNqyqeGbEusBhBt
	WI6Dvz8zt1ZfcmiW2xkkfO1H3v/UeMsxhPdrlZJq4P/2ngcBNlLQIBYkjnDXWZKqUUW7AUqdqfbek
	7EE/rEQL9gZNthelzuEE1/qnPeQRdOaAyKMflKCW5qKE+wvbs2SLkMd9fF5WAXhKq9ymTmjJ+9GN4
	tT9fLd4rG7RQH0mXDWagbsHlHLu1D6+ge7IivDk2tvw5JKA/64DAOji7qqMdHf8UzN2zEZoS0zeD0
	oEYHEELdEFk5Aiac09BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxWYW-001SYn-43; Wed, 15 Dec 2021 15:51:00 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxWYT-001SWg-2v
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 15:50:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CD618E0003;
 Wed, 15 Dec 2021 15:50:48 +0000 (UTC)
Date: Wed, 15 Dec 2021 16:50:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Xiangsheng Hou
 <Xiangsheng.Hou@mediatek.com>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 03/22] dt-bindings: mtd: nand-controller: Harmonize
 the property types
Message-ID: <20211215165047.2d089269@xps13>
In-Reply-To: <YbjYNVOVL/sLda9H@robh.at.kernel.org>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
 <20211207093422.166934-4-miquel.raynal@bootlin.com>
 <YbjYNVOVL/sLda9H@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_075057_295866_B741BEFC 
X-CRM114-Status: GOOD (  12.16  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFR1ZSwgMTQgRGVjIDIwMjEgMTE6NDU6
MjUgLTA2MDA6Cgo+IE9uIFR1ZSwgRGVjIDA3LCAyMDIxIGF0IDEwOjM0OjAzQU0gKzAxMDAsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIYXJtb25pemUgdGhlIGRpZmZlcmVudCBwcm9wZXJ0aWVz
IGluIHRoaXMgZmlsZSBieToKPiA+ICogZHJvcHBpbmcgdGhlIG5vbi1uZWNlc3NhcnkgYWxsT2Yn
cwo+ID4gKiBhbHdheXMgZGVmaW5pbmcgdGhlIGtleXdvcmRzIGluIHRoZSBmb2xsb3dpbmcgb3Jk
ZXI6Cj4gPiAgICAgLSBmaXJzdDogInR5cGUiLyIkcmVmIiwKPiA+ICAgICAtIHNlY29uZDogImRl
c2NyaXB0aW9uIiAod2hlbiByZWxldmFudCksICAKPiAKPiBJZiB3ZSdyZSBnb2luZyB0byBtdWNr
IHdpdGggdGhpcywgcmVhbGx5IEkgcHJlZmVyIGRlc2NyaXB0aW9uIGZpcnN0IG9yIAo+IGxhc3Qg
YW5kIGV2ZXJ5dGhpbmcgZWxzZSB0b2dldGhlci4KCk9rLCBubyBwcm9ibGVtLgoKVGhpcyBpcyBq
dXN0IGEgcGF0Y2ggY2xlYW5pbmcgdGhpbmdzIHVwIGJlZm9yZSBtb3ZpbmcgdGhlIHByb3BlcnRp
ZXMKYXJvdW5kIGFueXdheS4KCkNhbiBJIGFkZCB5b3VyIFJldmlld2VkLWJ5IHdoZW4gc2VuZGlu
ZyB0aGUgdXBkYXRlZCB2ZXJzaW9uPyBJIHdvdWxkCmxpa2UgdG8gbWVyZ2UgdGhlIGZpcnN0IGhh
bHZlIG9mIHRoaXMgc2VyaWVzIHNvb24gZW5vdWdoLgoKPiAKPiA+ICAgICAtIHRoZW4gdGhlIG90
aGVyIGdlbmVyaWMga2V5d29yZHMgKCJlbnVtIiwgImRlZmF1bHQiLCBldGMpLgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
