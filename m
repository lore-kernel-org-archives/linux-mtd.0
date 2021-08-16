Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91869C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 583EC60F58
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 583EC60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdGhS8Q4QntF81yTEx4kYnW3VpaiY5LnoXdE+DHFstY=; b=ksdp2nF26oWnrf
	pkmPHgfOHnBFz/P7LQ0uwc1Ns3xOXQOd3KVnluiakm69c6r8AWKRWXSShxkBuRhp1B6r81Gb5Hp/4
	2z8Slml7LTJgkaH+9Nd1ClwgSExylgmebxxk7tGVWGjO93F2sO9Jh2wAuctl3ca8z44Pndv5rw3at
	ampEbI5wSDOb0lJDSW3M9k10czgSt4l+5oK34aZp3n6xknLO75VM+Dhqhcz83qn7Z7ouQHkwYG5gi
	rkDDHwG5Y6MkFE74pq1no5yxgZQY15s6BneoKtcqRIEJBhIlblUPKTUdNfsct3IGdagVku6F7rHb6
	/lDzbKi2MZjZmzAvu69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFdaT-00HFAI-OF; Mon, 16 Aug 2021 14:27:37 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFdZy-00HF5i-8Y
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 14:27:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 69B5F240007;
 Mon, 16 Aug 2021 14:27:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Young <sean@mess.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/5] mtd: rfd_ftl: add discard support
Date: Mon, 16 Aug 2021 16:27:04 +0200
Message-Id: <20210816142704.15036-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210807214538.14484-3-sean@mess.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a7fef5f3b448b45f62e8212cf8ef43bde8d20071'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_072706_475130_8FC3E724 
X-CRM114-Status: UNSURE (   9.57  )
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

On Sat, 2021-08-07 at 21:45:35 UTC, Sean Young wrote:
> I proposed this change 16 years ago before discard was a feature in
> the block layer: https://lwn.net/Articles/162776/
> 
> Now that the block layer has discard, we can finally merge this change.
> 
> Discard is also known as trim. By implementing discard, both fstrim and
> the discard filesystem option can be used.
> 
> Implementing discard in the ftl means that when files are removed, there
> is less data in the ftl mapping. This means less stuff to move around for
> erasing and also less erasing to do; this means improved wear levelling
> and improved performance.
> 
> Signed-off-by: Sean Young <sean@mess.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
