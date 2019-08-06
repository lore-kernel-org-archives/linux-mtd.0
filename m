Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B4AC31E40
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 16:08:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3156420679
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 16:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZoGB8lls"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3156420679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nNg7Fq+kuZGdw+3i92QzAWkZTLkb8fG0yY97tR4j7nA=; b=ZoGB8llseonfTn
	lapEmR1Mn5sDnZhR4ngd37lMrRrPTiQN+OEPyuvgx2/5oJvqcYXTkFpd79G+nTTcl2UCYUEN28EBy
	8qY/7ejKN32ppIgTFji1Ds5BMqllqz3OiTznb2MZPTra1DqYRQSSzHHlNDV1/J69qqY3TWSgv8wja
	bQe8U0q8OQ+wA4uWXarm4n6vjjr1ILKCuW+Kx+jcRyPRY3gLA9HH6gVKlnM09gxtdYlLnUdm7vLbQ
	iY6YsR7BkHBSLG8cKqr7honYOmGyez0D8NRHBAj/G/Jalkwbo0AsPhvMRa8Fq0nQ1rUmczbtLA2IE
	noJNqlsqtRIbB6ZAjnGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv20v-0000zr-7A; Tue, 06 Aug 2019 16:08:41 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv20r-0000yz-5M
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 16:08:39 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1E2BBCD242C6BF83393B;
 Wed,  7 Aug 2019 00:08:25 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 7 Aug 2019 00:08:17 +0800
From: John Garry <john.garry@huawei.com>
To: <corbet@lwn.net>, <mchehab+samsung@kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] docs: mtd: Update spi nor reference driver
Date: Wed, 7 Aug 2019 00:06:23 +0800
Message-ID: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_090838_118070_53BBDC9F 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The reference driver no longer exists since commit 50f1242c6742 ("mtd:
fsl-quadspi: Remove the driver as it was replaced by spi-fsl-qspi.c").

Update reference to spi-fsl-qspi.c driver.

Signed-off-by: John Garry <john.garry@huawei.com>

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index f5333e3bf486..1f0437676762 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -59,7 +59,7 @@ Part III - How can drivers use the framework?
 
 The main API is spi_nor_scan(). Before you call the hook, a driver should
 initialize the necessary fields for spi_nor{}. Please see
-drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to fsl-quadspi.c
+drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
 when you want to write a new driver for a SPI NOR controller.
 Another API is spi_nor_restore(), this is used to restore the status of SPI
 flash chip such as addressing mode. Call it whenever detach the driver from
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
