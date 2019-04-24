Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A2BC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 14:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5620E218FC
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 14:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJ3DzN2i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="m9G9AzhK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5620E218FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=py+cqB6dEEcTjAIJaAOIPWlc8NbeeDXgeWm2DoiHuHM=; b=UJ3DzN2i8glnaV
	MDQOLslqqpDFQdObSSoS0v2XG6Z8RjmIglm26cbmuWYr4X6JdD7tNTiFth0MgiZbpVSGIchiOGUfH
	nNi2oQHCgmxyYFHo+af+2t6OkIwK3jCy45mcz7VjaD9JBhl3ctT+KOfqoJfRZ9KI7lk+IDOT/7DLl
	Mr2/HtfA1s6QnlpH7vrQiMjk0DNttl8fJ7NY2p6RA7n6bSW9Sm3yc0OzquYA2OlUt+x71qBDDzSs0
	nmnSlg8gQmbJmzYPK8zP6d9fHNPj6IlDJrEbnv4VmcwMAfqa5pMqMLiCQI4fgeyrPOecawSyhCIl6
	+2BGuSWzdlRwd68UZZHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJJDJ-00079P-PF; Wed, 24 Apr 2019 14:49:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJJDH-00078Z-De; Wed, 24 Apr 2019 14:49:33 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3OEfCTa007540; Wed, 24 Apr 2019 16:49:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=6s1Tk9L2Xa2/OmOpTV1QTi7TgrOpLaf1ckgpFapd4kA=;
 b=m9G9AzhKVM2KfBQ9watK+EIq92OgLJJ7SDKuFg0xMHQh0bTqWrNSpgwvFJDX+PgpQaAx
 uQDPPVngvcLNNrj26jo7zB9a6oZhRwyIYwCasOhMMDuHaudt7Nl3sFnr/ZtU/AfQOLa/
 Ck+ic7OyBKANdPu6iGvTwTqfLUWQ5p7/dEFkjZiz8Gl/iutpVNsx+WbU5WBZozxsrbFM
 k9zATtumRX/YbXLO7y5cSnqM7+gY39HqFp3Ko3IaHXNXZQi8EkQe7zsJeCONlnpSVBff
 IyIv5WEozyja0thDz/WsWlPXlcbHXQTykGG2wM1ImnbENntLsffuKLFP3P/q93Y7h/qn zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2rytad77q8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 24 Apr 2019 16:49:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6535434;
 Wed, 24 Apr 2019 14:49:18 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37FAD286C;
 Wed, 24 Apr 2019 14:49:18 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.361.1; Wed, 24 Apr
 2019 16:49:18 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 16:49:17
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: stm32_fmc2: manage the get_irq error case
Date: Wed, 24 Apr 2019 16:49:06 +0200
Message-ID: <1556117346-5608-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-24_09:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_074931_805387_C65C60AD 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

During probe, check the "get_irq" error value.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 999ca6a..4aabea2 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1909,6 +1909,12 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		if (irq != -EPROBE_DEFER)
+			dev_err(dev, "IRQ error missing or invalid\n");
+		return irq;
+	}
+
 	ret = devm_request_irq(dev, irq, stm32_fmc2_irq, 0,
 			       dev_name(dev), fmc2);
 	if (ret) {
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
