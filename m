Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C61C35274
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QjupvcXxI73QNqNYAnfb/nANqz9JnWj3Fne8GC9zbdk=; b=vlk+1CoQVJKKkC
	SCrcjaFOG2KhkHFFjx7thMtJsh2vyWAtUcBu+Q+yH+Sgap8t64JUX3oORSa+X7U58RD9TW4Ego2ad
	eJr2gFtNkoPhcGVF/EKk77Tl3CKkzPK7q2ZoSYD4u20ZwfWlet1vD6tpLV6XE36OGe6NnNj2jViHT
	HAJoaLcxv4UdwAFwb6ZSkTA0LgmknWbco112VH65C6rtZNGk68uWB9buIaiNevOXqcppqmV3Eivce
	x5dMzNigsc3vULOnfonVF3b72n9yKmGZ4KWL5gFcD6+lk+XrloWDJtpewnQqBgJxiJoyV1S8wdcDt
	rc7n9aeu1gTnfShZj1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Ma-003EoE-2D;
	Fri, 15 Dec 2023 12:32:20 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7MW-003ElU-2t
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 12:32:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A2401BF206;
	Fri, 15 Dec 2023 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702643533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gn1svHp2dJnPRLnGDBMfdIQ/8sdqM++c6QYOegIVHzA=;
	b=QCM+TSJRlNKVmvb3DVVmKN/Wm3asfWq0vNi4oJw0fTaVgD0XF8IUaB+Mn4KyxW8rcP2FDm
	VoufzXQZU2FcxmuEG+0Nv3HGBB+c5LmKZ4NyC5Q5sKqZztV5T+WAQa7OSVGNG9u3RykpBd
	4SM0rR745aiAN/SilWDd2uUY/1vU7Z8UL4jMnEdDC0DMcpCKr69GtGqqjFcsWpIpBdzGD8
	+EGpwVH+knYifSePoI2zdXSq3oxZJYF8In1akGu7oYm83msNiR7396xMgvqLvVJGWvGY9c
	xbNsCW2GLyS22tDI55rOtjXQX/Ms5nB9kIgvQmlTzv/nY6P7XrUr/otWfhvLBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] mtd: rawnand: Fix sequential reads
Date: Fri, 15 Dec 2023 13:32:04 +0100
Message-Id: <20231215123208.516590-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_043217_062706_500B3F71 
X-CRM114-Status: UNSURE (   7.37  )
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

QWZ0ZXIgYSBudW1iZXIgb2YgcmVwb3J0cyBhbmQgaG91cnMgb2YgaW52ZXN0aWdhdGlvbiwgSSBj
b3VsZCBmaW5hbGx5CmlkZW50aWZ5IHRoZSBtYWluIGlzc3VlIHRoYXQgbGlrZWx5IGxlYWQgdG8g
YWxsIHRoZXNlIGlzc3Vlcywgd2hpY2ggaXMKYWRkcmVzc2VkIGluIHRoZSBzZWNvbmQgcGF0Y2gu
IFRoZSB0aHJlZSBvdGhlciBwYXRjaGVzIGFyZSBhbHNvIGZsYWdnZWQKZm9yIGJhY2twb3J0aW5n
IGJlY2F1c2UgSSB0aGluayBpdCBpcyBiZXN0IHRvIGFwcGx5IHRoZW0gYXMgd2VsbCBhcyB0aGV5
CmFyZSBzdXBwb3NlZCB0byBwcmV2ZW50IGEgZmV3IGNvcm5lciBjYXNlcyBmcm9tIGhhcHBlbmlu
Zy4KClBsZWFzZSB0ZXN0IHRoaXMgc2VyaWVzIGFuZCBsZXQgbWUga25vdyBpZiB5b3UgZW5jb3Vu
dGVyIG90aGVyIGVycm9ycy4KClRoYW5rcywKTWlxdcOobAoKTWlxdWVsIFJheW5hbCAoNCk6CiAg
bXRkOiByYXduYW5kOiBQcmV2ZW50IGNyb3NzaW5nIExVTiBib3VuZGFyaWVzIGR1cmluZyBzZXF1
ZW50aWFsIHJlYWRzCiAgbXRkOiByYXduYW5kOiBGaXggY29yZSBpbnRlcmZlcmVuY2Ugd2l0aCBz
ZXF1ZW50aWFsIHJlYWRzCiAgbXRkOiByYXduYW5kOiBQcmV2ZW50IHNlcXVlbnRpYWwgcmVhZHMg
d2l0aCBvbi1kaWUgRUNDIGVuZ2luZXMKICBtdGQ6IHJhd25hbmQ6IENsYXJpZnkgY29uZGl0aW9u
cyB0byBlbmFibGUgY29udGludW91cyByZWFkcwoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
YmFzZS5jIHwgODkgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIGluY2x1ZGUvbGlu
dXgvbXRkL3Jhd25hbmQuaCAgICAgIHwgIDIgKwogMiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
