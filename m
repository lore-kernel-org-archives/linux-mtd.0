Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375F4C43461
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:58:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5A092074B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ePTdVEcM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5A092074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xketagkSk86uMlAgAPEkQdJE9yvWCQHQHpMcaQSl2Uc=; b=ePTdVEcM+UeKV6nIhcmmfTYM6
	xUSkx7u1t2GK4xX4oDhh32pjtFNhvEPTy0phr8Yhn4+9mQeWDSrfwkZOEe+m8/kj8rM7KNoPkpwWR
	snsa3hDWvmNBkOrzV3PXXqd5U/eWGIPrZS8rNpzK4jJS178kecX+GI3uesKaBPyHfjn6S3CLsajNR
	2fwAzcpOxTOpLsUcrmFduucm3HwIrSSXbCylWS+dmq/RvElBaqeUQIwA0s1AxkGDUspVQEj1l+MVZ
	DXDjXItJe9DMAsdm0V2tx84Z74Oq9tlSd0XGvrQapYFtWrOYOD6kt+KLnN5KX8q7bap25UCriTu60
	laHmDGmEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGmN3-0004jY-CN; Fri, 11 Sep 2020 16:57:57 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGmLb-0003xV-0j
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 16:56:28 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A300D1C0005;
 Fri, 11 Sep 2020 16:56:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v2 3/3] mtd: spinand: gigadevice: Add support for
 GD5F4GQ4xC
Date: Fri, 11 Sep 2020 18:56:23 +0200
Message-Id: <20200911165623.29032-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820165121.3192-4-hauke@hauke-m.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f90ee29deff96e14f3c8b9de28035d62cfd437f5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_125627_204280_DE165A82 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: gch981213@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 wigyori@uid0.hu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-20 at 16:51:21 UTC, Hauke Mehrtens wrote:
> This adds support for the following 4GiB chips:
> GD5F4GQ4RCYIG 1.8V
> GD5F4GQ4UCYIG 3.3V
> 
> The datasheet can be found here:
> https://www.novitronic.ch/sixcms/media.php/2/DS-00173-GD5F4GQ4xCxIG-Rev1.574695.pdf
> 
> The GD5F4GQ4UCYIGT (3.3V) version is used on the Imagination
> Technologies Creator Ci40 (Marduk), the 1.8V version was not tested.
> 
> This device only works in single SPI mode and not in dual or quad mode
> for me on this board.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
