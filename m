Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A8DC433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 07:53:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1545561973
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 07:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1545561973
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sb7vD2NRPvICJjrWsCAPGo2Ul45g1asjuFcwNTCr/QM=; b=C1vkVMK+w4Hgk5dvQGDUhhpey7
	7ZSQTO1CnQ608c20lY0rWfqD0X4y0oTxLgZVO53OA2pVhPnCye8Aiy2cPl1BGZ8Rcc1fuyK1QfPbI
	9rXkJlhuebgpdrG2DvxoSpomQvTD/hgP79p24oBsup20nY207dU0CgF+Ci9i7h/3H8OR+AH1n/rYt
	4mR6AvqLVOv0dYNqnEGTsZGiUQEBcVfcCBTd4oukrHDm9M7OUwoG/AuWlzvbNEbTMtXEnNeE13BZ/
	j/TKkl9T/Sf6j1VWQ4A9J/VZE9txdbRKqwT11sfoszeNA0XFVXMGha8l8eBGclAXWTVGy4aqJEd+d
	GkPL/Ulw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOFMm-00B6iS-Ci; Mon, 22 Mar 2021 07:52:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOFMW-00B6fP-A8
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 07:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1616399552; x=1647935552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GHbviN382mS0WFoielS1QhqNDpObeQ8Ts5XNId4GLX8=;
 b=KSCCD70Br/vJycxWMDFFC2LFcLxO0i4640BvUSquHTXDe9Bjl82Efmvi
 eWowFIkDOoVXA8wJZFnVIUsyQOKwWoLM4Aee6GxNRLmcP2TJsyVF2snKo
 zONkEWpvF34HxPkg1hccvOqtcjTzo+t7N6Yx/NqN4Dugwj7vXGZiG+E49
 E+kKZvo1IB7VpiEBSVKmTP2pE6ItnSNtvomxXD+qJifyo+Zu0aVKEcTIU
 Tyc7tyqT+448TB2T1U3cuoeuAQXLx0H9wVRG9G8cpI7liym70W/h+9YrD
 t2/dGTY5ncXpfnKS16FpyW/7SWjXZxkXxfw8P22UVif/75QoUtSfwBORL g==;
IronPort-SDR: 9ff6a23kY5W7Z85zPDzRHIKAul0wJWYoclkOlwUKUKIunxCI+MsdKKsxrn7CTrrTiljAjM7lLU
 xt4BIhpsDIEd42bSqEMO6iUCvDpZ1UfAsJHPU6f+RGmpgfM5k5WSkien4R18znfLges0YvUZ2n
 gXEDWVuom+htD+PXBOOUmjUvktzPMhrQCY3fg1ANNkfMebT4oEXOTHtbeLidcrAMXBo4B6Oe15
 Br1s+U75b+Za9A8V2dLyNAY5pxzl/E/0psYcMJ5jVcArQldx22J7qkhOEUrSBUD9hiKdJkYG0s
 0EA=
X-IronPort-AV: E=Sophos;i="5.81,268,1610434800"; d="scan'208";a="113597878"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Mar 2021 00:51:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 22 Mar 2021 00:51:35 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 22 Mar 2021 00:51:33 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <michael@walle.cc>, <p.yadav@ti.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v3 0/2] mtd: spi-nor: Cleanup patches
Date: Mon, 22 Mar 2021 09:51:29 +0200
Message-ID: <20210322075131.45093-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_075233_030587_D98D9DDC 
X-CRM114-Status: UNSURE (   6.12  )
X-CRM114-Notice: Please train this message.
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

Various cleanup patches done while reviewing contributions.

Tudor Ambarus (2):
  mtd: spi-nor: Move Software Write Protection logic out of the core
  mtd: spi-nor: swp: Improve code around spi_nor_check_lock_status_sr()

 drivers/mtd/spi-nor/Makefile |   2 +-
 drivers/mtd/spi-nor/core.c   | 406 +--------------------------------
 drivers/mtd/spi-nor/core.h   |   4 +
 drivers/mtd/spi-nor/swp.c    | 427 +++++++++++++++++++++++++++++++++++
 4 files changed, 435 insertions(+), 404 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/swp.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
