Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E20EC4363D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 07:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A47206DD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 07:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wOghsQy2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A47206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tH3ZOPaTYARXgIzYuyfpKfgN2edDWo3IiftesF4CmB4=; b=wOghsQy272K1oI4Tc1mion+b5
	3K2TMkJob5XUYCAex28X2TF4VDoghSKUzWr01p1OIqePWzw9OpLQBWUeFV9vrkQbP81RolEvU2OqF
	a9kE1MolyUZacN+8UuOmQ/D20eYvWAHTZOrN+hbE5mOChS012DRbKXk7YC9BjOfmrAbl5XYBSUHcq
	oEf46N4Z2tYOkGN+2Umo3SMJw1XcKHbyd28I0B6LJPZN2rrmym1r2ni6EVk5Su6vkAnrG9xEFTn4T
	eEMPxYaEynL4Yl2EvKJMVkhg79C+qK5wWuJV/O0/TuQv/rebFySPL31hs3f3MPu1muypouHxP1WjS
	X4XYcZMGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOFHt-0006Wv-3R; Fri, 02 Oct 2020 07:15:29 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOFHq-0006WI-7U
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 07:15:27 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EFA5B1BF217;
 Fri,  2 Oct 2020 07:15:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: parsers: bcm63xx: Do not make it modular
Date: Fri,  2 Oct 2020 09:15:19 +0200
Message-Id: <20201002071519.26282-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929172726.30469-1-f.fainelli@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b597cc75f7fe76708bc6ab3f0e09bbff6f09ae4a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_031526_370487_AE19E390 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: =?utf-8?q?=C3=81lvaro_Fern=C3=A1n?= =?utf-8?q?dez_Rojas?=
 <noltari@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-29 at 17:27:21 UTC, Florian Fainelli wrote:
> With commit 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE
> detection"), we generate a reference to fw_arg3 which is the fourth
> firmware/command line argument on MIPS platforms. That symbol is not
> exported and would cause a linking failure.
> 
> The parser is typically necessary to boot a BCM63xx-based system anyway
> so having it be part of the kernel image makes sense, therefore make it
> 'bool' instead of 'tristate'.
> 
> Fixes: 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE detection")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
