Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E08C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynUemt6VMg2k9KjZKrESinw4n/L2hQzCUKVKBemURsA=; b=AiS6j0j3Qp1b9/
	SnMv4xtKQWfqtfPcrpVW3rmPK07rXHch1pZbtnHv0ucBptnnrfxoNQM34DNu1d6mDfeZooi8z/x0S
	ZL/U+PUnwkFXeb8Bg9qtdBvO8KxHX6nscfV9+k9EiRVozMxaegbjHLjhdORsO3b6VKQ6LQPKp3+rI
	7ehZLo7C0iwGkWwEwKJYPPmOJNCRUV2SBkAdpbJFadqVLK13f3JsKe4yxHT+0h6WRufZyQICNMSb4
	lyY57hTqWoHxgOt6Fl2tShWT4tpmbMTaf4qXjPePyNWsj/eu9cOWWvVskbO12WtQCUK5myJCXAHhp
	GSiyFH8yuGTDRJ/QGQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7f2-007Zkl-8u; Fri, 03 Jun 2022 13:48:20 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7ez-007ZjR-FM
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 13:48:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0FDF924000C;
	Fri,  3 Jun 2022 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654264091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jtp/yRc/uyATXr5jntdl9ignuQiC6FOqLOyBRDlGt+Y=;
	b=F2ou3Is5D9zfFmlCo29B+n0hLZiuMnFPTKyH5VOk/3lNoaB8BLxhyYTElUMpEaZVnXAl+s
	oRUxF0gRrtBnJdAmXTsSSQPvcN0zS6pZPebBTjbVtiKp8Nee6uZlhjmgyjsd6DhLxq+BSH
	hj4kuHjUblCaCrkd6K8+mDw//k8bcJCGcRsSkSPqcYv0PmfCfp69pYSz7nqTVIvLBNbvCK
	X6f70eaHLacWTIyuvcWkpBAu1mpXsk9aDawWFvhGEwINIbt+js24VHZxmXjlCeU98vWoML
	cby6HBmFVF/YpWZg0JxkKdswRhUS5y0704Aj6qQ79dXHmRT06DH99ZeIDCMprQ==
Date: Fri, 3 Jun 2022 15:48:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tom Rini
 <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso
 <dave@stgolabs.net>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
Message-ID: <20220603154804.2705bcb6@xps-13>
In-Reply-To: <Yn1ibyUeXZttNX2a@makrotopia.org>
References: <Yn1ibyUeXZttNX2a@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_064817_686905_C2CED073 
X-CRM114-Status: GOOD (  18.61  )
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

