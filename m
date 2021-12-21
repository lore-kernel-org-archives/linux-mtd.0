Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB80EC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=arpACwDfTty8EVg/uCCW4YDWQMajuDRDDdUBK9JaTYY=; b=d/mI34Ym3SqS0Z
	UvZbcIYVOgkuCXtJEZQJivFSSZV0RrzrrLkT7xmQjnfZz1QChPpKRJN99GH65SiVL4tY4Sc5P3sNa
	wu1gE1R2I3Vgvg7tO6knKwNLbgJzxgxgCFnQ7zqilbsji15l+txKRYoFnZ6lmcjwqsCBV2duwKk6F
	ulYGcmck42KQCNNxKgQSWbxUXPps8Z16UQbNn2B86RDu8sPG6aBCcso7mq++A6OrIasWJQsjcATen
	VPLlI+PgQksh+R4gJjptWuWymgLyh3ywSWxT8j+/LFQrJgPgz9OZJSfGFhu+WWElyty2x1RIaindu
	uT24GgzveZhlYy2ZzERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mziVw-007ez6-QY; Tue, 21 Dec 2021 17:01:24 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziVf-007eoY-DN
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 17:01:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AC8A8240005;
 Tue, 21 Dec 2021 17:00:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 0/3] Stacked/parallel memories bindings
Date: Tue, 21 Dec 2021 18:00:55 +0100
Message-Id: <20211221170058.18333-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090107_619550_AB1BF4FB 
X-CRM114-Status: GOOD (  11.08  )
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

SGVsbG8gUm9iLCBNYXJrLCBUdWRvciAmIFByYXR5dXNoLAoKSGVyZSBpcyBhIGZpZnRoIHZlcnNp
b25zIGZvciB0aGVzZSBiaW5kaW5ncywgd2hpY2ggYXBwbGllcyBvbiB0b3Agb2YKUHJhdHl1c2gn
cyB3b3JrOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTExMDkxODE5MTEuMjI1MS0x
LXAueWFkYXZAdGkuY29tLwoKQ2hlZXJzLApNaXF1w6hsCgpDaGFuZ2VzIGluIHY1OgoqIFVzZWQg
dGhlIHVpbnQ2NC1hcnJheSBpbnN0ZWFkIG9mIHRoZSBtYXRyaXggdHlwZS4KKiBVcGRhdGVkIHRo
ZSBleGFtcGxlIGFzIHdlbGwgdG8gdXNlIGEgc2luZ2xlICIvYml0cy8gNjQiIGNhc3QgYmVjYXVz
ZQogIGRvaW5nIGl0IHR3aWNlLCBkZXNwaXRlIGJlaW5nIHN1cHBvcnRlZCBieSB0aGUgbGFuZ3Vh
Z2UgaXRzZWxmLCBpcyBub3QKICB5ZXQgc29tZXRoaW5nIHRoYXQgd2UgY2FuIHVzZSBmb3IgZGVz
Y3JpYmluZyBiaW5kaW5ncy4KCkNoYW5nZXMgaW4gdjQ6CiogQ2hhbmdlZCB0aGUgdHlwZSBvZiBw
cm9wZXJ0aWVzIHRvIHVpbnQ2NC1hcnJheXMgaW4gb3JkZXIgdG8gYmUgYWJsZSB0bwogIGRlc2Ny
aWJlIHRoZSBzaXplIG9mIGVhY2ggZWxlbWVudCBpbiB0aGUgYXJyYXkuCiogVXBkYXRlZCB0aGUg
ZXhhbXBsZSBhY2NvcmRpbmdseS4KCkNoYW5nZXMgaW4gdjM6CiogUmViYXNlZCBvbiB0b3Agb2Yg
UHJhdHl1c2gncyByZWNlbnQgY2hhbmdlcy4KKiBEcm9wcGVkIHRoZSBjb21taXQgYWxsb3dpbmcg
dG8gcHJvdmlkZSB0d28gcmVnIGVudHJpZXMgb24gdGhlIG5vZGUKICBuYW1lLgoqIERyb3BwZWQg
dGhlIGNvbW1pdCByZWZlcmVuY2luZyBzcGktY29udHJvbGxlci55YW1sIGZyb20KICBqZWRlYyxz
cGktbm9yLnlhbWwsIG5vdyByZXBsYWNlZCBieSBzcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sIGFu
ZAogIGFscmVhZHkgZG9uZSBpbiBQcmF0eXVzaCdzIHNlcmllcy4KKiBBZGRlZCBSb2IncyBBY2su
CiogRW5oYW5jZWQgYSBjb21taXQgbWVzc2FnZS4KKiBNb3ZlZCB0aGUgbmV3IHByb3BlcnRpZXMg
dG8gdGhlIG5ldyBTUEkgcGVyaXBoZXJhbCBiaW5kaW5nIGZpbGUuCgpDaGFuZ2VzIGluIHYyOgoq
IERyb3BwZWQgdGhlIGR0YyBjaGFuZ2VzIGZvciBub3cuCiogTW92ZWQgdGhlIHByb3BlcnRpZXMg
aW4gdGhlIGRldmljZSdzIG5vZGVzLCBub3QgdGhlIGNvbnRyb2xsZXIncy4KKiBEcm9wcGVkIHRo
ZSB1c2VsZXNzICNhZGRyZXNzLWNlbGxzIGNoYW5nZS4KKiBBZGRlZCBhIG1pc3NpbmcgIm1pbkl0
ZW1zIi4KKiBNb3ZlZCB0aGUgbmV3IHByb3BlcnRpZXMgaW4gdGhlIHNwaS1jb250cm9sbGVyLnlh
bWwgZmlsZS4KKiBBZGRlZCBhbiBleGFtcGxlIHVzaW5nIHR3byBzdGFja2VkIG1lbW9yaWVzIGlu
IHRoZQogIHNwaS1jb250cm9sbGVyLnlhbWwgZmlsZS4KKiBSZW5hbWVkIHRoZSBwcm9wZXJ0aWVz
IHRvIGRyb3AgdGhlIFhpbGlueCBwcmVmaXguCiogQWRkZWQgYSBwYXRjaCB0byBmaXggdGhlIHNw
aS1ub3IgamVkZWMgeWFtbCBmaWxlLgoKTWlxdWVsIFJheW5hbCAoMyk6CiAgZHQtYmluZGluZ3M6
IG10ZDogc3BpLW5vcjogQWxsb3cgdHdvIENTIHBlciBkZXZpY2UKICBzcGk6IGR0LWJpbmRpbmdz
OiBEZXNjcmliZSBzdGFja2VkL3BhcmFsbGVsIG1lbW9yaWVzIG1vZGVzCiAgc3BpOiBkdC1iaW5k
aW5nczogQWRkIGFuIGV4YW1wbGUgd2l0aCB0d28gc3RhY2tlZCBmbGFzaGVzCgogLi4uL2JpbmRp
bmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgICAgICAgICAgIHwgIDMgKystCiAuLi4vYmluZGlu
Z3Mvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwgICAgICAgICAgfCAgNyArKysrKysKIC4uLi9iaW5k
aW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCAgICB8IDI1ICsrKysrKysrKysrKysr
KysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
LS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
