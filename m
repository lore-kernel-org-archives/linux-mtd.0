Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA411C2BA19
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 16:00:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80AB5206F9
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 16:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FqcCfM1q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="AtCus4if"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80AB5206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37e8wsRXo0A1hY9hwO4fRW5vW7a6Z4spnJvp2uXnzu0=; b=FqcCfM1qXIVHCM
	/gxZYy45w02rYugS/3kPxD28mqJEZNjTBZVvuN4XnOXh8ckY647zLj4/ltDwToB8+vTLIfzyix01t
	TwqKj63oRKuDj1djIgoXEeaumcvjfg+jsDiQi2wZJiPp0MuVqPR9KkoznGtQPBtOoUJEZVKAW4T3z
	YVAAtr23XfzpqY+/At8W1yndv6b6nHC5VKPWZDGcQLkhFIGht+TlZ+fvppOASAzDch2pptVl28QpC
	UspIsOJUITefdGzbkx9WBbxrThnXCLwvqrQhyG6T8TJNoCnX5XMqJ7s/T+Kfrc2/3sPWjTQLpMbGq
	MbE9hOeDtD6iiyJy9iyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOkSn-00074o-CU; Wed, 15 Apr 2020 16:00:33 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOkRG-0003AL-KK
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 15:59:00 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FFW6Hc032223; Wed, 15 Apr 2020 17:58:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kyVB+tiE+rN9XPO8kyR9LpGoCVCUanK+RTCgZf2jO/w=;
 b=AtCus4ifxTr/M17C7ri7ozELEn/Q2Ec2NMTSkCz/IvF+XFvZo6YuHd32YlYf2oYS/GsH
 APJoL/Uzi2K52Si3f0QQZ/baw6p8Rgwj88/O828W5iZdUMHeCYr1qO74/hpuQKQfG2qH
 CVhR0zlBHEpDOiagc5QDIi5OYdz+Qk8xaeHxxFrdqRHLshviwWOoGf5mv1TDw8fPe1Yt
 o9eaA/WnMGrcnCgEXeeS85X9zD/9IJW9nSgy1NkwvHGC8n+ffXKEBiwfa6Tyy80K6cZS
 0TnSTk268qtpIYIPvww/IqnBI8NB0T43DXg29NnpFwWL+I/LhKnGiAGxcd3ax2RIwlIO fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn94cy00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 17:58:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28E4B100038;
 Wed, 15 Apr 2020 17:58:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 178FA2AF597;
 Wed, 15 Apr 2020 17:58:49 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 15 Apr 2020 17:58:48 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <tony@atomide.com>
Subject: [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS for
 timeouts
Date: Wed, 15 Apr 2020 17:57:30 +0200
Message-ID: <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_05:2020-04-14,
 2020-04-15 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_085858_998165_14ADF786 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch removes the constant FMC2_TIMEOUT_US.
FMC2_TIMEOUT_MS is set to 5 seconds and this constant is used
each time that we need to wait (except when the timeout value
is set by the framework)

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index ab53314..f159c39 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -37,8 +37,7 @@
 /* Max ECC buffer length */
 #define FMC2_MAX_ECC_BUF_LEN		(FMC2_BCHDSRS_LEN * FMC2_MAX_SG)
 
-#define FMC2_TIMEOUT_US			1000
-#define FMC2_TIMEOUT_MS			1000
+#define FMC2_TIMEOUT_MS			5000
 
 /* Timings */
 #define FMC2_THIZ			1
@@ -525,9 +524,9 @@ static int stm32_fmc2_ham_calculate(struct nand_chip *chip, const u8 *data,
 	u32 sr, heccr;
 	int ret;
 
-	ret = readl_relaxed_poll_timeout(fmc2->io_base + FMC2_SR,
-					 sr, sr & FMC2_SR_NWRF, 10,
-					 FMC2_TIMEOUT_MS);
+	ret = readl_relaxed_poll_timeout_atomic(fmc2->io_base + FMC2_SR,
+						sr, sr & FMC2_SR_NWRF, 1,
+						1000 * FMC2_TIMEOUT_MS);
 	if (ret) {
 		dev_err(fmc2->dev, "ham timeout\n");
 		return ret;
@@ -1315,7 +1314,7 @@ static int stm32_fmc2_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 	/* Check if there is no pending requests to the NAND flash */
 	if (readl_relaxed_poll_timeout_atomic(fmc2->io_base + FMC2_SR, sr,
 					      sr & FMC2_SR_NWRF, 1,
-					      FMC2_TIMEOUT_US))
+					      1000 * FMC2_TIMEOUT_MS))
 		dev_warn(fmc2->dev, "Waitrdy timeout\n");
 
 	/* Wait tWB before R/B# signal is low */
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
