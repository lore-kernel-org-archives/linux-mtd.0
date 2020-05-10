Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2127CC38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:15:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA5F206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NnivhPHt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA5F206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPJ1DulxnWkxpwxDCYFDDB2IUyx7F2GaPldEcTE3POQ=; b=NnivhPHtAo1j3z
	NPJob93nt1+TR/oYsDzjPbOwCMElEGgsC1B7+n9kewqEa1A7ETi49c7ChG7vPGJ02iEm9U7thOKxf
	dMpEPdR5qq0NNut/w9yYQBW6S/WalbFlbHH9G5lNmSJ4WFvM/3S/WRw9tBkgrQA3vV6dgRMlLrYB+
	7Y7Ns9Sp2JPm1kfs3CYVCsBIJYvTD45YNvxeR6voKPD9uh6v6sRQ0WmaGYmvjvQ/dpjYRPJefuxT+
	4grvLPlKaeJHg2KJLBgM1U37OrGDxQ5xeImOXy+tpxt2Dkq5m/+59iPVOU0OcncMiE3aX9enXL3/L
	E4f+o74kBGG/B1SgR1Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsM7-0006Iv-2t; Sun, 10 May 2020 20:15:23 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsDr-0002IO-Th
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:06:53 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 82FB1200007;
 Sun, 10 May 2020 20:06:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>, computersforpeace@gmail.com,
 kdasu.kdev@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: Re: [PATCH -next] mtd: rawnand: brcmnand: Remove unused including
 <linux/version.h>
Date: Sun, 10 May 2020 22:06:48 +0200
Message-Id: <20200510200648.3206-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200417101129.35556-1-yuehaibing@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 4ba246d7a365b8049892d852ab00d8bd707dc0e6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_130652_151095_1477D349 
X-CRM114-Status: UNSURE (   4.93  )
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
Cc: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-04-17 at 10:11:29 UTC, YueHaibing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Reviewed-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
