Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7584C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jul 2022 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6C0PJfn4qGFuj7FqOGDJSpXiC5kgVOfCVHf5xUYMfHE=; b=0ImbzrI1wT58f4
	NRASwAtgruobS41hkWe7TvwZwe6w9C5n/IUWuwo8TuyElh5rGiPXo2JoVpFlvTm1oQ9RRTfkrkrTM
	GYUoJ4gpFMuHpp66VCdijVssod9lEzufg0CaELevFvfi6B6QGGoQOSYAOSaC3a4IDTf24Kq/mfK9V
	X5F0vrhLCXgCvaT5czbnb0Lsd/+SbrI1IBdUxjtOwKhpb9NdIeI1Ov44qVvXTdgMKexPLaSuvPJ5j
	4fxJzOYXjoVB+fV6pTAiL2APV1L9yB2Be2pizKDBEmy5Jidu/HCEJwXYX4ZXbvesfTkgllFeeYjrG
	1ZcFy3TW1dTDe9qErv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5cq-0030UJ-J3; Wed, 20 Jul 2022 09:04:12 +0000
Received: from m12-15.163.com ([220.181.12.15])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5cm-00304L-Kc
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2022 09:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=GDF/E
	7WqRUk5DIFmfUxr9+y55qjYw3uJMgUd25WZZDc=; b=RWvBcqn9EFvsfY0yw5E7M
	UqK3YlkiZtLrlt8F5bnD8Q4Jky8mArLyTP8iZPfrWpiUv5OzH8cemoQFJrNAThAi
	YFh6Hd4Uo5PiMsDOAW9ayMjyi1JqOXvyEqbUmeb8uWPhb0krlFPpBN0pSd/Uq/An
	mgX2p9/4alXK042UQAyAPA=
Received: from localhost.localdomain (unknown [223.104.68.229])
	by smtp11 (Coremail) with SMTP id D8CowABHhV_mxNdiybcTAA--.26S2;
	Wed, 20 Jul 2022 17:03:39 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] ubi: block: Fix typo
Date: Wed, 20 Jul 2022 17:03:31 +0800
Message-Id: <20220720090331.13691-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: D8CowABHhV_mxNdiybcTAA--.26S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUjPfQUUUUU
X-Originating-IP: [223.104.68.229]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJQtEZGAJpI5YlQAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_020410_324538_BDCE9C9B 
X-CRM114-Status: UNSURE (   7.97  )
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

Remove typo.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 4cf67a2a0d04..4fc7e756d885 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -409,7 +409,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
 		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_free_dev;;
+		goto out_free_dev;
 	}
 
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
