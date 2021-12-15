Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FC6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XWiOi4LRwq13+qiaDGTjhDgNF1NproQn4cx1JdCkCTw=; b=S/cCbAUhhZAO1k
	yUtdT9co+jE0oS5TUMAJ14S1+/V5PdcEkLBqb42lnsGsP+kX2TyhBV/vEAB+geH79qU+LoWu+/gY8
	H9NbDixRlWm8l/qxzGwg8BsEkEL5LdaKS7qOsy8wSCv5OI5ZImok/DmHx7LKgiFEzFRq9bkMd9ok1
	imJo3pIV0DokQrRt6Q3MLuKodxSgVc6jDD9rauJgqUr0YfBcpYGp2OR4eudjavr+eBHTAUDwdGX1H
	zTBAFPr+LIwpgw8Ya20C/09MoVzyMVYxdmcDfnWYfE8l3oCq77/8tKWYCRY0uHy3Pe2q0W94YDd1P
	ieUJ0vcmebn6XpEOjkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxWU9-001Qs0-JW; Wed, 15 Dec 2021 15:46:29 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxWU6-001QqC-Rx
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 15:46:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 932EEFF815;
 Wed, 15 Dec 2021 15:46:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/4] Renesas RZ/N1 NAND controller support
Date: Wed, 15 Dec 2021 16:46:15 +0100
Message-Id: <20211215154619.166360-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_074627_064807_3AF96325 
X-CRM114-Status: GOOD (  15.78  )
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

