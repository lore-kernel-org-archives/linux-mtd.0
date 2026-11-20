Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E9606A320
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 04:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jzTCfCWH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=X86ZJirx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ui/hEQZkYtKCRjRyD5EVzCu8yWlKH+rjA+R5kDi35t4=; b=jzTCfCWHLpAaP1rXV/cwHyhwkq
	xticrcYswIrNSIG2oHQ9hARwTzvWhkkRyk1YZ8bnX5TWqbaml8sGHvfhqmeopQaKmMu5/f2qgzgE3
	m/cXc9PfnX23p5Jy99XpCuvI38Fg2SJljgfeeFgB4ZQRg6WNthcogOHaPi0i1woiv4TbzufZzgQ2+
	RJl39V68LxltqY+lBno6A/zb2ylsVVncAVeY+lcKiPt5wxUtygSm7eaJL5FxD26PuZLB5CcgHUOvp
	nRC0PIsYGAZ58McjRAukOjLV+ccMho0EdKTzdgHGx/R+7mEb8L7rMzw+m6e6qZi/1P/hZqnm8yTE8
	7wXqbKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGNQ-0000000E2EJ-3u3j;
	Fri, 20 Nov 2026 04:37:32 +0000
Received: from r3-23.sinamail.sina.com.cn ([202.108.3.23])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGNM-0000000E2DD-3NC2
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 04:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795149448;
	bh=yXSpHCXjG8Bt6YepxA4OsIZfdP6BYPNbHrx0PkUKp3Y=;
	h=From:Subject:Date:Message-ID;
	b=X86ZJirxkb60XCMAJltmdfy9IMQcKtL9XqlFUPh1nrEOPJtQmwt0w82Bc7klnemtG
	 OZhhqBVZA3EiGGAKVOVbtT3wRCkOkSd0kdlOcb63xjzPE4aKve0m4vJzkJshFCvTjO
	 sD474O9MfyUEqOLviaw1BS9K4vLw5Q4OARHaTBaY=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.31) with ESMTP
	id 6AFFCE7600004FE7; Fri, 20 Nov 2026 12:37:12 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8121826815960
X-SMAIL-UIID: A43E84E0A2184041AEA62D24FAFD1FFA-20261120-123712-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Cc: joern@lazybastard.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH] mtd: Use I/O memory accessors when in an uncached
Date: Fri, 20 Nov 2026 12:37:09 +0800
Message-ID: <20261120043709.99845-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6afd0433.8f566acc.2517be.000f.GAE@google.com>
References: <6afd0433.8f566acc.2517be.000f.GAE@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_203729_472936_DEAE3D46 
X-CRM114-Status: GOOD (  10.03  )
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
 drivers/mtd/devices/phram.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..95bd5a9d7e48 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -43,8 +43,13 @@ static LIST_HEAD(phram_list);
 static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	u_char *start = mtd->priv;
+	struct device_node *np = mtd_get_of_node(mtd);
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 
-	memset(start + instr->addr, 0xff, instr->len);
+	if (cached)
+		memset(start + instr->addr, 0xff, instr->len);
+	else
+		memset_io(start + instr->addr, 0xff, instr->len);
 
 	return 0;
 }
@@ -66,8 +71,13 @@ static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct device_node *np = mtd_get_of_node(mtd);
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 
-	memcpy(buf, start + from, len);
+	if (cached)
+		memcpy(buf, start + from, len);
+	else
+		memcpy_fromio(buf, start + from, len);
 	*retlen = len;
 	return 0;
 }
@@ -76,8 +86,13 @@ static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct device_node *np = mtd_get_of_node(mtd);
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 
-	memcpy(start + to, buf, len);
+	if (cached)
+		memcpy(start + to, buf, len);
+	else
+		memcpy_fromio(start + to, buf, len);
 	*retlen = len;
 	return 0;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
