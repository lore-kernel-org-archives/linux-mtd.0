Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B5FC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:04:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1014820848
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AjtL2zHU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AH+uJvdu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1014820848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADjPmvLHKyujTKnIl+JPC0vI3JCoipCuZohEgqbTN8c=; b=AjtL2zHUywrFDA
	gWQXfCGSE95l0Tt1gNKO1Ia4MZX+y0qkinUHDqcZIuNC2BK9GDzQfOBdWR53CG8A5GQq0nGV7xGLt
	DRR4BxBr6P4B3glS1dvJ86wHFAo/21C6mJM9hCOXLLIKVNXYJFP3VUbuMGR7TISrXfOpB0PV281xs
	khGk5MVEEqbM5EB3wOuDRLGVpHqt1UqS1svTLOwFtlZ4O2VDBxRtu+UMRbHdS9LgK6aU83k1mMibm
	i7rkCmdzacbbPQqD4a8YWCxutgmOFr5uzTat/8oZd2rmW5x0JFP8R7glU+Y8QO7UqllzCLLvhPjRU
	pnKq6wCY/T64Oj+uJ2WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBJ1X-0004LK-Bb; Mon, 09 Mar 2020 14:04:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBJ1W-0004Kv-5y
 for linux-mtd@bombadil.infradead.org; Mon, 09 Mar 2020 14:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QEThg5syGzPd0Vo/PITyNViEPWITDXNBSqxfPgtlr2s=; b=AH+uJvduDBpDlGmcqejzJMVhFs
 mlMXragQbDieo/3O5cQVkMMT4cRd6awnNu/7DbTe/BtITaqJCUWQ49AclK8MsWwSE5r3wmeET7xx9
 /i9WGTuMAVKqjJ1nETQGGmKKjlhfmciQZVFVKy6SQ1Wcrt0sb2iWH3xkgWgZYj1oKOV/ecbNzvYfL
 qiJL314x4i7wsdAa6wNz0ela/I0llgB78HIpTUKXTbGGdkmkhOtUgPDi2htz+A89Pcitv/QbjrhaN
 EG7wt855du/jVVJ7RIl2irc/bQ/iykE7datj8Sv8JxhGahyVBVATCnJ2EHh0+LWUQ6nkjhRCFREm+
 wK/rdsIQ==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBJ1R-0003QV-Uq
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 14:04:48 +0000
X-Originating-IP: 90.89.41.158
Received: from localhost.localdomain
 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 129D94000D;
 Mon,  9 Mar 2020 14:03:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] MAINTAINERS: Add staging branch for HyperBus
Date: Mon,  9 Mar 2020 15:03:47 +0100
Message-Id: <20200309140347.22391-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227051212.15496-1-vigneshr@ti.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: c74326331b837a4df020e223d73e0385c09e76bd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_140446_123063_F9C5E318 
X-CRM114-Status: UNSURE (   5.70  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-02-27 at 05:12:12 UTC, Vignesh Raghavendra wrote:
> Update HyperBus entry with branch used to stage patches under
> mtd.git. Also, add mailing list and patchwork queue information.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
