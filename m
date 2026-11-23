Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6470606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sSvnsW09;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=ZBkPBmZk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xejjf3WvZmekWtfzoparMGJWTzn3CckYf6GMQfHulYM=; b=sSvnsW09HRcF4/IN1ILR4O+vAb
	ORczhNn4Fr//Cqf3TQuPjuz0zZbcfGVRrRWLKwpxZnvGc9RltNhn8ZHERm5btwC7KDkPiLZVhx7cB
	UXoxpQQTpcIreO4GZL40zNY8XknpLmkQSClDS/uz1xHiwFYPfE7LFiID1H6zbJM2AuYKHEn/uMXMz
	hxJoWysncdIZjC018vRz62pWHDt0sg+Sz9bLIEuiD6vZ9qhStPVx0pDoCVg9KNIZPBy6FsGf2YH2e
	cFiyADw2BBh1LYslzwQUtUEYpfY5AlgMOPqqKX7pdWDS7006hCPS0qBB4lUl8YeE/PTP0dMMX0/91
	kMSK5OMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPtq-00000002dDL-3ovG;
	Mon, 23 Nov 2026 08:59:46 +0000
Received: from r3-17.sinamail.sina.com.cn ([202.108.3.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPsc-00000002ck2-0IHQ
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 08:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795424310;
	bh=aR0tmA1/eSKWhAkyRRrHigR/ndR4gGbRzgjxSxU95kk=;
	h=From:Subject:Date:Message-ID;
	b=ZBkPBmZkp2GsQ8LWnWUIkp3aykz7Wsx/LvEBLl+HocCvfGhjOftfYSV9cXMd0CkOP
	 WKb5Sv50UdC64Cuve56mlT0YeZMfDqQWdOPbsnxrWPiOMH34T1eFT1XH3U72cYyOl7
	 0J6j72BtXxCIzDN8kEwtN3XSXX/3pjo+p+GXlrEc=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.34) with ESMTP
	id 6B040016000026E2; Mon, 23 Nov 2026 16:58:00 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5481496291758
X-SMAIL-UIID: 968F27132CE0417C82722B29A6077732-20261123-165800-1
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
Subject: [PATCH v3] mtd: phram: Use I/O memory accessors when in uncached mappings
Date: Mon, 23 Nov 2026 16:57:58 +0800
Message-ID: <20261123085758.152229-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120094434.107278-1-eadavis@sina.com>
References: <20261120094434.107278-1-eadavis@sina.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005843_871753_261CD9FF 
X-CRM114-Status: GOOD (  11.97  )
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

phram_point() exposes a uncached pointer that obtained via ioremap() in
mtd->priv, which leads callers to perform standard memcpy() on it.

In phram_read/write/erase(), standard memory accessors are used when in
a cached; otherwise, I/O memory accessors are used. Only register _point
and __unpoint when cached mapping.

Fixes: f3d45ac21e46 ("mtd: phram: Module parameters add writable permissions")
Fixes: 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
Reported-by: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ee09ee2112d03c35f1f7
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: use phram_mtd_list cached, add void __iomem* and write use toio
v2 -> v3: update subject, conditionally register _point and _unpoint

 drivers/mtd/devices/phram.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..d7a074a69e62 100644
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
@@ -147,8 +163,10 @@ static int register_device(struct platform_device *pdev, const char *name,
 	new->mtd.size = len;
 	new->mtd.flags = MTD_CAP_RAM;
 	new->mtd._erase = phram_erase;
-	new->mtd._point = phram_point;
-	new->mtd._unpoint = phram_unpoint;
+	if (new->cached) {
+		new->mtd._point = phram_point;
+		new->mtd._unpoint = phram_unpoint;
+	}
 	new->mtd._read = phram_read;
 	new->mtd._write = phram_write;
 	new->mtd.owner = THIS_MODULE;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
