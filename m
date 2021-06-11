Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B666C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 20:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26032613AD
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 20:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26032613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qgk0MM2e3kzUsgtb3v86jxP8QWmS/xPju7V9DUvPSqA=; b=0QqrsCzPcA+jhG
	sj7GO2yr0x/PskIewG5SxoghV56/uJTCf5ILd0OskKzLk61XP5aTe7X2p1yV/4a4IH2rOCBTIpSek
	EB9QcvbQ2yMWYCUJjIwcN8djnwOuRXpeg+iDPjjl3xumrgqo6rsrjNmTWyR48czVkF5mAIb6/O8Re
	jRJ8kVjYXTCjag1jQ3/CenJuqfrG8krvb2BeIYGYyuDDlenzcEHftuZiajcskFuQjwWy289xxyWap
	6kTG21weZ4tveSD5VJVA4ApgZn/xiORWdAZjvQKHk2PbLmj1qK/bej5vMnBkbx6zrbTFwDDYzf35X
	jPwjZKo0dLCPS5cvXU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrnZg-006r4z-Gy; Fri, 11 Jun 2021 20:16:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmRd-006ZB0-RN
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:03:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CE1E820002;
 Fri, 11 Jun 2021 19:03:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, YouChing Lin <ycllin@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: spinand: Fix double counting of ECC stats
Date: Fri, 11 Jun 2021 21:03:50 +0200
Message-Id: <20210611190350.226975-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527084345.208215-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c93081b265735db2417f0964718516044d06b1a2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120354_054678_723F06E9 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, 2021-05-27 at 08:43:45 UTC, Miquel Raynal wrote:
> In the raw NAND world, ECC engines increment ecc_stats and the final
> caller is responsible for returning -EBADMSG if the verification
> failed.
> 
> In the SPI-NAND world it was a bit different until now because there was
> only one possible ECC engine: the on-die one. Indeed, the
> spinand_mtd_read() call was incrementing the ecc_stats counters
> depending on the outcome of spinand_check_ecc_status() directly.
> 
> So now let's split the logic like this:
> - spinand_check_ecc_status() is specific to the SPI-NAND on-die engine
>   and is kept very simple: it just returns the ECC status (bonus point:
>   the content of this helper can be overloaded).
> - spinand_ondie_ecc_finish_io_req() is the caller of
>   spinand_check_ecc_status() and will increment the counters and
>   eventually return -EBADMSG.
> - spinand_mtd_read() is not tied to the on-die ECC implementation and
>   should be able to handle results coming from other ECC engines: it has
>   the responsibility of returning the maximum number of bitflips which
>   happened during the entire operation as this is the only helper that
>   is aware that several pages may be read in a row.
> 
> Fixes: 945845b54c9c ("mtd: spinand: Instantiate a SPI-NAND on-die ECC engine")
> Reported-by: YouChing Lin <ycllin@mxic.com.tw>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: YouChing Lin <ycllin@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
