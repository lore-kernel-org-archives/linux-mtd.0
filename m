Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B279C636C9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C204861279
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C204861279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bq3boGuFYdEvKJ/40OJJfYifc98aw7MIZGGkQSjGICM=; b=uiPEerN+PRnkD4
	SzpLtsmSukNxE8Mg5s//Cle56zl+m/CarD+dn+i7ehkDX34M/YQXIyva94WYzaXU1090EVPSXkx5/
	ER5blYRNVIDv2InBCvy8v78VL40FxAJ1IqKwo6jzk5AWQNdLcBsA9G0CCTjcqjGGMUMPxhrbYGASC
	mkL+8kzzOyScmjfWK0B7JPxTxWcvbPkcd1N0is7caReJASO4wIDoccXLRE3Pyj12C7y4DJpfmXnNn
	Qdko3Za+zKnFodbs/0CWRu2O4GgSyk39bJdM+8DC4nfmRWEuKtgg6DFBVVhi0AS8U+fxMe3l/KRU5
	MnIe/Qu7eVVntFUGBaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4ACE-002YcY-Em; Thu, 15 Jul 2021 22:51:10 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ABa-002YMO-S7
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 22:50:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5B6C91BF208;
 Thu, 15 Jul 2021 22:50:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andreas Persson <andreasp56@outlook.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: fix crash when erasing/writing
 AMD cards
Date: Fri, 16 Jul 2021 00:50:26 +0200
Message-Id: <20210715225026.65922-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <DB6P189MB05830B3530B8087476C5CFE4C1159@DB6P189MB0583.EURP189.PROD.OUTLOOK.COM>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2394e628738933aa014093d93093030f6232946d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_155031_084044_0BC0450D 
X-CRM114-Status: UNSURE (   8.30  )
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

On Mon, 2021-07-12 at 07:54:52 UTC, Andreas Persson wrote:
> Erasing an AMD linear flash card (AM29F016D) crashes after the first
> sector has been erased. Likewise, writing to it crashes after two bytes
> have been written. The reason is a missing check for a null pointer -
> the cmdset_priv field is not set for this type of card.
> 
> Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
> Signed-off-by: Andreas Persson <andreasp56@outlook.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
