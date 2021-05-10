Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DE1C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:12:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8366761075
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8366761075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i09kEdWhWkd/+lDMMf+2xz8yRE+fgUhSy2EeNmpqzsY=; b=XSQNCOL50kcTZPhFb3OrJHEtV
	UOq38WgIgTdtcgqzfuq07pr7i+TQc7a9lkFzMlRCnIaeDLBdiwfYuqQYLKY2huyo2+kuz3Pm7HjS7
	f4agi2ZGFJE1HRh5D4ot7qjb60IalF/7zxJU+pDBBUYfQQs+I6XVHEjnaUWSHO3T8zHlSGBI6jGo/
	nOW6FKQARKMPweeZq29a2PpFebgEjJ5pDumUFGRonZPuwozTRJJ4M82JY+96s0q1A3wCADN7UKB/e
	gab6zgpAzPGZeRlRnLGvIhMic0tQGc5iN18/EfUA/bUFp4htZVBaB7cmUEAg3N+DUZjjdn8oy1tII
	iT1jyNwfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1x5-00Dipx-V9; Mon, 10 May 2021 09:11:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1uw-00DiOC-SR
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7vwgP7rVQhP+x2N4+gT79eMa8ii4VQiey3hprVXi9ck=; b=mhah+DoYWg1WYzKlhAna2m96wm
 DHDU+rlyEMuuzMSheK6n2DW5brHt7B6ch45Uvl/lfwheWRdt5okOgcF1QW984EgcncGA1XTw68uC+
 /aMd2HnUha38hMIyXr44aZ2qzhAs4RcyrEzCaS62kwS4fTyzkNYugImZy/qNfun7eQbGFBxrzptW4
 wKl+nRItRSfG5zrpet9rxBvnnGzjveomxd74u5KQn4nvlvdBtt/MRC3yLZd/Uhy43LxyiUIDUSDTV
 y3S9EIvrDjCHIFgOYODqVmgPbkCRkfZY1JEntAYg3Negr0V3YsbE97sbE5TsfdbvGiRh9fAKR0dOu
 BhBiHD2A==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1uu-008RTH-8J
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:09:33 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E7C371BF222;
 Mon, 10 May 2021 09:09:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH v3 3/7] mtd: rawnand: lpc32xx_slc: Fix external use of SW
 Hamming ECC helper
Date: Mon, 10 May 2021 11:09:29 +0200
Message-Id: <20210510090929.3649-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bda69b5507f1bf45c55733d1cc5bdc396a96f11a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_020932_447263_87BFE0B8 
X-CRM114-Status: UNSURE (   8.60  )
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

On Tue, 2021-04-13 at 16:18:36 UTC, Miquel Raynal wrote:
> Since the Hamming software ECC engine has been updated to become a
> proper and independent ECC engine, it is now mandatory to either
> initialize the engine before using any one of his functions or use one
> of the bare helpers which only perform the calculations. As there is no
> actual need for a proper ECC initialization, let's just use the bare
> helper instead of the rawnand one.
> 
> Fixes: 90ccf0a0192f ("mtd: nand: ecc-hamming: Rename the exported functions")
> Cc: stable@vger.kernel.org
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Reported-by: Trevor Woerner <twoerner@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Trevor Woerner <twoerner@gmail.com>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
