Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ECCC63777
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:07:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4DDF221EB
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VrJYPOTq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4DDF221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjn1et7LKqu4adxFMiiUFOb+ws4xoa4g3j+BshT0Yds=; b=VrJYPOTq9oAQT943uBhpaG00a
	+29RJ7easEteKfX7nqQyeN7AEoRkndHcRjwC/xj6lY7y54Fri/seqniBSi8jBh6yAJOI2CHDIyYVI
	tM3snRB7QY6DY8wCQ6bwzav92zPRhtgcZWl8MjspM5Ss7xWGojkVII0sTtqlR9gkGJWHkdeY8qjUD
	N+LtIWd/dD1U0Km2rqa8/ZeTT18weMWWUCNKZmRUuqYbRx3ehgudWQspWP3+FFjR4G5rtvTx63//X
	bImjzJYh9bC3oBd8Qk5GXDnzGCIMduyCh2m0XOlGqUEL9JQqXmQ1vuGexQQbQvA79LyP1opqe4q0S
	wTYOpG2gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfr8n-0001QB-QG; Thu, 19 Nov 2020 21:06:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfr8k-0001Oh-QH
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:06:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0DC09E0007;
 Thu, 19 Nov 2020 21:06:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: Change dependency between the NAND and ECC
 cores
Date: Thu, 19 Nov 2020 22:06:48 +0100
Message-Id: <20201119210648.24661-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123945.32592-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 1f887d017edc9d652a970aa7a75b0eb03e155ecf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160651_006326_E6E53E3B 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-13 at 12:39:45 UTC, Miquel Raynal wrote:
> The NAND ECC core is included in the generic NAND core when it is
> compiled in.
> 
> Different software ECC engines drivers will select the NAND ECC core
> and thus also have a dependency on the NAND core. Using a "depends on"
> between the two leads to possible cases (not real cases, but created
> by robots) where one is still unselected because of the "select does
> not verifies depends on" game:
> 
> WARNING: unmet direct dependencies detected for MTD_NAND_ECC
>   Depends on [n]: MTD [=m] && MTD_NAND_CORE [=n]
>   Selected by [m]:
>   - MTD_NAND_ECC_SW_HAMMING [=y] && MTD [=m]
>   - MTD_NAND_ECC_SW_BCH [=y] && MTD [=m]
> 
> Fix this by using a select instead.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
