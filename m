Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF97CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XQiRgRX78Xl7T4232KxUzoCtzx5/qZSriQOG+/me1Z8=; b=4xPT5XgojbUpI7
	rF+7ObXZV81XNN2cniNAr9BYo5pjtZ7dzVS3ke+zG1MeRl6D39tUzQsAytPlnNYVJrY2TvhEVkzI9
	BuwmACD1aka391LsAAP2qEPU1IOEf6qpDjzQ6ZI3/RX6AuuPRKMu4fD7r7ptLUi3u7P3KN2LLHP0k
	5BK6yE2KSsC0OcRVGs+HnjLHeTslx/pUgDcrv+tGQO4ONN3HKTFujrdxJwB/BczQ4UhR4TG5tuMFt
	Oo1pD8Mc0WvQg/gayM2Gte7U5lJJyzMfoTEayCuTrW2M6Y0Q28ekBeCpDcDbrO5RVylCnz0fuT0th
	imqgis1uvEBB3uiDt83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYph-00000000pBB-2WUU;
	Mon, 09 Sep 2024 07:29:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYpd-00000000p8N-3te5
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16E96A4019E;
	Mon,  9 Sep 2024 07:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E847C4CEC5;
	Mon,  9 Sep 2024 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725866944;
	bh=gLORX5kNyb8Wx4wp2/yGi9iofYmB9JEz1cojrS4yw90=;
	h=From:To:Cc:Subject:Date:From;
	b=d3e1ucj4AhArJNEXjeAmQ/6yyGYVNiPYMe2PMGZxPVp54qEk3LKKG+x1+O6GbuBlE
	 XynLX1OZyD8Hz/D6I1r2WW/UyQh8h5ot9gd/9OYAl2cxic8dmG9ajmELNNAHGFNDSf
	 dtK+q6isWXeOuf/MTYzPpRt2S1Fy2OGNaa1DRYnfXh+l+yt6QxtDP0mzIEUWMfnukj
	 GJroeindJ68Sa7Rt/XFvGq7FefENsEXgoYtDWTJ5anaf6b36wHl0nw4xiNPiJF/6J9
	 IbVCZSdI3QB/OiaWJgpHS87kdqtivrgb/x7jclf1QoqAfstPcg3XcHyRyu7cmJbixj
	 O2TBEztnPg6yg==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] mtd: spi-nor: fix flash probing
Date: Mon,  9 Sep 2024 09:28:54 +0200
Message-Id: <20240909072854.812206-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_002906_049425_8F4727AF 
X-CRM114-Status: GOOD (  12.52  )
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

Fix flash probing by name. Flash entries without a name are allowed
since commit 15eb8303bb42 ("mtd: spi-nor: mark the flash name as
obsolete"). But it was just until recently that a flash entry without a
name was actually introduced. This triggers a bug in the legacy probe by
name path. Skip entries without a name to fix it.

Fixes: 2095e7da8049 ("mtd: spi-nor: spansion: Add support for S28HS256T")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/r/66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com/
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d8e551fd2e2a..101ee5b0ddeb 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3281,7 +3281,8 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
 
 	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
 		for (j = 0; j < manufacturers[i]->nparts; j++) {
-			if (!strcmp(name, manufacturers[i]->parts[j].name)) {
+			if (manufacturers[i]->parts[j].name &&
+			    !strcmp(name, manufacturers[i]->parts[j].name)) {
 				nor->manufacturer = manufacturers[i];
 				return &manufacturers[i]->parts[j];
 			}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
