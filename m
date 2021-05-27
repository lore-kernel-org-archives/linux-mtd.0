Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8E1C47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 17:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE93A610A5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 17:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE93A610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8hB4pXG9YUxIRkHGbUyuRd+c7b/mTVxZW8uh/pqm4gU=; b=kDnbMOxsrC4kjV
	ICJp/JCSuVZ2GQaawtfcaYO0LEK/8BngsAZ/RjRJcBXaXdJ636PsoC7rPQAxKC8x4v8jRL8ddxUc2
	tITS6Pw7/prUqPK5Wm8NRpY/CjJdKOypoxA2ezGy4Uc0CKLxSAC2EcgDYGRQgfTPtyT5b/YALflbZ
	B/HEguZFzYe14c7xpYPWir3wCyv5S9k+3h45gQXJSgM792naZeKykKEeuCsyjv51c8gugaTdB69o7
	gWKlVQVXIjIfLrzV1ZHCrExU+43Q6j06IIOkcbTi2khBPAL09DkYLg2P+4LIiaO8eV5ytg3xt6nmT
	rk/W6oLLNHZFp4ToKlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmJzW-008AaT-E0; Thu, 27 May 2021 17:40:18 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmIdI-007VqO-SR; Thu, 27 May 2021 16:13:20 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14RGD6cs000887; Thu, 27 May 2021 18:13:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=LCxObs1JJa3ITzuaD/aVq/zLo/TMl80lt7ojHZ3IzB4=;
 b=xmZmy1rFGwT1ZdtLjqXrzY17MuN3xjjX0VY1FItCFhTxWQN+8bu0Fy4tPuJyQiHkeUJG
 Vv2i8sizcXh2T2wfSnvakFpYznm48Et6S87Z90r1SBTo0jo7xIdh0sVJNXEfN7Q0YLf3
 +2BC0fKrFVRBhbgLfXGMaAIYqxpEm9pKrD8WYu5Mq19G7xAAzHZE0KQt9OXALQKW4nhc
 MpQpEYy6eiv2JEUYwhje9e5p889SzjAtLCCgDky4j3/GHHMO9yqUmBkAWvTMyiIBLxXs
 xUxZUuMh/W8epTMcsHUzZzKEDVeLUJtBO4XUcQ43YPuNf+DXMgsVEF/4oZMfnZch8q6Z zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t7k3av0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 18:13:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A73B10002A;
 Thu, 27 May 2021 18:13:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1C29236565;
 Thu, 27 May 2021 18:13:02 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May 2021 18:13:02
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v3 0/3] mtd: spinand: add SPI-NAND MTD resume handler
Date: Thu, 27 May 2021 18:12:49 +0200
Message-ID: <20210527161252.16620-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_09:2021-05-27,
 2021-05-27 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_091317_516113_F974CE11 
X-CRM114-Status: GOOD (  11.35  )
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
  mtd: spinand: Add spinand_block_unlock() helper
  mtd: spinand: add spinand_read_cfg() helper
  mtd: spinand: add SPI-NAND MTD resume handler

 drivers/mtd/nand/spi/core.c | 90 +++++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 19 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
