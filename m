Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D01C4363D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 07:16:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00786206DD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 07:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GqB+wZdC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00786206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5PN06fiAMhDzCnHDBi6Jaf+PnERavSdDe+m42EMRxoI=; b=GqB+wZdCPzHm/tPL2vxTmQ2Yn
	+sBhQK7mdqmnkLbkDZtG3Q0d3dylH2Ai2g4VRr8mTpF4EJnouR7j0GqihmMIaZqB8w0H3M3H0D2ww
	ZfqRHKdcBZu443kSBJM24jIhe2jo4W17UiIENIvJXdGnEIV9hkwCTQ0rpEUmSaO/B8YDTWGHUE64p
	JaGeFciwovDWwrWd15iWoSXUPf95jG4+/NIyCgb1WFXwYeHzA8uJ6fGR1ZhMYQWQdpOp+Lfn8Nl0z
	Wk4pq8dcSeCyhEcioVCS2cXRBZVIuiVgY0IMz4EHOZyBJE4X/+nxXAweXbpjj0hgsHE9/yEd2lyiX
	egTOgyCBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOFIB-0006aR-UV; Fri, 02 Oct 2020 07:15:47 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOFI9-0006ZU-FU
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 07:15:46 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 26DBC24000B;
 Fri,  2 Oct 2020 07:15:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: physmap: Add Baikal-T1 physically mapped ROM
 support
Date: Fri,  2 Oct 2020 09:15:42 +0200
Message-Id: <20201002071542.26477-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920111445.21816-1-Sergey.Semin@baikalelectronics.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b3e79e7682e075326df8041b826b03453acacd0a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_031545_697174_56B30154 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-mtd@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-mips@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 2020-09-20 at 11:14:44 UTC, Serge Semin wrote:
> Baikal-T1 Boot Controller provides an access to a RO storages, which are
> physically mapped into the SoC MMIO space. In particularly there are
> Internal ROM embedded into the SoC with a pre-installed firmware,
> externally attached SPI flash (also accessed in the read-only mode) and a
> memory region, which mirrors one of them in accordance with the currently
> enabled system boot mode (also called Boot ROM).
> 
> This commit adds the Internal ROM support to the physmap driver of the MTD
> kernel subsystem. The driver will create the Internal ROM MTD as long as
> it is defined in the system dts file. The physically mapped SPI flash
> region will be used to implement the SPI-mem interface. The mirroring
> memory region won't be accessible directly since it's redundant due to
> both bootable regions being exposed anyway.
> 
> Note we had to create a dedicated code for the ROMs since read from the
> corresponding memory regions must be done via the dword-aligned addresses.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-mips@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
