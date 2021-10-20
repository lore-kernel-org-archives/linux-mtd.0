Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B97BC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507406109F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 507406109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v17c10W/QSAmsPohla/FydgDkszFjqQuiJtkVAmxmUY=; b=gXPGuyaEnePuWX
	jaKuEeVyZ6J6EIfDRBlzF3fqIFgOMf6j3toc1+2ZS89sRaSxVoKqiYVY5acsSRgsSQuzPcMaDc9tW
	RA8vRC10IkD8urMzpKmherRgeiKrAVSSetJ4eKWfXnXgVHzloeBYLRpaSIqIziCS0fPLoeKjOWyu+
	pzK2Q1VWk/7wTRtsY2c2Z0vwfnvmwtvlQ+UvV9bvYz1H6mCg94c8PNIJQYOVx+NHrzdrFCr+H7DQ4
	KTFF/LgXYMZE4WMeBlEOgzerCVZLa9YOLLYxUQtNHciieDg+nVOJGlJZ0Jjs1OQkVsd0PCHrw1DPA
	bxTBTGo9ChwLpBgNGRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7FE-003rnU-CY; Wed, 20 Oct 2021 08:46:44 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7EH-003rYa-NL
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 08:45:47 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 78DA5C7EC7;
 Wed, 20 Oct 2021 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634719543; bh=i/8+adCTB/1ZY8UzLuJ8XezBVVwGeL0INtp1R95tHKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NB3xri6B/AeZ8R2UuxkpLkaqp9aASu4mLmRDqZjFzNy2vR3adoreX2oMxtv/vFZa3
 0NPVRfxL+8A5RWZMNmcNV2q/oORfUrYoPVbyEQdgbWQYIjyD/yDhTM+1ny5bj6kPd2
 RDuRNp+UxHXBxWKeAZuM53uAzM36HtQhk1CWFTwjFU9TswGBtIhtnRTWvcmUqZsF+4
 GgRvM8IHJdNX4lQtxZrI6yIVbcMNeWdIdDvB2YDoBK/4kFYufFde96afFKhmoetMQ0
 SRISQw6B8ZTOe2vgX+aCzqcd55r2+pFdiFP2jOBlwOL2TKMsfTB4iCDTBk2iRoxjGE
 dt3x86RIvf1jw==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] mtd: mtdconcat: add suspend lock handling
Date: Wed, 20 Oct 2021 10:45:34 +0200
Message-Id: <20211020084534.2472305-5-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020084534.2472305-1-sean@geanix.com>
References: <20211020084534.2472305-1-sean@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_014545_962227_67069091 
X-CRM114-Status: GOOD (  15.01  )
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

Use MTD hooks to control suspend/resume of MTD devices.

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/mtd/mtdconcat.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f685a581df48..1ec36890118f 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -566,9 +566,11 @@ static int concat_suspend(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		if ((rc = mtd_suspend(subdev)) < 0)
+		rc = subdev->_suspend ? subdev->_suspend(subdev) : 0;
+		if (rc < 0)
 			return rc;
 	}
+
 	return rc;
 }
 
@@ -579,7 +581,8 @@ static void concat_resume(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		mtd_resume(subdev);
+		if (subdev->_resume)
+			subdev->_resume(subdev);
 	}
 }
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