SGkgRGFuaWVsLAoKZGFuaWVsQG1ha3JvdG9waWEub3JnIHdyb3RlIG9uIFRodSwgMTIgTWF5IDIw
MjIgMjA6Mzk6MjcgKzAxMDA6Cgo+IEFkZCBLY29uZmlnIGJvb2xlYW4gQ09ORklHX01URF9CTE9D
S19QQVJUSVRJT05TIGFuZCBlbmFibGUgYmxvY2sKPiBwYXJ0aXRpb24gcGFyc2VycyBvbiBub24t
TkFORCBtdGRibG9jayBkZXZpY2VzIGluIGNhc2UgaXQgaXMgc2VsZWN0ZWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIEdvbGxlIDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL0tjb25maWcgICAgICAgfCAxMSArKysrKysrKysrKwo+ICBkcml2ZXJzL210ZC9t
dGRfYmxrZGV2cy5jIHwgIDQgKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvS2NvbmZpZyBi
L2RyaXZlcnMvbXRkL0tjb25maWcKPiBpbmRleCA3OTZhMmVjY2JlZjBiOC4uMTI4NzRkZWMxNTY5
MmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbXRk
L0tjb25maWcKPiBAQCAtNjksNiArNjksMTcgQEAgY29uZmlnIE1URF9CTE9DS19STwo+ICAJICBZ
b3UgZG8gbm90IG5lZWQgdGhpcyBvcHRpb24gZm9yIHVzZSB3aXRoIHRoZSBEaXNrT25DaGlwIGRl
dmljZXMuIEZvcgo+ICAJICB0aG9zZSwgZW5hYmxlIE5GVEwgc3VwcG9ydCAoQ09ORklHX05GVEwp
IGluc3RlYWQuCj4gIAo+ICtjb25maWcgTVREX0JMT0NLX1BBUlRJVElPTlMKPiArCWJvb2wgIlNj
YW4gZm9yIHBhcnRpdGlvbnMgb24gTVREIGJsb2NrIGRldmljZXMiCj4gKwlkZXBlbmRzIG9uIE1U
RF9CTE9DSyB8fCBNVERfQkxPQ0tfUk8KPiArCWRlZmF1bHQgeSBpZiBGSVRfUEFSVElUSU9OCj4g
KwloZWxwCj4gKwkgIFNjYW4gTVREIGJsb2NrIGRldmljZXMgZm9yIHBhcnRpdGlvbnMgKGllLiBN
QlIsIEdQVCwgdUltYWdlLkZJVCwgLi4uKS4KPiArCSAgKE5BTkQgZGV2aWNlcyBhcmUgb21pdHRl
ZCwgdWJpYmxvY2sgc2hvdWxkIGJlIHVzZWQgaW5zdGVhZCB3aGVuKQo+ICsKPiArCSAgVW5sZXNz
IHlvdXIgTVREIHBhcnRpdGlvbnMgY29udGFpbiBzdWItcGFydGl0aW9ucyBtYXBwZWQgdXNpbmcg
YQo+ICsJICBwYXJ0aXRpb24gdGFibGUsIHNheSBuby4KPiArCj4gIGNvbW1lbnQgIk5vdGUgdGhh
dCBpbiBzb21lIGNhc2VzIFVCSSBibG9jayBpcyBwcmVmZXJyZWQuIFNlZSBNVERfVUJJX0JMT0NL
LiIKPiAgCWRlcGVuZHMgb24gTVREX0JMT0NLIHx8IE1URF9CTE9DS19STwo+ICAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyBiL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZz
LmMKPiBpbmRleCBmNzMxNzIxMTE0NjU1MC4uYzY3Y2UyZTZmYmViMGEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZz
LmMKPiBAQCAtMzU5LDcgKzM1OSw5IEBAIGludCBhZGRfbXRkX2Jsa3RyYW5zX2RldihzdHJ1Y3Qg
bXRkX2Jsa3RyYW5zX2RldiAqbmV3KQo+ICAJfSBlbHNlIHsKPiAgCQlzbnByaW50ZihnZC0+ZGlz
a19uYW1lLCBzaXplb2YoZ2QtPmRpc2tfbmFtZSksCj4gIAkJCSAiJXMlZCIsIHRyLT5uYW1lLCBu
ZXctPmRldm51bSk7Cj4gLQkJZ2QtPmZsYWdzIHw9IEdFTkhEX0ZMX05PX1BBUlQ7Cj4gKwo+ICsJ
CWlmICghSVNfRU5BQkxFRChDT05GSUdfTVREX0JMT0NLX1BBUlRJVElPTlMpIHx8IG10ZF90eXBl
X2lzX25hbmQobmV3LT5tdGQpKQo+ICsJCQlnZC0+ZmxhZ3MgfD0gR0VOSERfRkxfTk9fUEFSVDsK
CkkgcmVhbGx5IHdvbmRlciBpZiB3ZSBuZWVkIHRoaXMgaW4gbXRkYmxvY2sgPyBJc24ndCB1Ymli
bG9jayBlbm91Z2g/CgpBbnlob3csCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKSSdsbCBsZXQgUmljaGFyZCBhY2sgdGhlIHViaWJsb2NrIHBhdGNo
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
