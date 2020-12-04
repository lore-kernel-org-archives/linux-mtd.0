Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204DFC433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 16:21:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF17229C4
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 16:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF17229C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ePyWIR2Twh+UoZYKTAeirQjBw8CY7cvdd32aQSb2kvE=; b=uPbh7YTT5yjnrG2xuKNxfRnnx
	uar82bAO0r4fdIArvFlNI2HGM2s6EtGlYoClszBmnI1otmakAFuQV9evzlsJJzStQbtpG6CsNogJw
	qWhW5/oihHTqDPv5ZooleB9aAJGP+R9Sr32GiR7Zp3WI7sUVf3sgEB//TwweGo8jXkI5PAtnWoOca
	6R9Oj1vH40xjxzSSlIdKlKOPDJ9Qz8+TFX4+jlS7gOe9KwwuGTsSpfEvZcCwD65RIXQTjkxhTZYAN
	znPI8qi92T6b41otiAOJA5hDZFtTz4RPnPBs9Rouc/FMoLMZm/rJYX85h4HPiRLKWcvEWANF/Jk0L
	l3BETJ+Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klDpV-0004Uh-VY; Fri, 04 Dec 2020 16:21:10 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klDpR-0004Rb-W7
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2020 16:21:07 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F30F71C0004;
 Fri,  4 Dec 2020 16:20:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/9] mtd: rawnand: orion: Do not force a particular
 software ECC engine
Date: Fri,  4 Dec 2020 17:20:56 +0100
Message-Id: <20201204162056.32682-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203190340.15522-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 373de8a8facb650ef9627562119549f3d9f8e57e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_112106_144450_98CEBF9C 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 19:03:36 UTC, Miquel Raynal wrote:
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
> Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Fixes: 553508cec2e8 ("mtd: rawnand: orion: Move the ECC initialization to ->attach_chip()")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
