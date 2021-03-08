Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3493FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:21:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71AE651B7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71AE651B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9QN1m62KERxXrFkmPGNPaPAAo2Iky3GjVb7t8zR5Iuk=; b=VNHU/qLyqjwHE38vzfBI73tJ6
	oARqVN1pau96DwOkh0qDww5oo+biUl04C2uCTv+hEHGhrg4IU0+PtXGGNd0i1o8EGsUIBILfq2Txi
	m65EYH/RLSvppDC0STq1zbTUXj1QjMH36wE+Vdxph4BHGrnMsaD9OLUQQjylAsrOJ08ClGgJdermB
	ec4poOrssKj+IifpJVHx5xoCK/ouWYMzHCXu1b9FZiTP9CKibi8JKV1IeBZ3WLDuNpXeEOhXFP35p
	3feRf9ncUgcUDG0AImUaAj1L6z4vJDMUou7iwBNT+8cszvw4OVHigSFmZnqQVWjaqWi6z9okVlejG
	yGhIeJZyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9Fs-00FScE-PH; Mon, 08 Mar 2021 06:20:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Fm-00FSab-FX
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615184430; x=1646720430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cNUFkLLEIoqMFqJYVsIH5x0g/HfTKJzj54C+4PKLThg=;
 b=ytKaUF/wU9WaLUJAKBEqLbXlfz81ApXWww1FEZCzZQd04OcEwkppNsow
 pdASxgWEhc4jns+1nHb0JLsWHL797SINN+ME4N5XxG+Byj+WoqFSZsuEz
 v/v9tmC/SUBabDWoeKghW6cuknTTcjUkkY5Z1Bc1o/wmU3DsFw+IuX04X
 Qc6TKk7QUb+cU/4gQWDbXUjIqYtPvZawTYtGprDhsdWVZCEJfYyb74EG0
 9HcNC58TVa+0i2vvY0AyVQjCJpA3TtkkaCC/uHmVIikce4f50oRAHG8vD
 2EVfnX2aiKgG3Ncc+zrLD393e1tbB0H1QGaAVAlxeap3cdAsnXABQAWOZ g==;
IronPort-SDR: aX6ADHPrVJgGoouxDLpihNnVrEy9CnJZ98dVe27lxuws4xFq/CU+TasJHDh3PcmY8F0e5g+Rei
 Zj6W8u5y70V26DGMrcM3mxNajvNOIrW2zgCbnoY/yDRnqT1RveoUuACy1wftxSWBGULJDRyx7w
 6Q1MabkGlTERjouHkBO2+6Y4ZjsykEm3HqJ8zIMwmt+jBZ9EtIK+KKbo84qaTUhHWYK/ekhAlC
 N9tErH0dHFo0rlmFJfLgS9GCPJopC702GouQoV40tHAQN1QTBdijGZHPJI1yE1nut6VT6t5BvS
 aq0=
X-IronPort-AV: E=Sophos;i="5.81,231,1610434800"; d="scan'208";a="46622120"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2021 23:20:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 7 Mar 2021 23:20:28 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 7 Mar 2021 23:20:26 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, "Michael
 Walle" <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: use is_power_of_2()
Date: Mon, 8 Mar 2021 08:20:24 +0200
Message-ID: <161518441282.69910.7961092195039294624.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305234552.19204-1-michael@walle.cc>
References: <20210305234552.19204-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062031_094276_7BFC573E 
X-CRM114-Status: UNSURE (   6.64  )
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

On Sat, 6 Mar 2021 00:45:52 +0100, Michael Walle wrote:
> There is already a function to check if an integer is a power of 2. Use
> it.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: use is_power_of_2()
      https://git.kernel.org/mtd/c/04fc298c7d08

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
