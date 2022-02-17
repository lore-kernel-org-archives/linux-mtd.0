Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9E0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VF1xWvCImsYNT06Z8UDq8advov/scKUFvi3ljQYR2A0=; b=Ma3WyFHEWQG8gS
	1QfRuSKwOYFM6oqtQrXz+D38uMEr1ZuoQtDXxiSb81UyZgPfhv+vzBR5/7zFlJ0QTzSXwIjp3r3rw
	70FFllNaeM0HJXilaFbw68PlI+dCC8adybygn49pOfgf4TB2evtQ8VC1oRO4JTmw2j+Tfr0afMDwA
	tzIscwy3fL0vUpZ2DPiTo+VZ5qBm6rozl+rqde7xRYjBqW73LLv3Q+nDS4l7hjVR+qWWyxxRvCElS
	+M5x3oO+xmXAC55n91UU0rGfldk5Ao24MxQpPlyhJwMOEa0SvHm+YGzracfZIW1YM2v3v4qkub8FF
	TyPM22V1AqyIOwmwq2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKi5x-00B82m-Cw; Thu, 17 Feb 2022 14:49:21 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKi5e-00B7xl-SA
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 14:49:07 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21HDwSUO011767;
 Thu, 17 Feb 2022 15:48:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=fXiYuBUyotv54LQyPZgnEfOt06j2LWRZLDd1yz76l+0=;
 b=CE2j31jMzdXDLas38K2WwBQENXRIjAz4ciT3WqcFGs71po+NsTUwTpWiUO9dr1n1kmX6
 kKvLcKAoXV53hUUpoBbsUTW4XQmyGlQhBwhFQbWNhZH0bN4xSDzeT5L76WhFaiFixkZZ
 yQ4+seqcu7Y3jiXCvV6PqbAC83LHhaJegA091FLMmw+ngqwQaYEfxiOjvDMxljeCXJXZ
 INa0M9vHMv1++EJzb+5xl1+U0XtKuTpZu2ZtbGw4FsQqUMKAH/j1SMbrHm1N+TN1HZuD
 axOOSmHBG5vJWB1PvfZr5LDCpLzyNmsXd/sFmeXCpToIcAPwM1tSKMwehgsDmnqnrgL9 Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e9de2uwpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 15:48:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0F3810002A;
 Thu, 17 Feb 2022 15:48:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E71DF2278A1;
 Thu, 17 Feb 2022 15:48:49 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 17 Feb 2022 15:48:49
 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <srinivas.kandagatla@linaro.org>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-binding: mtd: nand: Document the wp-gpios property
Date: Thu, 17 Feb 2022 15:47:52 +0100
Message-ID: <20220217144755.270679-2-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217144755.270679-1-christophe.kerello@foss.st.com>
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_05,2022-02-17_01,2021-12-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_064903_214161_9449CF42 
X-CRM114-Status: GOOD (  13.47  )
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

A few drivers use this property to describe the GPIO pin used to protect
the NAND during program/erase operations.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
 - add Rob Acked-by.

 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index bd217e6f5018..53b21aed0ac5 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -154,6 +154,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      wp-gpios:
+        description:
+          Contains one GPIO descriptor for the Write Protect pin.
+          Active state refers to the NAND Write Protect state and should be
+          set to GPIOD_ACTIVE_LOW unless the signal is inverted.
+        maxItems: 1
+
       secure-regions:
         $ref: /schemas/types.yaml#/definitions/uint64-matrix
         description:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
