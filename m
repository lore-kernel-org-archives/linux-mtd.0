Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70E2ECE582
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y0XnvJjgq6Ey5nerWwq8AcRhFEVWic9ApavwKOW9bDw=; b=j/Uk5kl2XPB3qb
	Pe2i5DZAU3YqSnEvrPxyy0QsHx1N+x59uDzgoyOoX0iFax2V+L5L2TmqMB2Bzr1qiWy4L9Rrw3poS
	fzoA6b3Cigtme88Fviz5oqIeXA8ZbyNQ4rGEBv8E4Lwy8XBE6Cu9qh7kMhhuRFyRQRyh2PLg9CzkG
	ENJc6TralD+/ao6+bj/kRhy7/bk7L9NbRoLwh/aO0tBNdSf4rqdMbp2PjYQB/rwRlVLHrD2SEUO0u
	SCv00EZ2tmJ1DfTW5Tc+brU7SDeVuCQDnLeWQsgOfpNzQp+eNreku0OeapoPffdkqxBjQOhyJbUxG
	wGn0cNkoa06mA4Vp8sdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxqZ-00000005BhC-2tdD;
	Tue, 10 Sep 2024 10:11:43 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxqW-00000005Bf2-3rXK
	for linux-mtd@lists.infradead.org;
	Tue, 10 Sep 2024 10:11:42 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1725963094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mewE89KpuUNuRuPsaUATNI8/27eHihLCNzRG0ls+B1o=;
	b=a6+cA9vLVN5fCIUY7P1KcBdjoUj+ZMajIbfXX3fkGaNk2sIIAA/RG+5ivfnKYpFVS1iyFb
	P79/t6qiJ7cCrgdEnnXaUlPpUC3HKBE4EnSOlKsavU1DMdD6th1sF/urFlLU2cjyYmz1aP
	4tedQFM+BX3YjBZ6pyrNI0C3XU5N5xk=
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] mtd: partitions: redboot: Added conversion of operands to a larger type
Date: Tue, 10 Sep 2024 13:11:33 +0300
Message-Id: <20240910101133.18020-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_031141_487940_26E57256 
X-CRM114-Status: GOOD (  10.22  )
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

The value of an arithmetic expression directory * master->erasesize is
subject to overflow due to a failure to cast operands to a larger data
type before perfroming arithmetic

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/mtd/parsers/redboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 3b55b676ca6b..c8f7e7b351d7 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -92,7 +92,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	parse_redboot_of(master);
 
 	if (directory < 0) {
-		offset = master->size + directory * master->erasesize;
+		offset = master->size + (unsigned long) directory * master->erasesize;
 		while (mtd_block_isbad(master, offset)) {
 			if (!offset) {
 nogood:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
