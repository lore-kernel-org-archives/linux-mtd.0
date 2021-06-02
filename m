Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90680C47083
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 09:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5067C6135D
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 09:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5067C6135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DgwqGqHZwsb323MH/TL7+R+CF9ybIORv7ILg60XHyoM=; b=SVXYS5ODbiHkGi
	ZiB6UBfYphhUyB3mS1pEgDkJgiqhHuBL/ENHEbM38h/e9kWKdt5prMAkGrYx9k/V5G1HpWu0aeXIE
	HTMFNYfikrO5MTELOFv9Mslr/z9uO0EhIo1K2f9U0k3AP4Biz3C02LTJs3xpBfFjXf61vy3AwZDBW
	/40JHJWPghpf+v35bwYHHlJ9k8VSY3nP1U4NpqDvshFjXX454PxfjZKpCv0zra7ewrNWgAxhjkqRt
	t5+w7/tH59G9OgP+Dv1O4ayJ29NJYKJvaOPGgtbHtvmwPUztiXWoAPFj7wRqB1nPCUPeSRNEnAwMU
	Pn+/7JS3Zgk3Eb+lOCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loNZl-0035ws-Oy; Wed, 02 Jun 2021 09:54:13 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loNVl-0034c8-MA; Wed, 02 Jun 2021 09:50:13 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1529nCrT004370; Wed, 2 Jun 2021 11:49:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=EWRidho0dnsJM1LKzQGAhZ8GVYTIGNPTjg8OhRES9Og=;
 b=aQULshdvaG7MYq/d5lr5El5lk8iXogePW9WADjwm5glQgx90j8NTufRnreS+EK2hZOXW
 ZxKGiBEdZnSx9bOQtT1IBPDzs5IWxboF3GyAR0oNqU+uHPoW7bVPL9QAPZvARpVBoZqG
 FJjeRCS86ha/b5h+2XaYhEXEz48uRwyqax8x8TMJen3WcyOE3e3Izt1Sf08yQTNoGNq/
 TbQpk/0buLkvMmOb/uoygw2Y2lMUjivtge30Bblgpo9OJEVLuq+FFazPBgwHPyH5lJMf
 nneYoj7cAZj89bgmBYJqGDUyuwmeVWFjImyu6WPmWh3PTZFZHcIxAh+djlmCgSyvy3Ub CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3gxmkpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 11:49:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE8B810002A;
 Wed,  2 Jun 2021 11:49:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92491216ED7;
 Wed,  2 Jun 2021 11:49:54 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun 2021 11:49:53
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v5 0/3]  mtd: spinand: add SPI-NAND MTD resume handler
Date: Wed, 2 Jun 2021 11:49:10 +0200
Message-ID: <20210602094913.26472-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_05:2021-06-02,
 2021-06-02 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_025006_110491_935B5348 
X-CRM114-Status: GOOD (  12.55  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v5:
  - spinand_init_cfg_cache() only allocates spinand->cfg_cache array,
    spinand_read_cfg() is called directly in spinand_init().

Changes in v4:
  - Add spinand_init_flash helper()
  - Remove no more needed spinand_block_unlock() helper introduced in v2	

Changes in v3:
  - Add spinand_read_cfg() helper 
  - Add spinand_read_cfg() call to repopulate cache during resume
  - Split v2 patch in 3 patches

Changes in v2:
  - Add helper spinand_block_unlock().
  - Add spinand_ecc_enable() call.
  - Remove some dev_err().
  - Fix commit's title and message.

Patrice Chotard (3):
  mtd: spinand: add spinand_read_cfg() helper
  mtd: spinand: Add spinand_init_flash() helper
  mtd: spinand: add SPI-NAND MTD resume handler

 drivers/mtd/nand/spi/core.c | 112 +++++++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 34 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
