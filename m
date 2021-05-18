Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B202C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 13:44:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EAE6105A
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 13:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93EAE6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4Xy48sxeUqxEQXL5+uvOQojPrpGiQiYO10Leg9RXIs=; b=fSHdj+xm/vNNkOrbD/qKklTzbx
	lMlcSHn4hSS6aHuCcZsxKixGUC4SbIMPwvSTIQSO0RaN3APTjXeCVA0Co91P6MgO1SC7l738nmvwE
	mxG4YV4FOstSY1UgR63LuztdO7zyeem0atanhE9QLjiTRmaaQWvzHN2saOffOXxu4gOEYefrP43SD
	TTFw/jTh+gIldkFd0K78dMbG5aIizm34sE5+jUxoMrqUBtQDilcd3LbMUlYcKPDwp/9RYIPZm2jD2
	jBYD2pDqy+8A48JHXTsIzrOgCef3TVrcMR+uCuV84eG3X4/E/y6AK6BykF2QFqjvxdBDHiePMfa47
	KhYKJGww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj00h-000u36-Ac; Tue, 18 May 2021 13:43:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj00e-000u29-8B; Tue, 18 May 2021 13:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ClUM44THHlL1BycyMOmRsN86GSk4mDnz+xXOf8XGX8s=; b=X0+u4BSb+sVAeDbpyEYkBtrnyI
 hWnBioLpxDINd83VSZ+/YGstUq9IAo+jQgUL3xK1f0iB50c1yf3s1LSjrcv5JGH9rMwbwwTF8Wh4R
 14AzrM/YAu7Am2HqwF/6QmNKgxP/YD8WjiDT1yxPAwq+dC4IazxH7uhxGYZJbTWkQGkwRbwunfeo3
 NuhLUu9TfhmFttCfdoaksmSNafRtKHSoSzY5RZtmtJ5Vd/2z+tk+7KLccuKZfljhCg7O/kNt6Zs7k
 W8HQceL19zW44HH9PsrwLqG1sqigBOSJCAyVkUcdYSXSiudvfdqem37stpGD1eii6/dcEtRfmtRtT
 QG9TtZ6Q==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj00a-00EhAt-SF; Tue, 18 May 2021 13:43:42 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDX56q023702; Tue, 18 May 2021 15:43:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ClUM44THHlL1BycyMOmRsN86GSk4mDnz+xXOf8XGX8s=;
 b=TgMdYdTRkPqqRW4B2K8CKt6ybV8q+0Huq+i9A+RJIz544JJ72F7Ng8gVVbQwKR17AIIS
 Cd3xo+ZgdBXxM8NYneGLheRqpcndSWvtAjjpI8RS0CCF8+Y3NzP9V0HU8NevpU+dSJ+K
 qjKpLggiSh4y4Jv87bu2l+5pksxiRAnY4jaf7Clb0LfCuc3R13Rrw6+MQ2H4Anoy8J0b
 el94qfjAj62MuGTzS1hjkdoMlbdKYWHUHkJRhHkXBZ9kJTgAMjkAzMkUOH5DT306JFnt
 7KQ/nrxn2kyrWSR6Cjspn4QUPo+U1PZ0Vu6rLLpPWm6Sk75fheAVpJlR0sfa707Nyy4X Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunsgw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:43:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3260610002A;
 Tue, 18 May 2021 15:43:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BCB4227D8B;
 Tue, 18 May 2021 15:43:34 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:43:33
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v4 0/3] MTD: spinand: Add spi_mem_poll_status() support 
Date: Tue, 18 May 2021 15:43:29 +0200
Message-ID: <20210518134332.17826-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_064341_282967_2E78B3AE 
X-CRM114-Status: GOOD (  16.18  )
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

This series adds support for the spi_mem_poll_status() spinand
interface.
Some QSPI controllers allows to poll automatically memory 
status during operations (erase, read or write). This allows to 
offload the CPU for this task.
STM32 QSPI is supporting this feature, driver update are also
part of this series.

Changes in v4:
  - Remove init_completion() from spi_mem_probe() added in v2.
  - Add missing static for spi_mem_read_status().
  - Check if operation in spi_mem_poll_status() is a READ.
  - Update patch 2 commit message.
  - Add comment which explains how delays has been calculated.
  - Rename SPINAND_STATUS_TIMEOUT_MS to SPINAND_WAITRDY_TIMEOUT_MS.

Chnages in v3:
  - Add spi_mem_read_status() which allows to read 8 or 16 bits status.
  - Add initial_delay_us and polling_delay_us parameters to spi_mem_poll_status().
    and also to poll_status() callback.
  - Move spi_mem_supports_op() in SW-based polling case.
  - Add delay before invoquing read_poll_timeout().
  - Remove the reinit/wait_for_completion() added in v2.
  - Add initial_delay_us and polling_delay_us parameters to spinand_wait().
  - Add SPINAND_READ/WRITE/ERASE/RESET_INITIAL_DELAY_US and
    SPINAND_READ/WRITE/ERASE/RESET_POLL_DELAY_US defines.
  - Remove spi_mem_finalize_op() API added in v2.

Changes in v2:
  - Indicates the spi_mem_poll_status() timeout unit
  - Use 2-byte wide status register
  - Add spi_mem_supports_op() call in spi_mem_poll_status()
  - Add completion management in spi_mem_poll_status()
  - Add offload/non-offload case management in spi_mem_poll_status()
  - Optimize the non-offload case by using read_poll_timeout()
  - mask and match stm32_qspi_poll_status()'s parameters are 2-byte wide
  - Make usage of new spi_mem_finalize_op() API in
    stm32_qspi_wait_poll_status()

Patrice Chotard (3):
  spi: spi-mem: add automatic poll status functions
  mtd: spinand: use the spi-mem poll status APIs
  spi: stm32-qspi: add automatic poll status feature

 drivers/mtd/nand/spi/core.c  | 45 +++++++++++++------
 drivers/spi/spi-mem.c        | 85 ++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-stm32-qspi.c | 83 +++++++++++++++++++++++++++++++----
 include/linux/mtd/spinand.h  | 22 ++++++++++
 include/linux/spi/spi-mem.h  | 14 ++++++
 5 files changed, 228 insertions(+), 21 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
