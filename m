Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B93C73C66
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3vPkSXKERTDzKJirGMBjVl46Byi7FHYq8FAdZyhUDM=; b=bMOqz14364CIYC
	nSUPaPiJHYM7c6ijF0McG0Z7NhTyM+bhuHfIVWNJs3HKr6TzNEzB/2BNhJevMzGhsn+M0KlaiFp5K
	MNJSNTFk0aZPWd/jq8vBNM2yJs3ZUH6pSL+vvEKs5pyKZkJkgmSpwnx+Mw/UDit+syJIg0R633717
	dJdy+TsZPPd+p0fnNBEvaqLrkYjvMjRG4mZTy/NMnitKjcMPk6cNwUKP3S/X0dxEZn9dcOW6gpKzR
	LIp79yhylQw2Bw7stF4mF8g07EnHtIKWKDAx65N0yonweDZ8zDaD/hOH9wgIegN/bV8orCTcjZfIC
	tumsiSJl8nw0gvVRlLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fF-009Vgz-0Y;
	Fri, 18 Aug 2023 14:41:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0f9-009VeL-2u
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A7C9FF809;
	Fri, 18 Aug 2023 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klMvfIssuOuVoL+YNUtLduOa+csp6ZF0pibZedhD+zA=;
	b=C1NUZtJQ2D1rNaKuAgry7F7WMP80fKMDzURlMy4zTfnKfT2rtnzU4veYCTIMmX8YKTr/0Y
	VATsuoEpE4Kk3iDGGs5O7Fc1vo9pDpWgfZkeKIDMtiRuuNkpSreaUGFg/MuoW7vatlQQKr
	BPRVY/x4EJf5kf1KaeqibmafSIioiGjF/x7hDj09shg9s9SoMLXBV3HJ0A5S3/V1cCCuwK
	rBG/52JQKcZX/aPD3ulvbw6+ywxchUcjobwtj5bcxyNHTFxmG2KbMJ0zfqaal7o3Oel4ce
	8XWXirUnj9xvWm/mGSajMpCCoifoc1jMakSz8asFP4SQuij6KtjQInFCGUOxsg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>,
	linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH -next v3 RESEND] mtd: rawnand: Propagate error and simplify ternary operators for brcmstb_nand_wait_for_completion()
Date: Fri, 18 Aug 2023 16:41:12 +0200
Message-Id: <20230818144112.145876-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808032943.3890545-1-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f504551b7f153c52e52154b989266c11a17590f3'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074120_110239_2249E8BC 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2023-08-08 at 03:29:43 UTC, Ruan Jinjie wrote:
> As bcmnand_ctrl_poll_status() return negative errno, so return true if
> sts < 0. The < 0 case does not exist for wait_for_completion_timeout(),
> so return true if sts = 0 and zero otherwise. Both of the true return
> of them can be considered as a -ETIMEDOUT err, so return -ETIMEDOUT
> if err is true to propagate err from its caller.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
