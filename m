Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8719BC4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:04:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2987260F25
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2987260F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHyKKCfakU2XNkIqzZ8PvIismAWWGitJsXcesDJsS7g=; b=2rZDYnLlpyPtwO
	85w0i+hDiIGHrVQQwemUpAVwS/NqG9vZROHY4QN5drbUPFRqOudXHKXpCegNzm4bRBq8qiVck7SMQ
	M3g4K4ulEr0i2L3vRh0mxWh7YhK1q/wJCe4luLOPiNFdQ3MZ80gGOE/pf6DmvzRpN04c+Bjg/scCX
	IMFsHVsvn4Mw+e2dIQ49kvqYo8X19nCRUh2qisJffYVVowwl8krwJfnJB+7F1YR/KTepyHlzM64Ni
	sIqEApG1Ob22JyW2t15kNv3n1UsmvCjGlVx9p3MMFjUqO+lNUazS5Udon1LFiXqlTNiAfo4ueO4x8
	805CG3sKeATFwOs2/usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC64K-00DQ0a-Vs; Fri, 06 Aug 2021 20:03:49 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC63f-00DPfC-1c
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 20:03:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E8AC7100007;
 Fri,  6 Aug 2021 20:03:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Molokov <vladimir@molokov.se>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: omap: Fix kernel doc warning on 'calcuate'
 typo
Date: Fri,  6 Aug 2021 22:03:04 +0200
Message-Id: <20210806200304.393591-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210801205909.7102-1-vladimir@molokov.se>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'014665ffd7e84bb2f18912f7285190090e218e4c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_130307_266101_07C251ED 
X-CRM114-Status: UNSURE (   5.21  )
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

On Sun, 2021-08-01 at 20:59:09 UTC, Vladimir Molokov wrote:
> Fix a trivial typo which is reported after enabling W=1 level of warnings:
> 
>   drivers/mtd/nand/raw/omap2.c:927: warning: expecting prototype
>     for omap_calcuate_ecc(). Prototype was for omap_calculate_ecc() instead
> 
> Signed-off-by: Vladimir Molokov <vladimir@molokov.se>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
