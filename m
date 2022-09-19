Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98FC54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fmwuIFqW5xcctkFwDB2al/JNNHu+gzTOsJYeYlv1hs=; b=PJQhnmipwiWmiY
	rgl9CILTJsmc4yLQn4odP7JL6CN6Ns0ycMm0EiZ9WB1FG3uH+0HkJRK5D0upb6jNg/mWnqaNxk68k
	dJTWkap5BzPS8zQQj5ty7UJ4JnGio3V9iUzLfvrclITkgnaOrRFi+kq0dksIsA/8W481GUvkhL3iJ
	7F4y3bOTjEqTpzQOeREqPInWJqJ7rCjSVTLtnMk1qXf6s1B9n/fGgZSWxFX4rj8l54is9Wo3B/vc9
	reqYoZ54HZHFC0lL64D0h+dS3AzcuNj0gXaAW6gs3/CHOALSZcjK4CMbTBsaqixpGNcg3swN7qNGd
	6hEDSO9hVPYOHfmZTYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJRJ-00Cny5-7m; Mon, 19 Sep 2022 16:16:09 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJRF-00Cnth-14
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:16:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 621D71BF20A;
	Mon, 19 Sep 2022 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663604160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELi8T3Bhx5dSgWmHSngNXxOBCBGwDJCNnx9M4Rl2f9Q=;
	b=O1rc2hGHDRLJrmRNwetsfc7aOSS6r4gVAKXAW28Qkx4K77Lse+n7plCIyITsQIBSomKM+j
	isttim8nbNqBPH2FtsMQD3e4sf5Js6nThNYqIAboqNhxOYAd6PVtgEdOOVciqK4kFenQpQ
	LwCXN6cFXR2JLKV9iaIu/5eoeraqcGZ2YkLDDhZVq85F7uFMDEzLTV6Gh/S+DboBBmuV73
	XMO+daKFPfY1A2PI9JFvaiZP6hHxKPSwdI/aWFw5C8oxHDqBJ3jx4X2xyIk3SEnQsmKvm5
	KarMLFyiayGJ8F462SyLGPAbTjdPTy8qw3w4dgf4vKat+OseOumeLaFe6VNY3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: devices: docg3: Use correct function names in comment blocks
Date: Mon, 19 Sep 2022 18:15:58 +0200
Message-Id: <20220919161558.226540-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805175423.2374939-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f535ca406f5400be33b9498ea8a07ffa9e744133'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_091605_432875_1D328DFC 
X-CRM114-Status: UNSURE (   7.18  )
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

On Fri, 2022-08-05 at 17:54:23 UTC, Colin Ian King wrote:
> The incorrect function name is being used in the comment for functions
> doc_set_reliable_mode, doc_read_seek and docg3_probe. Correct these
> comments.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
