Return-Path: <SRS0=c1be=3T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AB8C35240
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2020 23:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E30220661
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2020 23:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlNlaeqk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ludw4atG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E30220661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ybbl+KnLCCwaY3Cxr4xIZpdD1eq3sKOYZRvZWvxIZ4M=; b=nlNlaeqk6bM8Jc
	iQedIen6hlBbdoBJPrqxsY3VaDN1Afmri3y2q816rrKRP2mg3Szkq1gTiDbk0vLXB6b8c0h2YPJno
	B3bCQ5/Eh8qy7zzNiEmbxKZJB4sHJZ/lAMqeJ+pMMDIUDPxCIPOXOQFGtr4jnxDQbPL25OHZScvv4
	9QEhyPauoo2uWuzozyt7rYWrjfzzyH6mLX/Y3HSL0SrmHDa2OeQ/gSmpTohgF8Ys7gpbnqaKJeR3l
	qnhxRoVnersUVb33HNXVHvf3HWAkPIaVedans5VfG6QpO6HL9bc6wV8/fDMhArzOmRP6kIOvPIz2R
	4FhwoBRYIJT74/Y2nLXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixJZo-0004GS-5b; Thu, 30 Jan 2020 23:50:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixJZl-0004FL-12
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2020 23:50:22 +0000
Subject: Re: [GIT PULL] UBIFS changes for 5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580428219;
 bh=sMz85wRSjNdz8O+qr3zYIEcgVX0eP8CXjq1rhP/j0cM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Ludw4atGSqzHGvuJvMsSGqSwiEhjaLYBob8aGDfy5/HUs47VuGVriIHglph/RTIvn
 kGQdtIO+Kj3Qslmckp92OrqqdpSZqNOtUKHmOncjCZz3LpM/GfgDs97CEbRvMf4g2u
 kYL/Oi4Z231YGJ0Zvda3B1XO3asrorvvYbBcMRFI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200130211433.46abdf90@xps13>
References: <20200130211433.46abdf90@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200130211433.46abdf90@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/upstream-5.6-rc1
X-PR-Tracked-Commit-Id: 5d3805af279c93ef49a64701f35254676d709622
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e84bcd61f686d65956c9f54872778bb215059519
Message-Id: <158042821932.30792.16094549720157204175.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jan 2020 23:50:19 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_155021_090553_52881E16 
X-CRM114-Status: UNSURE (   1.98  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 30 Jan 2020 21:14:33 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e84bcd61f686d65956c9f54872778bb215059519

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
