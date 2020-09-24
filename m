Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368C6C4727F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3B66212CC
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qe2t1NiA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NWdH8IM+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3B66212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DwIoUQpSkIu810YTzVLc2g1/Fh0ggnhwKUNVHCvjX9E=; b=Qe2t1NiAQ6mKBPLeotVV8IG9/
	yyi1aVQxklAvrkGE7fojTfKK4iGVSHx06FoMlU8QIL9xJjsYrhTis6RaA7KzqpVV8+psvZqaAxZBZ
	l+QVOCPP/QF2VUfIYnqn+44eUH+RGY6yMtyNde13VM5KWr0e3l5vnxaDPvBefHSaP1eKELajo74PX
	8LE1wrZNm2lDfwZ3vAGqzfFZDj72PvwWQOHpiwL5WNPDBD9VFk4Gpiwb8kdkbDPoxBSJVFG8kklv8
	TP2aoolHfqDQadyJbZpdMIrlsGLxn/AlBax1cFmv/9gxv6Qs0V3r7zzmLMDINmMbFC3Mn58qrqMqt
	3DTUEoSzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMMe-000164-1e; Thu, 24 Sep 2020 08:12:28 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMMZ-00014r-OJ
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 08:12:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08O8CK4Q072428;
 Thu, 24 Sep 2020 03:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600935140;
 bh=GQf2mrBMP5jSalqwKWbonLXiaPuvhMhO6Zn1bvzCtGE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NWdH8IM+m1k8nIltflNo0Oa2fyM+sJMhKopNjdM4nyKL+V2u/MfAZPV/2oNgOJjJP
 wuL5gJlGPRE73pvo/YfbxLUnlpxD7zAfyE3aKTkh73gIi0yUyc4DOK04jfiGec/gRc
 Qufds+7aoldYI/fVL9g+QRhVd9zMI1BAO2EKBQsU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08O8CKL5082890
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 03:12:20 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 03:12:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 03:12:20 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08O8CFFI002000;
 Thu, 24 Sep 2020 03:12:18 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 1/4] mtd: hyperbus: Provide per device private pointer
Date: Thu, 24 Sep 2020 13:42:11 +0530
Message-ID: <20200924081214.16934-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924081214.16934-1-vigneshr@ti.com>
References: <20200924081214.16934-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_041223_836993_7F8A2FDE 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Provide per device private pointer that can be used by controller
drivers to store device specific private data.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 include/linux/mtd/hyperbus.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
index 2129f7d3b6eb..d8cb1aec826d 100644
--- a/include/linux/mtd/hyperbus.h
+++ b/include/linux/mtd/hyperbus.h
@@ -20,6 +20,7 @@ enum hyperbus_memtype {
  * @mtd: pointer to MTD struct
  * @ctlr: pointer to HyperBus controller struct
  * @memtype: type of memory device: HyperFlash or HyperRAM
+ * @priv: pointer to controller specific per device private data
  */
 
 struct hyperbus_device {
@@ -28,6 +29,7 @@ struct hyperbus_device {
 	struct mtd_info *mtd;
 	struct hyperbus_ctlr *ctlr;
 	enum hyperbus_memtype memtype;
+	void *priv;
 };
 
 /**
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
