Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FF1C47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 15:44:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E9361028
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 15:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2E9361028
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jRRn+ZHT9w0Vitcpa3S6O/CbAfu6H/ArDcLdmhO+B0=; b=hdfxdi0TQybTK+
	GLyYYzjNOgapnhyIno8AiYpqpyihMMfiF+ttljyj51dsyANxskm0yAMbOMAN3Zg7MA1hx1qNIiody
	/YeMSrLs03qSlWvY09iRJDYxBTI4QpjHLbCWoLoULr9oLSgIJF0J7+NVEUl4ZyGZ4X87RjSx6nPPc
	NTWAE5xcD80ChqE/7mlQFDZQnzNaObRJmfffQfqQVXeDPjdaODRzkxBGBjdEUj3W17JwB8teS9ihX
	uf3Wz2esEPdOJ3h2xMK09nKfbmgfYpMbznUWQvtriNmtOQa7ffGEOe7Ct5zfu8u+iGqY0sdAVxGqX
	5R+icLHBVIC0pfYWtSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llvhI-00FT3v-SE; Wed, 26 May 2021 15:43:53 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llucM-00Evu5-EZ
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 14:34:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9138220013;
 Wed, 26 May 2021 14:34:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [RESEND v3 4/4] mtd: rawnand: arasan: Leverage additional GPIO CS
Date: Wed, 26 May 2021 16:34:39 +0200
Message-Id: <20210526143439.188041-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526093242.183847-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'acbd3d0945f9cca4622f45e477793c5922bd6605'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_073442_659308_DB4FD859 
X-CRM114-Status: GOOD (  11.55  )
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

On Wed, 2021-05-26 at 09:32:42 UTC, Miquel Raynal wrote:
> Make use of the cs-gpios DT property as well as the core helper to parse
> it so that the Arasan controller driver can now assert many more chips
> than natively.
> 
> The Arasan controller has an internal limitation: RB0 is tied to CS0 and
> RB1 is tied to CS1. Hence, it is possible to use external GPIOs as long
> as one or the other native CS is not used (or configured to be driven as
> a GPIO) and that all additional CS are physically wired on its
> corresponding RB line. Eg. CS0 is used as a native CS, CS1 is not used
> as native CS and may be used as a GPIO CS, CS2 is an additional GPIO
> CS. Then the target asserted by CS0 should also be wired to RB0, while
> the targets asserted by CS1 and CS2 should be wired to RB1.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
