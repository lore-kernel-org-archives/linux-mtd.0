Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B53C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Nov 2023 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+3mm9otMgS9cNa9SDFEJp1g45AfG7px5w673cgzS2aA=; b=0y1OGiby4qYbED
	x+Z8GZWij8k+wz8HMLX9z5+FemlhfqNubCMY3rYnzdU0XR/B+Zy2I4A9UbIB7fLq6BqUlrdF/xlR9
	Pzal8lVI51HFawCoxbxk+jX1GuVMwxBCGeoom0wmFn52kWJ3bzBY3FV7sqsZ/gvExwqSAatV/zf2U
	jNon3Rl6NDmauhms3R6K09gNTXOAuiMXSENsAf1eA+PrSxrJqiAytT7X0GD0uSqzUDYDbQ4NimmU5
	NScDfXplYIvArwlEGeLY574qgIY/vC82IBszq5BZ358wj2NnIVW7HbLZQxBr+mGJm8TbsjoBQwZqR
	Jb0bk1cDSsLkZ1V3q3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1p4U-00B5lJ-0Z;
	Sat, 11 Nov 2023 14:34:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1p4S-00B5km-0D
	for linux-mtd@bombadil.infradead.org;
	Sat, 11 Nov 2023 14:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=88bRG1lcroix3W45YzyTApmvMKSO7QbkupyHybMI5uo=; b=fRW3Uv1+sBnFWOOhpZBzVJ9rui
	EACcEtNK+Clnx5nAGxFWknx5AhCx2wkQ5WHrHc4ESuhH65gVqbZWwqJnfSU3vnbEw4UT6zM7bSsO1
	7lmrdJ470klo7BZyx+RDj8lRNyiZhYTa7DKV8zZ3RSGc2ZeQgEoJvPKIR5M0UnFPsCEwBrZS6iw68
	cjFFw5avT8ywJAfK4jCEt+bLzIe6t0g5OL04SMjxcd/LP3mcbLKg0ZFuGUnkYE5+gUwWxP86WWitw
	ClcydzAX37Wy2bKYiJViZqODlvwgjaeZV6ye1CDI2gblumM0HwOpBi3Vz9OfnyTT4CgqcSdyZC3aV
	1QPjDzTA==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r1p48-002RNR-Cl
	for linux-mtd@lists.infradead.org; Sat, 11 Nov 2023 14:34:41 +0000
X-UUID: 3acd5ef20ddb4d659c0118824e4b727b-20231111
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:aa2daf27-020b-44d2-ba81-26b6c03d0361,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-INFO: VERSION:1.1.32,REQID:aa2daf27-020b-44d2-ba81-26b6c03d0361,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:fca8f15f-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:231111222744ETFN0OQ7,BulkQuantity:1,Recheck:0,SF:66|38|24|17|19|44|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 3acd5ef20ddb4d659c0118824e4b727b-20231111
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.169)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1167861007; Sat, 11 Nov 2023 22:33:27 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: richard@nod.at,
	Artem.Bityutskiy@nokia.com
Cc: kunwu.chan@hotmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] ubifs: Remove unreachable code
Date: Sat, 11 Nov 2023 22:33:14 +0800
Message-Id: <20231111143314.1518314-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_143438_476282_F47DCF81 
X-CRM114-Status: UNSURE (   6.96  )
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

Because there is no break statement in the dead loop above,it is
impossible to execute the 'err=0' statement.Delete the code that
will never execute and initialize 'err' at the start of the function.

Fixes: 6fb324a4b0c3 ("UBIFS: allocate ltab checking buffer on demand")
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 fs/ubifs/lpt_commit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index c4d079328b92..d4751628fe70 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1589,8 +1589,8 @@ static int dbg_is_node_dirty(struct ubifs_info *c, int node_type, int lnum,
  */
 static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 {
-	int err, len = c->leb_size, dirty = 0, node_type, node_num, node_len;
-	int ret;
+	int len = c->leb_size, dirty = 0, node_type, node_num, node_len;
+	int ret, err = 0;
 	void *buf, *p;
 
 	if (!dbg_is_chk_lprops(c))
@@ -1646,7 +1646,6 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 		len -= node_len;
 	}
 
-	err = 0;
 out:
 	vfree(buf);
 	return err;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
