Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C6CC7619A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfZp4ne2XYIfxocBfD8xQYmyghK+cHRzBXGikD6zPis=; b=w4AuN+V7Ro3khp
	4Jukk8G97dEIpOtJq8rdfwGxuj8c/n7tEn/X0cIasCIhkkukRRL4BKD1WOVtMHz5az3C8A1TWmHni
	Yp9lgHwujAFcR/E1Hm6raf3KFx4Rtrix9JBVNmVTppmBEyxZHDuy7PNpdtVSnHV+Z0sApkWtbmYdm
	0AdZGWccnEilOPVfj7QEX10ji1pC3ImSHpoenF0LWtDIrWw58c2S9uwTMInpdqPoLPYgj/BDKT9aY
	24dg0xB0V9H8ckGAU2XLra7iMGLn7VX57m07FQc0DKxjTY+duge3RL9sIAzczjMq/B5kvQj8yAGNo
	6GhJuYnehEb3qyXPqw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjT2-00AXI2-34;
	Mon, 27 Mar 2023 09:48:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjSy-00AXFY-09
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 09:48:43 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R8IUGG005717;
	Mon, 27 Mar 2023 11:48:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=WYV7EBAofXJyjzZBSfwpOR5v4z00FX931Kh4b0ja95g=;
 b=mSHycwxz/M4wDaKtWXw9Z3IVed4FlmVQ6GoYzw7//rWelMxMz/3+WMymg3WmLLdpcwnT
 qzDFPsw27345E3DOOIHlgJExjay4+sKlpH1dM9L51UZHMwwtudOVC9UBMI+qowmYthhU
 foXNNIoj4MMKnGq+Bu9jp8vySRWt0BJKdCLjsmcqICfSi4ae1n7D5dRkNoIEkNgKHwOi
 AdiNbJMId8s6KKCD1+ZuaIC0KtN9ejKIteBlJ4kFoa5xG22gzfsPXi4bdh8AmdC6B9SU
 j4XI+MLcyP4jTLrEnBoKtHOlblQaOq/X49kbN623WINryfOHdWP7zIU2SopDktwLwiWd vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsr59ygq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 11:48:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DC9D10002A;
	Mon, 27 Mar 2023 11:48:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 481C6212FAB;
	Mon, 27 Mar 2023 11:48:35 +0200 (CEST)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 11:48:35 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH v2 1/2] mtd: rawnand: stm32_fmc2: do not support EDO mode
Date: Mon, 27 Mar 2023 11:47:41 +0200
Message-ID: <20230327094742.38856-2-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327094742.38856-1-christophe.kerello@foss.st.com>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_024840_604253_9282B454 
X-CRM114-Status: GOOD (  14.42  )
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

FMC2 controller does not support EDO mode (timings mode 4 and 5).

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 5d627048c420..3abb63d00a0b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1531,6 +1531,9 @@ static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
 	if (IS_ERR(sdrt))
 		return PTR_ERR(sdrt);
 
+	if (sdrt->tRC_min < 30000)
+		return -EOPNOTSUPP;
+
 	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)
 		return 0;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
