Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96876C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 10:44:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F1D21534
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 10:44:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uWRss/Xq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A+0o6fZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F1D21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1eZKHViJ1xQAn0IB8wK/g+zLtQZoYEExGVQfPFjwoaM=; b=uWRss/XqIhSHYnyAUbAakXNKeY
	QeZzhezbfQxG4vgVmAEHRQZ0GAO+p2HU/Ff0LkwYqvR5hIpolT7eun0fvltyGkcmm3Q02qTkOKFqM
	HVgM59vP/ICYo8IUSG1brfblSXE8FlwdupFUnP6QGKf4R4HjDw9tUjDuY/WQXgt2tn5+IHK4lKMMN
	xCcWdgL4y2M/a3N4T+PDWKhENmPF3D27Wk4PA5ZqWW5khecs1s+sRRVT0y7fpvTqu+AmqRvKY6ANI
	HUVBhASdBkp36dCcU3owEg1nc8Znz1aeut4h6d398cyaL+L6JH8vQZowx4gJhU6pWTSrlLc5LW2io
	Uma/8Xrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJDs1-0004bS-PB; Fri, 18 Sep 2020 10:44:01 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJDrz-0004aI-0h
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 10:43:59 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IAhqeX062485;
 Fri, 18 Sep 2020 05:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600425832;
 bh=11/iz4CVyn0YKQ9XqTyV3nLKzBsbouQ7wrl140Vpllk=;
 h=To:CC:From:Subject:Date;
 b=A+0o6fZrC3kWN783xQn2+Yug/sVinB8tOQJkVmYrcOWEuQoUkOctky+iaIAjJ7AO3
 6lOKfJeUWWQbFoCDfzr0pBx4RxDX9YXJYZHIQS/4oJ11B0JtuZsaNApxQcLFL4kZv5
 ZGUTZdk8O8fusoONpVfRcPPIBZSn0oHUTZlO0Uso=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IAhqff111077
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 05:43:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 05:43:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 05:43:51 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IAhmht012358;
 Fri, 18 Sep 2020 05:43:49 -0500
To: torvalds <torvalds@linux-foundation.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] mtd: Fixes for v5.9-rc6
Message-ID: <c6965ad6-7d32-7dd9-21f8-346cfa634147@ti.com>
Date: Fri, 18 Sep 2020 16:13:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_064359_188249_7C3F0AFF 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Linus,

Please pull the MTD changes for v5.9-rc6.

I am sending this on behalf of MTD maintainers group this time around.

Miquel/Richard, 

Could you please ACK the PR?

Regards
Vignesh

The following changes since commit 856deb866d16e29bd65952e0289066f6078af773:

  Linux 5.9-rc5 (2020-09-13 16:06:00 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.9-rc6

for you to fetch changes up to 1afc0c89f6a155c54c76d65ffcf72cd1232daf3a:

  Revert "mtd: spi-nor: Add capability to disable flash quad mode" (2020-09-14 20:58:27 +0530)

----------------------------------------------------------------
MTD/SPI NOR fixes:

Revert patches that caused non volatile Quad Enable bit to be cleared
for certain SPI NOR flashes during module remove or during shutdown, thus
breaking backward compatibility.

----------------------------------------------------------------
Yicong Yang (2):
      Revert "mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()"
      Revert "mtd: spi-nor: Add capability to disable flash quad mode"

 drivers/mtd/spi-nor/core.c | 57 ++++------
 drivers/mtd/spi-nor/core.h | 10 +-
 2 files changed, 24 insertions(+), 43 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
