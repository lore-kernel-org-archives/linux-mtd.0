Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99B4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2s3lGRNk0NQY8zZhhGIExoY2VbNZGB5oYLjdU4EWnhE=; b=vttGrhjm/xNenn
	ZviM/r2ICEnECNjbmkjNczaAUgK1l7sYTXvFgk2g3oSxb2mttv+MGeICiNGBMcYetoqB/4qa3Wqf/
	iGHsVeF37QELTYrxdEpAW5XpZWtUqc9FcNJ9Z6lDtgLHjEw+R0cGeZ2/gceztzJ6ypt6OikY2PqXy
	6q3am9LJt8GSwklNMkR7AgNPPKcECnZy04g56Ji8kLO9kmr4VYBFRDs4lLiuO93SclKxFWIimt+15
	xb/8zz3Q3yNjW94ZE8gdLvMNGHZpeDN5tYvkeBYkeX+2qeWGiLFK/xFkR2zspK3gJK+cfr6Ot04vt
	voW68UEKbVz1HILHFtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqbsH-00AgLi-VK; Fri, 26 Nov 2021 14:06:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqbs4-00AgJL-RG; Fri, 26 Nov 2021 14:06:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D1080FF804;
 Fri, 26 Nov 2021 14:06:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] Renesas RZ/N1 NAND controller support
Date: Fri, 26 Nov 2021 15:06:22 +0100
Message-Id: <20211126140625.351697-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_060637_049018_BA9ADD6B 
X-CRM114-Status: GOOD (  13.64  )
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
YXMgUlovTjEgTkFORApjb250cm9sbGVyLgoKU28gZmFyIHRoaXMgZHJpdmVyIGhhcyBiZWVuIHRl
c3RlZCB3aXRoIGEgbm90LWZ1bGx5LXVwc3RyZWFtIGRldmljZSB0cmVlCmJlY2F1c2UgY2xvY2sg
dHJlZSBpcyBub3QgeWV0IGRlc2NyaWJlZCBlbnRpcmVseSwgSSBhbSBnb2luZyB0byB3b3JrIG9u
Cml0IHJlYWxseSBzb29uIGJ1dCBJIGJlbGlldmUgd2UgZG9uJ3QgbmVlZCBmdWxsIGNsb2NrIHN1
cHBvcnQgdG8gZ2V0IHRoZQpOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIG1lcmdlZCBmb3Igbm93LgoK
Q2hlZXJzLApNaXF1w6hsCgpDaGFuZ2VzIGluIHYyOgoqIEFkZGVkIHRoZSBmYW1pbHktc3BlY2lm
aWMgcnpuMSBjb21wYXRpYmxlIGFzIHN1Z2dlc3RlZCBieSBHZWVydC4KICBVcGRhdGVkIHRoZSBi
aW5kaW5ncywgdGhlIGJpbmRpbmcgZmlsZSBuYW1lLCB0aGUgY29tcGF0aWJsZSB1c2VkIGluCiAg
dGhlIGRyaXZlciwgdGhlIE1BSU5UQUlORVJTIGVudHJ5LCBldGMuCiogQWRkZWQgYW4gQVJDSF9S
RU5FU0FTIEtjb25maWcgZGVwZW5kZW5jeS4KKiBDaGFuZ2VkIHRoZSB0eXBlICh0byB1bnNpZ25l
ZCkgb2YgYSBjb3VwbGUgb2YgdmFyaWFibGVzLgoqIFJldHVybmVkIGVhcmxpZXIgd2hlbiBwb3Nz
aWJsZSB0byByZWR1Y2UgaW5kZW50YXRpb24uCiogVXNlZCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlv
bmFsKCkgaW5zdGVhZCBvZiBwbGF0Zm9ybV9nZXRfaXJxKCkgdG8gYXZvaWQKICBhIHVzZWxlc3Mg
d2FybmluZy4KKiBIYW5kbGVkIHByb2JlIGRlZmVycmFsIGNvcnJlY3RseS4KKiBBcHBsaWVkIGEg
bWFzc2l2ZSBzL25mYy9uYW5kYy8gYXMgc3VnZ2VzdGVkIGJ5IEdlZXJ0IHRvIGF2b2lkCiAgY29u
ZnVzaW9ucyB3aXRoIHRoZSBuZWFyLWZpZWxkLWNvbW11bmljYXRpb24gZGV2aWNlLgoqIE1lbnRp
b25lZCBFdmF0cm9uaXggYXMgb3JpZ2luYWwgYXV0aG9ycyBvZiB0aGUgSVAgaW4gdGhlIGNvbW1p
dCBsb2cgYW5kCiAgaW4gdGhlIGhlYWRlci4KKiBBZGRlZCBhbiBhZGRpdGlvbmFsIGNoZWNrIG9u
IHRoZSB2YWxpZGl0eSBvZiB0aGUgY2hpbGQgbm9kZXMgcmVnIHByb3BlcnR5LgoqIEEgY291cGxl
IG9mIHN0eWxlIGZpeGVzLgoKTWlxdWVsIFJheW5hbCAoMyk6CiAgZHQtYmluZGluZ3M6IG10ZDog
cnpuMTogRGVzY3JpYmUgUmVuZXNhcyBSWi9OMSBOQU5EIGNvbnRyb2xsZXIKICBtdGQ6IHJhd25h
bmQ6IHJ6bjE6IEFkZCBuZXcgTkFORCBjb250cm9sbGVyIGRyaXZlcgogIE1BSU5UQUlORVJTOiBB
ZGQgYW4gZW50cnkgZm9yIFJlbmVzYXMgUlovTjEgTkFORCBjb250cm9sbGVyCgogLi4uL210ZC9y
ZW5lc2FzLHJ6bjEtbmFuZC1jb250cm9sbGVyLnlhbWwgICAgIHwgICA2NCArCiBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGRyaXZlcnMvbXRk
L25hbmQvcmF3L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgIDYgKwogZHJpdmVycy9tdGQv
bmFuZC9yYXcvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9yem4xLW5hbmQtY29udHJvbGxlci5jICAgfCAxNDIwICsrKysrKysrKysrKysrKysr
CiA1IGZpbGVzIGNoYW5nZWQsIDE0OTggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmVuZXNhcyxyem4xLW5hbmQt
Y29udHJvbGxlci55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcv
cnpuMS1uYW5kLWNvbnRyb2xsZXIuYwoKLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
