Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A34C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:56:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2AB761492
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2AB761492
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/6zR2T+62KpPi5tHTov2OyGk0l+VWppgo34Fk6KZ3E4=; b=Ccr7Y33Busr/8goVL8oUNFbxl
	YAabYDdJ8KhgA1xpGk7dajUPI9S032lVjZsLI56yMQ/ZYU9vas2qdsl8KvbdmJIlEJrkn8GgOTPfB
	KyzbLIywn2ukXnrJM9c3w6aeWm0fPpQl4GOXWl56FbFG5Gfwh7wN/k29mxpTToS7rqpyq59BJmgBT
	Sn8TKbAZciN6KbETKDM2ZwYODGMOccmFO2k3vIqujUKeWBH1SfjpIL8MBTgc0/ZBEz/N1XrUk1a7D
	qSBxCwRMT2AegRDtv8Qi75BQXzPMjrqtE4bcx56eI4LOHEBwkw9Zf1nwcaO1O1R967S2zUAhQRwAj
	DHE2BBoFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Zs-00E15G-Kn; Mon, 10 May 2021 10:55:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OB-00Dyzn-SO
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=N+AbAkVfvYiMlvYw4xXzMY3phWKs26aHq5EaiITZSOc=; b=PkyA2PtA8Nzi/SjQ30Mih86KX2
 +MNo7ZL6mOwSOMh2bvaHh+ovfjw6rUh1shl2frvf5kAW/pgzqsYMFHBZBMgAbLNsZx/XFo5G+6Gth
 Fq2OUwwrFfi8+g9mU59ZRD0veuTjyYwcCGGALgkznsBs6syc/qsStGbEHu1i376PqmJYhs30s7xhI
 lUbFXH2pG+jkb7h0vQk5si4R2GKj8AN1cd0GyUEd9KyTpRgkagpZQfvM+BIQXRexg5plR9SztZW7u
 GkHzcaEejDMesASyZIl5svntLF4O1mHyi6IFw9a5pLVSxRrgxFKYngTGuJrULZfeJzsjin1ixPwWI
 M6Z2GDAQ==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3O8-008Yra-Pv
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:43:50 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C8E54240005;
 Mon, 10 May 2021 10:43:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Li <yang.lee@linux.alibaba.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: return -ENOMEM when kmalloc failed
Date: Mon, 10 May 2021 12:43:46 +0200
Message-Id: <20210510104346.10947-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1619429543-52234-1-git-send-email-yang.lee@linux.alibaba.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8fa7c3618e8abcca09e16a1c9048b8e78bcf803d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034348_995139_BAFEA434 
X-CRM114-Status: UNSURE (   7.58  )
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

On Mon, 2021-04-26 at 09:32:23 UTC, Yang Li wrote:
> The driver is using -1 instead of the -ENOMEM defined macro to
> specify that a buffer allocation failed. Using the correct error
> code is more intuitive
> 
> Smatch tool warning:
> drivers/mtd/inftlmount.c:333 check_free_sectors() warn: returning -1
> instead of -ENOMEM is sloppy
> drivers/mtd/nftlmount.c:272 check_free_sectors() warn: returning -1
> instead of -ENOMEM is sloppy
> 
> No functional change, just more standardized.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
