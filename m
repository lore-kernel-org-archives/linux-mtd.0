Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36381CD13CF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2024 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MA09s4nGr3utsbRK14DeLciNI3kbW5AM+0dnKs1Y2eI=; b=Z1Ib1h86FA/kJs
	v0qyUUIXPMd+DMCf6nDqCBcYRVSZ68K0WqhfqoU5ou/53xHHDGGcI91MPPxgT3mSvDl9wX1zf1fOA
	hP/ov2Pzyuzt+3mEDgIjzWr/eSUj/8UTBrbS17nAgvqvNfqievluGECKjsQtSArRI7h2uTQLSxg6/
	kyVUUAAAYzkKY00qKeakefSk1hmanepzdNtE896spYUzFKAWaqqv8rFmwIZLQ+vyxMwZJivs69amG
	2q7hjWprZb8P1YVpQA0l0gfztoNri0XlbtLh6pFqalUG9BDbPoKaoBnZQTswdpIkmem0C4YEDOyBR
	yWcndwsK/kjSYF2qQsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl6FO-0000000EJ4F-1avA;
	Mon, 02 Sep 2024 12:33:30 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl6B1-0000000EHws-3e9W
	for linux-mtd@lists.infradead.org;
	Mon, 02 Sep 2024 12:29:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 844CD6000D;
	Mon,  2 Sep 2024 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725280136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3bHLgPC9UcNLmBmxjD3JWZOBGlNzvtP7G+tkWxSr6cw=;
	b=kpfS69Z2MKp2rNQmnV05UEwL+5em9prQmKegSFNYIkmVlEZ4QNcA2xC4oLYOiKk/aWLpmg
	oMHf++ykE5xkdnkvRqzmfYRBCRvManeVrRqU/nRaUTR0K8F+6S3vnO7WZDcGDeEbSCJnsX
	P71dvOWQau5e24O47/gYlvDA/eKTxjJx9+buLl5vR69HC1fIjEm78zcgs++bZddvUP1vxw
	6Rdya358OfbwLuiUdOOXC5a2zMf8niBgmEia/5T2fTkanz6ZwGvD5tkxHZXQpQCDTxRu9C
	PX6+etLucv8G2uhq8/VbMsmaXBCKl10/LSlJHbU2i/zyy/3lkT5egZdRbQCrEA==
Date: Mon, 2 Sep 2024 14:28:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v5 1/2] mtd: spinand: Add support for setting plane
 select bits
Message-ID: <20240902142853.5fff056a@xps-13>
In-Reply-To: <CAAyq3Sbta_p9WNOTEdCA7V=huPkeFFxUvxTqfzRJz0dsJMJBwg@mail.gmail.com>
References: <20240830100310.1553675-1-linchengming884@gmail.com>
	<20240830100310.1553675-2-linchengming884@gmail.com>
	<20240830175504.746fb2ec@xps-13>
	<CAAyq3Sbta_p9WNOTEdCA7V=huPkeFFxUvxTqfzRJz0dsJMJBwg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_052900_928251_8F908CD3 
X-CRM114-Status: GOOD (  19.79  )
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

