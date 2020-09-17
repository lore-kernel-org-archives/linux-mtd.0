Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A903C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065D421D43
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEv1ip2S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SiWSIe++"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065D421D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DwIoUQpSkIu810YTzVLc2g1/Fh0ggnhwKUNVHCvjX9E=; b=UEv1ip2ScSaSfNGgQWNIukbYH
	9UbnLSjfqIi4rvwJtDgzCFnkdyux8MlpylrRfcniwig2qd92U4oUkyXH4IUnkyZb6hOdj3VDY7T++
	s0l24JuE0ViTikvIH6DHT3KhUOeCYWuOsnwTjr9xcb/W70oGnl+95FH9cIUlXr6R/E+i/WYB35DPB
	fmxyix7eEuKkYeHTmax/8Q563Unm3fOLMNFL4la7SWJKXQ8+oyQ5qIW4TKNABof9yT7oBbSz7OgAf
	Fx+lN8cFNEK1lFwyzD88a6yEiiIoNjBbj2kvoqZVK8751V8Wsd9jCUa32KFj1xTiVMkxgntETXb6J
	mn6jUqWUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoea-0000Xl-FF; Thu, 17 Sep 2020 07:48:28 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoeU-0000VP-9x
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:48:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mJhn109035;
 Thu, 17 Sep 2020 02:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600328899;
 bh=GQf2mrBMP5jSalqwKWbonLXiaPuvhMhO6Zn1bvzCtGE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=SiWSIe++RtO9/1LZxTiUV6d4hNOgna3Co3TJtBBUp5/6ygS8qhOhu0coMs6RawyAt
 DqZmAMdfw2SM9j4cWAzUOUacx2f+1euC2CJBA5oHmYF2sPusFYag9Dzd6O5AEe8OjO
 njdBnuidc91XrN8pQWl+rmN4FGH7CooYVZ9T/hUQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08H7mJmW102251
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 02:48:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 02:48:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 02:48:19 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mEds100359;
 Thu, 17 Sep 2020 02:48:17 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/4] mtd: hyperbus: Provide per device private pointer
Date: Thu, 17 Sep 2020 13:17:46 +0530
Message-ID: <20200917074749.8957-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917074749.8957-1-vigneshr@ti.com>
References: <20200917074749.8957-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_034822_394649_415269EF 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
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
