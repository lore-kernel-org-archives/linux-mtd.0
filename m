Return-Path: <SRS0=7qHi=45=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07B0C10DCE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 21:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BD6205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 21:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bgH90vOQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77BD6205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiuRXGilidNrsWsDigD4//43KGqe96/ULp9hBdkZslI=; b=bgH90vOQUPBy7O
	oRhHtavMxikR/vbr6aOsr+cGOud4kBS2wByRAZZPYMmSIuxokJe9IEvXIXvCt2C9z2hQvmlBZY4HI
	8WoGtm6C9kwr6yAePXnbY97dFZ049fCPVV3OhIEmmMKROgIqdZeGO8vgbU/OSl7fLsNvY1LY9ru48
	iom80xE8yeiWCaNRkIBJKrCfeKjAdNKwRbOLtddffV8ydEp63xcBlQ7/0xk1RW7bRtrLtR1PYOk9W
	xgTuDX3BRMui0FxVTkmUKR89pYGgFvTbK1+RunHHZvkcUSdPb/RY4yaZEleH3BIZHrNn/0S/yW1Rb
	cLJy/C0AQM/0yjKs5WHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCVSA-0005Zb-Da; Thu, 12 Mar 2020 21:33:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCVS7-0005YO-LY
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2020 21:33:17 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6D220240004;
 Thu, 12 Mar 2020 21:33:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] mtd: spinand: micron: Add new Micron SPI NAND
 devices with multiple dies
Date: Thu, 12 Mar 2020 22:33:02 +0100
Message-Id: <20200312213302.7185-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311175735.2007-7-sshivamurthy@micron.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 9f9ae0c253c1e058fbc845e26c4a32a7d777f0dc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_143315_843175_8254A013 
X-CRM114-Status: UNSURE (   6.72  )
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-11 at 17:57:35 UTC, shiva.linuxworks@gmail.com wrote:
> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> Add device table for new Micron SPI NAND devices, which have multiple
> dies.
> 
> Also, enable support to select the dies.
> 
> Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
