Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA44CCD199
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qWdZ3Uifs8WV9uRbaTY+HqyM3kc3xwy5XN6wbss+xkg=; b=qrCOwinVE5LmwL
	9j13Juv0wXjExl+nQqkvWNq1k7Na0tB8Z9uBVxGjNHG3B5emkQIAFQpipHrp8IedpkKnX4Bdu5Rq9
	B4Im8lTLZa0/i+gG3pji2OOEMa7NzhfFN4ZO2smu3Zua6Piwcs3FE4MhgIEdapgXNLJmB7QB9PPNZ
	Lr9ZSJx4bG7BI1YxMjyrfV0i9fsWaXGHy/FAKUgVz5hUkiEUlYRfdKtnOo6RFfV4CdVa0Ur/Nmvg2
	ZHbuwNYAgyERCPKsXfTy+JlQVT/RfX8Ivq4VelwWC3BerHoonei6EY8N/vcxXZS1kn7/aOH+bN5Dt
	OqdqvssJWeFN4HFNF5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApOY-0000000DeRA-3BAA;
	Mon, 20 Oct 2025 12:53:50 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApOW-0000000DeOE-02iT
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 12:53:49 +0000
X-UUID: cb4c0f12adb311f0a38c85956e01ac42-20251020
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f910d0c3-7f34-48e6-b4ec-4a4fdabd0173,IP:0,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:a9d874c,CLOUDID:54cfd040c6b2de2905d497e7cb8a6c40,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:5,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cb4c0f12adb311f0a38c85956e01ac42-20251020
X-User: liqiang01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liqiang01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 813802747; Mon, 20 Oct 2025 20:53:36 +0800
From: Li Qiang <liqiang01@kylinos.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Qiang <liqiang01@kylinos.cn>
Subject: [PATCH] mtd: rawnand: realtek: Make rtl_ecc_engine_ops const
Date: Mon, 20 Oct 2025 20:53:33 +0800
Message-Id: <20251020125333.3400488-1-liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_055348_348759_DDE078CA 
X-CRM114-Status: UNSURE (   8.76  )
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

The rtl_ecc_engine_ops structure is only used to provide a set of
callback functions and is never modified after initialization.
Mark it as const so it can be placed in the read-only section, which
improves safety and allows better compiler optimization.

Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
---
 drivers/mtd/nand/ecc-realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
index 7d718934c909..32da4c15fbe9 100644
--- a/drivers/mtd/nand/ecc-realtek.c
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -380,7 +380,7 @@ static void rtl_ecc_cleanup_ctx(struct nand_device *nand)
 		nand_ecc_cleanup_req_tweaking(&ctx->req_ctx);
 }
 
-static struct nand_ecc_engine_ops rtl_ecc_engine_ops = {
+static const struct nand_ecc_engine_ops rtl_ecc_engine_ops = {
 	.init_ctx = rtl_ecc_init_ctx,
 	.cleanup_ctx = rtl_ecc_cleanup_ctx,
 	.prepare_io_req = rtl_ecc_prepare_io_req,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
