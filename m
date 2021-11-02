Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE40C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 11:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7E960C41
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 11:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A7E960C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFKcBOK2MlzT9ZWBLax+FyxkMgzmkKOhcyEx2IEm6bg=; b=psP7EInCe6iMeH
	b+noHSACwHHgOZmiUt8QtLPjXsIbGawQ5z36q4dCDEOUX7xPt0Se45je7kRFqZwDW5Fz3pl4NCoKo
	T7ZIUzyTbnZu0D64YRvIajf+f/iDBcKLkTK9wb88+uKQwSSASupOZMXuWCOc4uXw35um4j08v3acT
	2wjwMXWAwPQdvEnyUzfCuv9GDjkqpdtU3UAFF6h0NzNAjlA3aSNFdrmBh4luvwhlmOGmjKv+vP/Ia
	OXWHRJ16AOBBwiLmE7KsRUTtWxz2+H1vnq+7/+XGb/Gw1yWzNMXh+nVJuTI9+cIidmEhqPFZ4IWKG
	66E4OCSJ4p91/6UdppQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhrYy-001QmR-MQ; Tue, 02 Nov 2021 11:02:44 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhrYV-001Qc7-P4
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 11:02:17 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id A20E3D747B;
 Tue,  2 Nov 2021 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1635850931; bh=daO+Y1OCTBro/SQlNmjckPsesZNNVg/tJVluOHMiVlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=V5e3/OInDSgyW9RFiB6zJPegKINakabRLwOWSr5UPyjbbB/rpwkcLybXJXCt1EbnT
 pBYhwMqjrbm6OKcJmUVoe41kO9613Mb1KIrxiytJUdJZ7z47rW8irwOV4DIucJSYs4
 f4ZYzN7AgefcikLssSSC2habX5cIb03T8XY2c/So8yamw0jmlKRxlTmDMDJAnSad3o
 NPfsLgif+9llt9cHi9izKuRLSyM87HGA6gCc7qfV1QtxuyuULToEPDA6XCC/7XAwxG
 gLO7AN8/WYmzFxR1+BcW4R114opUUrGQX2tiSvhIfUnSWWJezRI85woqzzx/6sBeFM
 fMURgjGrZC6Mg==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] mtd: mtdconcat: don't use mtd_{suspend,resume}()
Date: Tue,  2 Nov 2021 12:02:02 +0100
Message-Id: <20211102110204.3334609-3-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102110204.3334609-1-sean@geanix.com>
References: <20211102110204.3334609-1-sean@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_040216_007715_C2C1BAA4 
X-CRM114-Status: GOOD (  18.12  )
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

From: Boris Brezillon <boris.brezillon@collabora.com>

The MTD suspend logic will soon be adjusted to automatically wait for
device wake-up before issuing IOs. In order to do that a new read-write
lock will be added and taken in write-mode in the
mtd_{suspend,resume}() path. Since mtdconcat.c itself is an MTD device,
calling mtd_suspend/resume() on subdevices from the mtdconcat
->_{suspend,resume}() hook will lead to a nested lock, which lockdep
will complain about if we don't add a proper annotation. Let's keep
things simple and replace those mtd_{suspend,resume}(subdev) calls by
subdev->_{suspend,resume}() ones to avoid this situation.

Tested-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/mtd/mtdconcat.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f685a581df48..f4a4274489b4 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -566,9 +566,15 @@ static int concat_suspend(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		if ((rc = mtd_suspend(subdev)) < 0)
+		/*
+		 * Call the MTD hook directly to avoid a nested lock
+		 * on ->suspend_lock.
+		 */
+		rc = subdev->_suspend ? subdev->_suspend(subdev) : 0;
+		if (rc < 0)
 			return rc;
 	}
+
 	return rc;
 }
 
@@ -579,7 +585,12 @@ static void concat_resume(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		mtd_resume(subdev);
+		/*
+		 * Call the MTD hook directly to avoid a nested lock
+		 * on ->resume_lock.
+		 */
+		if (subdev->_resume)
+			subdev->_resume(subdev);
 	}
 }
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
