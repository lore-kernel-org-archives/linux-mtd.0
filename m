Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51F4C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 11:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8589A2072C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 11:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpri/zOr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8589A2072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gFkIcG+cw5n0HiWYreM5BQA/JNSteh1eueF5VkeC4eY=; b=cpri/zOrJAQZkG
	S+IjnZea+Dc7K1+/Ygac7eDOlr8CoH0OLJXYjjhqyv7swXkkCs2EFpvbVwi07aPYu0nb7sISeNQpt
	qJejSZuSf7zVUZ6h+Fv/aRS8pAkYk4nuUMNEr/H73b2NjgptuUbbNkwcnAhGGsF3qYzmQxHII8KU/
	iN/PdAJiFg3y7hwwYfhZnkCDAadiQcxmftpUXdxcBnvKjWuz8qgtglD9YS4GUbCIacy3WberUzSe7
	LDSkc0lFR7IxUvWTAr3vnTkN9lpW2pfx3nUpbT5bgyKKnn1BhyDCVLrbnNoCuA2AaYD71+v/90ls9
	dVs8jhIBelA7gSx1/YxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbjJf-0004AU-5p; Thu, 21 May 2020 11:24:47 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbjJL-0003mw-Om
 for linux-mtd@lists.infradead.org; Thu, 21 May 2020 11:24:29 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E3758CC14ED682E7A9D3;
 Thu, 21 May 2020 19:24:12 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 21 May 2020 19:24:06 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <broonie@kernel.org>, <tudor.ambarus@microchip.com>,
 <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 0/3] Add prepare/unprepare method in spi_controller_mem_ops
Date: Thu, 21 May 2020 19:23:48 +0800
Message-ID: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_042428_028322_7A1DAC3B 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, john.garry@huawei.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In this series:
- Add optional prepare/unprepare methods in spi_controller_mem_ops to allow
  the controller do specific works before/after a set of operations, like
  spi-nor flash's read/write/erase/lock/unlock. This is equivalent mechanism
  to spi_nor_controller_ops' prepare/unprepare methods.
- Implement prepare/unprepare methods for hisi-sfc-v3xx controller. This will
  solve a race condition between the kernel driver and firmware.

Yicong Yang (3):
  spi: spi-mem: add optional prepare/unprepare methods in
    spi_controller_mem_ops
  mtd: spi-nor: Add prepare/unprepare support for spimem device
  spi: hisi-sfc-v3xx: Add prepare/unprepare methods to avoid race
    condition

 drivers/mtd/spi-nor/core.c      |  8 ++++++--
 drivers/spi/spi-hisi-sfc-v3xx.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 drivers/spi/spi-mem.c           | 20 ++++++++++++++++++++
 include/linux/spi/spi-mem.h     | 11 +++++++++++
 4 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
