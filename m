Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEB3C6FD20
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v8URCacYtOF+Xa/4sWOeLPdyQ/YmEGG510DGS70X2TY=; b=v4nvIHijEArb7R
	JM7XbIPvQCmd/W/LTI3n5IQDKzyw4usXYtmIPFPJtebyVjjL4V4lMwpkb2tSCMziJeatLKArjOumi
	dfiBgerV9jLvH1VzjX6MbTSFVWFfwP4UCnXvcmZva8hRc5ug0hX+9cjjcRcUQhzu8zyAhCK4FNhZ2
	kqpxQCqDnj5NA/8JU+gzU2zizq2U/r+3Itjv3mllUls/7FLT7PHmBb3P0+vVnyrEZi71kTLE2Phcl
	aWR0iJ8/6AOymQCnRZ8YR8TA8e2IpXkI/B2dBN/sdLcPAID8DpXZW0ZALuk1igXPV4Jb0zWcyQwYj
	8ZhfT2mMpHZusAgXKwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjij-004uSp-2B;
	Fri, 24 Mar 2023 15:52:49 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjig-004uOp-15
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 15:52:47 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32ODPbF0010697;
	Fri, 24 Mar 2023 16:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Orov2Wj71gacCKJm+kuTZX9w05ghZJAYYdo65KlDR6U=;
 b=dXuunBoeV3rDenyDeLj1d7MqXKatlyVXIhcOvKuJE6w3bgHh6ovABIt1BGOy/WX6pZqK
 5qhzS2RrNWjHeg7FaqIRFVw3NUflyT5DLSnHGw1HnxXCMgxoi0Emdxj1wbtKovjIn6hl
 BVATwUfN5pjXQLhnDV/MptPg5Ng3s8H4vbDzsz1ryYGmW2KF/PGxW2KiIQ69GLqDmDqt
 e16Le86MvX11l3yFV/TBoJkwte5cvNq4avfdcw7Q4hUM7c+x+7kn3ZREe56mHiHgmb7B
 koaSm/kHhinZF7iBgYf+OxwpPdeDxhnC1j6vqvo5GzLS613MPoIRLud69n+W7kTT/JLe nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pgxjcdunb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 16:52:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18BB5100034;
	Fri, 24 Mar 2023 16:52:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F33C6217B88;
	Fri, 24 Mar 2023 16:51:27 +0100 (CET)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Mar
 2023 16:51:27 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH 0/2] depends on ARCH_STM32 instead of MACH_STM32MP157
Date: Fri, 24 Mar 2023 16:51:03 +0100
Message-ID: <20230324155105.826063-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_085246_677329_13FBFABD 
X-CRM114-Status: GOOD (  11.61  )
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

To be able to compile the driver on all STM32MP SOCs, we move the
"depends on" on ARCH_STM32.

Christophe Kerello (2):
  memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of
    MACH_STM32MP157
  mtd: rawnand: stm32_fmc2: depends on ARCH_STM32 instead of
    MACH_STM32MP157

 drivers/memory/Kconfig       | 2 +-
 drivers/mtd/nand/raw/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
