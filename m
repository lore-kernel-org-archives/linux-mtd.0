Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17788CCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SqMOXLuN5Ovm0nxOjxK9z7zfHwlAAn/416v0loqpgD4=; b=DxMymdU17/9/M+
	y5tOX2gSLQcpEj2G601YJYSq0iMpBrI6l4sTI7ff4R7R2CJySKbVbMM3Wu9Su9VOuCnFStb+GEmDA
	6nByD2sXzYIK7NKia6872kJtaGU74X7LMDMtGm4TyRRFAJJDXOdkBH5ETRcy1QChybKAreyDkggzH
	iZ01HP2teWqXRvCKjOJuz8Gq4+Y74MVg/9rOK5z21eMUc+ZTVLLwDZDpG2ZQgDEb4f+M755vZti9P
	DUax4auIiKUkw9Y4M2ajyEFJxx0B9gpRUDCwum55Tp4U6AcnXNqoupUUMm8NjwlXESfiP/RkAGvhd
	eS4UicLJ7jm1b0rzFCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTna-00000001zEk-2S9K;
	Wed, 22 Oct 2025 08:02:22 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTnX-00000001zBL-2SZo
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 08:02:21 +0000
X-UUID: 6629df54af1d11f0a38c85956e01ac42-20251022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:b97e0a3b-8bae-46db-b23f-3929984af970,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:3ad24c58edeb1b9ffe37f19047c79524,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6629df54af1d11f0a38c85956e01ac42-20251022
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1312065914; Wed, 22 Oct 2025 16:02:05 +0800
From: tanze <tanze@kylinos.cn>
To: richard@nod.at,
	hengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tanze <tanze@kylinos.cn>
Subject: [PATCH] ubifs: using vmalloc_array() to handle the code
Date: Wed, 22 Oct 2025 16:02:00 +0800
Message-Id: <20251022080200.526003-1-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_010219_980606_92545E37 
X-CRM114-Status: UNSURE (   7.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Change array_size() to vmalloc_array(), Due to vmalloc_array()
is optimized better,uses fewer instructions, and handles
overflow more concisely

Signed-off-by: tanze <tanze@kylinos.cn>
---
 fs/ubifs/lpt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 441d0beca4cf..dde0aa3287f4 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -628,8 +628,8 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	pnode = kzalloc(sizeof(struct ubifs_pnode), GFP_KERNEL);
 	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_KERNEL);
 	buf = vmalloc(c->leb_size);
-	ltab = vmalloc(array_size(sizeof(struct ubifs_lpt_lprops),
-				  c->lpt_lebs));
+	ltab = vmalloc_array(c->lpt_lebs,
+			     sizeof(struct ubifs_lpt_lprops));
 	if (!pnode || !nnode || !buf || !ltab || !lsave) {
 		err = -ENOMEM;
 		goto out;
@@ -1777,8 +1777,8 @@ static int lpt_init_rd(struct ubifs_info *c)
 {
 	int err, i;
 
-	c->ltab = vmalloc(array_size(sizeof(struct ubifs_lpt_lprops),
-				     c->lpt_lebs));
+	c->ltab = vmalloc_array(c->lpt_lebs,
+				sizeof(struct ubifs_lpt_lprops));
 	if (!c->ltab)
 		return -ENOMEM;
 
@@ -1846,8 +1846,8 @@ static int lpt_init_wr(struct ubifs_info *c)
 {
 	int err, i;
 
-	c->ltab_cmt = vmalloc(array_size(sizeof(struct ubifs_lpt_lprops),
-					 c->lpt_lebs));
+	c->ltab_cmt = vmalloc_array(c->lpt_lebs,
+				    sizeof(struct ubifs_lpt_lprops));
 	if (!c->ltab_cmt)
 		return -ENOMEM;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
