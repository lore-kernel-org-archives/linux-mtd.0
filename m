Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0803C54FD0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:48:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A7D20774
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m50l5Blc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A7D20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r5lon6brQ/xADZqSOwzUtl90KS0oeS/DKffHRTcohNE=; b=m50l5BlcYpKpkR
	WwQeCxIX79Tw2MT3/cqz6C7ymKm03G1tDVrSuzPBib2JJ/5kvYtzMRyfAORYT85v8TWBtLEGEg4IE
	4U3iBTqDY3dPk8RbYl+juw+yjMTZ88YNirfg3Ay8eEYQXzI4GULgY1FuNjF3GSdxMbAGXMPFQ6vJg
	Uzd7iMG3H4nyrGPr66F4ldefbrRdIOP7yGlxn1x3paFg751piaXXdNnEgjg8+kmROb41rTdrgykpK
	PNerLlv8M1SEtPPlgNJB0gq7ZoeeQ/ti4jtP1eggxsKJZ/9VgTzlTvidIHJe1iNdit7gC9yxYI7lC
	o2QXJfcPHjNCiE8KWCTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS2QW-0008SG-IL; Fri, 24 Apr 2020 17:47:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS2QS-0008Q0-Py
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 17:47:46 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AF27AFF806;
 Fri, 24 Apr 2020 17:47:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/2] New Arasan NAND controller driver
Date: Fri, 24 Apr 2020 19:47:36 +0200
Message-Id: <20200424174738.22304-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_104744_979872_66610A97 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIGlzIGEgZGVlcCByZXdvcmsgb2YgTmFnYSdzIEFyYXNhbiBOQU5EIGNvbnRy
b2xsZXIgZHJpdmVyLiBUaGlzCnZlcnNpb24gaXMgdGhlIGZpbmFsIHZlcnNpb24gYW5kIHdvcmtz
IHdpdGggc29mdHdhcmUgRUNDLiBJdCByZWxpZXMgb24KYSBwcmV2aW91cyBzZXJpZXMgY2FsbGVk
ICJTdXBwb3J0aW5nIHJlc3RyaWN0ZWQgTkFORCBjb250cm9sbGVycyIgdGhhdApicmluZ3MgbW9y
ZSBmbGV4aWJpbGl0eSB0byB0aGUgTkFORCB3aXRoIHRoZSBnb2FsIHRvIHN1cHBvcnQKcmVzdHJp
Y3RlZCBjb250cm9sbGVycyBsaWtlIHRoaXMgb25lLgoKU3VwcG9ydCBmb3IgdGhlIGhhcmR3YXJl
IEVDQyBlbmdpbmUgd2lsbCBjb21lIGluIGEgc2VwYXJhdGUKY2hhbmdlIHNldC4KCkNoZWVycywK
TWlxdcOobAoKQ2hhbmdlcyBpbiB2MjoKKiBXb3JraW5nIC0+ZXhlY19vcCgpIGltcGxlbWVudGF0
aW9uIHJlbHlpbmcgb24gY29yZSBjaGFuZ2VzLgoqIERyb3BwZWQgdGhlIEVDQyBzdXBwb3J0IGZv
ciBub3csIHdpbGwgYmUgcGFydCBvZiBhbm90aGVyIHNlcmllcyBpZgogIHRoaXMgcGF0Y2ggaXMg
YWNjZXB0ZWQuCgpNaXF1ZWwgUmF5bmFsICgyKToKICBkdC1iaW5kaW5nczogbXRkOiBEb2N1bWVu
dCBBUkFTQU4gTkFORCBiaW5kaW5ncwogIG10ZDogcmF3bmFuZDogU3VwcG9ydCBBcmFzYW4gTkFO
RCBjb250cm9sbGVyCgogLi4uL2JpbmRpbmdzL210ZC9hcmFzYW4sbmFuZC1jb250cm9sbGVyLnlh
bWwgIHwgIDYzICsrCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAg
ICAgfCAgIDcgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAgICAgICAgICAgICAg
IHwgICAxICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYyB8
IDkwNyArKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgOTc4IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2FyYXNhbixuYW5kLWNvbnRyb2xsZXIueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYwoKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
