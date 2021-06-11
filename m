Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD65FC48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 12:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA1B2613CD
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 12:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA1B2613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYEkWTJJRSvcKcbl8gJztZ3YsZQcaFFcKIr9N+qwiqo=; b=Db495wf53v4rmy
	vCheP5QSb3QUw2njzjXtcMvoDL14c4QjaEk9HGmrXM2mavxhalEL7wr6yi1GphbcBOYYX5SXjJk8B
	eOsnfYDVd35742TaOJWXUtbQarKwOsbe9PYtK5UkBwIkE3mxaeJeZKSpIYX6d71nQ4mvWontJc8cw
	OCJhWVcq7pz+HZk+pTReb2KFyQFv8wFP0fDtgvHTgYFbm2dqX6lHsZQKZQEYdDi3NLDE7s1KbPr8C
	s12EeQtCuUvSgwjOJn4OR8l4zz9aO0GQFryAzma4NcESUL7ddZw+79vqMjZVWcu+nhi8csbIBfWty
	UMuLFVXqCdx7rKK9dwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrfre-005APB-Vg; Fri, 11 Jun 2021 12:02:19 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrfra-005AN6-HB
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 12:02:17 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15BC27jZ021024;
 Fri, 11 Jun 2021 07:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623412927;
 bh=TZUF3XLsndhZpDF4GtPele55YbhA1YqGf3N7KlqpBiY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FMmqBGD+iYFodfgb6EdgBGTPUMOPJoBVJJXIskWgquuII7msAMC5CZkne398+pNl/
 9h3Zfbss6UgZE3vMpXL6+a4EqWzbHRAXfoF0VB3vPIMt4t8Ujo7o1aTZu9yg+PkX/y
 Ab/wkVcolQCh+qFvLBo1r9dJ3EYhOfOab6L3qhZ0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15BC27m7037070
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Jun 2021 07:02:07 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 07:02:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 07:02:07 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15BC24Cb000422;
 Fri, 11 Jun 2021 07:02:05 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Alder
 Lake-M SPI serial flash
Date: Fri, 11 Jun 2021 17:32:02 +0530
Message-ID: <162341290303.9639.1652536816568796122.b4-ty@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210415101138.2174-1-mika.westerberg@linux.intel.com>
References: <20210415101138.2174-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_050214_687021_3C226381 
X-CRM114-Status: UNSURE (   6.59  )
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

On Thu, 15 Apr 2021 13:11:38 +0300, Mika Westerberg wrote:
> Intel Alder Lake-M has the same SPI serial flash controller as Alder
> Lake-S. Add Alder Lake-M PCI ID to the driver list of supported devices.

Applied to spi-nor/next, thanks!
[1/1] mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-M SPI serial flash
      https://git.kernel.org/mtd/c/854955ae96

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
