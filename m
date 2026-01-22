Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98779D3EE62
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4OrvTXk4o+cq880xC/9eEZpIG4xTrk0xGP2nzBBjiBg=; b=gVVGIuIXYMt7pJ
	o42sSkSsdhzwlwnlF65N5Ut6tk3bpQ670uMTJd5IrQl0TaTOlsdUlPnUpDaKoguMiD5Ld4S7G0dDA
	sk1PHBvH/2skmWdgCpNnGOf4ULU6nOVnxNdxUS+TcA9M/U1wAwxrUMKVThVWENJ+7chnBvccqwxCm
	NTYGoC7Ba+iimzF2KcaLQaJxYgcALESzRx3UHt5kovVCkMSNmO8Sd/OmrFc+oX40T7/AL5cFLQ3Wk
	oAwE0adVx2TbOBbq9T4cLqSA3xXmfsPmjVHoaVVOfSXjh/kdlBs1OxYOycfg5BYyweYVxeIlnCUBw
	aKeTjZyNonXnD5FavHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuRm-0000000775i-0Pzf;
	Thu, 22 Jan 2026 13:10:02 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuRi-0000000773n-38OX
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 13:10:01 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 319b85ee9;
	Thu, 22 Jan 2026 21:09:52 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] mtd: parsers: Fix memory leak in mtd_parser_tplink_safeloader_parse()
Date: Thu, 22 Jan 2026 13:09:50 +0000
Message-Id: <20260122130950.758563-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9be5d35a0703a1kunmf2b331223ed2f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEtNVklCTUgZQx5JQx5CQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=j1ZZJ+5gjWiD1VgfqRJYlg5twZ+9SxvDQpc9fndhmnwUF3lvIHwAxnr+yKvQXXLtgMVgVTZ6KuAA8VE3mNpDolFYcS6+0Sru9Vr2jpY32GOI41w2WfO8wCIjOMqN/zARW5kG/OA8w4OGuZJD84vaDhdpIcSOrGV5q7zI4RNLbPA=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=YeI5p4thje2zu1p2OI+kafuurM2OYDaenOJ0uKDaqeo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_050959_454465_8987C768 
X-CRM114-Status: UNSURE (   7.64  )
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

The function mtd_parser_tplink_safeloader_parse() allocates buf via
mtd_parser_tplink_safeloader_read_table(). If the allocation for
parts[idx].name fails inside the loop, the code jumps to the err_free
label without freeing buf, leading to a memory leak.

Fix this by freeing the temporary buffer buf in the err_free label.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: 00a3588084be ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/mtd/parsers/tplink_safeloader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
index e358a029dc70..4fcaf92d22e4 100644
--- a/drivers/mtd/parsers/tplink_safeloader.c
+++ b/drivers/mtd/parsers/tplink_safeloader.c
@@ -116,6 +116,7 @@ static int mtd_parser_tplink_safeloader_parse(struct mtd_info *mtd,
 	return idx;
 
 err_free:
+	kfree(buf);
 	for (idx -= 1; idx >= 0; idx--)
 		kfree(parts[idx].name);
 err_free_parts:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
