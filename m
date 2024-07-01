Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA9BC30659
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+INLndzsLUJ2D1ZHTfSs5OsDiVXi7Q06vvzunDJ70Y=; b=i+pQK62T/2C4RV
	zryiJbB+hj+IW9kJjc6eV9O0FMgxQvHCYXyKsthWv6jeOXjCovyvmYah14qKVm+oUkKE1xYS2wGKY
	Ap1ZcmdgTFc0zRstzm+J7GGGQxaaAYY3B03o3k0v8OvznHzwtH4a8vO4HvTtEGmd2S/Hw7DNhAtTH
	i3ghXfhDqGNtVP8YdZYnK8fTifmEcXZ4XLeJjU6xJEYgWVqYODr8OIqPVPllQaqTmwqPXxSS0HPG9
	Xh96Oo9FOaTvSX8JvoA5pBabu/cYI9MiBGg0NG9uBZtrX1crDBz6MXezb7a9ZEPsdmyIXgm3i9ljh
	QeYOwtnES6/akMJlvuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG2D-000000038c8-1XQL;
	Mon, 01 Jul 2024 12:21:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFhv-0000000300S-3aQQ
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:00:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C068CC0007;
	Mon,  1 Jul 2024 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mMFdDlVb8tiUU5WEmsBNo9BoejZis2bqk/srViz/iU=;
	b=AxdWh2iPt5xV83865WrQsdKKsm33cg8tiIZCQRdI0G/urVsuKUyuxPGfkCZyLi9VfYMhN9
	Mv/LpkDuIXI4FvUIdFlKpY7abT98KSQvkNeaBhStjHcMnyvX2XCflRrY92p/9t85UrMlth
	YdQWL0Bx43mL4w+D/hXQPb008V4VQHNJQi/rHktDbJgSQ+fYG2YIzLAkWNiMbh+fuKwuwo
	zZzy7GYtbty+Zw//kx1ME8KW3imMOnaHAoqu3+qwtDnL41tNvpq8sDWAfneotFVcNxWwUF
	/cFTAQgSVFyU3deqh5S5RxxkmaSAPJAK1JzwYH1KSC17v7or6cpdIHv90UGk9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: mxc_nand: use 'time_left' variable with wait_for_completion_timeout()
Date: Mon,  1 Jul 2024 14:00:29 +0200
Message-Id: <20240701120029.525541-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240604212919.5038-5-wsa+renesas@sang-engineering.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'73c6e7963ee8b835c5f267222ec011510be2b630'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050032_491926_B4FF8965 
X-CRM114-Status: UNSURE (   8.45  )
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

On Tue, 2024-06-04 at 21:29:20 UTC, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
