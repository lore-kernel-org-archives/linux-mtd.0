Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE703C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZpfrYYgG4KqQzCZm50kmyeHqtRxyHJ6D/SNyhozkG0=; b=UOyMb4c/WxKOrz
	ulvMMNXUlawOlkWBgg4r8ErtXASxvUy1s5dVttXk0W1mk6eGJKVODpMJvVmPBMWZ0TZji0QOu+7kX
	re6Qcd4W7H52TmakuTh/UmPCwp+9+3msY1kqK7XjYblrJiWcg0UuCrzesk8PmATVgZM2nEZCxsXX3
	LJtIoeF+A+beGt8+QbB2nR71x52Y3inb0DKXlxdVGmOtyAtxEVEo6Flk9CdwWDgVH3FF/46+YzpXN
	Sfr7emG6Zm2Mk5el2UeNMa/eQEasuo4r59oenNQeAB4TEbWpGpWNropcqTBVG9zEchiSYcxsgksHY
	JafH8tDnzLbSIrpJ00VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiRt-0000000H2I6-1uiH;
	Mon, 25 Mar 2024 11:25:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohRz-0000000GiN3-0XKc
	for linux-mtd@bombadil.infradead.org;
	Mon, 25 Mar 2024 10:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M4tr6jXQo2B5No46bghO0NGB40nWqUW2K62Prsk80Uc=; b=Hkc9jSlds1GHCGrSRGJSA5fxe7
	vbhXgzmQvOBPpU+c5cARil75Nrb3tGMEvEF+5+MrNcTfdVMEHsDV2muLvhgYLN/YVErWWhVE/bC1N
	ueDq8JINKfRqA6JkvDU4ntVGRG66HWVuDbjmiCBpD5sBb4taQx6ILCjAxX4B5l4wCvHG56rWgeXhT
	dG2gVEbDAFvJRRnvDVm2xIpxSh8mJCcbFbCavQ2fhI1HYknKiEmbDuEB5LxIOtRe9HMYUds9o8aX8
	01XIP/co6Znu7BgDFGW6XFpgNKuzvYJG1nRrzeooChMqmypZJSJCHmd9NExXG49cBP1knbaNEUjYE
	NB4bLjsg==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohRv-0000000GWks-1Hbr
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:21:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 450D81BF20C;
	Mon, 25 Mar 2024 10:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711362059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4tr6jXQo2B5No46bghO0NGB40nWqUW2K62Prsk80Uc=;
	b=DzcHDIlIwgk7EUTx5YG/SrQySAXw0X1+RbEVKalYXWFpidoRWeP7FtH5UXIiCqfOeEaQD1
	DgLu3bzV46BP9GyU5tj2WD+XuZfNIea/ZwHw5+pXlu1qNtYcOb/kc3gf33jLdHN37p3S4G
	Zf05loldfDABtbc+j55AUMOB+9MmQrv3jgqQ4Y94sk9QHhgsgQSEhhfngNfQsahW5YOAHo
	lp48eIl4o/dWpmcxL8M6DGf0k72HjsUYZN6tgZV2bwxqQQhjw2t7ttiInYMorOBiyGlbp4
	IkUV3dB3DWWRc2L/yVtZfxzRILJ9kIynFeZNqoQ14yx5uLYqrP6IZqhT7gEr9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Hector Palacios <hector.palacios@digi.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: rawnand: hynix: fixed typo
Date: Mon, 25 Mar 2024 11:20:57 +0100
Message-Id: <20240325102057.262963-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6819db94e1cd3ce24a432f3616cd563ed0c4eaba'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_102103_537464_BE3532F5 
X-CRM114-Status: UNSURE (   9.09  )
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

On Wed, 2024-03-13 at 10:27:20 UTC, Maxim Korotkov wrote:
> The function hynix_nand_rr_init() should probably return an error code.
> Judging by the usage, it seems that the return code is passed up 
> the call stack.
> Right now, it always returns 0 and the function hynix_nand_cleanup()
> in hynix_nand_init() has never been called.
> 
> Found by RASU JSC and Linux Verification Center (linuxtesting.org)
> 
> Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
> 
> Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
