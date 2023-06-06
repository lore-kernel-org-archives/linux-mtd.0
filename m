Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C63C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RZLT6lSDOCMO9PfY6XfuRVef7UM9jACol+M/KjFBdFM=; b=dBvL5TYZfdEjsX
	lkZeh+G/+G/Mbhe+8jS8n3xJYGho9Ws+d/RrDM5xixEUFR02Dq1NtvTH6LiWk1jxHJPPhmDSpB0Je
	VKik/cZpbLHEj3MJLOeFgLmeq1Vy84CRm57EHcyR2IsDu8rs2D4sSaCh5YIOFRlrep+BxHAHH006z
	kaBmxqjkMcr+dJXWfQgbSVCq5WbuiTrhacQLo1YqvSBtttOHnd4LHgkGAakKzFnuLwKe+rucCynwl
	cbztOGsgX6VfH8ATWu1RjIQ7XFwEBGdfbLVALzwLNcmfRYVGuHxfLsWVwZVHZ19IJsAjrLRxWxU9C
	fSU8637I0ZomZdQCGrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ty0-001BUu-0i;
	Tue, 06 Jun 2023 10:31:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Txw-001BRE-2h
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 10:31:06 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686047461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OK5WHjbNiB9y+jsDV+19GZyajpKtnZ338156rkAkncQ=;
	b=dhXFICz4CZXtaI+/G3Ms7YPV+0FUNLn65bPJnNtYr3ZSNwnO5hDZu9J5TtK30c9efvVyYh
	eeweqdQ+z27R48lL9q42QqseXFBBIfk2YhM6pcHPSH+TVE5YgTh4EUTa6GHKd95MuRxWSn
	rcEqrC9OwcM/KpB4Xp2/4iyJQbte45zKAYNbdoeTAcX29Cg3Am8FuqPVN7axpdhq0Jc999
	tCS9HIyX2zGUIgPq3QTGDka2P8tmGb669xmiBQ88FfmavkxASUVmAhHEkEOpQapf59uqzT
	tudPPLa5e0SNTEXN2osJoqOMfk5mN9Pmg+4siAwU+jbOGgrcWLlvhu4Khs5Uig==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B10CFF806;
	Tue,  6 Jun 2023 10:30:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] Fix a couple of missing unevaluated properties
Date: Tue,  6 Jun 2023 12:30:54 +0200
Message-Id: <20230606103057.137711-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_033105_006184_66B9EAA1 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

QXMgZGlzY3Vzc2VkIHdpdGggS3J6eXN6dG9mIGFuZCBDaHJpcywgaXQgc2VlbXMgbGlrZSBlYWNo
IE5BTkQKY29udHJvbGxlciBiaW5kaW5nIHNob3VsZCBhY3R1YWxseSBleHBsaWNpdGVseSBsaXN0
IGFsbCB0aGUgYWxsb3dlZApwcm9wZXJ0aWVzIGluIGEgc2NoZW1hIGFuZCB1c2UgInVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UiIGluIGJvdGgKdGhlIE5BTkQgY29udHJvbGxlciBhbmQgdGhl
IE5BTkQgY2hpcCBzZWN0aW9ucy4gV2hpbGUgdGhpcyByZXN0cmljdGlvbgphbHdheXMgYXBwbGll
ZCBvbiB0aGUgY29udHJvbGxlciBzaWRlLCB0aGlzIHdhcyBub3QgZW5mb3JjZWQgb24gdGhlCmNo
aXBzIHNpZGUgQUZBSVIuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYTIzZGQ0
ODUtYTNkOS1lMzFmLWJlM2UtMGFiMjkzZmNmYzRhQGxpbmFyby5vcmcvCgpXaGlsZSBjb252ZXJ0
aW5nIE1hcnZlbGwgY29udHJvbGxlciBiaW5kaW5ncywgQ2hyaXMgZXhwbGljaXRlbHkgcG9pbnRl
ZApzaW1pbGFyIGJpbmRpbmdzIHdoaWNoIHdvdWxkIGFsc28gdHJpZ2dlciBlcnJvcnMgd2hlbiB1
c2luZwoidW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSIgYmVjYXVzZSBvZiB0aGUgcmVnL3Bh
cnRpdGlvbnMvZXRjCnByb3BlcnRpZXMgbm90IGJlaW5nIGRlc2NyaWJlZC4gSGVyZSBpcyBhbiBh
dHRlbXB0IGF0IG1ha2luZyB0aGVzZSBtb3JlCnByZWNpc2UgYW5kIHJvYnVzdC4KClRoZXNlIGNo
YW5nZSBtYWRlIG1lIHJlYWxpemUgdGhlIHFjb20sYm9vdC1wYXJ0aXRpb24gcHJvcGVydHkKZGVz
Y3JpcHRpb24gd2FzIGJyb2tlbiwgc28gaGVyZSBpcyBhIGZpeCBmb3IgaXQuCgpUaGFua3MsCk1p
cXXDqGwKCk1pcXVlbCBSYXluYWwgKDMpOgogIGR0LWJpbmRpbmdzOiBtdGQ6IHFjb206IEZpeCBh
IHByb3BlcnR5IHBvc2l0aW9uCiAgZHQtYmluZGluZ3M6IG10ZDogcWNvbTogUHJldmVudCBOQU5E
IGNoaXAgdW5ldmFsdWF0ZWQgcHJvcGVydGllcwogIGR0LWJpbmRpbmdzOiBtdGQ6IGluZ2VuaWM6
IFByZXZlbnQgTkFORCBjaGlwIHVuZXZhbHVhdGVkIHByb3BlcnRpZXMKCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxuYW5kLnlhbWwgfCAxMSArKysrKwogLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbCAgIHwgNDcgKysrKysrKysrKysrLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
