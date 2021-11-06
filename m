Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EC8C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 07:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA89601FC
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 07:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEA89601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6CrFKgBCNtumMTy20ftSlK5w1TOiX+mChYPDpxX1Bg=; b=JlMIjOtBA6vXVn
	4XUUgkKe25eMzwtZu9hhmK0v8C72B7zMS1BTpkUpcc+vSYf1HCaz8zVMbUqjQOEHYDSTYLA890VCN
	CrHqlTN/dK0Hqe6Pga169uinssta8aGVxgJPqNtn6LVLuEqoFjYJecRJTJhJcEHdlW6gwW6Ezif1g
	fYpcPCFeERrFgGkod5qj7kf3eOx8/j29GIt0fMSWJywyQ3UkshwdsY760LgZ5NDV8fyoKNeYJvXlL
	VHtvOEwx0MbQkgiaRhsiy4+OknczJyTg4dapB9IWJyVeD2E4McyWI5/BHwev0B/KaswQXcY2SMPxl
	BERJE0fipIx1uAbvzOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjGYv-00Cm5G-EA; Sat, 06 Nov 2021 07:56:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjGYq-00Cm4A-9k
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 07:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636185384; x=1667721384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pKs/JTvbqAJPdXz+GBkilVJdmNiQD67bqrDbRYYV5tY=;
 b=DeA4QldnxRJUlDQjBXBpBbNRm76jrd5b0VEbNAHZ6fkIrEku7B6fy89f
 2j/KrWYzUheh66cTWjdEjb62SjgSEtDDRAUb0vZLahoW0djcfnzvpi0QC
 0s9+nC6Eev9STF7hECz8b+i6yevdXeFoB25RIiB53x5erhZfj+J3KpAgL
 oCXD4dmlTqPtYHXplLArgcnhNOCc1NvzoNyMd4HX+A0+lqbBqs0s1ST02
 TxVOjlyNlVCfQl49d6mfYXqbzacRiYQ7puUhBmnwVkU0tJ764HZbxdrXN
 Wvd9jg9h07ItgUqV/qsh5S9jr9uZt0E5MN7ID2O8PyafdoB2EN9WW16Ot Q==;
IronPort-SDR: xW1TKyB7d+p7Lw7cDZWlabqazY6c6SZxEISmVt+JqZVlmfGE6slDwGp1s56XFcGNg4R0+5P8yk
 XGkQRKfKw+t0Cte0ifzv15/5tF2IMUpzFDdEhxB8YDbwc7mxKPjMic6tI2peEFqHIRhmuhE4v6
 8lfBwcvrKvYC4ejf1gLlSDcJOzpvuepROGOWAmUnXqAuz8LXKyvIvcqx/Y8Mmbiu9ph2T9d+E6
 pD+RjH4MHrKGt0eP61K37VY31LlA4kRFfnGxvB5Gl3rys+oB/vJ1rR5NCTnTsyJovk6aFe+Zro
 55AkTHlQUEHk+b7mDG8NeCvA
X-IronPort-AV: E=Sophos;i="5.87,213,1631602800"; d="scan'208";a="75559099"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 00:56:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 00:56:20 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 00:56:18 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <Alexander.Stein@tq-group.com>, <michael@walle.cc>, <p.yadav@ti.com>,
 <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 0/2] mtd: spi-nor: Erase fixes
Date: Sat, 6 Nov 2021 09:56:14 +0200
Message-ID: <20211106075616.95401-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_005624_465093_AD51E931 
X-CRM114-Status: UNSURE (   4.43  )
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

Depends on:
https://lore.kernel.org/all/20211029172633.886453-19-tudor.ambarus@microchip.com/T/

Tudor Ambarus (2):
  mtd: spi-nor: Fix shift-out-of-bounds
  mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is set

 drivers/mtd/spi-nor/core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
