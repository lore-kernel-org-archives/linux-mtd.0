Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08842606A320
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 05:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2oCTk2gE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=C5J8yU9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iA/HfGth34KMF7220FmEok/2NzRDWpRoFfnJ/k78giI=; b=2oCTk2gE4kbFrhTQRi4lfcIrPQ
	bcsrmo+rruK13FBi1KMqyahCqHV+TqRXMCXct7beKIWTPugPivGRFRPEC7UuiveSoCBdH1GpziUy3
	/mU0PLxj5Z3SRVf2ag8rsiyOLHjsXGn/XvFS5vazkQ9HfB0mUX4h9BNMWZFgj9IPb89EIbb5//uKW
	/wf9wGGkr8L7MYhSm74kplAOfGL9NZV2jeTW1V2r1V8jbTKRZfbmz6wq2BSiJtQDzyB+40MaZ9dRD
	mGWEoXQlUW7z16ZtPNxuYU6C0KSr0c6oijQEWHpYxTWiYpheO0ySIRyY3Bx/OGph9JwvXtj23JGfm
	fM0kRhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUH7E-0000000E3zg-2TgT;
	Fri, 20 Nov 2026 05:24:52 +0000
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUH7A-0000000E3yp-0BDw
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 05:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795152288;
	bh=TItee/T03NTRENeR4cH4C0LDyn0Kmlrpb5BazOHyBL0=;
	h=From:Subject:Date:Message-ID;
	b=C5J8yU9ZjLmeZQz45tDQieZD10/bJCs5xOqpNQdBFs9MrasHPMgZA9v76uqiMp35x
	 ZNoKkXHCYUIh2YFP/C73RhexhTu9RAod7CFv8OjHnpSughR3wz2Gb3Kz9xCdf4j+3A
	 sPIptN4rV9DkrKyrbtcFZh68ekHuPmPP6QRpmlYg=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.33) with ESMTP
	id 6AFFD99200004AB0; Fri, 20 Nov 2026 13:24:37 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 3965716685128
X-SMAIL-UIID: B96F6B02782F4AC6A66F80A8AF9D5791-20261120-132437-1
From: Edward Adam Davis <eadavis@sina.com>
To: sashiko-bot@kernel.org
Cc: eadavis@sina.com,
	joern@lazybastard.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sashiko-reviews@lists.linux.dev,
	syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH v2] mtd: Use I/O memory accessors when in an uncached
Date: Fri, 20 Nov 2026 13:24:34 +0800
Message-ID: <20261120052434.101613-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-224471@kernel.org>
References: <sashiko-outbox-224471@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_212448_717657_4AF7453B 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When registering a phram device via module parameter or sysfs invokes
register_device() with pdev = NULL, which causes new->cached to be false.
As a result, phram_map() maps the physical memory region using ioremap()
(mapped as PROT_DEVICE_nGnRE on arm64) and forces the pointer into mtd->
priv, yet phram_read(), phram_write(), and phram_erase() access it using
standard memcpy() and memset() instead of I/O memory accessors (like
memcpy_fromio()). When scanning partition headers (e.g., ftl_add_mtd()
reading a 68-byte header via mtd_read()), arm64's memcpy implementation
issues pair-load (ldp) instructions at unaligned offsets, which triggers
an alignment fault (FSC = 0x21) on Device memory and crashes the kernel.

In phram_read/write/erase(), standard memory accessors are used when in
a cached; otherwise, I/O memory accessors are used.

Fixes: f3d45ac21e46 ("mtd: phram: Module parameters add writable permissions")
Fixes: 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
Reported-by: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ee09ee2112d03c35f1f7
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: use phram_mtd_list cached, add void __iomem* and write use toio

 drivers/mtd/devices/phram.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..802da960d840 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -43,8 +43,14 @@ static LIST_HEAD(phram_list);
 static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	u_char *start = mtd->priv;
+	struct phram_mtd_list *phram =
+		container_of(mtd, struct phram_mtd_list, mtd);
 
-	memset(start + instr->addr, 0xff, instr->len);
+	if (phram->cached)
+		memset(start + instr->addr, 0xff, instr->len);
+	else
+		memset_io((void __iomem *)start + instr->addr, 0xff,
+			  instr->len);
 
 	return 0;
 }
@@ -66,8 +72,13 @@ static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct phram_mtd_list *phram =
+		container_of(mtd, struct phram_mtd_list, mtd);
 
-	memcpy(buf, start + from, len);
+	if (phram->cached)
+		memcpy(buf, start + from, len);
+	else
+		memcpy_fromio(buf, (void __iomem *)start + from, len);
 	*retlen = len;
 	return 0;
 }
@@ -76,8 +87,13 @@ static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct phram_mtd_list *phram =
+		container_of(mtd, struct phram_mtd_list, mtd);
 
-	memcpy(start + to, buf, len);
+	if (phram->cached)
+		memcpy(start + to, buf, len);
+	else
+		memcpy_toio((void __iomem *)start + to, buf, len);
 	*retlen = len;
 	return 0;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
