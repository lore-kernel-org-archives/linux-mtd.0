Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FFBC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 12:49:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D8320771
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 12:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D8320771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NB8rJUbfhnZOmvi1wgccwoAdFGiW96boj/4c8hAXhxI=; b=tb8SnigX9bjWeOGf/uvOQqP9g
	BEIwbN1WjiEpjIG6stLlfGX1cbbkYBm7yUBCkQiaSjUQld69yuRq+YfUYIMfw+zekD+lDEhAsBu9/
	+b+X62ABMMbfImdz6I1cVQ4GVGKfpiaDvEY19Lr1UrQlO/lv8YOW48D44uYS8sKqNNbmor1hq8KMy
	NDrJ6asHjdfdvak5O49XWUSoY+bOHNUJhazJcnb5yoJCDxQawiY9uAmDmao5d5QvdCpiGnHCjxyM6
	qUqIgQmZcfKTGmrf2crrtU+YxN69tKC1s7acxIUZO+GFMhoyqQulLGXvezVjCiV2GImAqmmu493j0
	JKTZe0Kfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4kFN-0002E8-2y; Wed, 27 Jan 2021 12:48:33 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4kFK-0002Cj-Lv
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 12:48:31 +0000
Received: from localhost.localdomain
 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id CB80A200007;
 Wed, 27 Jan 2021 12:48:22 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 vadivel.muruganx.ramuthevar@linux.intel.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH] mtd: rawnand: Fix an error handling path in
 'ebu_dma_start()'
Date: Wed, 27 Jan 2021 13:48:22 +0100
Message-Id: <20210127124822.13987-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 65e4cbbd7cd15aef78e332a67bc748674b203570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_074830_872557_313FB329 
X-CRM114-Status: UNSURE (   9.76  )
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
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 2021-01-24 at 07:39:55 UTC, Christophe JAILLET wrote:
> If 'dmaengine_prep_slave_single()' fails, we must undo a previous
> 'dma_map_single()' call, as already done in all the other error handling
> paths of this function.
> 
> Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
