Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B7D0E6DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iibvb22cpO6v4MwNGxPIl11YF/qRv7jIPL/GPmlNmmg=; b=x9sR2wt5lb7SPQ
	i89PMuuKw09FTaL5uW5Vf+9zZsbGU0ar9zj29T1v2oOK1OKiyqsky2hBdzFaeriyVG3kt+ItovgLk
	VDpME5mHtXV4AFJWS8NvIMNApn6CiBTAyGt381qNz1MD4unRUJBaJKcuKaRH3rwxJxCQgOhi6CVsh
	g1jRa2ClMLB3ntBC8LxFb199u73hOD/ufOpjT2MK1kH6cLcoxYsdFiBKR8sbFhh8QFREuT4k0gR8k
	KkDMySRWodE+AoWGhx7RDlphpsiE9I+BXfYaNj3u9u0REepItmNqXSy+RSdr1AOqdxs+gIcj3TCvA
	cFUEmfvFojf0C2qOktvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pH6-00000006oRS-3Es4;
	Mon, 21 Oct 2024 10:04:32 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFP-00000006nsf-0XhL
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E900FF80A;
	Mon, 21 Oct 2024 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tcu5dEoi9gB94N13JkzIpnDDgeeEc2xXKWP4KS/Ty58=;
	b=UUZBUtrNRLfKQVFAU3PrmVGwA23zlSfyZlbpzWMhaCoYIriBg0IkBXWS8O9Ork9uSuHE8J
	m9CR+56aGiRpLpKFcQkxGR7HOhLUzkeLe5UT/NZgEvQ5tmIIulVLy1NGUq6A5RTdnpEaXk
	Ykh0hbByMt6TKm1LjR1gCIj4GNbuB5S7nZDNRWd0FGV5yIKvBNwiiERvggNfIjidfZEPM0
	xUbCHfxrZIBYBNXEkFJWNvBJ5TGzn9KGfYz59w9/pxMR7funDILlFwfDYtTVNWkY+pqQEf
	aeggP8r5kbMFa8dAvj8QvbWBZF7d1pnMmZVzTnubbyDsq8Vhmiu4XUr0gAU2zg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/3] mtd: rawnand: davinci: use generic device property helpers
Date: Mon, 21 Oct 2024 12:02:44 +0200
Message-ID: <20241021100244.173421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007122350.75285-3-brgl@bgdev.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'905050b01499fb80dbd579e8ec13b19eb8f59101'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030247_317628_B20564D8 
X-CRM114-Status: UNSURE (   7.13  )
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

On Mon, 2024-10-07 at 12:23:50 UTC, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's no reason for this driver to be using OF-specific property
> accessors. Switch to using generic device property interfaces and
> replace the of.h include with property.h. This allows us to no longer
> check the existence of the associated of_node.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
