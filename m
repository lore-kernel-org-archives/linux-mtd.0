Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03735C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:13:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D53B64EFD
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D53B64EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d/dOanNBB0UgAhxynFmvOzFbB3xAxtieK3Do/z83/us=; b=Pr3T3vMX1Ar2Gl98eOAMUdQs2
	RuP4xTDeP/sMTyg05DUuTBlUbo83dNcsMP/2FPxPogxuRXSQAscoD20yrJWRLhO8+vXkXVPwG04DF
	5szwB+4DFyHX5FUqhZHs4qnXSdJk/2yMX2Vv3mTz4oxHunoSdW5l0KkQh0QLrLdDCIobNB1gGLaxX
	d8didGAO7WNRI6tdww2nXUBCHsKTonkKeO71dZe4I9joHSktpzNo0NA2Ab7a8wqZmtYHobQn8tr9J
	/xlq+JuG74D4jhJe4txbTokTK8C1gv6NFhGx8nM7gKDkkwHqphNndx5kIp9othtcopcW4Hfz5yAkU
	arRb9D7bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHU6o-005YH6-SN; Wed, 03 Mar 2021 16:12:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSp2-005DnO-Tb
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=funD4ewfJVq+GeDPwmdAqTejlquJh68wAEAM4mM4jrs=; b=i60Yq1Vu18Qz7DE4FDn8FBnfEA
 VOZGQMGmmIY+wMe6Gutu1U4n+bSpieIzLeLoQshjcpiIPBDcAnsDx6GAMl+Jhu3PfAw0OjLGcHJy7
 DgVynSiB72b56Gm3ZkkjQgtr7RiVSsHK7Z2eDbn12kzeMq/sgz0YQi2LCysZK044Pvw0RvKBVF4aa
 vRwSlcfPUUn/mHppw6cRRswfLQqLWi8aHaO2a8io6BM4RFElAwsI6vmhmEBpKRBLZnVgK5Zy5BfDS
 A4C9uxy9DM0MQvAEKC7E4uU7MTmsqsX9NwGJ86wN7TrjxbMniZ29Z74OcKZpAJbfbFAaUHI94+/UW
 +0CpLGcQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xZ-00HSEl-PB
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:26 +0000
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9F257200002;
 Tue,  2 Mar 2021 16:32:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] mtd: nand: fix error handling in nand_prog_page_op()
 #2
Date: Tue,  2 Mar 2021 17:32:56 +0100
Message-Id: <20210302163256.23517-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205142725.13225-2-s.hauer@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 19877b2c5de809e6f553e158c263b7a8bb65222d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163326_384420_46B98E26 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, 2021-02-05 at 14:27:25 UTC, Sascha Hauer wrote:
> On success nand_exec_prog_page_op() returns the NAND status byte, but on
> failure it returns a negative error code. nand_prog_page_op() interprets
> the return value as NAND status byte without error checking.  This means
> a failure in nand_exec_prog_page_op() can go through unnoticed.
> 
> The straight forward fix would be to add the missing error checking. To
> clean the code a bit we can move the nand status check to
> nand_prog_page_op().  This way we can get rid of the overloaded return
> value from nand_exec_prog_page_op() and return a plain error code which
> is less error prone.
> 
> nand_exec_prog_page_op() is only called from one other place and in this
> call the 'prog' parameter is false in which case the nand status check
> is skipped, so it's correct to not add the NAND status check there.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
