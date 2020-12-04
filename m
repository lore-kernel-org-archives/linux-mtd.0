Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD35AC4361A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 16:21:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B3A22838
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 16:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B3A22838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uP3dC1NjlZVHRFTcIJK4+XIuQ3rfZOu5kcaMngxt7Ks=; b=EXgRRQjn5FCxdYgZ3LcJURy83O
	YIjLWPtvL7irMbTxtyoSgrwKmpWP5Ulv9jxwSa2FXU0eS9o3oERqudOxlwH/kiAAOSLmWaqBBUvDx
	dbxl3PJyNbNGNiehSKSW0UmXziGm0QtP9XFfHsgeQBJhluAu/udZwbCCniowbkw32fuAOuxtqqtU5
	AcPgPsZ4pzMKYp58Kc1ITqehn+2koyWyU+01b4z4CnsQChwBkzC5W961QKou1gFZV4PxgXunnwLW9
	gJPgHc7FCGxL9FaEOeKTTqunBNb86XKjRdGkYGSGML76cTsSGBoz0gUaLJNmsADBNRddagFNLDQ1F
	YmSdcn4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klDpa-0004Wo-Mg; Fri, 04 Dec 2020 16:21:16 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klDpW-0004UX-N7
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2020 16:21:11 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8663E200007;
 Fri,  4 Dec 2020 16:21:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/9] mtd: rawnand: mpc5121: Do not force a particular
 software ECC engine
Date: Fri,  4 Dec 2020 17:21:06 +0100
Message-Id: <20201204162106.32744-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203190340.15522-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: c1bf977b1574c2ad91c04120f2028ac45aa519fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_112110_891791_A541766C 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 19:03:35 UTC, Miquel Raynal wrote:
> Originally, commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework
> user input parsing bits") kind of broke the logic around the
> initialization of several ECC engines.
> 
> Unfortunately, the fix (which indeed moved the ECC initialization to
> the right place) did not take into account the fact that a different
> ECC algorithm could have been used thanks to a DT property,
> considering the "Hamming" algorithm entry a configuration while it was
> only a default.
> 
> Add the necessary logic to be sure Hamming keeps being only a default.
> 
> Fixes: 6dd09f775b72 ("mtd: rawnand: mpc5121: Move the ECC initialization to ->attach_chip()")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
