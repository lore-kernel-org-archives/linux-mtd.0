Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D835CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDW2gqcf2h3m0oVIf056+sMslUepf3U2+YlOSdt8m3M=; b=dVfzKJh9Vr6V8V
	wQO7y5+fIIKS1jELbJAafy+lxCY6bSPIBjxU41abYrQ3UVHs4SQjJ7BGzOlv/Y21VrHExYfPdcAwJ
	9DCOURiGL81oNhBfCosepG1mpHwCFP2r47tqIEIrKczKaz1x9CQVS5EcAEvvbcZRylhsBd91KmLxw
	Y4+SYfaHb9A3GleCC8e/a7LM3RT6c0Xud4ys1P8vVb2gwj3z+nS/vJyEiQj7LcSrN0FgY65z8/zRb
	n10ckPFllDAwytUWD13JlGVcZDPLXH0OnIi9Kq7jymDMInl3Tt7qz2v9JSLKfRRve29/u+S5BqcEl
	V/IdqArnJddnCnlJQYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTn6k-005uCi-J8; Mon, 14 Mar 2022 15:59:42 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTn6g-005uBN-Vh
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 15:59:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 343C1100003;
 Mon, 14 Mar 2022 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647273575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCLrsONXQ1StYZSTmk+RDGt9dvHeLr+NavdIziVYykA=;
 b=mg2UgiMuVibybCKpDD7L4INsKkLbnH5YQHu31g+/9eh7COfqfDdDQBV1wg7GDd3fO5eTbo
 Gbvrg25OkAsnwS7RZbKzqrgkoWRxMUEAz/XQasK28fywrQu07bEGJtskuDmJe+xsQ+vzYO
 eHItl8lK+B+DlzXAvlqtxD6LpxYtZcYQN9FxBrOaGhCZM4t3vS4ClHKCXIjgEa0vQ7xmNB
 yKd1ZgkmzGX7s+XkeMbXfKkQoacaHhk639nhPmiI2T3sGsLYXPjvKTGMnSqRpizDJFo+mp
 ZnNJ+bcMFwDqCER53U8PGTqCg8OnLISu3ZJtAhwQiEkcrkQYSHpG7Z43FzWr1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: nand: mxic-ecc: make two read-only arrays
 static const
Date: Mon, 14 Mar 2022 16:59:33 +0100
Message-Id: <20220314155933.77142-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220307230940.169235-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'12e0b9742cc735aa317e8273b98c8575cc0bd444'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_085939_199985_48F1C066 
X-CRM114-Status: UNSURE (   5.35  )
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

On Mon, 2022-03-07 at 23:09:40 UTC, Colin Ian King wrote:
> Don't populate the read-only arrays possible_strength and
> spare_size on the stack but instead make them static
> const. Also makes the object code a little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
