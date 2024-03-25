Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA50C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xyDUK9rlXXg20A/oVTxVF+EYjZ2anUVVvhLM31EL+8=; b=CXxqSsO8CSURCk
	hZriBburtIGzImHbEkRlS6ZDxuMMJVeNgbq3EJcxK/CXSoP1zj7VxMPwXxa/uGnnLwJk7ahqemo5p
	uFOkawAZQcigsp1WdOye8scuZg6UOExWe4VzfikNQP7rDOIZr7xxqN2tyQw+5yAmL6LvQWOLUNRWB
	KgJWDPIgjvaFyDo+cdsGdS9mTlDDfWrHlJa2p3t61GuNOc6H4zcqT8HpAGp3HgvUz01kJa6+MoLxE
	Q/b8dXuZDRjQ8Avn2s53YGRBitzSMbdcndVR6BvwfeHbmVujt6uTf2z7H6MTWq0tpWxNdXtWU9SHw
	2kNR/UjqRb3TmMnX+nJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohPi-0000000GhMP-3PD5;
	Mon, 25 Mar 2024 10:18:46 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohPf-0000000GhKn-34Dy
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:18:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEDD06000D;
	Mon, 25 Mar 2024 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711361919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HpKxnGuq4NGSS31UqPNZH4kFPyky5wJE4aY0gNyw2nI=;
	b=dWD8RPs0pMCGzjjHxXqZvCvws7CodSuZGLD7A8aVgTcOZkd/pahag5M9XiL9Rqh9Z0QQfM
	aN9dRYgDpLjnCtAGKrDZbAvnSQxy7yYleSGz0iqj2+/1mIoEOmPwtH9j77O86h5aaOHWgl
	jXsrnjp590kJ5uO2f7oYdbSbBo6lzvuswaWm9QY0haB5k/6iVjid9XV2+FuFkeU7O5NZ3l
	OfUSkox+Zg/Hv8uR/X0lIoUgLxO8+G8aTi3rjcu2sYsmPHZWCYF74GB32yH0WRCVjgaOMK
	qTNZfbCb9WGaLhMXuCCf2IHfUEGdRTYJvT+FOG9rd9UThG39nNWnj4zvx1EyTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	joel.peshkin@broadcom.com,
	f.fainelli@gmail.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	kursad.oney@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	David Regan <dregan@broadcom.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Fix data access violation for STB chip
Date: Mon, 25 Mar 2024 11:18:38 +0100
Message-Id: <20240325101838.262387-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240320222623.35604-1-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4053caf60bb349ab9ea9e36ee30c64681b696198'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_031843_945935_0C29AC51 
X-CRM114-Status: GOOD (  11.32  )
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

On Wed, 2024-03-20 at 22:26:22 UTC, William Zhang wrote:
> Florian reported the following kernel NULL pointer dereference issue on
> a BCM7250 board:
> [    2.829744] Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
> [    2.838740] [0000000c] *pgd=80000000004003, *pmd=00000000
> [    2.844178] Internal error: Oops: 206 [#1] SMP ARM
> [    2.848990] Modules linked in:
> [    2.852061] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.8.0-next-20240305-gd95fcdf4961d #66
> [    2.860436] Hardware name: Broadcom STB (Flattened Device Tree)
> [    2.866371] PC is at brcmnand_read_by_pio+0x180/0x278
> [    2.871449] LR is at __wait_for_common+0x9c/0x1b0
> [    2.876178] pc : [<c094b6cc>]    lr : [<c0e66310>]    psr: 60000053
> [    2.882460] sp : f0811a80  ip : 00000012  fp : 00000000
> [    2.887699] r10: 00000000  r9 : 00000000  r8 : c3790000
> [    2.892936] r7 : 00000000  r6 : 00000000  r5 : c35db440  r4 : ffe00000
> [    2.899479] r3 : f15cb814  r2 : 00000000  r1 : 00000000  r0 : 00000000
> 
> The issue only happens when dma mode is disabled or not supported on STB
> chip. The pio mode transfer calls brcmnand_read_data_bus function which
> dereferences ctrl->soc->read_data_bus. But the soc member in STB chip is
> NULL hence triggers the access violation. The function needs to check
> the soc pointer first.
> 
> Fixes: 546e42599120 ("mtd: rawnand: brcmnand: Add BCMBCA read data bus interface")
> 
> Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
