Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416E3C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:01:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E068C2078B
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nxmcS4Eu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E068C2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3oL1fQ/595eJeGjKshFmQFR+VwKy72wFq5DNnIvQ7HY=; b=nxmcS4Eu3HweoGC6TJYMtkrIv
	NZBYVo+p/2ox+1I0qTfs/avflFnJaS6Ti/eiuQLWAzFJn1zIYJDza7BtKJuGKazYKn2q0W8jgLSWq
	8oFU1kT5JpFmdBwZvCsIwQpZlJA7VfEdBCA1sQPggSbYdZg5WdQehfyVNAqZ788q9avK+9gduV5Td
	gq+4DNv1Undyi9u5cCoYriG3eBAT07BX94QyzvEHkEuwRpbNLvb8ftAo3ax39tf8IEXdnLWaAZhx8
	aWfv39LrMC4xSh1JeVxvRkfGaW9MzRLclexifslDlCQgXLhHIPuK2oRmcyY5Z13eeufYXh7Mg2Qag
	vLi9SQ0GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMudk-0002UF-7K; Mon, 28 Sep 2020 15:00:32 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMudd-0002RH-Uu
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 15:00:28 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5F7DEFF81A;
 Mon, 28 Sep 2020 15:00:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com
Subject: Re: [PATCH 1/3] mtd: rawnand: Fix wrongful fallthrough NAND_ECC_SOFT
Date: Mon, 28 Sep 2020 17:00:19 +0200
Message-Id: <20200928150019.9404-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200917075213.532161-2-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 86adb4473ce9bf59d2b069264f69322bd8bb5a5f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_110026_134278_F7FBA2FD 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Santiago Esteban <santiago.esteban@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-17 at 07:52:11 UTC, Tudor Ambarus wrote:
> In case of valid HW ECC, where the fallback to SW ECC is not needed,
> the mentioned commit breaks the "switch (ecc->placement)" statement,
> but then wrongly falls through the "case NAND_ECC_SOFT" of the
> parent "switch (ecc->mode)". This causes an -EINVAL in
> nand_set_ecc_soft_ops(), because for the valid HW ECC cases
> ecc->mode is set to NAND_ECC_HW, but the nand_set_ecc_soft_ops()
> expects a NAND_ECC_SOFT mode, thus -EINVAL.
> 
> Move the fallback to SW ECC after the setting of the ECC on host ops.
> With this, when a valid HW ECC is available, we break the
> "switch (ecc->mode)" statement, and when a fallback to SW ECC is
> needed, we fallthrough "case NAND_ECC_SOFT".
> 
> Fixes: d3f8ec8e979b ("mtd: rawnand: Separate the ECC engine type and the ECC byte placement")
> Reported-by: Santiago Esteban <santiago.esteban@microchip.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
