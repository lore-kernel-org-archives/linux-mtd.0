Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA32C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 19:06:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90DC4206E9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 19:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H8qbYh6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90DC4206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sZvEmqyf4B4wOh4y+f96QpTrnSEeVxsU6fL4jEK0zQ8=; b=H8qbYh6U1DYtO2+ISBrg1jG++
	KfkmxewwaRS8z6zRNxIi9eb8sRpEqXHmzGqbE3Sqm8filiY3kbpclCL62iSNwX1I5WCc8iSNh6sww
	6l/1zLVgyHnDbtFAo2H87Yn1/Nm25EA6e/uo8u67Yt72Fu0tJbHhS7WBQVQf4ybaixwRMlO6U5u3A
	Dli5MckMydZq5/nQCcIoPq/mZ3HquvMRg9HuGmTw1AYkob1WLSB2Ae87PBmlcd5lPRvptZ+EutSOo
	IJHO/5tyzsWQCtfm6R+Mcwqf1dyqGo8HLMFbbSUPxxNTy10P3+og925WNYAyArB5mJ4a1HcYFo0Sy
	LfWPnkAZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssu4-0000Sh-0L; Tue, 07 Jul 2020 19:05:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssu1-0000Ro-Od
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 19:05:14 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6F22E20006;
 Tue,  7 Jul 2020 19:05:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: xway: Fix build issue
Date: Tue,  7 Jul 2020 21:05:10 +0200
Message-Id: <20200707190510.11190-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626065511.16424-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 880bc529bae2257d05a767f7f5c24fd61a47b605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_150513_920434_310B62FE 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-26 at 06:55:11 UTC, Miquel Raynal wrote:
> This MIPS driver does not support COMPILE_TEST yet and failed to build
> under my radar.
> 
> Replace 'mtd' chich is not defined in the scope of xway_nand_remove()
> by nand_to_mtd(chip). The mistake has been added in the long series
> dropping nand_release().
> 
> Tested with a 7.3.0 MIPS GCC toolchain built with Buildroot.
> 
> Fixes: 9fdd78f7bcda ("mtd: rawnand: xway: Stop using nand_release()")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
