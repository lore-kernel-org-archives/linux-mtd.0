Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4805AC43460
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 13:19:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9631261042
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 13:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9631261042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iG8If5v+D1HEBg8yLJH59+nBtYrLmPeobFs/16q7cVk=; b=XroEDyzLDFakx3nbaBxseYmUDg
	QEupWCvqiWXMPlYVuykH+BedcqlSpDze0CojqX6POR0OJVSxmMKbWG9lGN9WQ2ySb4kqpmZYEBuqI
	ef4Kzciw8Z9RqUIPP7XvcXEZD6wcK5zYmnQtdfjoHoQF+zmOPPDTIb30+16asQ+qgE4b1HTsF1FQ4
	xWdNeJaSpSW6wU1/AzgmU2/kZ+kYnc/ROY8aj0Y97rNCl9lguu9Jkynu8m2sHXYF628VTUa6e9+D4
	3r2HdO/M9uM1IiCPYEDX6641U//KjQUYUQI/hBVQGeJDjNmT+x+PSok9uOQOTkAql99W6viq5ZZY9
	2MN3bjcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0NW-0079R9-AG; Fri, 07 May 2021 13:18:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0N5-0079IF-Bo; Fri, 07 May 2021 13:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=qEpLoPkHkDO0KPGL9HESkeimlG06MUmm1JzHIHKO0Cg=; b=W3hERRdK3dslPhwkaDzOSsLmdg
 BkvfKGcamMcJfqCqcKmetd+4qP4m/c8feVtLvMRp/ma9y6uToFpEgbQzA08GCUYcb85RYk1Y7dD59
 9wufSxZAVxGMRcWxZ2BjXJ3ybag1OSmhz/5pvKc6m5Cq8VhA004Qx4WRV09r8JGge2qtPX6bn2mC1
 z0FsN+r+Rq7wjL6/0h+9Da5ir5EbeyZcVclcsofTL8KBVsmmp8h7JONoq2wqRHDtaxztRsXKOwSQ1
 Ecz8bqbZqBuUBuXd/8/jL47vOmvtZGf+TyZIRragN/u7LE3HwRyJpeKZjCo2avbCFtyVkju7VAGeh
 Z8YxoCOA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0N2-006sks-4x; Fri, 07 May 2021 13:18:21 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147DD3K9030544; Fri, 7 May 2021 15:18:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=qEpLoPkHkDO0KPGL9HESkeimlG06MUmm1JzHIHKO0Cg=;
 b=EHn6lMUIqgLjkv/iAHTgQM1mHzYNyT7y9PzftZ4TOjwJXUW93RZEKC6n+opj2oG/OnZR
 lbVtlgbfApEhuvayEVMZllcxEmuol+5Rm56HgzSYkgLkB0+AMDJg7pkk0fQlKW6y2cU+
 wZKYa5qZmKA8F/2YjmIxSPWw18b8BCgEYTmrxkkb0+k14AmNHZ8u40UHR3M3GC76szc/
 k2jS2IANMkOafOvu3HuSaN+SXALq9vjQl7TZhciYsqGIuUiFugExPBJd26kPLctAKUMv
 7uNbED1Od97JxDYG/xvnxxnP3Wn24Q0HSvts0EgMonVvmJGCRVP3J9zeFNjK82P58sXB JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38csqbv68r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 15:18:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D36B10002A;
 Fri,  7 May 2021 15:18:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6018221F78;
 Fri,  7 May 2021 15:18:12 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 15:18:12
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v2 0/3] MTD: spinand: Add spi_mem_poll_status() support
Date: Fri, 7 May 2021 15:17:53 +0200
Message-ID: <20210507131756.17028-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_061820_495962_D5333040 
X-CRM114-Status: GOOD (  14.86  )
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

Changes in v2:
  - Indicates the spi_mem_poll_status() timeout unit
  - Use 2-byte wide status register
  - Add spi_mem_supports_op() call in spi_mem_poll_status()
  - Add completion management in spi_mem_poll_status()
  - Add offload/non-offload case mangement in spi_mem_poll_status()
  - Optimize the non-offload case by using read_poll_timeout()
  - mask and match stm32_qspi_poll_status()'s parameters are 2-byte wide
  - Make usage of new spi_mem_finalize_op() API in
    stm32_qspi_wait_poll_status()

Patrice Chotard (3):
  spi: spi-mem: add automatic poll status functions
  mtd: spinand: use the spi-mem poll status APIs
  spi: stm32-qspi: add automatic poll status feature

 drivers/mtd/nand/spi/core.c  | 17 ++++----
 drivers/spi/spi-mem.c        | 71 +++++++++++++++++++++++++++++++
 drivers/spi/spi-stm32-qspi.c | 81 ++++++++++++++++++++++++++++++++----
 include/linux/mtd/spinand.h  |  1 +
 include/linux/spi/spi-mem.h  | 10 +++++
 5 files changed, 164 insertions(+), 16 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
