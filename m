Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E747C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ypd26bq8W6VThBR4pyRFGX7brrU5If4/fOPdQ4uLuY=; b=ItSxV0ZY2FO0DR
	dNJUFJMuD2ljT+DvikroULnKZ60Dzdbo/GyMjgK+gaKgIIFhKdmwF0aC24qDR3kaZjxLbuPtDgc5p
	UQTDG6l9vPjIjT7Q2Crp4my/wKKcB/a06W5SRNkJigz9j4JlkOPZs4fOtYhY4BvmH9bZWPItOpAp3
	wuKK+2XThFzDumAbAgao/9lhz3cYrrEzP+2z/xhN7sY5PJM4WjlIGZAdZ5j3Nxr3CWkhBGnP5SsxZ
	yfKSxr9w9cpWQsu4utkp8pYzO54HvmP41MJJA5k4BJnlNqobYUHWzvvwSbLd0QpYLvfF9QW6c4Br8
	+63CZNITko8hPIlX6+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7avH-00000004xuF-1nqI;
	Thu, 16 May 2024 13:13:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7avE-00000004xse-2Xxz
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 13:13:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D918940008;
	Thu, 16 May 2024 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715865201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ldj9Hwr3ACMQJOfyijq2ogVzKbaNWAcCqIJ+yIrSRwM=;
	b=aMbJfEGGQ4EsNSklB0o91SHVR1qYA94miNzTbl+JilM6pFu7mUYf7RNcoyIgD5Rj1SVlNT
	BSmqeWczQY4vV7UXE6TD74R59V5+oYFiUzb2gCqA02gipj99pCKivmWGUWDnfFa/glJ46G
	vweNMfcj8q5m15MTIN/MK6ZxtBYuNKuWiwJsyenlo8qjDYNk5sEBJE/damm5YrbZyXSKLE
	cdJDJ7tromrIQGfg7GgKj1KfmbbyGpsS+GezzIk+qFqqzVZwJDmUwywiv9O11cPEaTkHAN
	SwFqcKbKWB/JyUjUIYm862+r7UTnzKkMOiTgkm4NhJZzLcs5mdMUmYRJdiNaDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] mtd: rawnand: NAND early identification fixes
Date: Thu, 16 May 2024 15:13:18 +0200
Message-Id: <20240516131320.579822-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_061324_957928_E2B09DF8 
X-CRM114-Status: UNSURE (   8.96  )
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
ZSB3ZSBzaG91bGQgdGFrZSBjYXJlIG9mPwoKQ2hlZXJzLApNaXF1w6hsCgpDaGFuZ2VzIGluIHYy
OgoqIFBBVENIIDEvMjogTm8gY2hhbmdlLgoqIFBBVENIIDIvMjogSSBhbHNvIGNvdmVyZWQgbmFu
ZF9maWxsX2NvbHVtbl9jeWNsZXMoKSBhbmQgYWRkcmVzc2VkIGEKICAgICAgICAgICAgIHN0eWxl
IGlzc3VlLgoKTWlxdWVsIFJheW5hbCAoMik6CiAgbXRkOiByYXduYW5kOiBGaXggdGhlIG5hbmRf
cmVhZF9kYXRhX29wKCkgZWFybHkgY2hlY2sKICBtdGQ6IHJhd25hbmQ6IEJ5cGFzcyBhIGNvdXBs
ZSBvZiBzYW5pdHkgY2hlY2tzIGR1cmluZyBOQU5ECiAgICBpZGVudGlmaWNhdGlvbgoKIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgNTkgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMo
LSkKCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
