Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76562C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LIkNl+gRb/pEhXiSZp10m0xqYWVe+U28XPTNz83qM4=; b=4HH8HnkI8JRxPb
	foIrjBblI+mOiGtyLRp1U7dq8QQA1VUEyd4jxoldIa8DGyMB/KW/KFNYo9hXMU0s/1nkitlMW8Zdw
	tRZ+Fo7KJ0met1Hr9ITtIPuDj4UZyVLnReOHCkjl14C6E9Lxl/dbOgEiZRxW7XICYPfl/TyUFWGQL
	cBOWWxjp8SI2Eg3iI8cD/GphY9JvAB53VZRfSv6k9+XLdxSDfnN6xoy6KWlA76+L83xqyYYkcTn5D
	t6fXkgiFjXUS110q8pkfqiQMsc2PUr4IaByi7CuI+D+FwJhMGLPD+8pujU4kvh09TLDDjUh8e3MQm
	tabMdpPvCRPLKAybTCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFwh-00FT5h-4R; Thu, 09 Dec 2021 09:42:35 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFwe-00FT39-CM
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 09:42:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1195124000D;
 Thu,  9 Dec 2021 09:42:25 +0000 (UTC)
Date: Thu, 9 Dec 2021 10:42:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Roger Quadros
 <rogerq@kernel.org>, devicetree@vger.kernel.org, Thierry Reding
 <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
Message-ID: <20211209104224.41d42cca@xps13>
In-Reply-To: <20211206174209.2297565-1-robh@kernel.org>
References: <20211206174209.2297565-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_014232_588333_F9FE95CB 
X-CRM114-Status: GOOD (  16.71  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgIDYgRGVjIDIwMjEgMTE6NDI6
MDkgLTA2MDA6Cgo+IFdpdGggJ3VuZXZhbHVhdGVkUHJvcGVydGllcycgc3VwcG9ydCBpbXBsZW1l
bnRlZCwgdGhlIFRJIEdQTUMgZXhhbXBsZQo+IGhhcyBhIHdhcm5pbmc6Cj4gCj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLmV4YW1w
bGUuZHQueWFtbDogbmFuZEAwLDA6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxv
d2VkICgncmItZ3Bpb3MnIHdhcyB1bmV4cGVjdGVkKQo+IAo+IEFkZCB0aGUgbWlzc2luZyBkZWZp
bml0aW9uIGZvciAncmItZ3Bpb3MnLgoKcmItZ3Bpb3MgaXMgYWxyZWFkeSBkZWZpbmVkIGluIG5h
bmQtY29udHJvbGxlci55YW1sLiBJIHNlZW1zIGxpa2UgdGhlCnJlYWwgcHJvYmxlbSBpcyB0aGF0
IHRoaXMgZmlsZSBkb2VzIG5vdCByZWZlciB0byBpdC4gQ2FuIHlvdSB1cGRhdGUgdGhlCmZpeD8K
CldoaWxlIGF0IGl0IHlvdSBtaWdodCBhbHNvIHdhbnQgdG8gZHJvcCB0aGUgcmItZ3Bpb3MgcHJv
cGVydHkgZnJvbQppbmdlbmljLG5hbmQueWFtbCwgd2hpY2ggYWxzbyBkZWZpbmVzIGl0IGEgc2Vj
b25kIHRpbWUuCgo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBWaWduZXNo
IFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Cj4gQ2M6IFRvbnkgTGluZGdyZW4gPHRvbnlA
YXRvbWlkZS5jb20+Cj4gQ2M6IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUBrZXJuZWwub3JnPgo+IENj
OiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvdGksZ3BtYy1uYW5kLnlhbWwgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC90aSxncG1jLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1uYW5kLnlhbWwKPiBpbmRleCBiZWIyNmI5YmNmYjIu
LjFjMjgwZjUyYmFhMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3RpLGdwbWMtbmFuZC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC90aSxncG1jLW5hbmQueWFtbAo+IEBAIC01Myw2ICs1MywxMSBAQCBw
cm9wZXJ0aWVzOgo+ICAgICAgZW51bTogWzgsIDE2XQo+ICAgICAgZGVmYXVsdDogOAo+ICAKPiAr
ICByYi1ncGlvczoKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBHUElPIGNvbm5lY3Rpb24g
dG8gUi9CIHNpZ25hbCBmcm9tIE5BTkQgY2hpcAo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gIHBh
dHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICJAWzAtOWEtZl0rJCI6Cj4gICAgICAkcmVmOiAiL3NjaGVt
YXMvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwiCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
