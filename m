Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B17C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:02:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE8764EEC
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE8764EEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wCllLGnrOTdfXzacrPPsurM8EPjPxGvuwvTZDL/MQ3s=; b=DYTVauKaaq/5ngq1H+2SEWApa
	pu04FDtvuGogseDT9ahe7lH7RKd+6DjTpymY8wr2ZYKvyMVDce/fkTqMmRFFdf0vS78ZhdpIwnDpe
	YzrTX2BBqrQiWeWJZYUmvuUT3KDzZiexVWkp0XgqZGFsvFzwTMtjopDHQRr2JLklUGQXsxbBRanD9
	z62NEeiTyfVKMhHdVdi0L7Whi/X6TkKgLdO3bCe8m6zo+JlmL8KUIuFlUklajJnGhHTS5IotnoCxf
	YRlj68ePde8ey4vhe3zhzwJVQcPZsNikt0ECrFJC//rCvcoOtbwuYeNSAAb5MmKFpPaNyRxhgsiIC
	OPSYe6SrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWl0-0067wt-OR; Wed, 03 Mar 2021 19:02:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT2F-005Hew-BO
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=msLY/QM4avPQmb66U+rH+1AH9rCFTPPz6pW042FWsDg=; b=ffHzeMT3pIc8bmvAa137t6yAW6
 yS4t99IT95/DW8az6qtKFr/dGBOFWQeKIkyVraa3Nmfp5OSiCRaSPT6kJc2PhO90AcIyZdjXZomtu
 zOTUaa3n9y8Kd4CR0MagzRTP65vwBkdmIh7TWxnnIzSwUq3CMac6fWqNufq5Asdv6fmoCKJZPHIj8
 GGGnpFvsnWYWa6MXBrW77Y73dpcXmYGyBnTCPXxnD7V0uupFKrrUyH+EKnrFIrJTYvdJ2B5jRY1Kt
 4+okgWZnfCyBjDB+LG3A7XxW/6XdSRWBSRaNytKpy64q7EKas8DUfTMTueHuDHmAnylxTaGXpEmMQ
 xGM5C0Ug==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8c9-00HWJN-CI
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:15:20 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 197F8C0009;
 Tue,  2 Mar 2021 17:14:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] mtd: physmap: physmap-bt1-rom: Fix unintentional stack
 access
Date: Tue,  2 Mar 2021 18:14:50 +0100
Message-Id: <20210302171450.1871-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210212104022.GA242669@embeddedor>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 7b3e9c56e6be29e387c47e94c802736d01df1e9b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171520_809015_505D3540 
X-CRM114-Status: UNSURE (   7.30  )
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

On Fri, 2021-02-12 at 10:40:22 UTC, "Gustavo A. R. Silva" wrote:
> Cast &data to (char *) in order to avoid unintentionally accessing
> the stack.
> 
> Notice that data is of type u32, so any increment to &data
> will be in the order of 4-byte chunks, and this piece of code
> is actually intended to be a byte offset.
> 
> Fixes: b3e79e7682e0 ("mtd: physmap: Add Baikal-T1 physically mapped ROM support")
> Addresses-Coverity-ID: 1497765 ("Out-of-bounds access")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Acked-by: Serge Semin <fancer.lancer@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
