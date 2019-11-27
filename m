Return-Path: <SRS0=A63j=ZT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1995DC432C0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 10:56:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF615206BF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 10:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JI1zmwQ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF615206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PygMa+bWr/cQw/3lKr5xo1CuvCwleUMavBpDF/DVW78=; b=JI1zmwQ3UJaPhc
	ky1QIhdgZkxwq6s1ewLiq/p5qU6/pWc56GHua3vocrSL+O6Lggbi4qzctfms+T8upItAjq5mXrprO
	Aol4x22V/hI2oi7MiUGPlgCZbGr6LNgk1GD/cQitdc9ns1PjMwWw+7EVOZB4BQ8KbW2bnJnCbl+t8
	V57r7RmjvXmFkxyaZ9mcp884TVCCGShep/bi8pU8rVKO4rLNsL/VibsY3yf2UGHztr5mz8VbbGtSB
	Ua/LIbPYdKsh+mMGEM4S0zPAfx8P9BY2lahLE4ZoR/Bt3ANWXZBb8b2KVxo3bOBkJ/CYv74Xy7PNH
	ZCkLyYlhXIbAWFst9z+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZuz3-0003MO-GG; Wed, 27 Nov 2019 10:55:45 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZuys-00039e-3o
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2019 10:55:36 +0000
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 109B1FF803;
 Wed, 27 Nov 2019 10:55:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 0/4] MTD concat
Date: Wed, 27 Nov 2019 11:55:18 +0100
Message-Id: <20191127105522.31445-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_025534_286255_87AD76CA 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpBIHllYXIgYWdvIEJlcm5oYXJkIEZyYXVlbmRpZW5zdCBzdGFydGVkIGFuIGVmZm9y
dCB0byBicmluZyBNVEQKZGV2aWNlcyBjb25jYXRlbmF0aW9uIGdlbmVyaWMgWzFdLiBUb2RheSBJ
IGFsc28gbmVlZCB0aGlzCmNvbmNhdGVuYXRpb24gdG8gYmUgcG9zc2libGUgaW4gb3JkZXIgdG8g
c3VwcG9ydCBjb25maWd1cmF0aW9ucyB3aGVyZQp0d28gTVREIGRldmljZXMgYXJlIHRyZWF0ZWQg
bGlrZSBvbmUgYmlnZ2VyIGluIG9yZGVyIHRvIGJlIGFibGUgdG8KZGVmaW5lIHBhcnRpdGlvbnMg
YWNyb3NzIGNoaXAgYm91bmRhcmllcy4KCkFmdGVyIGhhdmluZyB0YWxrZWQgd2l0aCBNYXJrIEJy
b3duLCBCb3JpcyBCcmV6aWxsb24gYW5kIFJvYiBIZXJyaW5nLAp0aGUgb25seSBhcHByb2FjaCB3
aGljaCBzZWVtcyBhY2NlcHRhYmxlIGlzIHRvIGFkZCBhIHByb3BlcnR5IGluIHRoZQpwYXJ0aXRp
b25zIG5vZGVzIHRvIGRlc2NyaWJlIHdoaWNoIHBhcnRpdGlvbnMgc2hvdWxkIGJlIGNvbmNhdGVu
YXRlZAppbiBhIHZpcnR1YWwgZGV2aWNlLgoKQXQgZmlyc3QgSSBjaGFuZ2VkIGEgYml0IHRoZSBj
b2RlIGxvZ2ljIGFuZCBzdHlsZSwga2VlcGluZyB0aGUgbG9naWMKZnJvbSB0aGUgb3JpZ2luYWwg
dmVyc2lvbi4gU2luY2UgdGhlIGxhc3QgYmluZGluZ3MgY2hhbmdlLCBJIHJld3JvdGUKYWxtb3N0
IGFsbCB0aGUgZHJpdmVyLCBzbyBJIHRvb2sgb3duZXJzaGlwIG9uIGl0LCBrZWVwaW5nIEJlcm5o
YXJkIGluCmEgJ1N1Z2dlc3RlZC1ieScgdGFnLgoKSSB3b3VsZCBsaWtlIHRvIGFkZCBhbm90aGVy
IHdheSB0byBjb25jYXRlbmF0ZSBkZXZpY2VzOiB3aXRoIG1vZHVsZQpwYXJhbWV0ZXJzL2FyZ3Vt
ZW50cyBvbiB0aGUgY21kbGluZS4gVGhpcyBpcyBlYXNpbHkgZG9hYmxlIGluIGEgc2Vjb25kCnRp
bWUuCgpUaGFua3MsCk1pcXXDqGwKClsxXSBodHRwczovL2x3bi5uZXQvbWwvbGludXgta2VybmVs
LzIwMTgwOTA3MTczNTE1LjE5OTkwLTEta2VybmVsQG5vc3BhbS5vYmVsaWtzLmRlLwoKCkJlcm5o
YXJkIEZyYXVlbmRpZW5zdCAoMSk6CiAgbXRkOiBBZGQgZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSgp
IGhlbHBlcgoKTWlxdWVsIFJheW5hbCAoMyk6CiAgZHQtYmluZGluZ3M6IG10ZDogRGVzY3JpYmUg
TVREIHBhcnRpdGlvbnMgY29uY2F0ZW5hdGlvbgogIG10ZDogY29uY2F0OiBGaXggYSBjb21tZW50
IHJlZmVycmluZyB0byBhbiB1bmtub3duIHN5bWJvbAogIG10ZDogQWRkIGRyaXZlciBmb3IgY29u
Y2F0ZW5hdGluZyBkZXZpY2VzCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bi50eHQgICAgIHwgICAxICsKIGRyaXZlcnMvbXRkL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgOCArCiBkcml2ZXJzL210ZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKwogZHJpdmVycy9tdGQvbXRkX3ZpcnRfY29uY2F0LmMgICAgICAgICAgICAg
ICAgIHwgMjQwICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9tdGQvbXRkY29uY2F0LmMgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMzggKysrCiBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKwogNyBmaWxlcyBjaGFuZ2VkLCAyOTEgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9tdGRf
dmlydF9jb25jYXQuYwoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