SGVsbG8sCgpIZXJlIGlzIGEgc2hvcnQgc2VyaWVzIGJyaW5naW5nIHN1cHBvcnQgZm9yIFJlbmVz
YXMgUlovTjEgTkFORApjb250cm9sbGVyLgoKVGhpcyB0aW1lIHRoZSBkcml2ZXIgaGFzIGJlZW4g
dGVzdGVkIHdpdGggYSBmdWxseS11cHN0cmVhbSBkZXZpY2UgdHJlZQpvbiB0b3Agb2YgYSB2NS4x
Ni1yYzQuIFRoZSBEVCB1c2VkIGlzIHZlcnkgY2xvc2UgdG8gdGhlIHI5YTA2ZzAzMi1kYi4KCkNo
ZWVycywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2NDoKKiBTZXQgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
IHNldCB0byBmYWxzZSBpbiB0aGUgYmluZGluZ3MuCiogQ2hhbmdlIHRoZSBjbG9jayBuYW1lcyBi
eSByZW1vdmluZyB0aGUgbmFuZF8gcHJlZml4IHdoaWNoIGlzCiAgcmVkdW5kYW50LCBldmVuIHRo
b3VnaCB0aGUgY2xvY2tzIGFyZSBuYW1lZCBsaWtlIHRoaXMgaW4gdGhlIHNwZWMuIFRoZQogIG5h
bWUgcmVtYWlucyBjbGVhciBlbm91Z2ggYW55d2F5LgoKQ2hhbmdlcyBpbiB2MzoKKiBSZWJhc2Vk
IG9uIHRvcCBvZiBhIGZ1bGx5LXVwc3RyZWFtIHJlY2VudCBrZXJuZWwuCiogUmVuYW1lZCB0aGUg
Y2xvY2tzIGluIHRoZSBiaW5kaW5ncyBhbmQgdGhlIGRyaXZlciB0byBtYXRjaCB0aGUKICBkb2N1
bWVudGF0aW9uIChsb3dlci1jYXNlZCk6IG5hbmRfaGNsayAmIG5hbmRfZWNsay4KKiBBZGRlZCBh
IG5ldyBjb21taXQgZGVzY3JpYmluZyB0aGUgTkFORCBjb250cm9sbGVyIGluIHRoZSByOWEwNmcw
MzIKICBEVFNJLgoqIEFkZGVkIHRoZSBSZXZpZXdlZC1ieSBhbmQgVGVzdGVkLWJ5IHRhZ3MgcmVj
ZWl2ZWQuCgpDaGFuZ2VzIGluIHYyOgoqIEFkZGVkIHRoZSBmYW1pbHktc3BlY2lmaWMgcnpuMSBj
b21wYXRpYmxlIGFzIHN1Z2dlc3RlZCBieSBHZWVydC4KICBVcGRhdGVkIHRoZSBiaW5kaW5ncywg
dGhlIGJpbmRpbmcgZmlsZSBuYW1lLCB0aGUgY29tcGF0aWJsZSB1c2VkIGluCiAgdGhlIGRyaXZl
ciwgdGhlIE1BSU5UQUlORVJTIGVudHJ5LCBldGMuCiogQWRkZWQgYW4gQVJDSF9SRU5FU0FTIEtj
b25maWcgZGVwZW5kZW5jeS4KKiBDaGFuZ2VkIHRoZSB0eXBlICh0byB1bnNpZ25lZCkgb2YgYSBj
b3VwbGUgb2YgdmFyaWFibGVzLgoqIFJldHVybmVkIGVhcmxpZXIgd2hlbiBwb3NzaWJsZSB0byBy
ZWR1Y2UgaW5kZW50YXRpb24uCiogVXNlZCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgaW5z
dGVhZCBvZiBwbGF0Zm9ybV9nZXRfaXJxKCkgdG8gYXZvaWQKICBhIHVzZWxlc3Mgd2FybmluZy4K
KiBIYW5kbGVkIHByb2JlIGRlZmVycmFsIGNvcnJlY3RseS4KKiBBcHBsaWVkIGEgbWFzc2l2ZSBz
L25mYy9uYW5kYy8gYXMgc3VnZ2VzdGVkIGJ5IEdlZXJ0IHRvIGF2b2lkCiAgY29uZnVzaW9ucyB3
aXRoIHRoZSBuZWFyLWZpZWxkLWNvbW11bmljYXRpb24gZGV2aWNlLgoqIE1lbnRpb25lZCBFdmF0
cm9uaXggYXMgb3JpZ2luYWwgYXV0aG9ycyBvZiB0aGUgSVAgaW4gdGhlIGNvbW1pdCBsb2cgYW5k
CiAgaW4gdGhlIGhlYWRlci4KKiBBZGRlZCBhbiBhZGRpdGlvbmFsIGNoZWNrIG9uIHRoZSB2YWxp
ZGl0eSBvZiB0aGUgY2hpbGQgbm9kZXMgcmVnIHByb3BlcnR5LgoqIEEgY291cGxlIG9mIHN0eWxl
IGZpeGVzLgoKTWlxdWVsIFJheW5hbCAoNCk6CiAgZHQtYmluZGluZ3M6IG10ZDogcnpuMTogRGVz
Y3JpYmUgUmVuZXNhcyBSWi9OMSBOQU5EIGNvbnRyb2xsZXIKICBtdGQ6IHJhd25hbmQ6IHJ6bjE6
IEFkZCBuZXcgTkFORCBjb250cm9sbGVyIGRyaXZlcgogIE1BSU5UQUlORVJTOiBBZGQgYW4gZW50
cnkgZm9yIFJlbmVzYXMgUlovTjEgTkFORCBjb250cm9sbGVyCiAgQVJNOiBkdHM6IHI5YTA2ZzAz
MjogRGVzY3JpYmUgTkFORCBjb250cm9sbGVyCgogLi4uL210ZC9yZW5lc2FzLHJ6bjEtbmFuZC1j
b250cm9sbGVyLnlhbWwgICAgIHwgICA2NCArCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAzMi5k
dHNpICAgICAgICAgICAgICB8ICAgMTIgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgIHwgICAgNiArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgfCAgICAxICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L3J6bjEtbmFuZC1j
b250cm9sbGVyLmMgICB8IDE0MjIgKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwg
MTUxMiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9yZW5lc2FzLHJ6bjEtbmFuZC1jb250cm9sbGVyLnlhbWwKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yem4xLW5hbmQtY29udHJvbGxl
ci5jCgotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
