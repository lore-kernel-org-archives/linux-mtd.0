Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6383EC54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 11:27:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 344932072B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 11:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gaKKcNoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 344932072B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PwIZDFbqEP3hyxMFyPck2zfIT6qa59B7F8nQdg62VsY=; b=gaKKcNoPLZXwtQ
	nzVQ7S855YO9p0VplJtXww/GBOtyrgYkPHJXWCc3GdakRQRggFiuKh9NVa0or4xK2HMRyEt52RK8a
	+ETBJtRFp3IBJ2nJc7ZZv6PM+qAecKNPJ/HOrDMLebfT5mBOOzBSfWnxx1j49GOmmDCU8k7f1F8fT
	3FKJYdVOpJje6g8thcDUxZ9KZNOebKNGDWFSYytMp4Z1hEkdaYG3qq7Jrg8opezflDMt2tKZYkA2G
	601e4ZBzwMLrOtejcrdpemtWqiNVP4x5IpARGkgZ/R0RS6M6Ioc0hn0d2lxSeHe0KmQPWXccCOja7
	fBNo/jpMcTPWsYh0Tr/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYT4a-0000Y2-9j; Tue, 12 May 2020 11:27:44 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYT4Q-0000M4-EX
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 11:27:36 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3735C9648A7C742A9A1D;
 Tue, 12 May 2020 19:27:22 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 19:27:11 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH v2 0/2] Add support to Disable the flash quad mode
Date: Tue, 12 May 2020 19:26:57 +0800
Message-ID: <1589282819-42358-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_042734_658087_3DB87F2D 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, alexander.sverdlin@nokia.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Previously we didn't disable the flash's quad mode when it's removed
Then comes the problem that if we next time load the flash
in SPI/Dual mode, it will not be correctly enabled as the quad enable
bits has not been cleared. I validated the condition on Cypress s25fs128s1.

This series adds the capability to disable the flash's quad mode. And
restore the flash when it's removed in spi_nor_restore().

RFC:
- I cleared quad mode bit in spi_nor_restore() when flash removed or
shutdown, follow what reset 4byte address does. But I don't know if
there is a situation that the flash is in quad mode by default. If so,
we should disable it in probe stage.
- The issue occurs when the user switch the spi mode of the flash.
Not sure whether a situation exists.

Changes since v1:
- modify the comments and fix the condition suggested by Pratyush's.
Link: https://lore.kernel.org/linux-mtd/1587720044-49172-1-git-send-email-yangyicong@hisilicon.com/

Yicong Yang (2):
  mtd: spi-nor: Add capability to disable flash quad mode
  mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()

 drivers/mtd/spi-nor/core.c | 56 +++++++++++++++++++++++++++++++++-------------
 drivers/mtd/spi-nor/core.h |  8 +++----
 2 files changed, 44 insertions(+), 20 deletions(-)

-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
