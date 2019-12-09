Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4D9C43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 14:12:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 897492073D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 14:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BCYijuYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 897492073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHCTWORDyvF3FW+iWV1FqtzZOJ1i8W1kSk3Oc1KT+Rw=; b=BCYijuYkpnrvwS
	GwAg3Gt4or1HIoYb27XkCjPm+XQeYzvIYrNwfmVKIb3dfWw/sNNZFY5iKPllDRzLds7VuNrD6/ncD
	aazCBn/IY4u56w6ApSAHX69PsqRP/HzsxjXwO/ygAef2cIFmawDZvY0YwaMslhdgWif5+8X5TSSWu
	VV7O6YR4+Fur6niATUoETsgyBOajWzT9AR1RWHnWRX2KAeOa/emVIhanshPIv7glt0AeXOVoFExWK
	8RMBOwRUttJ829F+x6MijQZjjZhiVFt3wtRsBeOU92t/ZJpqnzimLOP8ymT6K6eGU/aKlaUaebZwq
	ZxwThN2XBAQlq2eedogg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieJmE-0000IK-Cx; Mon, 09 Dec 2019 14:12:42 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieJld-000836-Hm
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 14:12:08 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C681C7ADE8329B6A8CE4;
 Mon,  9 Dec 2019 22:11:49 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 9 Dec 2019 22:11:42 +0800
From: John Garry <john.garry@huawei.com>
To: <broonie@kernel.org>, <marek.vasut@gmail.com>,
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 3/3] MAINTAINERS: Add a maintainer for the HiSilicon v3xx
 SFC driver
Date: Mon, 9 Dec 2019 22:08:10 +0800
Message-ID: <1575900490-74467-4-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_061206_827635_C76E20D7 
X-CRM114-Status: UNSURE (   7.58  )
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
Cc: chenxiang66@hisilicon.com, linux-kernel@vger.kernel.org,
 John Garry <john.garry@huawei.com>, linuxarm@huawei.com, fengsheng5@huawei.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 xuejiancheng@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Set John Garry @ Huawei as the maintainer.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd5847e802de..8c119bd4f687 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7492,6 +7492,12 @@ S:	Supported
 F:	drivers/scsi/hisi_sas/
 F:	Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
 
+HISILICON V3XX SPI NOR FLASH Controller Driver
+M:	John Garry <john.garry@huawei.com>
+W:	http://www.hisilicon.com
+S:	Maintained
+F:	drivers/spi/spi-hisi-sfc-v3xx.c
+
 HISILICON QM AND ZIP Controller DRIVER
 M:	Zhou Wang <wangzhou1@hisilicon.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
