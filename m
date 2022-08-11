Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87135C19F2A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aifKSOVXVMiIRn591vMvQKqMwUdwh/cN6uujSjdUQ+8=; b=dWltnpZfWmo8IO
	FScFuBDKBR0NInINQyPk4kGixL1BvYE7/r7M1IIs29EdJ8FdLU0Es2HBAPHwnVvw0z8okecuyvlbr
	/pKMvn9w2KT7pFS/0gk/5R8Vq50QwepPFw/9DehFmgexTBp7t9XuPP0+WgfWH2HfOj5l82dlTkFQ8
	Sz9X7b/3mC4E6MGh8+LU+w8INvp6Uys/uYNnblD6S6gPAxsnFxV0gBQURK0h9RQTP9rzigcdN20tt
	i9oNfjho91K1wDdo4aUKRyIoyol+6h7aN2ZWEx8fJQ1acishM8zvUtnxNsSCvs69q65FC4qMCb5fW
	RqWlf8VOGnMBGCRYNhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM8iS-00CyPp-JN; Thu, 11 Aug 2022 13:59:16 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM8iO-00CyKV-RO
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 13:59:15 +0000
X-QQ-mid: bizesmtp85t1660226342tbq3avfi
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Aug 2022 21:59:00 +0800 (CST)
X-QQ-SSF: 01000000002000G0V000B00A0000020
X-QQ-FEAT: +ynUkgUhZJns9Hywu1JtC6+YgWtE5HVVtHMMXcmSGm7pZwDUszPEB2dzRu5CQ
	5sRpIT/xi3uOfGsYxAVuml/X7jsmNO+1qbl2oF/jJU1+tXEkIfJwosYyizy28Nm6m23Da7P
	Ew6xW6BoxRlcVdESy1Ll5uGWvcs5DcbhxSi/5qK2amqVe0tNLdT9UqYOEXHY3iAwiEp3a5y
	ITZy8kM6GwAC7wvsHmEDZMeauGaasjU/skHRCqQrVGyeIIGwSy2NqkuZwnQSwVzYd736AAV
	CXwgGVGN+UQx3CfEkJJzxUKphMML2C/FChn3sVhEPYZkUbk2wfAcwLQc493UQLhRSVonN9a
	4wVChmewi+b7KV27UdTxVsZCdu8xHrIw9b6SMqO75HKTgncnf/W4TPNf0w88163aWGhGg9i
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: miquel.raynal@bootlin.com
Cc: han.xu@nxp.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] mtd: rawnand: gpmi: Fix comment typo
Date: Thu, 11 Aug 2022 21:58:54 +0800
Message-Id: <20220811135854.27036-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_065913_226468_9F2D046C 
X-CRM114-Status: UNSURE (   9.82  )
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

The double `the' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 93da23682d86..01ccbde748f3 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1361,7 +1361,7 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 /*
  * Handles block mark swapping.
  * It can be called in swapping the block mark, or swapping it back,
- * because the the operations are the same.
+ * because the operations are the same.
  */
 static void block_mark_swapping(struct gpmi_nand_data *this,
 				void *payload, void *auxiliary)
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
