Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4C9C43458
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2026 01:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2xHjRW9DyfxpccXhvEc11CAuRizqoqtQDsfSgzRvcEE=; b=KvAGVDVXizeQRm
	dS/RQ3sk5Ygwu4Ub+lgGfvAx7aNC/7EZ5S/fBTyCpjoo54UacKQC7zqfMrDZwlfHZPAhFZ7JaLlTo
	uaoVrk2PBqFshpgOtSZuyl02Nprp/G7wyIHa2TWb73s2ux6RGTnQ5uEpjsgtcFwjXeixHMQ+cZDtp
	xNOLW5Dz+kya8pOgTgHEYUnP/z4Xn1yY6zsxKf+AcqQpL9613uVzahlq0RhRR+Qnl5rLAulpUzboQ
	8inPBr6vcCLi81SnUfHLE3fphd65kok0XbYeahbYttxMvvJQZmjLdF4FIcSB4Zbpkc5jgCOobVjui
	CM/q4g1vhG4rCVge/n+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHPd-0000000G7hU-3qDq;
	Wed, 08 Jul 2026 01:49:21 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHPa-0000000G7h1-2SU9
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jul 2026 01:49:20 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACXapGZrE1qqIIiFw--.45497S2;
	Wed, 08 Jul 2026 09:49:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Linus Walleij <linusw@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 RESEND] mtd: afs: validate v2 image info bounds
Date: Wed,  8 Jul 2026 09:49:06 +0800
Message-ID: <20260708014906.1463-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowACXapGZrE1qqIIiFw--.45497S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw13CFy5JFWxGF1Utw45GFg_yoW8uw4Upa
	1jgay7tw4kJa109F4kAws7W3ZxGwn5JFW7Ga9rX34DAFZ3Cr98WayFkry0vr4Skr47WrnF
	vrs8ta4rZF9rurJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUpwZ
	cUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_184919_027143_0206D37E 
X-CRM114-Status: GOOD (  11.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The AFS v2 parser uses footer[8] to locate the image information block
inside the current erase block, then uses the image information
region_count to walk entries from a fixed local array. The footer offset
and region count come from flash contents and are not checked against the
erase block or the local image-info array before use.

Reject v2 entries whose image information offset would underflow the
erase block calculation, and reject region counts that cannot fit in the
local image-info array before walking region entries.

Fixes: b7cf5e2830bb ("mtd: afs: add v2 partition parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- v1: https://lore.kernel.org/r/20260706094059.82323-1-pengpeng@iscas.ac.cn/
- add Fixes and Cc stable tags

Resend note:
- resend with the complete Cc list; no patch changes

 drivers/mtd/parsers/afs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 26116694c821..7ab3d50f565e 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -235,6 +235,9 @@ static int afs_parse_v2_partition(struct mtd_info *mtd,
 	pr_debug("Parsing v2 partition @%08x-%08x\n",
 		 off, off + mtd->erasesize);
 
+	if (mtd->erasesize < sizeof(footer))
+		return -EINVAL;
+
 	/* First read the footer */
 	ptr = off + mtd->erasesize - sizeof(footer);
 	ret = mtd_read(mtd, ptr, sizeof(footer), &sz, (u_char *)footer);
@@ -245,6 +248,8 @@ static int afs_parse_v2_partition(struct mtd_info *mtd,
 	}
 	name = (char *) &footer[0];
 	version = footer[9];
+	if (footer[8] > mtd->erasesize - sizeof(footer))
+		return -EINVAL;
 	ptr = off + mtd->erasesize - sizeof(footer) - footer[8];
 
 	pr_debug("found image \"%s\", version %08x, info @%08x\n",
@@ -278,6 +283,8 @@ static int afs_parse_v2_partition(struct mtd_info *mtd,
 	entrypoint = imginfo[pad];
 	attributes = imginfo[pad+1];
 	region_count = imginfo[pad+2];
+	if (region_count > (ARRAY_SIZE(imginfo) - pad - 3) / 4)
+		return -EINVAL;
 	block_start = imginfo[20];
 	block_end = imginfo[21];
 
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
