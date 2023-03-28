Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC119C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwcpwlKiD6PqPDCSA5Kw2Dng0mqfQnOngHWImiokWpk=; b=43EoBj/vpx4Aqx
	N0SPeFbCVLi8FyAGKyF4YXGwWrzYaaS365K7S3nwnU6zetkgm1ajyjkEJ8KZ7bQyWoG/QxxJ7rUd+
	/XqXZJwt05+CLCzs3ceQE3Osj6ieDq3WPwtGh/KCBwQkwH15IeKOa2apOE0nnhk3Otw35ZCInZjLA
	t72Qh7FGcG3U+q2d6PRzOTlUndsTVVJXXGnd+Jk7mjZa2mEEt/r6PaeTl4SCPCASjIauGd4V1+zAE
	gRQptrWfX475VimNGk1xSasW1sCxaTHhSHc2t3IsaIpu4XGlZBOmryQ1rNhQ98aEuHiFumv8XvaNr
	5mkTXF/4KbmGiF8J3pPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBkW-00F443-0z;
	Tue, 28 Mar 2023 16:00:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBkS-00F41a-1q
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 16:00:38 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SE2FCt000530;
	Tue, 28 Mar 2023 18:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=oAuLL9E3dQSv/RZG+St8bKflmCvKwKf/3xQCNXsAZbI=;
 b=Ukug8FncPywnBZmTJ36/VVF+KiXJnnhqe7usSKdjgtPS/rZYQksFYAfjWaeEpYKYK2FL
 5xvW7hrwzAzBo/ZiSwfHgogjv0Q3pCtRrlagDBoYguU8ArpcwZ8Ser5IAnYyvitNygkg
 Hfq38ppX2PKo7fJ4G2OY2vADMLHIRwVI7JI3ViFF5P1MRev6QPlSd6kv77ii1F3MgP2k
 G0oBvyjZ/1sn3ACCiapHZsDCBtvSvq++Xg5zCUZIjlSdSt1Kiv+lB15pbUGvwVgdGxd9
 F4tChvKeaus7CjDWQpLoSLqFFdx4VQZWOQF6LFIknkgGCuSf+ZslbXtKRuossHOb+I+c Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkvs4u1wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 18:00:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CCEF100034;
	Tue, 28 Mar 2023 18:00:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59A2221A20D;
	Tue, 28 Mar 2023 18:00:29 +0200 (CEST)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 18:00:29 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH v3 0/2] mtd: rawnand: stm32_fmc2: do not support EDO mode
Date: Tue, 28 Mar 2023 17:58:17 +0200
Message-ID: <20230328155819.225521-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_090036_883514_4E546BF5 
X-CRM114-Status: GOOD (  13.11  )
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

The first fix removes EDO mode support from FMC2 driver as the controller
does not support the feature (first fix is needed for v5.4+).
The second fix uses timings.mode instead of checking tRC_min timing
(second fix is needed for v5.10+).

Changes in v3:
 - The commit message of first patch has been reworked
 - Cc to stable added in each patch
 - Tudor Reviewed-by added in each patch

Changes in v2:
 - second patch added

Christophe Kerello (2):
  mtd: rawnand: stm32_fmc2: remove unsupported EDO mode
  mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
