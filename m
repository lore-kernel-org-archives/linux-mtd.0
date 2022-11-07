Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7FCC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnI9zEH3RV2caWqi5dWqa7g700LThRg2n+xP8chmMc=; b=2thGWG5IN44m6+
	Ovh0VbBjP3CmOQKKpS5MJITpJFCuxXobMKXuNKtcBM5TZ1FfQfUr8cnccOrbKQDQrkYqvNWNniMZe
	kYWWP7JccMk4A7BV+ho47PDAROwKMA8GQKXCi58b3tOxd/2qLIgBtOj6wMaWNNIdllmDxEuRoFjXM
	mqOrSaHsO00bEa2xlNteCx6Cgva6JH53Ys8oJOBn+zXO+SyxXI2pqTLZI/EtMYZt1iq7ZLmohHAxA
	YP20Xq7i35P3QLEbOtZrPmdChdEPI7nDE1SmWZ0ZICdz+fdquY74y/izK8WHBOlgPLlhwcZL69qh+
	6ZjwLuW2d3fml3/MyeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os58X-00GG6M-E5; Mon, 07 Nov 2022 16:38:13 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4u4-00G9FR-Jv
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:23:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F406B4000B;
	Mon,  7 Nov 2022 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/n4ceiMfhKCHKucjsMxy8StCawz2KaDruUXWtlmsEs=;
	b=DhWE/W3+O7xoKnTMIOh5uGlRzjkxkJonhNVM5GdRBFSFs0FDZYR8y5kTMWEc3t9gtYPouV
	n5KecszsZtkFMOzMSss+Tsea2f2wqmgYZAu5P7yUKu1WxtGlwTW+62DLwk8svdwkExAHhp
	xsRKyVnwBe59QBgaeCL83+70bbDZ+mm/su+SNPtROACVxns8z8sCV6cceaZsZMJUXgrlR7
	IDKGROzM+7832fmjhCMN/XCEj9W3MijB/AtuneYCnOZFAjWsZes00EaCldmLu5LuoiukDY
	9WzHKwnZLKG0YfF+dEb9O3+am9K8e3ZSCNBqbZUmzSFvSHuN8A93AxdQgeNWgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	michael@amarulasolutions.com,
	Amarula patchwork <linux-amarula@amarulasolutions.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: drop EXPORT_SYMBOL_GPL for nanddev_erase()
Date: Mon,  7 Nov 2022 17:23:13 +0100
Message-Id: <20221107162313.54222-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018170205.1733958-1-dario.binacchi@amarulasolutions.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a50ae8c98e5766a4fcb78e76f13cc658b784eac1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082316_841922_6ADDA7B9 
X-CRM114-Status: UNSURE (   6.20  )
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

On Tue, 2022-10-18 at 17:02:05 UTC, Dario Binacchi wrote:
> This function is only used within this module, so it is no longer
> necessary to use EXPORT_SYMBOL_GPL().
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