SGkgQ2hlbmcsCgpsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMiBTZXAg
MjAyNCAxNjo0Mjo1NSArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IEkgYWNjaWRlbnRhbGx5IHNl
bnQgdGhlIHByZXZpb3VzIGVtYWlsIGJlZm9yZSBpdCB3YXMgZmluaXNoZWQuCj4gCj4gTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8IDIwMjTlubQ45pyIMzDml6Ug
6YCx5LqUIOS4i+WNiDExOjU15a+r6YGT77yaCj4gPgo+ID4gSGkgQ2hlbmdNaW5nLAo+ID4KPiA+
IGxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAzMCBBdWcgMjAyNCAxODow
MzowOSArMDgwMDoKPiA+ICAKPiA+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xp
bkBteGljLmNvbS50dz4KPiA+ID4KPiA+ID4gQWRkIHR3byBmbGFncyBmb3IgaW5zZXJ0aW5nIHRo
ZSBQbGFuZSBTZWxlY3QgYml0IGludG8gdGhlIGNvbHVtbgo+ID4gPiBhZGRyZXNzIGR1cmluZyB0
aGUgd3JpdGVfdG9fY2FjaGUgYW5kIHRoZSByZWFkX2Zyb21fY2FjaGUgb3BlcmF0aW9uLgo+ID4g
Pgo+ID4gPiBBZGQgdGhlIFNQSU5BTkRfSEFTX1BQX1BMQU5FX1NFTEVDVF9CSVQgZmxhZyBmb3Ig
c2VyaWFsIE5BTkQgZmxhc2ggIAo+ID4KPiA+IFRoaXMgZmxhZyBoYXMgYmVlbiByZW5hbWVkIDop
ICAKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSByZW1pbmRlci4gSSB3aWxsIG1ha2UgdGhlIG5lY2Vz
c2FyeSBjaGFuZ2VzLgo+IAo+ID4gIAo+ID4gPiB0aGF0IHJlcXVpcmUgaW5zZXJ0aW5nIHRoZSBQ
bGFuZSBTZWxlY3QgYml0IGludG8gdGhlIGNvbHVtbiBhZGRyZXNzCj4gPiA+IGR1cmluZyB0aGUg
d3JpdGVfdG9fY2FjaGUgb3BlcmF0aW9uLgo+ID4gPgo+ID4gPiBBZGQgdGhlIFNQSU5BTkRfSEFT
X1JFQURfUExBTkVfU0VMRUNUX0JJVCBmbGFnIGZvciBzZXJpYWwgTkFORCBmbGFzaAo+ID4gPiB0
aGF0IHJlcXVpcmUgaW5zZXJ0aW5nIHRoZSBQbGFuZSBTZWxlY3QgYml0IGludG8gdGhlIGNvbHVt
biBhZGRyZXNzCj4gPiA+IGR1cmluZyB0aGUgcmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGlj
LmNvbS50dz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCA2
ICsrKysrKwo+ID4gPiAgaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oIHwgMiArKwo+ID4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUu
Ywo+ID4gPiBpbmRleCBlMGI2NzE1ZTVkZmUuLmU3YjU5MmNkYmI0YyAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+ID4gPiBAQCAtMzg2LDYgKzM4Niw5IEBAIHN0YXRpYyBpbnQgc3BpbmFu
ZF9yZWFkX2Zyb21fY2FjaGVfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4g
PiAgICAgICBlbHNlCj4gPiA+ICAgICAgICAgICAgICAgcmRlc2MgPSBzcGluYW5kLT5kaXJtYXBz
W3JlcS0+cG9zLnBsYW5lXS5yZGVzY19lY2M7Cj4gPiA+Cj4gPiA+ICsgICAgIGlmIChzcGluYW5k
LT5mbGFncyAmIFNQSU5BTkRfSEFTX1JFQURfUExBTkVfU0VMRUNUX0JJVCkKPiA+ID4gKyAgICAg
ICAgICAgICBjb2x1bW4gfD0gcmVxLT5wb3MucGxhbmUgPDwgZmxzKG5hbmRkZXZfcGFnZV9zaXpl
KG5hbmQpKTsgIAo+ID4KPiA+IElzbid0IHRoZXJlIGFueSBiZXR0ZXIgd2F5IHRvIGtub3cgd2hh
dCB0aGUgYml0IHBvc2l0aW9uIGlzPyAgCj4gCj4gVGhlcmUgYXJlIHR3byBvdGhlciBtZXRob2Rz
IHRvIGRldGVybWluZSB0aGUgYml0IHBvc2l0aW9uOgo+IC0gY29sdW1uIHw9IHJlcy0+cG9zLnBs
YW5lIDw8IGZscyhuYW5kLT5tZW1vcmcucGFnZXNpemUpCj4gLSBjb2x1bW4gfD0gd2Rlc2MtPmlu
Zm8ub2Zmc2V0CgpPaywgbGV0J3Mga2VlcCBpdCBpcyBhcy1pcyBmb3Igbm93LgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
