Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DCEC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:24:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9453120787
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:24:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UI5+MBzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9453120787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHNJ8W7ZQ4M1TM95wEATVFV4Qxe/uiXP5lRHlKVdHjI=; b=UI5+MBzR5ePFL/
	gPghtAMc3915O/jJ0KHWFq7xVrAP29BZi5HGANXJgIoJlNI0P9Uvy75MolxB28GNJkcYDJ2BpnHo8
	ke4XurVW+mDvULObQYqMsdhw+JMaH4UdfCuLqkNmeiAItr5+phvhwzax8mtxc7Ii+F4ccdnineiJd
	d0APSh4jhhuP0bYjWHcq3iSb6UBJTWSZ0QZq5pEajKFTKGfMok4rq7VZQ5Qdxk5QR+UNWtRv906Bx
	qsmtbTqO8Bj6Tr+g+VOTH1sW7cQz9qE1Nd+6G+1ynZxWqXZdw+7wAtgVMP+9ZFxkacRSjvMuMBv01
	eVCBajtrOuOXp8K1Wxig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcwEq-00030V-RB; Sun, 24 May 2020 19:24:48 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcw0t-0001xm-V3
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 19:10:25 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 74E9D240005;
 Sun, 24 May 2020 19:10:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: Fix nand_gpio_waitrdy()
Date: Sun, 24 May 2020 21:10:20 +0200
Message-Id: <20200524191020.18380-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518155237.297549-1-boris.brezillon@collabora.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e45a4b652dbd2f8b5a3b8e97e89f602a58cb28aa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_121024_201677_196C374E 
X-CRM114-Status: UNSURE (   6.45  )
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
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 stable@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-05-18 at 15:52:37 UTC, Boris Brezillon wrote:
> Mimic what's done in nand_soft_waitrdy() and add one to the jiffies
> timeout so we don't end up waiting less than actually required.
> 
> Reported-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Fixes: b0e137ad24b6c ("mtd: rawnand: Provide helper for polling GPIO R/B pin")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
