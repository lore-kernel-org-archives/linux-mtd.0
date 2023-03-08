Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8529EC64EC4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85YufedXYvHTbBBfw5JHzRyDEIOwVWF95JY9q0AgeNI=; b=LuqDeEKiiEGrW7
	+E930CQE1TSvxkegsQupxnzA9ssBv4vmyMBic4dzYcij6o+r80+qg79mKV3O3nUjIedeJGmVDxkhZ
	SY+zYh/aO0wkdb8uDilp0fbmFrPNtokfVmw2A7ZPa7dvQSdCZQtt82dKzMTx7PigK1Kq3QO6A803W
	Hm4481f19gW1iPZ3LV6o0o4vK2TREBOt0mrGsB0Z4jgfs+itxAgCnfTFI8fazsHw/LDGQVA7aok4f
	yJghAeT65E+ciIuazJz1R+W9LkCC359vWsGrGlcahNBIOhn+C+JLUuHRjk2DeraZCSxEhRl5K/J5N
	HkEdY2ukHLBD+D+lZ6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2S-003wBv-32; Wed, 08 Mar 2023 08:20:44 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2I-003w9P-Qo
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 08:20:37 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2768516DE;
	Wed,  8 Mar 2023 09:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678263632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQro8lAsxYdfyKtXuzQP2F4xpI7uvYsRP5+6tnRPfKk=;
	b=QFTk0YH6t7zZMfpisKd1d1db9X237jRHj3oezB+gQ69KGAq+FeRGnktvA8Eo6mJGOd7b2/
	AEjC/DbAD1os8B0YfEkDU9n/RIZjz+FD+A2rDwBSICQqoDIJLXNa2X66DbmiymyZDYHhpi
	zdjIuvQR1S1ynay7zaGTHw0/6Tso0HEsFV4mbOcTMuKHNvSAbMO2EHBvOX8aVJRXwP6Bnw
	K6m8MdVzc5QAHjWyWr+SP55SLwAORXhekigxg7KwvyZ4eOlo2ORSIC4dt0F5UuwNsnaJhJ
	n8Wm6siWFaXBn1gh3AGdWFtf+8cG+a9zzZqwNVTn+J/sDEU0Z1q/1thSUGaGxw==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] mtd: core: fix error path for nvmem provider
Date: Wed,  8 Mar 2023 09:20:20 +0100
Message-Id: <20230308082021.870459-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308082021.870459-1-michael@walle.cc>
References: <20230308082021.870459-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_002035_050531_1A669086 
X-CRM114-Status: GOOD (  13.04  )
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

If mtd_otp_nvmem_add() fails, the partitions won't be removed
because there is simply no call to del_mtd_partitions().
Unfortunately, add_mtd_partitions() will print all partitions to
the kernel console. If mtd_otp_nvmem_add() returns -EPROBE_DEFER
this would print the partitions multiple times to the kernel
console. Instead move mtd_otp_nvmem_add() to the beginning of the
function.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 - none

 drivers/mtd/mtdcore.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c38a13cb8d5e..0bc9676fe029 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1023,10 +1023,14 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	mtd_set_dev_defaults(mtd);
 
+	ret = mtd_otp_nvmem_add(mtd);
+	if (ret)
+		goto out;
+
 	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
 		ret = add_mtd_device(mtd);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	/* Prefer parsed partitions over driver-provided fallback */
@@ -1061,9 +1065,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
-	ret = mtd_otp_nvmem_add(mtd);
-
 out:
+	if (ret) {
+		nvmem_unregister(mtd->otp_user_nvmem);
+		nvmem_unregister(mtd->otp_factory_nvmem);
+	}
+
 	if (ret && device_is_registered(&mtd->dev))
 		del_mtd_device(mtd);
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
