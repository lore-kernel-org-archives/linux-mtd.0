Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2214C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 16:32:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A006461155
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 16:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A006461155
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8JNPBCtS0Nx0RAAFa5nsxz2jzC9jeTb5iycKRv0XMC8=; b=fqBjnD/E4yZN1fbyre+W0aAM9T
	dpYPvAkO/iPBnMx1KARaVIi+uDZIsnL34lRzKgWnpJkSKcStmwdbmc4NyunnOzXoXIUxwjPlbLWxG
	4x4ArDesti+/6pLQEZZSM/GOkb2fV+4vALpVTNyWIHE6MFETLdDfK+PiX/ecBslkV/rgH9cimVeBR
	LCxXVkOgYazWgaO3+Owr0CF0USOd+UO6gnoTanNcqgfR2INuc24UPQfGGQeOUhsnpFmBDTZzdzxtn
	y3YxSCb0DaxlTXqVAy0B2EZbGglvg5B/YXivccHrDXWEnntiiKh4sZE31Pq+/aFegRHFozylqbb61
	QWOxMf+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg8oa-00EyW3-DM; Mon, 10 May 2021 16:31:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg8oX-00EyVe-BR
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 16:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=R+RG3xps9f7WYKUdCBmtU//M05hUpP4qzvEO7mW5WxM=; b=Y5R4sCbWSjeMtUPW5sHBWQjrt8
 /XlGPiomF9xt2v31EdeP1UKZE9yRK9+ER9DuiwZEPqUhSweqRPegE0zATUNaNQC10YTPRQgbzt9Sm
 AMdXeuO6MQXYEddCyWJ2Ks75259ndKnsA2K4YSB+K0k2lmAP2+bssDyfYUdhaYF8yvvTUcURDYbZW
 j2hcCb0gmHG6shWgi7hMv3EDMhQ8vQsxUd9r5XT6pbPLSUvwFtkuWM0TFEXM6He5jByVdrm2SKk2X
 xu/eQHCqXJ8BWZmovkwWzNTBrnRkIZBlwYN9WPpxxONgXIsiFk8MLCmuorKxs/apwQZHSy63xapqm
 yci4xGYQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg8oT-008vCx-AH
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 16:31:23 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1F90C24000C;
 Mon, 10 May 2021 16:31:14 +0000 (UTC)
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
Date: Mon, 10 May 2021 18:31:09 +0200
Message-Id: <20210510163114.24965-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_093121_519098_3AD23E53 
X-CRM114-Status: GOOD (  11.27  )
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
bmdlcyBpbiB2MjoKKiBBZGRlZCBhIG1pc3NpbmcgTU9EVUxFX0VYUE9SVCgpIHJlcG9ydGVkIGJ5
IGtlcm5lbCB0ZXN0IHJvYm90LgoKQ2hhbmdlcyBpbiB2MjoKKiBSZWJhc2VkIG9uIHRvcCBvZiB2
NS4xMy1yYzEKKiBUaGlzIHRpbWUgSSdtIENDJ2luZyBSb2IgKyBEVCBNTC4uLgoKTWlxdWVsIFJh
eW5hbCAoNSk6CiAgZHQtYmluZGluZzogbXRkOiBuYW5kOiBEb2N1bWVudCBncGlvLWNzIHByb3Bl
cnR5CiAgbXRkOiByYXduYW5kOiBNb3ZlIHN0cnVjdCBncGlvX2Rlc2MgZGVjbGFyYXRpb24gdG8g
dGhlIHRvcAogIG10ZDogcmF3bmFuZDogQWRkIGEgaGVscGVyIHRvIHBhcnNlIHRoZSBncGlvLWNz
IERUIHByb3BlcnR5CiAgbXRkOiByYXduYW5kOiBhcmFzYW46IEVuc3VyZSBwcm9wZXIgY29uZmln
dXJhdGlvbiBmb3IgdGhlIGFzc2VydGVkCiAgICB0YXJnZXQKICBtdGQ6IHJhd25hbmQ6IGFyYXNh
bjogTGV2ZXJhZ2UgYWRkaXRpb25hbCBHUElPIENTCgogLi4uL2JpbmRpbmdzL210ZC9uYW5kLWNv
bnRyb2xsZXIueWFtbCAgICAgICAgIHwgIDE2ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFz
YW4tbmFuZC1jb250cm9sbGVyLmMgfCAyMzggKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgICAgICAgICAgICAgfCAgMzkgKysrCiBpbmNsdWRlL2xp
bnV4L210ZC9yYXduYW5kLmggICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIDQgZmlsZXMgY2hh
bmdlZCwgMjQxIGluc2VydGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjcuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
