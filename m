Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB85C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 07:10:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE61E229C5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 07:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE61E229C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B964fvMbiQBGciYeEtuzs1NdKv8u97qtYorV7kMmpcE=; b=Pt4kiWg3Cqt9il4LaN/PrAmKc
	fpLdKwSSIyYnkqRNxrdXbkn4+UrRKvo7d5ZMBt5hqtwqAGHD/7ok/Zu6ji8kTu5KXGkJRbL+I/Wuy
	Wh5+TYf8pEvyKow0MQNNwQBo1zajg8L3PL7pkzxWKMwRrdK9aLtkEh1UVXUWyvxqnxVQR/dpahoKM
	BkMvOOKTke/f92KPuM2tjBt996AnXZVnOn2Bpj+gFwOQU72vzXMnMIGAsdW7jrfHsTYOsRvJgfEvQ
	J10iwlep3SlQ8A7Alr1oL/H3tYzkU0SfnOrPUIRULIdjdSK0OnDfqHdlQw0wIHTN7IEUC6hjbQgpS
	rxoRRKfYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3w0S-0004NS-Js; Mon, 25 Jan 2021 07:09:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3w0N-0004Kg-LP
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 07:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611558583; x=1643094583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGTNBme2leH6Kx0+XK+Wzo5EWAvRYgFdYUG+Ukw3kGY=;
 b=Z/N7S8iAPHnuZ+fp0Qxh+u4xFbKVo29eC4CUODVvLr0mPcSxi6cU11+F
 xvJSvwG4coryiyyJSAdnrK+u1UhWdT41FKDcSHwytDqi3mUXZ4JC/kVhu
 2oIMJyd5u6Vwped5lktaVeSWsP8PEHWmPsPegkVW4kLvynDLGql3ckjah
 K/5k5bhriDK8pt/uvFc7ZFBBmsuI+Rv7LuSXH0JJCkZrJeD8DovsiEZO8
 xGUi2p1mWY/+An7Ia4Wr1sblqhD+MscyIGmOsHPFxNK8A/TXi+bpHK8h6
 vPF7Idoa6TaBVxFo4E1/OiJb/tTkgrodIlO4xA1iWzRI93YOecXh1iE/h Q==;
IronPort-SDR: bFlK5wP8LtXOLjE9AHcrp7BD3EQVan3qERfpcJb6kNFxcxHterk4T59oMUBBu91VuF4jrAqnXy
 nfO/0C2OS8A3Yl8SOYi2J0RfMp69luXNRuMKMWuAcmKEKQawmKie8O0RJFl5ZEU4epK4SN+5LV
 Q+MxfcWVyAFD4Tqdwx6oIpUG+QXZaiSGCnXBx/5+I0wO1DSQ7ay4/ij+MNIAvjPY/vC4mE8Qjl
 2wT3VH7UbbBfG2hcMcwLftE0LGMe24i+0yvOVoG6rjkxgmX9KaeN8nosD3bQZocsT8dI913zsz
 dcU=
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="41592311"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jan 2021 00:09:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 25 Jan 2021 00:09:39 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 25 Jan 2021 00:09:37 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Alder
 Lake-P SPI serial flash
Date: Mon, 25 Jan 2021 09:09:32 +0200
Message-ID: <161155840484.1247075.18433896013148617568.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113101545.71579-1-mika.westerberg@linux.intel.com>
References: <20210113101545.71579-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_020943_823932_C8B000AC 
X-CRM114-Status: UNSURE (   6.99  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 13:15:45 +0300, Mika Westerberg wrote:
> Intel Alder Lake-P has the same SPI serial flash controller as Alder
> Lake-S. Add Alder Lake-P PCI ID to the driver list of supported devices.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-P SPI serial flash
      https://git.kernel.org/mtd/c/d5802468c358

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
