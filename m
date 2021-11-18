Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37567C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 11:21:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A9BA61A89
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 11:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A9BA61A89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gnRwtdPYbAXFDGv7iOiaIhkm0OdPtP347e3909qRw/w=; b=YQsrZGq5Kfc64K
	vU85O+fNUmnPcAgyzZCHYHB5EB+nFRagZE1DMX6DxwD0jVndnPFVdlgquz2LHSrDqoGf+JTIoVjVS
	bOUPxN4Q2/PcuDtwTExVIBFapCx7nK79vb5OlHUu6hmsap5Aa2jWmAYyUsxIToS9SlNaEsKV4m1eb
	reOalWpLJUAeCvrlNctJ8GNUA1VK16PxtocbFUqY43StiBVoVkkeeFNdjT8DbhMcaDTdI+6DBlvBP
	UaQnfmrJ6pdSQQV3Sx0/hyz29kyjhxNRD3lxeg0uqjv30HW1aZpBftzFt+lXI1y5+1iYckiEeLyIE
	bAKPG06UUL5hNQJq22hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfSv-007Xks-1x; Thu, 18 Nov 2021 11:20:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfSG-007Xdu-Jt; Thu, 18 Nov 2021 11:19:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5421120011;
 Thu, 18 Nov 2021 11:19:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] Renesas RZ/N1 NAND controller support
Date: Thu, 18 Nov 2021 12:19:37 +0100
Message-Id: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_031948_833457_5097DAC7 
X-CRM114-Status: GOOD (  12.44  )
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
YXMgUlovTjEgTkFORApjb250cm9sbGVyLiBJIHRyaWVkIHRvIGZvbGxvdyB0aGUgdXBzdHJlYW0g
Y29udmVudGlvbnMgZm9yIHRoZQpjb21wYXRpYmxlIG5hbWUgYnV0IHVzZWQgYSBtb3JlIGVhc3kg
dG8gcmVhZCBuYW1lIGZvciB0aGUgZHJpdmVyIGl0c2VsZiwKcGxlYXNlIHRlbGwgbWUgaWYgdGhp
cyBpcyBhbiBpc3N1ZS4KClNvIGZhciB0aGlzIGRyaXZlciBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBh
IG5vdC1mdWxseS11cHN0cmVhbSBkZXZpY2UgdHJlZQpiZWNhdXNlIGNsb2NrIHRyZWUgaXMgbm90
IHlldCBkZXNjcmliZWQgZW50aXJlbHksIEkgYW0gZ29pbmcgdG8gd29yayBvbgppdCByZWFsbHkg
c29vbiBidXQgSSBiZWxpZXZlIHdlIGRvbid0IG5lZWQgZnVsbCBjbG9jayBzdXBwb3J0IHRvIGdl
dCB0aGUKTkFORCBjb250cm9sbGVyIGRyaXZlciBtZXJnZWQgZm9yIG5vdy4KCkNoZWVycywKTWlx
dcOobAoKTWlxdWVsIFJheW5hbCAoMyk6CiAgZHQtYmluZGluZ3M6IG10ZDogcnpuMTogRGVzY3Jp
YmUgUmVuZXNhcyBSWi9OMSBOQU5EIGNvbnRyb2xsZXIKICBtdGQ6IHJhd25hbmQ6IHJ6bjE6IEFk
ZCBuZXcgTkFORCBjb250cm9sbGVyIGRyaXZlcgogIE1BSU5UQUlORVJTOiBBZGQgYW4gZW50cnkg
Zm9yIFJlbmVzYXMgUlovTjEgTkFORCBjb250cm9sbGVyCgogLi4uL3JlbmVzYXMscjlhMDZnMDMy
LW5hbmQtY29udHJvbGxlci55YW1sICAgIHwgICA2MCArCiBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcgICAgICAgICAgICAgICAgICB8ICAgIDYgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yem4x
LW5hbmQtY29udHJvbGxlci5jICAgfCAxNDE3ICsrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNo
YW5nZWQsIDE0OTEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmVuZXNhcyxyOWEwNmcwMzItbmFuZC1jb250cm9s
bGVyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yem4xLW5h
bmQtY29udHJvbGxlci5jCgotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
