Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B641FC3DA42
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jul 2024 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VhDIdm++fz6kTabpAobdzxflvOtpbxK4IjmTxVEXRFM=; b=td52jfadjAieOQ
	QClpg/ngjYxhhGWLOJ33jiiOCcjsYLVhCC6bgr02hYMB46ZFx7x1KUelYWFf9xzKVYkuGw0Mn00wh
	V+jAnPZbrOY5d+7XnVrf0icwgA62pnWwqjfdZhGDLCW5by4/8vP9KRvGf6q8kB/DfS3XZiCO27Li3
	qzzcLTc2M11fzL9N7kOOoDT1obnqrbwXm92FCKnGOoziUCSW2i28nnuyYtBgycWvpop7LeMXHuNzA
	JNxTWDI1ZQuokS9iOoas3DcTw3rPNhza8o6vhgSCmYouLDPCNLMMAXv2sHa3zcUgzCvqzyz/0qOKu
	PXOvg2MhtgSt4kdtR2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSXI9-000000027B2-2L70;
	Sat, 13 Jul 2024 07:35:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSXI6-000000027A7-1RFK
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jul 2024 07:35:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CB1A2606BA37;
	Sat, 13 Jul 2024 09:35:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ny2PvNGbggCq; Sat, 13 Jul 2024 09:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 252586196A6F;
	Sat, 13 Jul 2024 09:35:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EW9KpJFCFHXD; Sat, 13 Jul 2024 09:35:28 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id D883D6196A6B;
	Sat, 13 Jul 2024 09:35:27 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	Richard Weinberger <richard@nod.at>,
	Ben Hutchings <bwh@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ubi: Fix ubi_init() ubiblock_exit() section mismatch
Date: Sat, 13 Jul 2024 09:35:19 +0200
Message-Id: <20240713073519.25325-1-richard@nod.at>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_003534_548912_23C885CE 
X-CRM114-Status: UNSURE (   8.59  )
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

Since ubiblock_exit() is now called from an init function,
the __exit section no longer makes sense.

Cc: Ben Hutchings <bwh@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407131403.wZJpd8n2-lkp@intel.com/
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index bf7308e8ec2fe..60d0155be869f 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -670,7 +670,7 @@ int __init ubiblock_init(void)
 	return ret;
 }
 
-void __exit ubiblock_exit(void)
+void ubiblock_exit(void)
 {
 	ubi_unregister_volume_notifier(&ubiblock_notifier);
 	ubiblock_remove_all();
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
