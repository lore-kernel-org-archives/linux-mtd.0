Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C517C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwlH3WDxnUj5OJY+JQM0fnIC/4lH5SqLkHtuOJrIRw8=; b=G99SFOskI/tZCO
	pnnhulzjU6zdoaBWAG/xmoVPvrwrsTjtC/jALKIlS5LrJWs+o+DSY70dnEQdH5lJKt1NYuTw7vvHe
	p9tC45/zSSvQuuTNtBRImaPlGtURgRlGPreKNJL84qmCNfG3O6UdYr04wu8el8WtPQybsR9QA0rOV
	nSlNaDEywxQMOQJSDA9Val9tA9GFH0RYhF3Tm+Uve+bkuVss9TzE3Izs6EeXgx/zHQSy/dihV6y/K
	XRPbnbJx+P/9BqoDHV29OCkW3G45XnijJ5VJIpdCW/giI5M51jFR/LK+hsi8tuf6ArUF1u7Jr7EFF
	Q84VHP4QGQVZ40GZy0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiV1-004evV-4G; Tue, 18 Oct 2022 09:02:59 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiUw-004etV-TI
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:02:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D3FAA240016;
	Tue, 18 Oct 2022 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gHdFupziOKUo3PG7MT79bQw/IiggQbS86fhoDFJH6hc=;
	b=dxe+8PXmLWKqZe2LkteuMGDuvtOG5zqwpNsYyPyHZh/7h9Cr8czfA9dA5ePSApAneympoW
	obsrb+ni3kKnj88KqkPNhjnYHHdFsGdg1xXnwnjx7aFjHMPpqnyH0afXBTDQGL2xGc5x3K
	vjp2Fhi7XWJeApf7ZyBO7rjD4v7c8l1zmEjDxJJv493YSNbQtTbQpcAmani8CwIOaygYYd
	fhb9IMORlRVd0F/WAc0eN4Ryx2q+YxfJ1CVPuNgcpeHEq3hwxaARkFzUE/pTY20aH9nDT7
	pR0IYGS039Ai0ClyxfgyuwBDBRPpXx2IPcUopsitLwk9FEIRbmJU4y1WP2Sl/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhang Qilong <zhangqilong3@huawei.com>,
	stefan@agner.ch,
	dev@lynxeye.de,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH -next] mtd: rawnand: Fix PM disable depth imbalance in tegra_nand_probe
Date: Tue, 18 Oct 2022 11:02:51 +0200
Message-Id: <20221018090251.393882-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926084456.98160-1-zhangqilong3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3ada71310d2c68eebb57772df6bb1f5f033ae802'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020255_107529_8E4CBFD9 
X-CRM114-Status: UNSURE (   5.49  )
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

On Mon, 2022-09-26 at 08:44:56 UTC, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context.
> 
> Fixes:d7d9f8ec77fe9 ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
