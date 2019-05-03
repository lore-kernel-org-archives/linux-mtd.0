Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E117AC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 20:13:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92D942075E
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 20:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIqCktGY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92D942075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rockwellcollins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WEm4Yw6pIa6A3vOpbkovO61pKFIAp38a0jSgAvquH2A=; b=LIq
	CktGY5C8IATXxGMPTcjnGFzTocrWhj1t5OhqRfrNPWT5zxi072fM8pFU/8e57XESfX6p9iENl5I54
	wIP9Sbhgzj9iaYKfBAlNhONa+fb0K8DHI9uuUxOYL0ny7MgWTwkfQ3mjkZcQ+1Z2rjzVOHliXTQdt
	RH8nVHB8KAqWx18Daj418ubHWmHKu6UA9UlS8hXzQaw5e16X0prwcgRB6Kc4PF4j/WE+6bkk2XxjW
	Pk0DhA1Mm02FlWtALsNi3D+vntNqPksN1QRHUKqVtaDYk6VZoqvhkjSWrgXd7NBmJxtETQLk0aAuB
	wMmGyU6bpHz+M9Hil2fAqMl0D5uSNUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMeZ6-0003GY-M3; Fri, 03 May 2019 20:13:52 +0000
Received: from secvs02.rockwellcollins.com ([205.175.225.241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMeZ3-0003FY-6f
 for linux-mtd@lists.infradead.org; Fri, 03 May 2019 20:13:51 +0000
Received: from ofwgwc03.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.225.12])
 by secvs02.rockwellcollins.com with ESMTP; 03 May 2019 15:13:43 -0500
X-Received: from righttwix.rockwellcollins.com (righttwix.rockwellcollins.com
 [192.168.141.218])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 0A133600BA;
 Fri,  3 May 2019 15:13:43 -0500 (CDT)
From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: gluebi: Add sync logic
Date: Fri,  3 May 2019 15:13:37 -0500
Message-Id: <1556914418-40288-1-git-send-email-clayton.shotwell@rockwellcollins.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_131349_363878_EF15BB29 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, brandon.maier@rockwellcollins.com,
 marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding sync function to sync the underlying ubi device when a mtd sync
is called. This is being used to ensure a JFFS2 file system running on
top of the UBI volume is able to sync the underlying device.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 drivers/mtd/ubi/gluebi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 6b655a5..b7d1d7c 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -280,6 +280,19 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 }
 
 /**
+ * gluebi_sync - sync operation of emulated MTD devices.
+ * @mtd: the MTD device description object
+ *
+ * This function syncs the underlying UBI device when the MTD device is synced.
+ */
+static void gluebi_sync(struct mtd_info *mtd)
+{
+	struct gluebi_device *gluebi;
+	gluebi = container_of(mtd, struct gluebi_device, mtd);
+	ubi_sync(gluebi->ubi_num);
+}
+
+/**
  * gluebi_create - create a gluebi device for an UBI volume.
  * @di: UBI device description object
  * @vi: UBI volume description object
@@ -318,6 +331,7 @@ static int gluebi_create(struct ubi_device_info *di,
 	mtd->_erase      = gluebi_erase;
 	mtd->_get_device = gluebi_get_device;
 	mtd->_put_device = gluebi_put_device;
+	mtd->_sync       = gluebi_sync;
 
 	/*
 	 * In case of dynamic a volume, MTD device size is just volume size. In
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
