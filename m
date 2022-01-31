Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD99C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eags365vsngxHkrLdKHpNQ0t0jZmtTT/qvzSCz7LXG0=; b=Zh6UCzyDyWMcVl
	bNUfIAqevfy15hwJRd/pfXQ/jFTlfvwuvyCKb7niRUPd47ftDCH9DZDQZQXtzF3iCBM17r8xcChFC
	2QYwM8SzvwUrJTgwA3rSSPq1bYCFvF8je5PU/AIpmUJPFCrsjlq9yFRw1eu8qQ6DALASPUBrLqBRq
	+GXArW3CuPxG/vJmYW4OjIBIJXbq/SMT9Ds/Rj9b1dDVN3avrW0mRrLMrjsUzAtLBxoYetS7VubfB
	75HzjjyFmgEWPMiJ+wR+2eoXJgt3Cf9IJuA1M4dDjGcESJVx8c4mNxYQM+8YPDwp3SNzHFFLwZpvP
	Q7R9GIVWGqemjlYDFfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZao-009sFP-3G; Mon, 31 Jan 2022 16:31:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRv-009pxS-4C
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE7CFFF80B;
 Mon, 31 Jan 2022 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6m2GficIeLFtb3didu21RB0OOyHFYkaO4nP1daMw7XQ=;
 b=j6RqOxIylUZEVVoi6GgkCl6pogCCF6VD3SuUtb1kQVYtqJhaI9ep5bvo2FZJbJN1gAEbVH
 GKclsaWpTVcVBEWrJQePeNxYxIXMG99PwM3ZqBgxH4EkKa4JJ5rO32e5fM1x3ZYfPAmvSG
 FzxJS1fHrIRFwNXwNIwdmvJSUM0i3VKXZxRvlBRG9x/EMeT0JJZUgZw66OEiHxC9TdM05h
 kl1acRCF3aHQ6+wJdcJ2Yq4axmi3JX4RjRQ3NG+3g3HCmPY2F7mAdATGu7R7qu7VwbGVWQ
 L7DnPBDOKfu2uYxwrh9mveai1hvFAgR23Nb4XsG7GcGqnxnYNsVKZCLdBqzgCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 04/13] spi: mxic: Provide a capability structure
Date: Mon, 31 Jan 2022 17:22:35 +0100
Message-Id: <20220131162235.24171-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9130f39d17f53163a7703e7d5d51272f0d090e0c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082239_350780_15E5D556 
X-CRM114-Status: UNSURE (   8.51  )
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

On Thu, 2022-01-27 at 09:17:59 UTC, Miquel Raynal wrote:
> This controller has DTR support, so advertize it with a capability now
> that the spi-controller structure contains this new field. This will
> later be used by the core to discriminate whether an operation is
> supported or not, in a more generic way than having different helpers.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-5-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
