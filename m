Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE051C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:17:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E3F22D0A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E3F22D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s4vrlGTsCgpcmhAiIQUAdsRTewy2eMvuho7AgQsXZiA=; b=TKg5r2Of/+WVYiuxQtE6L++ug
	WRSDdcR0ZRMWUj06GXdq+jZYJtdpDvVoserjJ5iMobVnfr0rEUjuJdRRIHq6MMKsoYz2jIHJU4BC3
	/rqMR2gQwWFKwYneEa0n20bN1v03u7j8Inc5EBebLdY7yWLF1BPI/RP0Vlemm0NFBwH8CBwhmqtc9
	LN0NLIeNWPbJ/4cWWQbMGWxHllhVLivTOlbzTIdLlDcxiBV2BeijmX5tOPigoG4C7JssdZwjHIXqv
	Q5lnO4Yi0xLGmvN2KUxpCQ86f7mkM40AtwQ0UkLi2Dpu0QnsIx59QRxQDGg/HsfRGc/XEiqdfGlWp
	ZskRo1rqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEV2-0006C8-CP; Mon, 07 Dec 2020 11:16:12 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEUz-0006A0-7H
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 11:16:10 +0000
X-Originating-IP: 109.220.208.103
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2E65C240009;
 Mon,  7 Dec 2020 11:16:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sven Eckelmann <sven@narfation.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: parser: cmdline: Fix parsing of part-names with
 colons
Date: Mon,  7 Dec 2020 12:16:06 +0100
Message-Id: <20201207111606.9077-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124062506.185392-1-sven@narfation.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 639a82434f16a6df0ce0e7c8595976f1293940fd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_061609_382334_80705F7C 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: vigneshr@ti.com, richard@nod.at, Miquel Raynal <miquel.raynal@bootlin.com>,
 stable@vger.kernel.org, boris.brezillon@collabora.com, rminnich@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-24 at 06:25:06 UTC, Sven Eckelmann wrote:
> Some devices (especially QCA ones) are already using hardcoded partition
> names with colons in it. The OpenMesh A62 for example provides following
> mtd relevant information via cmdline:
> 
>   root=31:11 mtdparts=spi0.0:256k(0:SBL1),128k(0:MIBIB),384k(0:QSEE),64k(0:CDT),64k(0:DDRPARAMS),64k(0:APPSBLENV),512k(0:APPSBL),64k(0:ART),64k(custom),64k(0:KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive) rootfsname=rootfs rootwait
> 
> The change to split only on the last colon between mtd-id and partitions
> will cause newpart to see following string for the first partition:
> 
>   KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive)
> 
> Such a partition list cannot be parsed and thus the device fails to boot.
> 
> Avoid this behavior by making sure that the start of the first part-name
> ("(") will also be the last byte the mtd-id split algorithm is using for
> its colon search.
> 
> Fixes: eb13fa022741 ("mtd: parser: cmdline: Support MTD names containing one or more colons")
> Cc: stable@vger.kernel.org
> Cc: Ron Minnich <rminnich@google.com>
> Signed-off-by: Sven Eckelmann <sven@narfation.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
