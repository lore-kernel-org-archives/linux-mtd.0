Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047BDC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 14:10:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7811610C8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 14:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7811610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/l5SHAQzobThBLZ9ILQHT0ixQ4K4q2uLpJunH8qqNw=; b=1P7Fz4SCkwCqLr
	Q0UF6gjjx9L27BRkJCO+Zg+AZRxsu4zakkZ9D8qOS7MEXMNqERDbmqmQdcCd7rAV05y5A/Y2VIEBW
	Dhf7qzmm1VvUiyl3r6T7cvRrvwf6qiaH5BRrPLW5lFYhShnTL9MgH49acWqBElc05EnMiclvpri6S
	sAar6iuzWajydFYWxo8W1LcAmovW2/wDQIBoP7Va1yAB9RKSh2+14K1vJqDoLSEaGaqL/RkEZimHZ
	5j5QV7gK0WnwexMKBgpJNxVvgtvz8Oz1OUmlp9bxlK+RjRZh/tDmjpyKd6/ql6G5vDd6s8EXvGxru
	lMA9IL9Jb3lX5PiMMDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdYlK-007nVX-4W; Thu, 21 Oct 2021 14:09:42 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdYlH-007nTx-Dr
 for linux-mtd@lists.infradead.org; Thu, 21 Oct 2021 14:09:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E960C1C0012;
 Thu, 21 Oct 2021 14:09:32 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:09:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
 linux-spi@vger.kernel.org, Jaime Liao <jaimeliao@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/18] dt-bindings: mtd: spi-nand: Convert spi-nand
 description file to yaml
Message-ID: <20211021160932.4169f66f@xps13>
In-Reply-To: <1634764487.038982.2962586.nullmailer@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-5-miquel.raynal@bootlin.com>
 <1634764487.038982.2962586.nullmailer@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_070939_653230_3899440E 
X-CRM114-Status: GOOD (  19.63  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMjAgT2N0IDIwMjEgMTY6MTQ6
NDcgLTA1MDA6Cgo+IE9uIFdlZCwgMjAgT2N0IDIwMjEgMTY6Mjc6NTUgKzAyMDAsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gPiBMZXQncyBnZXQgcmlkIG9mIHNwaS1uYW5kLnR4dCBieSBjb252ZXJ0
aW5nIGl0IHRvIHlhbWwgc2NoZW1hLiBXaGlsZSBhdAo+ID4gY29udmVydGluZyB0aGlzIGZpbGUs
IGxldCdzIGFjdHVhbGx5IHB1bGwgYWxsIHRoZSBnZW5lcmljIHByb3BlcnRpZXMKPiA+IGZyb20g
bmFuZC1jaGlwLnlhbWwgd2hpY2ggbWlnaHQgYXBwbHkgdG8gYSBTUEktTkFORCBjaGlwLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnR4
dCAgICAgIHwgIDUgLS0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFu
ZC55YW1sICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5hbmQudHh0Cj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
c3BpLW5hbmQueWFtbAo+ID4gICAKPiAKPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21h
a2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbSBkdF9iaW5kaW5nX2NoZWNrJwo+IG9uIHlvdXIgcGF0Y2gg
KERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGluIHY1LjEzKToKPiAKPiB5YW1sbGludCB3YXJuaW5n
cy9lcnJvcnM6Cj4gCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPiBVbmtub3duIGZp
bGUgcmVmZXJlbmNlZDogW0Vycm5vIDJdIE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk6ICcvdXNy
L2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdlcy9kdHNjaGVtYS9zY2hlbWFzL210ZC9u
YW5kLWNoaXAueWFtbCcKPiB4YXJnczogZHQtZG9jLXZhbGlkYXRlOiBleGl0ZWQgd2l0aCBzdGF0
dXMgMjU1OyBhYm9ydGluZwo+IG1ha2VbMV06ICoqKiBEZWxldGluZyBmaWxlICdEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NucHMsZHctYXBiLXNzaS5leGFtcGxlLmR0Lnlh
bWwnCj4gVW5rbm93biBmaWxlIHJlZmVyZW5jZWQ6IFtFcnJubyAyXSBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5OiAnL3Vzci9sb2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvZHRzY2hl
bWEvc2NoZW1hcy9tdGQvbmFuZC1jaGlwLnlhbWwnCj4gbWFrZVsxXTogKioqIFtzY3JpcHRzL01h
a2VmaWxlLmxpYjozODU6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc25w
cyxkdy1hcGItc3NpLmV4YW1wbGUuZHQueWFtbF0gRXJyb3IgMjU1Cj4gbWFrZVsxXTogKioqIFdh
aXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiBtYWtlOiAqKiogW01ha2VmaWxlOjE0NDE6
IGR0X2JpbmRpbmdfY2hlY2tdIEVycm9yIDIKCkkgYW0gbm90IGFibGUgdG8gcmVwcm9kdWNlIHRo
aXMgZXJyb3IgYW5kIGluIGdlbmVyYWwgSSBkb24ndCB1bmRlcnN0YW5kCml0LiBUaGVyZSBpcyBu
byByZWxhdGlvbnNoaXAgYmV0d2VlbiB0aGlzIGNoYW5nZSBhbmQKc25wcyxkdy1hcGItc3NpLnlh
bWwuIEFsc28gdGhlIGZhY3QgdGhhdCBuYW5kLWNoaXAteWFtbCBkbyBub3QgZXhpc3QsCml0IHdh
cyBqdXN0IGNyZWF0ZWQgaW4gdGhlIHBhdGNoIGJlZm9yZSBzbyBJIHdvbmRlciBob3cgbXVjaCBJ
IHNob3VsZAp0cnVzdCB0aGlzIGVycm9yLgoKQWxzbywgbWF5YmUgSSBhbSBub3QgdXNpbmcgdGhl
IHRvb2xzIHByb3Blcmx5LCBidXQgaXQgaXMgdmVyeSBoYXJkIHRvCnNlbmQgY29ycmVjdCBiaW5k
aW5ncyBhdCB0aGUgZmlyc3QgdHJ5LiBSdW5uaW5nIG1ha2UgZHRfYmluZGluZ19jaGVjawp0YWtl
cyBhZ2VzLCBhbnkgY2hhbmdlIGluIG9uZSB5YW1sIGZpbGUgd2lsbCByZWNoZWNrIHRoZSBlbnRp
cmUgZGF0YQpiYXNlIGFuZCBmaWx0ZXJpbmcgb3V0IG9uIGEgc2luZ2xlIHlhbWwgZmlsZSBpcyBn
ZW5lcmFsbHkgdG9vCnJlc3RyaWN0aXZlIGFuZCBzdGlsbCBwcmludHMgdW5yZWxhdGVkIGVycm9y
cyBvZiBzeW50YXggb24gb3RoZXIgZmlsZXMuCkkgZG9uJ3Qga25vdyBob3cgbXVjaCBvZiB0aGlz
IGlzIGFjdHVhbGx5IGV4cGVjdGVkIGFuZC9vciBpZiBzb21lb25lIGlzCndvcmtpbmcgb24gaXQu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
