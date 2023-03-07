Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0B2C678DB
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjXMD3cI2vm3fUWXMqknBSW+XbuHOn7TtNnCLCNfGIU=; b=TTlRuwlQ4vb/jn
	zljomK7pTshn7mYtBrQhwPKCvBPO099d7MdEOKJMJZ0FEHdMeWTY8OLk7FEbCsACMVyUGdhQuHf4C
	C4xx768Tg5ygntcnqlHIOUb92JHhNjT+HiR46O4XNTL7XrZFFALWnAOultj3oOKahDfwiMdd6DiTT
	GzJjyu+zHhRN/T7LP/vb8/F2/7gA6WiDZ06zoYzf/xY4PqdP3zOPOIuccMTfhR7co8K8wbnwHnnEA
	mICnbknJTErngPA97tjw3aZMXZ3mjvLA0Cno00Y9e7adhZIwpEGRzJaP5ajcRCplttLzwdsVWPjZh
	hNP9j2lkAwOoiT45y5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcsT-002D7b-OF; Tue, 07 Mar 2023 19:21:37 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcsR-002D6L-5v
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:21:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9AF451BF205;
	Tue,  7 Mar 2023 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678216891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxdKgF0FoJ8o93pAtFh/ei+gKLeFCdS2rikMZuG/uH0=;
	b=Y2NDczmdy4t+ddy4/B7pcehkSH7NVY7Yh9fCf/HP/QTBG6VfvC2+qeuZiq3PT2TtZEvHrh
	dNskcRbXB3YfRTcr9S35hQNf/r+GT0yGxphzV8C6QBz8AEZMwu+pCrG0Iz76pPhlLh4/NU
	ijID7TxI6NhaqnC2BrIwT0cHLsfyX+3HYlmIuNAy8uk5soatKdReOvBmBHRJdzvpSx//zl
	Fi+wCcmqlJAkGvmbrJfamt7FXMNSsE+KeE+GDXMGbmkccpso6uvHyStZc2gMhlwk6P2cKU
	icL5Ue1qo6pSFqC7qYd7lafsir/AWK7Y2ZGGCO5DlLAhtkYNfMNiTimhQ42Phg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mxic-ecc: Fix mxic_ecc_data_xfer_wait_for_completion() when irq is used
Date: Tue,  7 Mar 2023 20:21:27 +0100
Message-Id: <20230307192127.274869-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <beddbc374557e44ceec897e68c4a5d12764ddbb9.1676459308.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'75dce6a941e3f16c3b4878c8b2f46d5d07c619ce'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112135_376502_009441CB 
X-CRM114-Status: UNSURE (   7.98  )
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

On Wed, 2023-02-15 at 11:08:45 UTC, Christophe JAILLET wrote:
> wait_for_completion_timeout() and readl_poll_timeout() don't handle their
> return value the same way.
> 
> wait_for_completion_timeout() returns 0 on time out (and >0 in all other
> cases)
> readl_poll_timeout() returns 0 on success and -ETIMEDOUT upon a timeout.
> 
> In order for the error handling path to work in both cases, the logic
> against wait_for_completion_timeout() needs to be inverted.
> 
> Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC engine support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
