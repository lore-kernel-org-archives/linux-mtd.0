Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863A9C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 09:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B6wTlzMdUZgK8zM4EnQiOx7xpSxFGL3cKGJuGhlIlkQ=; b=uZlqebxdlqobbJ
	NfEYiHO5iblnffcf4ObDJFsH8/S58/yn9iInEjjlpGBcVE2XoPADlO0nFSNlt5msypWqU+uYOZk3+
	IWkOH3mM3UAq4LkZZDpuZqo0u4KRG669QmttX56Ll/kkWKpycfgRZim3ijBRc515vhM4JGOu11tdn
	sad1BTZ2uVZhmeogCE11QWWDW6ZAHl5jQetT2lGHlLKdvzr0LIQsacxOIAf0EQ7XbeXRmv8HFtikA
	zp3NmGiaqUozr9mCPXixCbelMwVhfSIBT4wGw2rOdMbZ/s7H4die/0aW6OMp3H7djRwCBILAt0Xix
	Wb/T2lN1eLz95ksUrd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Bo-00000008FhI-0Vgp;
	Mon, 04 Mar 2024 09:00:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Bl-00000008Ffa-0c89
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 09:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709542844;
	bh=bAB5F4vNP6IVN7+dQqmn759QyLQ7N1UG2FLkohO65P8=;
	h=From:To:Cc:Subject:Date:From;
	b=CFN/4qSkWBc9srp/cqJivW54+P7ZwVqVbVST0wpPuMjw9RIgz/SLskeWyjaIvuQil
	 18X5kSm0FG1hFvv/vCUz2mMeIX6SjaJwNZ05GEPpy5wtRk52rfWWclC0EBq0IK1Jyd
	 KBgyp419NNL7VdiV8tzw1zA90IdPNgwN16k05ChE4tKD3vPEGz4dpKvmZ7wFpSbuqR
	 J0i57OXQ2J/mRtLteKNq4fAJ7iavX1dT/KxzWQNDpSX5pXH7PYffTMepvrrFjUDEWi
	 PXe2A1AgTR/CQP+SpzE5Z+Wn892rOedK2eH+SSGJoCW/nWausLiwhQS14AV59zHPT6
	 UMwjMPdN2Feaw==
Received: from localhost.localdomain (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC13F3781FE9;
	Mon,  4 Mar 2024 09:00:41 +0000 (UTC)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: core: correct type of i
Date: Mon,  4 Mar 2024 14:01:03 +0500
Message-Id: <20240304090103.818092-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_010049_342980_2053F591 
X-CRM114-Status: GOOD (  11.11  )
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

The i should be signed to find out the end of the loop. Otherwise,
i >= 0 is always true and loop becomes infinite. Make its type to be
int.

Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v1:
- Make i int instead of u8
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65b32ea59afc6..3e1f1913536bf 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3373,7 +3373,7 @@ static u32
 spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
 			     const struct spi_nor_erase_type *erase_type)
 {
-	u8 i;
+	int i;
 
 	if (region->overlaid)
 		return region->size;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
