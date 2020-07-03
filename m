Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F20DC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 10:54:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B1320737
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 10:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m4lU7Vv7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="uCFwg5u4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B1320737
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=caWmNXuzpcGKkN5dOcTtPyY257dJ7VKtNmZhoNvjc/Y=; b=m4lU7Vv7GJmB9YpT1LOSRbGJX
	WPSG70j2YmPu/Fkp/39RYaDKy/dliinNu0U8dZQOCa2v40y2MtlaQmTOmhe92R6mqxT1UhOwmFLIX
	tunztl+W/lcCnr7LuH5g/V6FtDSCuWCC3PeWC9I2t941Ex6Y5haKOuipb/vUK6yvTS01b74A72kyG
	dJycoSst+kq21Xyq9cOkBcile3qXThC/On6ht5/VWJQvXbhPC+tw+HekyCm88dlja/guKpHYtqhEK
	Za6GiRm72xCeRnD6sX145z73A/vzc054LjmBoHEuByxxntv9H2K7B+vr0q6ODrPMBwutZh6y7T4pc
	WnU3I1qNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrJJs-0001gQ-CP; Fri, 03 Jul 2020 10:53:24 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrJJn-0001f0-TB
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 10:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593773599; x=1625309599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W1fkCAJHahqWde9HjKMvjQEIsPzCIxPwk7BE7fAwW9w=;
 b=uCFwg5u465H9VB3tV3Vxolr/J4XQ1fkhxQdVezEAL3BOs62se1GngoeH
 QzI/RjyIVXZLLzj9oCj3Ycl6tHocc1GjPk7cldrhN89yQbwjAN8zZRxtk
 /ZLO1ScesmNQtQ89CIGExtRKGMOdsDvrf4cB9fEkoblSb1dsJAIT2+O6W
 r/wxUQ6YOyLvpaQGONKqOOmbPb5r+ExGtVI5lEAyxHCvRKwstS/fzXaHz
 rOVBunX58uAH9wrNn9SJZZ9bHmrmdUzPTXsRNFrKe8I1w2qaWmcf0kVbI
 704WzHdaNAsMfy3ODDy/nHWJAy75e7GzorA3w3pbxo6yllsnZGvIMmC42 A==;
IronPort-SDR: S9K8W58IuUR00ZYHbtq8tBOxScvw+HVqKFbmensstoW5mI9sU/nwLfXtXmqFrAnh046mIpN7rr
 SngmwHNwua7i922785Jeh8jEGv901z/Byqc0ocPeU1MvZrnbYnq1NpASvM+BvsPrNSyV2cB6bi
 nsZYSy7G/XzdJ5KHiwQeLH2GRH9e1rJd9vjg6kiMGNn1M6S/xXVZcd7gu8z57K3HyxxeeMX16Q
 1ARMhE74yartfwNRJzoLD/KolH2GZcFdyE3jdXdOpGxTVDxS6gfvGRR4pkPO4MUtfsuJrQEPuc
 PVE=
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="78683795"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Jul 2020 03:53:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 3 Jul 2020 03:53:17 -0700
Received: from atudor-ThinkPad-T470p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 3 Jul 2020 03:52:55 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] mtd: spi-nor: Add support for Macronix MX25R1635F
Date: Fri, 3 Jul 2020 13:53:07 +0300
Message-ID: <159377160989.144291.3836509687644676512.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702140523.6811-1-frieder.schrempf@kontron.de>
References: <20200702140523.6811-1-frieder.schrempf@kontron.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_065320_170013_8F2EC6CB 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jul 2020 14:05:50 +0000, Schrempf Frieder wrote:
> The MX25R1635F is the smaller sibling of the MX25R3235F that is
> already supported. It's only half the size (16Mb).
> 
> It was tested on the Kontron Electronics i.MX8MM SoM (N8010)
> using raw read and write from and to the mtd device and
> the 'flash_erase' command.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: macronix: Add support for MX25R1635F
      https://git.kernel.org/mtd/c/482dcb2a04

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
