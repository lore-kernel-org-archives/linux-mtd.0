Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0408C4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900522053B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sE7sDML7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XwXLIQPN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900522053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=USDWrBsOeRFRSVknQGP+DYo6qD2AolYqnvGDUGb+Jqw=; b=sE7sDML7q8APnQEtHVZH8E+GL
	Bw92EwKsEb4vFnfoYrYZbkTzMyL/eGtm7gHyJOKAMU6TFpQA3Aiag4oB7zt/TMICRvY0nvk69l1hr
	oknh3VBT/48/NY1W0/YyXPXgfgCDe85EmhGmDEZBWlPGiGk2niOYu1Avdoc3CPzo5rXfk4EOui4zP
	7CVWuT80jjZxSWQi34jx6uwfvEZG0VPKjzKDzHlnhuou5ipaFsW1DdS09+Pyx3hvysIxTulFxf8Zo
	7yy1bGA6dKGARzCm+wVi9Cc5E4WmAfkhQJTx3fRM6Axe5J+/WVaUU7nIjWkPWT9O3LnY2bUKHMLqU
	JhZQAqCIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXZt-0004va-RJ; Wed, 30 Sep 2020 08:35:09 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXZq-0004u1-S8
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:35:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Z3Rx052743;
 Wed, 30 Sep 2020 03:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601454903;
 bh=z7DTfVdRp6TQ9HpNMgRK+uU9T+07dBPntD5IK2iAKxs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=XwXLIQPNz4AgcOXkmw/p3sqEjIUc9vM39rxzeegbrPnDUqTn7CuldoVgE+/K+K4he
 F91MDszHryB+Wz23C7HGKwF9Ii7IwbOorfDoNYMqTj3eCvWFs5ezV9oG6JE2VWDktp
 qnFqWuXYyBj7Ijj6vxqQlo/609rkNpqSRKaGOkqY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Z32c059092;
 Wed, 30 Sep 2020 03:35:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 03:35:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 03:35:03 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Yo8m098804;
 Wed, 30 Sep 2020 03:35:00 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Robert Marko <robert.marko@sartura.hr>, <linux-kernel@vger.kernel.org>,
 <miquel.raynal@bootlin.com>, <tudor.ambarus@microchip.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add SECT_4K to mx25l12805d
Date: Wed, 30 Sep 2020 14:04:45 +0530
Message-ID: <160145480408.16293.13001875273291191478.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915100623.708736-1-robert.marko@sartura.hr>
References: <20200915100623.708736-1-robert.marko@sartura.hr>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043507_036623_82C94183 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: Luka Perkov <luka.perkov@sartura.hr>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 12:06:23 +0200, Robert Marko wrote:
> According to the mx25l12805d datasheet it supports using 4K or 64K sectors.
> So lets add the SECT_4K to enable 4K sector usage.
> 
> Datasheet: https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: macronix: Add SECT_4K to mx25l12805d
      https://git.kernel.org/mtd/c/02892d4053

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
