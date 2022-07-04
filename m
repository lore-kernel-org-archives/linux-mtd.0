Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C368C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jul 2022 02:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nCyVJUwXsF6G+HLC5F1Xx3d19cwcfPsL5nyvQ0hZMf8=; b=wHNxpDgeNRPcQ2
	fDcn8mQ8h3He3eEBzR0ZhIVTFQ2mwyW4yMCfbdNONGrBE+F6I3N39o0cf7kd4AueNumTOt7huYkWm
	vN7W2n76+wU/H4yB6RpIO+i3OFUmmSbWALq9CfSlYM9261JVXw8oS2yi43wT4KwaxEresoArI6njY
	nWE2pFsWHo2SFkvT4Nn13WQDnOeWOnECCvni8d0EULiKh8BLO59ciLa+VuF0XoeEZrF7lysgVKh6W
	RvklZoaeE/+hVS4LAS+NqN3BeEcC0VxV4BPd/wOOc0kRFQhxoe+PdAvMybYcmYToNT1WGu3tZkHwy
	9U5lC9eRl0U/PUUF1amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8BbR-003Onp-1w; Mon, 04 Jul 2022 02:14:21 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8BbL-003OYD-Qk
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2022 02:14:17 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id CF54A1E80C95;
	Mon,  4 Jul 2022 10:12:08 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTWRuc3kLf8M; Mon,  4 Jul 2022 10:12:06 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: jiaming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 9C0051E80C90;
	Mon,  4 Jul 2022 10:12:05 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liqiong@nfschina.com,
	renyu@nfachina.com,
	Zhang Jiaming <jiaming@nfschina.com>
Subject: [PATCH] ubi: fastmap: Fix typo in comments
Date: Mon,  4 Jul 2022 10:13:56 +0800
Message-Id: <20220704021356.14849-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_191416_095474_610CC197 
X-CRM114-Status: UNSURE (   8.30  )
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

There are a typo(dont't) in comments.
Fix it.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 55bae06cf408..ab413a674783 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1464,7 +1464,7 @@ static bool scrub_possible(struct ubi_device *ubi, struct ubi_wl_entry *e)
  * ubi_bitflip_check - Check an eraseblock for bitflips and scrub it if needed.
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock to schedule
- * @force: dont't read the block, assume bitflips happened and take action.
+ * @force: don't read the block, assume bitflips happened and take action.
  *
  * This function reads the given eraseblock and checks if bitflips occured.
  * In case of bitflips, the eraseblock is scheduled for scrubbing.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
