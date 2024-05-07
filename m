Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3C7C25B5F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nIK9YhnPr3KFgPuSLntacIHqv0cTOHT9v8MPXmbbzgk=; b=3eWP6Q90NsCPzf
	gmojGlyKXOiXsxraJ9YvKkC//TvAg38hn/tP/y4xaSarWq6bN0CA5m3St43o+ZnJdz3IAkAo1O+Mi
	zkBsWWcJHPcTMzmQdSJGaeCSWxqI/EExttJLW53W5lRSEJnlggWbjf2he+fm+4ZxtZQ5ebKHIaTas
	hVlH3T2y9Qqx6A8OPMXtaXTI0As3zwfRSJ53WgBAIqrMa9JWHtv4pzBSGjZSdEZ4dfmxO9Mb4l1nT
	lNiLhvrdQvySgizqI4UODvDwznBDqdz7r2EQzbXlhV5ebafxF0HOk/tgnewvTpy+CZz0eXkQbxysX
	V//k3/Ap1RsmJVDKCBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NKG-0000000Brrs-0RMv;
	Tue, 07 May 2024 16:05:56 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NKB-0000000Brop-2t0x
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 16:05:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84426C0003;
	Tue,  7 May 2024 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715097948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+LRS/kmsZa/DNe4IHprL8R5A6uCHOQg99R8YBa7jGE0=;
	b=E/fxBqOfOtWFt6IPm7Zf+B/4y6JjbaW7rJXfuVb0v1+dhoJ2hDgPu/6f5+u6U/cuG2rWT2
	DLRNgrmI0yJYH47hSoMjuBtZydYLydoCHU7e6kqqtX4oCFrXuUymqYh3xmoivU4VEjE9og
	1NAx6v39pVJtusQ6x001rfMdQBUUQarhiitwK4yZS1CslbBRj3dtSVbw3BM3nCczAJZLrL
	fg8/cguVHsXZcmZu7G7MrNORUnHix9ndZlBRHGednkO0zDRwXSA9odmSHV/cLZwtBWRe/K
	pQaUAoUlv79ONobgI0pIl0kd7sWnEeCukdgG6RJ6MifTcEWJQjge3GI4NOpQ6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] mtd: rawnand: NAND early identification fixes
Date: Tue,  7 May 2024 18:05:44 +0200
Message-Id: <20240507160546.130255-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_090552_139457_DF1330FB 
X-CRM114-Status: UNSURE (   9.19  )
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

U3RldmVuLCBBbGV4YW5kZXIsCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmVwb3J0cyBhbmQgeW91
ciBwYXRpZW5jZSwgSSBhbSBzb3JyeSBpdCB0b29rIG1lCnNvIGxvbmcgdG8gZGlnIGludG8gdGhp
cywgYnV0IEkgdGhpbmsgSSd2ZSBub3cgYWRkcmVzc2VkIHlvdXIgdHdvCmlzc3Vlcywgd2l0aCBQ
QVRDSCAxLzIgYWxyZWFkeSBzaGFyZWQgYW5kIFBBVENIIDIvMiBmb3IgYSBtb3JlIGNvbXBsZXRl
CmNvdmVyYWdlIG9mIHRoZSBpc3N1ZS4KClRoaXMgaXMgb25seSBjb21waWxlLXRlc3RlZC4gQ2Fu
IHlvdSBwbGVhc2UgZ2l2ZSB0aGVzZSB0d28gcGF0Y2hlcyBhIHRyeQphbmQgbGV0IG1lIGtub3cg
aWYgaXQgc29sdmVzIGFsbCB5b3VyIGlzc3VlcyBvciBpZiB0aGVyZSBpcyBzb21ldGhpbmcKZWxz
ZSB3ZSBzaG91bGQgdGFrZSBjYXJlIG9mPwoKQ2hlZXJzLApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFs
ICgyKToKICBtdGQ6IHJhd25hbmQ6IEZpeCB0aGUgbmFuZF9yZWFkX2RhdGFfb3AoKSBlYXJseSBj
aGVjawogIG10ZDogcmF3bmFuZDogQnlwYXNzIGEgY291cGxlIG9mIHNhbml0eSBjaGVja3MgZHVy
aW5nIE5BTkQKICAgIGlkZW50aWZpY2F0aW9uCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YXNlLmMgfCAxNCArKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
