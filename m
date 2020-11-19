Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647ABC56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D720322240
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2817mqmD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D720322240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mPrJydLpP994/F/0j7o8W682sAzZ2rLbzTIW3ET/HY8=; b=2817mqmDUYFbMC7Dr6qQi4vff
	KdK0zqmAifG9DL+GUh7jKu/13wDXTzZ/mBt+VGD815MGjaNkR+fD0Z9sWyjqBmZnWAQMqi+RJr7E9
	ewIhUseBiqVhswl2hJs10JNKRe7S1bZDi2CkDTVfK6KppIIp/pkt8npqfSO1Nn2Fy0Wdf4OEPzGfW
	dZLr77qExqtwLMxzWWq78pUuWqp61zUwew0Lv/NqDuNDhVis4dN4PhcklM+L4Li8JV74IC0S6qhHk
	FFw95Ol2xM4xr2D3AC4Gr5VpeNRLJPV4Lnhlt6UiQmvtEFdXJuaKh/D5u5lQ0FrZvms+ZvHFdF/FD
	I4mv+ZV+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrGl-0000aB-OO; Thu, 19 Nov 2020 21:15:07 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrGM-0000Sl-Fn
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:14:45 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 89735240009;
 Thu, 19 Nov 2020 21:14:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YouChing Lin <ycllin@mxic.com.tw>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Subject: Re: [RESEND,
 PATCH v1] mtd: spinand: macronix: Add support for MX35LFxGE4AD
Date: Thu, 19 Nov 2020 22:14:38 +0100
Message-Id: <20201119211438.7571-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1604561020-13499-1-git-send-email-ycllin@mxic.com.tw>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 0326b52e7bf18904a4fee54689851ccd81b57d27
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_161442_833907_D745C691 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-05 at 07:23:40 UTC, YouChing Lin wrote:
> The Macronix MX35LF2GE4AD / MX35LF4GE4AD are 3V, 2G / 4Gbit serial
> SLC NAND flash device (with on-die ECC).
> 
> Validated by read, erase, read back, write, read back and nandtest
> on Xilinx Zynq PicoZed FPGA board which included Macronix SPI Host
> (drivers/spi/spi-mxic.c).
> 
> Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
