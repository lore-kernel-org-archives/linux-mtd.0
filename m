Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B18C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:45:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB76617ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB76617ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XwTVXHMNVHWMMiCQHrwCcPZ2wVDDbYlWbW/xpuU0NZw=; b=pyIL3+VGKXZU4kaBjHTwNgg2Lc
	LCjZ7JX3Vq8OTpPQiwnLMMojORTaARFFbW8dlsVwzXk32ggEUaOQqwFoqZPibZzPxStcahW7YhbAc
	cBuQznDJkzCbudK5VbHYQ3ooJT8AhTY17tDY5NTOVaDhC2mqkW9kd6h85AkMuo9bA9IbLzcN/nQ0A
	QqUAnHfy52JCB9w1TCgLmlR0r/3jdJufo5cJy0kQ5RdhTdlU3BtX0uYqvHhWs/631OO3mF3qVZTYq
	0lMBY5bwN1YnmkMCQ3UFB5RZUchmoiKoTu7p31ACMXlO5Z+5KYKP6uNMOrjAF+K72fvq04vsyBgjQ
	HsyBsHpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Or-00Dz7t-3W; Mon, 10 May 2021 10:44:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LP-00DyUF-Lr
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2LfIOqtwq6aXjGykgra78viHH411bjnfLrbXygnt95g=; b=sHY9CzpnjXY+2UiBauWoXwc0Zi
 yLoPJMjUUwMac0VNX/jTSxrA24w9aAz033yhgGY+B/MQ6PW11cdvC+V9UZFnZBkYUml+bKAUr64j4
 GVq0WkDcRd+hJsdx9zs9e4R/fmFtwjjIebqJH2lYBQyKW1Wz46RXSPGJ69bwkuI+JbW4uUUOnwt1g
 kTdmqc4NpHPOH668H0ExvofBdTVHiJjPzdggMBrUazO0Aln6aSj9HTi2tOkvRbK55R05CBBr3tUKz
 dtlEp5UqmBcF0R29p3N6MM1myWpUqmQCbnt+WNYZhg9czS9sfeFxN/05KgziOa93foNV0csjPRRGE
 3U3JDvUA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LM-008YYr-PI
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:40:58 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1A4EF1C0007;
 Mon, 10 May 2021 10:40:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/5] Bring GPIO CS support to the Arasan controller driver
Date: Mon, 10 May 2021 12:40:46 +0200
Message-Id: <20210510104051.9701-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034057_000805_B33B91F9 
X-CRM114-Status: GOOD (  10.84  )
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

SGVsbG8sCgpUaGlzIGlzIGEgc2hvcnQgc2VyaWVzIGJyaW5naW5nIGEgdXNlZnVsIGZlYXR1cmUg
Zm9yIGRyaXZlcnMgd2hpY2ggYXJlIGEKbGl0dGxlIGJpdCBjb25zdHJhaW5lZCByZWdhcmRpbmcg
dGhlaXIgbnVtYmVyIG9mIG5hdGl2ZSBDUy4gQXMKbWFudWZhY3R1cmVyIHRlbmQgdG8gZ3JvdXAg
Y2hpcHMgaW4gYXJyYXlzIHRvIGVubGFyZ2UgdGhlIG92ZXJhbGwKYXZhaWxhYmxlIHNwYWNlLCBp
dCBtaWdodCBiZSB1c2VmdWwgdG8gb3RoZXIgY29udHJvbGxlciBkcml2ZXJzIHRvIG1ha2UKdXNl
IG9mIHRoZSBhZGRlZCBEVCBwcm9wZXJ0eSAoY3MtZ3Bpb3MpIGFzIHdlbGwgYXMgdGhlIGNvcmUg
aGVscGVyIHdoaWNoCmlzIGJlaW5nIGludHJvZHVjZWQgdG8gcGFyc2UgdGhpcyBEVCBwcm9wZXJ0
eSBhbmQgcmV0dXJuZWQgYSBDUyBhcnJheQp3aXRoIGVpdGhlciBlbXB0eSBjZWxscyAobmF0aXZl
IENTIGFyZSBiZWluZyB1c2VkKSBvciBhIEdQSU8gZGVzY3JpcHRvcgpzdHJ1Y3R1cmUgcG9pbnRl
ciAoR1BJTyBDUykuCgpUaGlzIGlzIGFwcGxpZWQgdG8gdGhlIEFyYXNhbiBOQU5EIGNvbnRyb2xs
ZXIgZHJpdmVyIHdoaWNoIGludm9sdmVkIGEKbGl0dGxlIGJpdCBtb3JlIGJvaWxlcnBsYXRlIHRo
YW4gZXN0aW1hdGVkIEkgdGhvdWdodCBkdWUgdG8gaXRzIGludGVybmFsCmNvbnN0cmFpbnRzIHJl
Z2FyZGluZyB0aGUgYm9uZCBiZXR3ZWVuIENTIGFuZCBSQi4KCkNoZWVycywKTWlxdcOobAoKQ2hh
bmdlcyBpbiB2MjoKKiBSZWJhc2VkIG9uIHRvcCBvZiB2NS4xMy1yYzEKKiBUaGlzIHRpbWUgSSdt
IENDJ2luZyBSb2IgKyBEVCBNTC4uLgoKTWlxdWVsIFJheW5hbCAoNSk6CiAgZHQtYmluZGluZzog
bXRkOiBuYW5kOiBEb2N1bWVudCBncGlvLWNzIHByb3BlcnR5CiAgbXRkOiByYXduYW5kOiBNb3Zl
IHN0cnVjdCBncGlvX2Rlc2MgZGVjbGFyYXRpb24gdG8gdGhlIHRvcAogIG10ZDogcmF3bmFuZDog
QWRkIGEgaGVscGVyIHRvIHBhcnNlIHRoZSBncGlvLWNzIERUIHByb3BlcnR5CiAgbXRkOiByYXdu
YW5kOiBhcmFzYW46IEVuc3VyZSBwcm9wZXIgY29uZmlndXJhdGlvbiBmb3IgdGhlIGFzc2VydGVk
CiAgICB0YXJnZXQKICBtdGQ6IHJhd25hbmQ6IGFyYXNhbjogTGV2ZXJhZ2UgYWRkaXRpb25hbCBH
UElPIENTCgogLi4uL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCAgICAgICAgIHwg
IDE2ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgfCAy
MzggKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAg
ICAgICAgICAgICAgfCAgMzggKysrCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAg
ICAgICAgICAgICAgfCAgIDYgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMjQwIGluc2VydGlvbnMoKyks
IDU4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
