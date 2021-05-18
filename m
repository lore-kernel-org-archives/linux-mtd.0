Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68080C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 09:43:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0E261184
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 09:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0E261184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lDDE5MRT+1RfoSf1baI5/k8e8hjz6hWeuOPDvthFh14=; b=nR069TTnWDV+gJLC5sUv0mypMK
	BWszxWUdQxlM4LVW4aN1MzdIa8aY7WiBfL+aShxIfPGbmrf5Jjnofc8nUaocMWDJReYGxktEqJ5ns
	j8SQDO/+L1VxufpaYhIwKxMvOTzbEnvQxrMQVYJkYKjNleeg3+4ILrKCyfvKGORrSN5V203ByCjNU
	t2bj4gwpi69yl300uww/NPv2FuSsK2zlaJEoLvG3ky1v8fAqZXRCBsBJMXUjc45Se9vkonO7E3HnL
	h7UOiR4aUDSjPMRtSXWld3m6FmHU2K8XP8+L2mmsmq+4fEVj5yrwXMIhgEmeTDqc/8fuKjMZMPqI2
	583ka/mw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwFE-000CJZ-DE; Tue, 18 May 2021 09:42:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwF9-000CIP-CD; Tue, 18 May 2021 09:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=NYkCFyg/J9YK0KU90WHGnXm9+RztNvxNW7BXV5KdyXw=; b=Hzw6UMFlRZFeac/ml33u27YDIw
 EiyEvVRYOZiwZvUOET4hUP9viRMqJAG703JQl9SffNmDAe7s0/T+8R76ZX4fPHGLPmr5Q4HladQfC
 th+jJTj7hYo6I/5zeA3zyHxOp4t1G1cZIXxDybYgYPbizmPkgOmCj4sV3q0idkAJTNW/057wzegMx
 PVhenbWgGC8HHzns+vxZaUtdKy+x4dM54Im9CYJ6vIt84i+VIO2Gro0ZSJsm+bfBuxwgVszVQuQNJ
 7keZ7RH7kkUFgxZTQEtIc+5vB6lp+h8uW4iZB/ztgLoouYqalxbPa9rSlZIbXqq5GtyGrm2mlRzHu
 j0VFlncA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwF6-00EWJJ-9j; Tue, 18 May 2021 09:42:25 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14I9MvPl010142; Tue, 18 May 2021 11:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=NYkCFyg/J9YK0KU90WHGnXm9+RztNvxNW7BXV5KdyXw=;
 b=pjiD3jJOvymNxQYw/Edc/CTtVfMDjIcZz4m1827GZIN8N+4UEXar3/yFLhN/CKtVor8T
 +qjVpMcgaqfFvPMgLtP3lUwuRcOI+m9klihgOXZ6hD3WiUHGEd8zI7HF0wBFrl5lbwNy
 hEGYbrA3gIQ1AgMu6+r7C8TXSuY/YH9VGL8k2vifSZmcDD8wLdveGcdLnA//+sNmmMgT
 uX7bQ1GR9qDTRHCx7/IfmLd9LldYPAXZbz2DvpozKW3JvxJm/q3HsgihuZrAxsLSddmb
 569x5b9sjitsvxieJ1LVc5jRyLk6thZVOid6UUtBXrjJ+bSE0YH12xzBvtBCECC0/mft 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunr4mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 11:42:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2228510002A;
 Tue, 18 May 2021 11:42:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09E1921CA62;
 Tue, 18 May 2021 11:42:12 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 11:42:11
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v3 0/3] MTD: spinand: Add spi_mem_poll_status() support 
Date: Tue, 18 May 2021 11:39:48 +0200
Message-ID: <20210518093951.23136-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-17,
 2021-05-18 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_024224_725444_AC93C68E 
X-CRM114-Status: GOOD (  15.40  )
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
 include/linux/mtd/spinand.h  | 11 ++++-
 include/linux/spi/spi-mem.h  | 14 ++++++
 5 files changed, 216 insertions(+), 22 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
