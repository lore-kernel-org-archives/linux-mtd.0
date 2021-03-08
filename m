Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113B8C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 07:00:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 552F760201
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 07:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 552F760201
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v4x0Vo6TvosHdlLYzSGSdnQ6hnggyLwxQIHjY/EwFeM=; b=SHphK8dWcNWt3ZmNfnqkSjsI1
	GUyci4HYBtmdYj3KPbmyagh0pl/VCWcVbbMJACr337MJrwPRMb+jsM+MNPKw4ZhxudSpsEQkdGRD1
	6AivTPlY4nxCtr8TXbBR6SuKSoalv8QKNA3HwtY8xvlT38r7obIVIpNr+G8U0luoJJ4AwKCXNrkDD
	KgxtWDcdVSPtuJx7ogbvgxAso3UbzoQ3oaFi0+GM8YYgavZ6cFQVNjUI6cxpyWMUJHn5P51hRT4KJ
	ME6IPHb+38OTotSGd4RaAO6Zajl9ysnKWUzaj9IkePo0ZrfEOE7Rx6Dx4PYOpKiiA/hbJEA56m1ob
	TH8u2aWGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9rV-00FbFZ-BI; Mon, 08 Mar 2021 06:59:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9dM-00FXOO-DH
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615185892; x=1646721892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1PWokqeLlK1wLdbrnNsyo72LALUZ8gy162Bk7d98kqE=;
 b=B5l7bG+VCDhEmJ9SClE5yCTky1A/Q3n2ubIHjp25ATBgAvq476lBvWAU
 aR0adEylCgCzO/z/CIp7vF8GubQjOhqIg+SBw+Lxlk3hl/l6KxqWFUGUu
 m1S/gx01nzZcAxPakxbbceVWTNi52knOFHkBQxm6BVz0lfO0ypOCgDZQt
 JKVOCHK29pR0G8bevRh7anGUP/5j1LGVLhGbOrfj/GwsSoJdKjFj6UYcC
 xzn6NxdpoZx2lyJ+byrRVArJ3UAgCsxIzfVrjtLVdy8rSzmr9xDDtJ1a6
 Zn21Ma22L9OiQlufOSdVqqFvUanUHFLLLI3Qkl8JAyqLjnqqdhquegW+c w==;
IronPort-SDR: DengQCPIAECU3j2WnDHB3JWU+eHFKML132SiCCEHA59Rtg784uuNi+74a2rZYl4vA49tjFkHEu
 KAOL8G4J7p8w+r/06FGwzsPomZ6cDToIebqJiELkmvEWafwMoanEAWM0FvjBrsr+aEx2HFJLQF
 npZ6JX0PSfu865S8vd2WtY6sw2R+hSC4I/5Si6D3n7Nphh2ZNua0m0oH4rx3OTRXRzgvC6r2Bk
 K8QMlmVQbEzjVtNZ25CJPqLHRklzSq8pHn+bLTxQOe9pBEyYngqYdxMUqGdhELJHswENCjSql7
 gLg=
X-IronPort-AV: E=Sophos;i="5.81,231,1610434800"; d="scan'208";a="112311694"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2021 23:44:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 7 Mar 2021 23:44:48 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 7 Mar 2021 23:44:46 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger
 <richard@nod.at>, Lee Jones <lee.jones@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: spi-nor: intel-spi: Move platform data header
 to x85 subfolder
Date: Mon, 8 Mar 2021 08:44:45 +0200
Message-ID: <161518567740.71282.5118491437409807533.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304140820.56692-1-andriy.shevchenko@linux.intel.com>
References: <20210304140820.56692-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_064453_902257_3BE2658D 
X-CRM114-Status: UNSURE (   6.34  )
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

On Thu, 4 Mar 2021 16:08:20 +0200, Andy Shevchenko wrote:
> In order to group x86 related platform data move intel-spi.h to x85 folder.
> 
> While at it, remove duplicate inclusion in C file.


s/x85/x86 in subject and commit description and applied to spi-nor/next. 
Thanks!

[1/1] mtd: spi-nor: intel-spi: Move platform data header to x85 subfolder
      https://git.kernel.org/mtd/c/ae2177cf318d

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
