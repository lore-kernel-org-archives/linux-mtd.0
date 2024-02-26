Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68514C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgC6ASDQnclOSvfC+caWPqihJPNLRKDsuw3OZusxlzw=; b=WnD73Tb0BDg9tW
	i4h3oO0CH0MksXus2wwkbCOfmzQrSChHMPGgYd5d8QUbdEb63dybvClXcI7iaXFreXfadwkMnaK1R
	vwK24OjLUSvxIWY3OvztC1VbJA4TQM9JTwaDooa8PGGoaRFBqBu93sNHu+0O4eYdnd9uvVX/E+aD0
	Zv3M+YnpHEaTmlCpGNLvaZv9hYArLqyvRsVK+8dIWofaJVG+eFscg5qlrIS9LnediYItn2GOm89OA
	M84V8HT5FkE6RluoVx4pJvSKdu0yZssNx11gJ7Dpwo0TJdSMPdMgCj9cD3evq7thPrYddl27Ptb+R
	uLH5myuJmq5WECTf2YIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSL-000000008XT-2NW6;
	Mon, 26 Feb 2024 10:43:33 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSA-000000008Rp-2nd9
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:43:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9987F60009;
	Mon, 26 Feb 2024 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWnQ1ew/adqQWSYAPjKxyawcnRgAZhYULEnzwiGjhjY=;
	b=onE6VgmXzkkmDbCwUJ9csVwJuvcYWYrYFbKzCiKwunQq/hQzefNNMl6lEtOwxvST7iSR7h
	nhx8y8yqEXVllgDVAKCeKSGfcR2+OU6t7+3ej875+ZLyIP6m87I9/oxR0H70g4HwIwK7wp
	2pSXwiGnOXYS5PisSKMzKJ5Fmur0vnFGa7AAOLg6cjG4PPRDDyhJbxGl6fi1L8Baq3qJHo
	eYRf/d1ylzd11v3BkRAouaXpiVSuHFC68Ex14xDLVvANYU4Sb+5F5LupPzNx0rxo9g7W1b
	nXeZHIFHjVlUBcObkg4XZXsbFwTtEKksfhNQjDrzD4QxovOAWc10E4s7nB4aAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marcel Hamer <marcel.hamer@windriver.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: fix minor comment typo for struct mtd_master
Date: Mon, 26 Feb 2024 11:43:18 +0100
Message-Id: <20240226104318.488980-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216155022.79371-1-marcel.hamer@windriver.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'081064cc103929c8a0d7d5fd057110c739c62ee1'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024325_622810_ABE0B51A 
X-CRM114-Status: UNSURE (   5.61  )
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

On Fri, 2024-02-16 at 15:50:22 UTC, Marcel Hamer wrote:
> Minor typo in the suspend description.
> 
> Signed-off-by: Marcel Hamer <marcel.hamer@windriver.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
