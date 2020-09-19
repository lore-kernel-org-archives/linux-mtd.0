Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6B9C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 09:48:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A58921582
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 09:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vnWvc9pk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A58921582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNgyByoPemoQu2I5YBtIyeXlPNZ+YHX32PaiyVrhTo4=; b=vnWvc9pkHZCKs/pMS4lXqkpyeV
	rinikugevBTmY3cvIy9NpIUO5mf402/Njh7ZSOs7WL9z18ygU2V+b5IQgKDjGEsiAOX43RofGD2xg
	716xbJCfSxzZ2YEQecDmyamydNXafTXD+lcGUNvGbgKsiT+rdSn3XiW7vtfImZ31ARdtnatYvzci5
	LfADFHet4PxeZTLHgo+rXjEABh8eelFZk99k/pwqilduap3fhFNOub1NLc6jdJKXELMeEKA87STFF
	fvBByJjaiXATId1EWBVWNEnwyH/eazHCz3dfG1+v5ved/aJK1mhSMSJzPPIE3TETHs2NGuwlcNGcv
	LtWHELIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJZSG-0002qZ-Jx; Sat, 19 Sep 2020 09:46:52 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZS9-0002pJ-D9
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 09:46:46 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D875968D08076370B470;
 Sat, 19 Sep 2020 17:46:33 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sat, 19 Sep 2020
 17:46:26 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH -next] mtd: vmu-flash: simplify the return expression of
 probe_maple_vmu
Date: Sat, 19 Sep 2020 18:08:54 +0800
Message-ID: <20200919100854.1639267-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_054645_722945_BA765DE0 
X-CRM114-Status: GOOD (  11.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Liu Shixin <liushixin2@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/mtd/maps/vmu-flash.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 177bf134e189..588e82de581c 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -772,7 +772,6 @@ static void vmu_file_error(struct maple_device *mdev, void *recvbuf)
 
 static int probe_maple_vmu(struct device *dev)
 {
-	int error;
 	struct maple_device *mdev = to_maple_dev(dev);
 	struct maple_driver *mdrv = to_maple_driver(dev->driver);
 
@@ -780,11 +779,7 @@ static int probe_maple_vmu(struct device *dev)
 	mdev->fileerr_handler = vmu_file_error;
 	mdev->driver = mdrv;
 
-	error = vmu_connect(mdev);
-	if (error)
-		return error;
-
-	return 0;
+	return vmu_connect(mdev);
 }
 
 static int remove_maple_vmu(struct device *dev)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
