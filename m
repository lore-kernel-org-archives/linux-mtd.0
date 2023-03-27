Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145BCC76195
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P3wY0BREAVpZMnz/4ag3zWXsn+cwByZMy2A5xU5ULDc=; b=IVrmI+Cz8HVFDn
	6WEp68vGkzM0goc4UhkNmBpd3WUVeK2SDUweY/V2nUKh/euBbEL8FgukHPh1Vogtm/vGddXA29Iv6
	aXL6XuyO3h9flKfgzAKACiyU4zA6tEp4ZiSEgyu3fh+nenuWy5HIzShzFpNehmEKEq1/K1eh1wQaQ
	bu1qgPZXYrLJ5Oni70OggD69uYIxkbdX8OYFJWOR+6S7voXuC/MSXBB7sdneVOHn9MxMUB2eQbYLg
	nVWnZo5oodpdc1IOG6W+BTeCSm17N7f83azD5hfjIK4JjX7RKxa7Fe3CsTCwbE/S2iKzZYu5/gVqj
	uIMZYC8ePlyX5Ou9ogNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjT1-00AXHQ-0T;
	Mon, 27 Mar 2023 09:48:43 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjSy-00AXFR-09
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 09:48:41 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R8IUGE005717;
	Mon, 27 Mar 2023 11:48:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=n2P31621B4pGT+Lt7Ca5JfRVeo9zygUKZhQAgYzXy6g=;
 b=ZA1zK6mkYTHpnfEP1/i5e32mxax1kkkZeKRdMU7VkhqjiG9QqTo6sB1byonCCjLlmHao
 dQsJTYji69ZGTFawFxleIBYfY1O+TsoXu7ZvHfQjxjB4UmbV4vOlpRvDnK9J9vajaw8x
 E9MYa0A3BdtfmudSmhVBv8U4VDQ5bO4IZJZhNR4EQhRH2WDXGb1tDE0c1/GFbQld90ok
 WtknUV7mOzA8dBz6mX4POR36BxXLgxAtxZV5zDsSbPkhZEPH662hZ9ZPREoUten0RjQv
 04XF07fK9/uj7YzjJ557rbIfqdSh21673H5DcjkmymBgUkElz6Pv5zk5dO1MusZXw2JZ xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsr59ygh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 11:48:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83D8210002A;
	Mon, 27 Mar 2023 11:48:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79450212FAA;
	Mon, 27 Mar 2023 11:48:33 +0200 (CEST)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 11:48:33 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH v2 0/2] mtd: rawnand: stm32_fmc2: do not support EDO mode
Date: Mon, 27 Mar 2023 11:47:40 +0200
Message-ID: <20230327094742.38856-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_024840_604254_FF018073 
X-CRM114-Status: GOOD (  13.45  )
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

The first patch removes EDO mode support from FMC2 driver as the controller
does not support the feature and has to be applied on Kernel LTS. The second
patch uses timings.mode instead of checking tRC_min timing for Kernel next.

Changes in v2:
 - second patch added for Kernel next

Christophe Kerello (2):
  mtd: rawnand: stm32_fmc2: do not support EDO mode
  mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
