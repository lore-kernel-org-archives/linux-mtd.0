Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDDCA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKMy8iwsIHnFHOUn7Zco8WM8Qgj11hzN4//OPdr69KY=; b=olRMzs9I2csVm0
	w3Yd8AbXz+9WtuW1BEO5FKIlCPNFK3OkoXEoqmXGhwBxVEBR2tFDNEdI/jFFq59j4FWIzfSO6PW2E
	GR7pfPAGD1OAc7UTrtE8g1d8Ae5WEFwQ7UoGiXxc2/uwNKBwIf1wrIobKpz3QymYsN/WGe4s8td1l
	OZKMNmrhmsWxUyY5OqjYQ0X+J9d1GgXCzpgUl5YxokWixIAyCg5r5YLSM02UFj/JMXca7V/QeTLoA
	x7Agnfou72azkmKBEC3qAPOgEWs/aRsVbvx/PZW3ksSRIbQFSBdXK3NbR1s21vrZWYtSNxAuNEQfy
	y4fy6dCxN7/FMuN9f5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad6-00000009DP7-1kjj;
	Mon, 11 Aug 2025 22:04:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYH2-00000008w1h-2j6M
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Aug 2025 19:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mbm6XmTsVQep+WWUIidWCy6jZKFBV6BX76B/Uekl5C0=; b=IyZoz75MuZYbDDf57KWjkLyFSD
	oN5gVsgY2ow9OVup2q3lZjJt4kfSbh+DP48ias2us5vIRdpaMUX/jeSwMibusIUUBHrC1taFKbXET
	2SB1zN7/uoF6GvbkEve+yVi/NJEpGz6Rnd43ShoKyUfyNX2We6nbLKWFdOjpBLLYv8IsfqktmwGyW
	abN6Cc2h3oeu49tED7J0Bu0cTI2Ov2cr874/Ts8cEeHqf0VHC6Pdf/pDAPJDcb45YJd5lebCGIhMz
	yslsuMSr4CXavs6k0xhC9cWNL0etl0hKnApAPVIbOdwohEDWQooGVHPPWKPPCd8z8s8iSPUyU+8B/
	bf0Osg/Q==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYGs-0000000FUsd-2VLd
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:31 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJXFEj1678217;
	Mon, 11 Aug 2025 14:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940795;
	bh=Mbm6XmTsVQep+WWUIidWCy6jZKFBV6BX76B/Uekl5C0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qfjpm+8E05PLNOAW/vc62xU1UTRIgM+5e6bKS4F22EGRXQbkd6ZGGwysE5q8h36QY
	 JFSY7JnG0Id0wk5jBooI+tfoPaCFC3KK1U5T+YsOW71oSpSpdlPLyv7qUkgf5SjED8
	 gsOt5Tr/FbUd7wzUtZgFIvblBrg9kKoLGssKFwTI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJXFld2910894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:33:15 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:33:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:33:15 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1r3690681;
	Mon, 11 Aug 2025 14:33:11 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 04/10] mtd: mtdcore: Call mtd_execute_tuning during mtd_register
Date: Tue, 12 Aug 2025 01:02:13 +0530
Message-ID: <20250811193219.731851-5-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193219.731851-1-s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_203328_769705_5C6CC840 
X-CRM114-Status: GOOD (  12.37  )
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

Call mtd_execute_tuning() during the mtd_register() which redirects to
the flash specific tuning procedure to run at higher frequencies.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/mtd/mtdcore.c | 19 +++++++++++++++++++
 drivers/mtd/mtdcore.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac..f50cebcdb670 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1023,6 +1023,22 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 	return dev_err_probe(dev, err, "Failed to register OTP NVMEM device\n");
 }
 
+int mtd_execute_tuning(struct mtd_info *mtd)
+{
+	struct mtd_part *part;
+
+	list_for_each_entry(part, &mtd->partitions, node) {
+		struct mtd_info *part_info =
+			container_of(part, struct mtd_info, part);
+		if (part_info->name &&
+		    !strcmp(part_info->name, "ospi.phypattern")) {
+			return mtd->_execute_tuning(mtd, part);
+		}
+	}
+
+	return -ENODEV;
+}
+
 /**
  * mtd_device_parse_register - parse partitions and register an MTD device.
  *
@@ -1087,6 +1103,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
+	if (mtd_execute_tuning(mtd) == -ENODEV)
+		dev_info(&mtd->dev, "PHY pattern partition not found\n");
+
 	/*
 	 * FIXME: some drivers unfortunately call this function more than once.
 	 * So we have to check if we've already assigned the reboot notifier.
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index b014861a06a6..04055fcd2df8 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -13,6 +13,7 @@ int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 void release_mtd_partition(struct mtd_info *mtd);
+int mtd_execute_tuning(struct mtd_info *mtd);
 
 struct mtd_partitions;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
