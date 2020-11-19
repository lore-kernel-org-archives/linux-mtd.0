Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBEBC56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:06:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D788221F1
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RdrMREvb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D788221F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jy30D1vJ3CJ00eYgZV8qCwqcsQ8HS+TBfP1cI5quR70=; b=RdrMREvbWWBqZLmhAIk5aVMnd
	OghACKUggKN2nqiwj5ufBB2xPc8MLVnW56DpFyIifc648fOeqsyNiN6JEIoA7D1RObXjs1Hfo28LM
	MGmHAfv6PjBpTw212LwENf7jx15Hq3/1+xOemirdwl7mhe6IFLFwnRDgvx7/oxi3BMWCLy/xtV+BU
	tE8zgg47I6ttxcHKHUmTa+xaW//stk7IAJp1U5Q6fVb0X6uYYf2n2Kdyeid6ZA2coBo0wG4r9ehD7
	oSWlMjbd2x5eiFYTmYkL30HeF1f2MuqggXksGMxk1afGPCqBdGTR6l48aXUjJSweHPJJXyLsFPB2u
	4NhTO8y+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfr7c-00011a-4h; Thu, 19 Nov 2020 21:05:40 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfr7Z-00010x-3v
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:05:38 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 881FF1C0007;
 Thu, 19 Nov 2020 21:05:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Baskov Evgeiny <baskov@ispras.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd-ram: correctly free memory on error path in
 platram_probe()
Date: Thu, 19 Nov 2020 22:05:33 +0100
Message-Id: <20201119210533.23671-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113160537.899-1-baskov@ispras.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e0e1153084bc04b055787b0b8ef664024c6e2ced
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160537_741562_484EB877 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: ldv-project@linuxtesting.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-13 at 16:05:37 UTC, Baskov Evgeiny wrote:
> If an error happens in mtd_device_parse_register or mtd_device_register,
> memory allocated for struct platram_info is leaked.
> 
> Make platram_probe() call platram_remove() on all error paths
> after struct platram_info allocation to correctly free resources.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Baskov Evgeiny <baskov@ispras.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
