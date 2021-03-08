Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3402C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 10:20:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5826511F
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 10:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F5826511F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EZkl+/0f1nkEViAONlAlqH041gsOftuODYy3JGeudBM=; b=DI44c+MggpyQ2Nus+dYqcYlV5
	i3iFwNzqOTVtWqDzpLyRBNmREMCxx6djWJP/iAZAgmXAv2skXkjDNw4wcxENfaDDhvPDtisDrFBcJ
	vMnHtyloJhK07pkurv2uYg4cEwzWd6iRuIeyO5VqvMMUJjgflg5N4EtcTiJoY/LJpKmhFVgGMwtSb
	OAb+VsUs53Y4zDzZSQvXzNj49mzbmfZI/sDRce9ozEqGQvf/mBwyDGgWJ8w5d2ocWr5Bq1eWRGxDE
	YFITx+UQsFWf6I18h5P7WVlgtypcyTdXLkdLd3Y91ltz4mEZqpsmCAMJofHo1+OIpWGeILfb8DfnA
	dNKUbGRxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJCzi-00GPMZ-05; Mon, 08 Mar 2021 10:20:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCzZ-00GPJ6-AV
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 10:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615198801; x=1646734801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oNvNn28rb4tAfciWFYpPvBm0QNlVOJCkd5bG/58CA8k=;
 b=YREiNCOOY7j63AdXsGuJZK1+ZE+XLfiKWwGb5tZuoIbmiF/hSrKuTU5H
 VKnxHpCRm1BojYy022nXVTupBYriRoh0ZGk3pp87AaU+yJs+NpFDA5uy8
 8oocJSysU5dxZuP0fskSn6oUTxj6ivmbnEGRWA0vpxstllRecDOqcEHEp
 v9jKMesmIWfjj/G7gZ7VOLajHRl1zG4+pjDh2DVqHe2/HEmwK7dfGENCT
 gp8hdh2v4lU7c5D7xPv2+QU3i9SJL6+5O8x3TsGUoGh3KPIkGgPoP901j
 6ydtuRI7SA3FDIQucP91r6ScYk2eCQIp2cF6JYtSefASQv+TYJ2i8j9wI Q==;
IronPort-SDR: UKIU519NeH63QXkMYghzIo6LLwqy61gNc4pbEp1MgFwbqqiS0H8fWaJiAtYbSqSvUS2k9ggT+y
 9PsgNTsO3RD8yJe/EvsGyQLGvbLEiwFwMZYvzU5Urc0i5TkPiBbLINWn6orBYAWD4tAdGV6yTV
 M9Hp54ZrAZYFaysm/DZM7EFTyl/JW7XEmZ6G6aX5A+z0TjhcnrNaR7QXhl5nFq5L082er9lEIa
 kI/5tyqEL/QRI22XkPUNkFokUiAz+kna4dKBzBPf9xBRELATBpLrgEMVnYFp+0DoMWL64yMaIc
 hto=
X-IronPort-AV: E=Sophos;i="5.81,232,1610434800"; d="scan'208";a="112334912"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Mar 2021 03:19:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 8 Mar 2021 03:19:57 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 8 Mar 2021 03:19:55 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] MAINTAINERS: Add Michael and Pratyush as designated
 reviewers for SPI NOR
Date: Mon, 8 Mar 2021 12:19:53 +0200
Message-ID: <161519874943.83443.13785039225508399438.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308092333.80521-2-tudor.ambarus@microchip.com>
References: <20210308092333.80521-1-tudor.ambarus@microchip.com>
 <20210308092333.80521-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_102002_151620_29716210 
X-CRM114-Status: UNSURE (   5.97  )
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

On Mon, 8 Mar 2021 11:23:33 +0200, Tudor Ambarus wrote:
> It's already been the case for some time that Michael and Pratyush
> are reviewing SPI NOR patches. Update MAINTAINERS to reflect reality.

Applied to spi-nor/next, thanks!

[1/1] MAINTAINERS: Add Michael and Pratyush as designated reviewers for SPI NOR
      https://git.kernel.org/mtd/c/47f25032c0e3

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
