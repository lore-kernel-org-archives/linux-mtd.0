Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272C0C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08C6613DC
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08C6613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUrzDmGfTM3zkhJ25vOV2uIQL3WvP0iV5mqDxH+YYuc=; b=0bFHpq5oyMGOTO
	vb5I1NuiISrjt5JXbx1DxZ4qvYSdI/b9EWA+89BFJOjd7YzTx0ZHaqD7rDPSNGFuejmWpkvwUaDt4
	DuUW2mDQs1CIfSB2WjQmSFO8rpPhxzILIhb0TD9A4WHO15gaFY9Hmh5gAMENHlp0QXl2Wvwx6B9gv
	wy68QRbhrvaMBMyFDy40pM07FX48+GwILl9E3nw9R8pcbkjdJUGQF5uyiGc9xOUDFdrFyRa72sYYN
	FxxY2QJv0ezliyX4/0xBrvCAC/M9L868XjzwG6Sn08dlqxtBOHS0oWaP5iLpI2TamnmWakUJ4pEiz
	om/rJg+XKTIfrs+azJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmH9Y-006qa9-NR; Thu, 27 May 2021 14:38:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGfn-006aOc-37; Thu, 27 May 2021 14:07:44 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RE7cZa025987;
 Thu, 27 May 2021 09:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622124458;
 bh=W5zWcl19RViZmcBzfL24u2KssqK+v83PJP5qli8LjAw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Y+yRUYzdKwXgrd5iYsIihVTHg1eNKIA5nlZoCwzY4/UNa6pme5kiMOQa37TB1lym0
 b6UKwr7/GJxzA3noxfmKcNR7LBoJhr2xUa2SNiXluPrI9oBQafA99jxNWUCuFTzA27
 4BqGV+uSrgHpc7iqs156uw5QiwjLzlhZbyzCh2fU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RE7cex070668
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 09:07:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 09:07:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 09:07:37 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RE7ImN079307;
 Thu, 27 May 2021 09:07:18 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-kernel@vger.kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Vladimir Zapolskiy <vz@mleia.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v1 1/1] mtd: spi-nor: Use SPI_MODE_X_MASK
Date: Thu, 27 May 2021 19:36:52 +0530
Message-ID: <162212417121.9400.7341872419015074097.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510141343.56805-1-andriy.shevchenko@linux.intel.com>
References: <20210510141343.56805-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_070743_248027_D5D677B3 
X-CRM114-Status: UNSURE (   5.41  )
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

On Mon, 10 May 2021 17:13:43 +0300, Andy Shevchenko wrote:
> Use SPI_MODE_X_MASK instead of open coded variant.

Updated $subject to:
 "mtd: spi-nor: nxp-spifi: Use SPI_MODE_X_MASK"

Applied to spi-nor/next, thanks!
[1/1] mtd: spi-nor: Use SPI_MODE_X_MASK
      https://git.kernel.org/mtd/c/5c26d52c9e

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
