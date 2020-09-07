Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630E8C433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:26:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E7E120757
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L23EgEVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E7E120757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYGPuPDjk0EP68lAFDLjDk6cf3HO6cJuooeJTyzTB7g=; b=L23EgEVjrY6PKG6UsLPfJg3410
	pqJH6agiZwMa9bAK9L8jF/Puk0cXvxHoAWerHPVUA/p5uvCr3KI70WXKg0Vh8FIpCxWiXd1/uxQuE
	JwyLakd8bc1+65bx0WdHIDdxLfrE5mYrsGJERXATPO0SESHVIoOl0RmUZvIBZTAvDmwM85+Pn3Gvq
	rqi0FHsosT0j/9iPzI6NMNtqKz9eQovJDH0IltywAF9yNtN+VUPVR/LpG3DwOPrXd/uV42Oy3B9WS
	TS0jdY8rgkcdgRst+ZQjpogiYGG6pSSaHEPVLwzAR8dcr47kJrkC7FR7a5RebDc4CqhhI0J7h5wGL
	jR1+tlHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBXF-0004W8-A3; Mon, 07 Sep 2020 07:25:53 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBVv-0003hN-Pj
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:24:32 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C500B100009;
 Mon,  7 Sep 2020 07:24:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v13 08/20] mtd: nand: Introduce the ECC engine framework
Date: Mon,  7 Sep 2020 09:24:28 +0200
Message-Id: <20200907072428.5102-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827085208.16276-9-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a8c7ffdb5fdde3a57c0b654f66f4d81325abe69f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_032431_964121_BDF5B1C0 
X-CRM114-Status: GOOD (  12.60  )
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

On Thu, 2020-08-27 at 08:51:56 UTC, Miquel Raynal wrote:
> Create a generic ECC engine framework. This is a base to instantiate ECC
> engine objects.
> 
> If we really want to be generic, bindings must evolve, so here is the
> new logic. The following three properties are mutually exclusive:
> - The nand-no-ecc-engine boolean property is set and there is no
>   ECC engine to retrieve.
> - The nand-use-soft-ecc-engine boolean property is set and the core
>   will force using the use of software correction.
> - There is a nand-ecc-engine property pointing at a node which will
>   act as ECC engine.
> 
> It the later case, the property may reference:
> - The NAND chip node itself (for the on-die ECC case).
> - The parent node if the NAND controller embeds an ECC engine.
> - Any other node being an external ECC controller as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
