Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6853C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1chH7b0WFh5o1MVyNgPZfe+s3XKlQ2vKFgF29T6EiW0=; b=MIbXfHDTNCnOa6
	r30IuI1lMCucm+nlYXuwHl4Dk6knJBAOvUTnw/wzxe7m6WffT1E7mWtRapLSHMhQDHn0wuOvHpVww
	Epkki3zpvO6teyiBTm5aaplQlL4ScPPqXwi9LenpUwd38WEzt3AF6ug2LSgiGfbQVRM6szDIF7vjV
	0/z68KROYPZV7pAsyue8RtWGVel9w0xFGK7qi/mbp4Sg20dEjcsrhmJJnS5uW83eDWtI+MqXwKLx7
	ZFsu1wcM8DRIjjxlp1Emnffuq68zDLrraH3uN42OtMhpylIXN5TdAg28N9SunFq24zzW6G8wbHIh6
	6pkOcdKGjGWCPcArEKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ove8F-00DnjA-KJ; Thu, 17 Nov 2022 12:36:39 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ove8C-00Dnd9-9y
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 12:36:37 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1668688586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z4MrYjbKsvS7dc79yNLvhFfNXfIiOrVHTG1RytCGWi8=;
	b=MeiXQZPs4gKo+k8/Zk6OM1T7WFblVklgTWM8O3lMNnYHzT+s9xXZLpThAe2U87J05vIuXa
	1VzXaI5q6S0EZRITeCkrJmzBFAnE+TkKPcPA1R6eJ98wN1sqT+09VCmJdSTMRuD90jN+sT
	bejmmRgCaulNBGeHc75fzEA+hRjKWPE=
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	trufanov@swemel.ru,
	vfh@swemel.ru
Subject: [PATCH] mtd: lpddr: Added literal suffix
Date: Thu, 17 Nov 2022 15:36:25 +0300
Message-Id: <20221117123625.117161-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_043636_530230_A22B4E1D 
X-CRM114-Status: UNSURE (   8.41  )
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

The value of an arithmetic expression
1 << lpddr->qinfo->DevSizeShift is subject to overflow
due to a failure to cast operands to a larger data
type before perfoming arithmetic

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/mtd/lpddr/lpddr_cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index ee063baed136..360b2af8340b 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -61,7 +61,7 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 		mtd->_point = lpddr_point;
 		mtd->_unpoint = lpddr_unpoint;
 	}
-	mtd->size = 1 << lpddr->qinfo->DevSizeShift;
+	mtd->size = 1UL << lpddr->qinfo->DevSizeShift;
 	mtd->erasesize = 1 << lpddr->qinfo->UniformBlockSizeShift;
 	mtd->writesize = 1 << lpddr->qinfo->BufSizeShift;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
