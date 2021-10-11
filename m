Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8ADC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 11:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B077B60F38
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 11:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B077B60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1YWpOD05D431iGXVJ+goEmOiiKWB3NiLqdSr5JuOCY=; b=mSg6r08ncR06LE
	j2fp6unmKcYpOSVRRE/Evk6C8DxnjjcAbO5L8Ef0YEJOk4e+MwTwcDD76MKD16SWMwKL8Da/eUu0h
	SdBbkwlMDf72leHJGUAHFyeAn8pZC0G+ry/u+I660kzngDw8IYyRtzxVi/y1OX5ImA2x1N9r+iyR5
	OLhaa/CQGQxhdVEH9gd1J8rDVrI0dqQdHJ4JOcETdjisKBoDjucKmUUhT8CvsfIJTsOiRUorNeaRd
	Fl7w5SAvk04dazKa5ZTilreMf2l51SvHc2vnG/HZwlxhpsJuRenFqlGu5yJxR1k3QfHbiirSvzpaD
	NNyGX66VCNSJ9uGP+pBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZtsV-009DsX-LP; Mon, 11 Oct 2021 11:53:59 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZtrr-009DhE-CX
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 11:53:22 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 1407DC3DB1;
 Mon, 11 Oct 2021 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633953197; bh=34RYAExQV2GpY9VYCNMKcw7k5EiKJcu+XcF5wGblsM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cLbnL/2oqSJXV6k+rEsBn8xJ6hh2Uy0h9AV9bhlXm1qH4AVfcRSAwGvYc1YbKpZ9f
 GzxqKaLnTvcKgrnZasC/r54GYgLLJw5lk26xT/SzqdPUEDK649rqdbLu+R3JYUMgbX
 +1tjer7lxABiiU8+xKDkE3QKxaY3INCKEPQmpclczGta4CsMidBH+7Jx+SamO5MSZV
 6ZUYirx6U3cwvs1dUFU/xGXC2avs2hq8iUhXhsiZzfLXowdb3vr4RsYLhG6F6i+Vug
 Tdl4G4HBuhPY01882a2GJJZeI5uz9obr9uwFpzrhGioz/0Ld5bXFjrRugPFySy8Rqp
 Qu8CydY3xxLpw==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mtd: mtdconcat: add suspend lock handling
Date: Mon, 11 Oct 2021 13:52:53 +0200
Message-Id: <20211011115253.38497-4-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211011115253.38497-1-sean@geanix.com>
References: <20211011115253.38497-1-sean@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_045319_608698_B6310FB8 
X-CRM114-Status: GOOD (  14.57  )
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

Use new suspend lock handling for this special case for concatenated
MTD devices.

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/mtd/mtdconcat.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f685a581df48..c497c851481f 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -561,25 +561,32 @@ static void concat_sync(struct mtd_info *mtd)
 
 static int concat_suspend(struct mtd_info *mtd)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, rc = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		if ((rc = mtd_suspend(subdev)) < 0)
+
+		down_write(&master->master.suspend_lock);
+		if ((rc = __mtd_suspend(subdev)) < 0)
 			return rc;
+		up_write(&master->master.suspend_lock);
 	}
 	return rc;
 }
 
 static void concat_resume(struct mtd_info *mtd)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		mtd_resume(subdev);
+		down_write(&master->master.suspend_lock);
+		__mtd_resume(subdev);
+		up_write(&master->master.suspend_lock);
 	}
 }
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
