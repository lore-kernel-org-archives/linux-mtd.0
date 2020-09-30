Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E889C4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 239F82053B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IiCX1U8o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k25fl521"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 239F82053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BPjIqfXEYfgJDWu7gAAtY6f/jlfFxTLJ4oFB5AP8gPo=; b=IiCX1U8ocfm0TKgYEdhb/8FWN
	dztGgip4Eb4Ly/EYIoLYgbqySSvqWgwOcCuzilPIXMtCGy2f1aP4gOZc1cbo3a8/REXESf9Tu6Rz1
	JylDhiEKktj0pEVQzvEUtSd9MO8SVyLOJFLuS72YMY78JrDL/3UkwuxLo04gkUtkb+ErN9sD4htmR
	9BGOIQ6I816N3uQsJ2/b5UARSpFBHbfuVVmJTTiH4H1pVegvYR1CudQ69yBnlnv5i/8HQb0Jml6Q+
	6qYHGZaq4VrrXx8ItBdZ5O2SGuKUmbSW5Q7XU8po2DL4zboNK54SCAm5pExTVEH1fZij3Oa3AmTPB
	MxBmxNSRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXZq-0004tx-E6; Wed, 30 Sep 2020 08:35:06 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXZn-0004sn-7u
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:35:04 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Z0VY019740;
 Wed, 30 Sep 2020 03:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601454900;
 bh=tle//ZCum/9MjNVp/V/hLomg0tW0QjJz5J54k982huc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=k25fl521azOnIVDK/cNlQFI34Q1UFk4zg3OKIvj4AMGMNrk8TXJgeRymud0We2qIT
 0FlZreKb9VDgOuPOaG4BNAhb0F8LTM+3N9w0+m83rWdbo1gfbLTWK1aHRIQXhzKN0x
 KsMJet2NOydAYJgGJYYZntNdFOf8tDDG87EkWo2Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U8Z0WA114407
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 03:35:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 03:35:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 03:35:00 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Yo8l098804;
 Wed, 30 Sep 2020 03:34:58 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Alder
 Lake-S SPI serial flash
Date: Wed, 30 Sep 2020 14:04:44 +0530
Message-ID: <160145480408.16293.10901415169772791319.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925095109.51148-1-mika.westerberg@linux.intel.com>
References: <20200925095109.51148-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043503_452678_79B2A5D3 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 25 Sep 2020 12:51:09 +0300, Mika Westerberg wrote:
> Intel Alder Lake-S has the same SPI serial flash controller as Cannon
> Lake. Add Alder Lake-S PCI ID to the driver list of supported devices.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-S SPI serial flash
      https://git.kernel.org/mtd/c/3a9dcb2586

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
