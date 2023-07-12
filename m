Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F01EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOKugXHHMavMgjBaSDbfxCzec4X4ZY8rqo/D27HtN40=; b=q3pALlaBAPbYOW
	fhT9jHZdxzcJLKuCJRsl82eGOtG9oB3LXSbH/hrbD2fpx2GG8LLZM9+U7SrazZRv6Wsy4m/+6UygR
	sqZVj1x+54DXG6RbAEP/nKmy0DOIBLvq/HTTz27t929wUzAUxfRsN8+IQTp+rDdPUcNwy5yV0D/HK
	dz4U7eTPsE7/4WQdBFokEkBsCD9Z2fulpxE6zaPlvuVZJhH3YyDu3rsZnqIOiJu7wIosXOOH/uFmb
	WepoXeOuNOHxtRVCPILjz9aras11JLkzzIws/f9UmIHrhjXkWuIPtHvJyniJZt8tsvlcy0BHD5Ove
	QKXV5KJwN4TmCsw7dyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJabj-000AYQ-2h;
	Wed, 12 Jul 2023 14:14:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJabh-000AVe-01
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:14:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A36060016;
	Wed, 12 Jul 2023 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrX5+Xt3jD73MWezAMWISqvmWFhWEE1LiE9fY/yhD8A=;
	b=DsmhjPNxwlxrzvnl0fQ/M/idjtnbpdM9HhDp9KacOexRe6OJWef2G1kNP9zj8X/fmRw8j4
	KbNXOTykVLax5b7BbaHJ0wLGqtezXorbeAFu2wOtM3tRgZ7XFkn2eidBMbB5X/oF+gaf38
	otHCYzFzp7b8kqLHTwJ0P9/1aBY5792bvTyQGu4bWrnjlt93dIvi8aRBRZvlWOPGzcqb0Q
	LZKSRnlt+sL+ZcXHp4owp662oSPxJyX3iOaEwWlkpYt4yujMjt45YgYbAPLmnsqohKeEDz
	0fNzdkXW1cBT5GD7kfKisPj+ySbENorxMXSm4YWj/cBRr444HvvWMmchumMXQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] mtd: use refcount to prevent corruption
Date: Wed, 12 Jul 2023 16:14:01 +0200
Message-Id: <20230712141401.354961-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620131905.648089-2-alexander.usyskin@intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'19bfa9ebebb5ec0695def57eb1d80de7e9cab369'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071417_176316_96521764 
X-CRM114-Status: UNSURE (   9.24  )
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

On Tue, 2023-06-20 at 13:19:04 UTC, Alexander Usyskin wrote:
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> When underlying device is removed mtd core will crash
> in case user space is holding open handle.
> Need to use proper refcounting so device is release
> only when has no users.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
