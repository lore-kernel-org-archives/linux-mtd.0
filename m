Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4903C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:36:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF5A613D8
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF5A613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++5SEXgDVBolakb0sqz/MPKQhylFA9w+JzH6ci4tm1E=; b=M/HLRGnm81Z7E4
	aiLDxUjU/NY5YCToMLLPr4eI5ev5ItbOe9RiEhvE5ZYwNH0z9m4pbK5JhPMAZRNm1U4NgRjOQWqS/
	IvE9muB+Q6Ul8dLq2ADkJ4TaYHomF5WctmCGgcUqK7V0VJka9m4SStIRLT8wuU9PD8d8hzVBfFgdM
	nu7B/5ET6e0a717XkfT1+J02zaaIr4rJqw+p5ek4LmbeovpaY2c3BC0hXsYSbI7jJymKWXEoCwpfx
	pbF6OcXbQLvuuQjBpEe7vwlwu86VQy7ZBJShwMml/XSNHq71TsF0ZXwpReJpFKaa99rNDcUdJetDG
	3m8hXokQ69TPZXqhmg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llpxB-00CvlQ-S7; Wed, 26 May 2021 09:35:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpRk-00Ci4l-Lk
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:03:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 33A7BC0007;
 Wed, 26 May 2021 09:03:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 5/5] mtd: rawnand: arasan: Leverage additional GPIO CS
Date: Wed, 26 May 2021 11:03:20 +0200
Message-Id: <20210526090320.181032-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'33396174ce5bfcbfffcd8f5332d0ceab2589e520'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020324_885057_56A3708F 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, 2021-05-10 at 10:40:51 UTC, Miquel Raynal wrote:
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
> Reported-by: kernel test robot <lkp@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
