Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C756CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X1BJBhPnPmVUviCOqO6hbIiRdR7Yj8FLVe0yoZ3hfo8=; b=FpYuJLx0nqx3Ud
	J+tWU6O0BK88/WBi4FjGrS6hKHpO3h0xsjb0xr+4vSZ52Tdkwu55Om1hTgMYmFCQL0A++5w+qSN9E
	hudIISDS0h1tzgxZDvgESKegy/dowh9jONU/zy2dPzxINx7WE3zQXazvIYpT9zjwQrzMpmxO2DgHX
	v0TaWEbo5uAsgqGf3t9xsROYrCcD3OSO8ec7YY21nSb6tFUme299maLURmdUgzPF2Es2gYzNwMMUe
	JKKbnJC+SVxeaRpOoJNMwsX9rY/YgcWw8GmZWRWNQQIpsL3Y4X+Qm5CygKhfMDZ6extEcOliNmJ0p
	jYP1/UGIgUjs9pPoOSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH2h-0000000HB0k-40Fx;
	Thu, 15 Oct 2026 08:42:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH2f-0000000HB0L-3aCA
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 08:42:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B67A6022A;
	Thu, 15 Oct 2026 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558F1F000C4;
	Thu, 15 Oct 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792053744;
	bh=3T+BBYG9njKm84IFi+JsC2GV6JdjgiVsPr6ozUNOJ5I=;
	h=From:To:Cc:Subject:Date;
	b=FmT/vhXPIM4BkJdjoZ3nFFJNW/Gki9HL86MTaMeiu496SaTyn2OHTSB9mp4tmUAaa
	 /8yANjuaRZiAmXRrWUhwy++zaQuXm2GIXH5vK8bMXRTHqsvkX4+1+LZGxcBh3Y2DfR
	 P9hIjkob44kZu7oGrepfQlIwFFSst7gg9lJNHhGtzCnEOUh3xL/ub5LE7I8x1ceHlq
	 FSnG+cz8kQibfEeqpWXZFgqpj8N0oMH7a0D/AS3Hf57z2tGvypoWIsYu2pJyATwLoW
	 Hiha86xyEQfwqaxHRSKvp3IMeg9PFgkX0yw0kLhisyFuk8csstQ+VBgRZcomKrV0Tw
	 tZxW6Otv5ooMg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: spi-nor: sfdp: fix missing kernel-doc
Date: Thu, 15 Oct 2026 10:42:14 +0200
Message-ID: <20261015084219.887963-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Commit 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into
sfdp") added the kernel-doc but missed one description for bfpt. Fix it.

While at it, also add documentation for the return value.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610040802.yD5XKM5i-lkp@intel.com/
Fixes: 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/sfdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index beb0f5c66212..818c7d4d69d4 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -403,9 +403,12 @@ static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
  * @nor:	pointer to a 'struct spi_nor'
  * @bfpt_header:	pointer to the 'struct sfdp_parameter_header' describing
  *			the Basic Flash Parameter Table length and version
+ * @bfpt:	pointer to the 'struct sfdp_bfpt' to be fixed up
  *
  * Used to tweak various flash parameters when information provided by the SFDP
  * tables are wrong.
+ *
+ * Return: 0 on success, -errno otherwise.
  */
 static int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 				    const struct sfdp_parameter_header *bfpt_header,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
