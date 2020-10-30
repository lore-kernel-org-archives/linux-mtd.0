Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A535C00A89
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:34:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE22E2075E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eK/Mq3Ap"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE22E2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=czV5j+2iWwQXSYCVlUMo0ZlHv+Js6ybUKWpNDOV/x/s=; b=eK/Mq3AprwxJGtoAiGUFZPJ1t
	ULg1rqIKMotd+Pn5w9dQo0hdAasgrbIe0+uE0JYe6ilNPi9D3wcnm2Nk7iEM9sBUjE/j1tjYS2wCJ
	IXqRZ8oPQ4kCCT9oKkkDfNLIlkau0C+Y3T3gf2nS1mfP39LOXR7HT3obhkLQMyiaQvTf6tN3ICQ5a
	5nfjRv5XiK7AQ8YkTcRHAtvi3jCpZa6+ftCrBBDDBoA6UKcDgJMeF43hTU7SWZjDV2MUlf5wMtWbO
	G3Mc7k/ZIXcIWoAAh90O8jX9W8MxDeD0xp5/DvmO4EJIneoUmm4Y9BYuKPpT95qsVsWGiba6+oBIi
	6sLRdB7jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYH9-0007hi-M6; Fri, 30 Oct 2020 17:33:19 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYDd-0005yN-Oo
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:29:42 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9C9F7200005;
 Fri, 30 Oct 2020 17:29:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/20] mtd: rawnand: Get rid of chip->ecc.priv
Date: Fri, 30 Oct 2020 18:29:36 +0100
Message-Id: <20201030172936.30640-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-11-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: eb9ab9b7d04b2b3576e6458f9950ea899fb27b1a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_132941_957437_0C60D648 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, Chen-Yu Tsai <wens@csie.org>,
 ycllin@mxic.com.tw, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-29 at 23:01:14 UTC, Miquel Raynal wrote:
> nand_ecc_ctrl embeds a private pointer which only has a meaning in the
> sunxi driver. This structure will soon be deprecated, but as this
> field is actually not needed, let's just drop it.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
