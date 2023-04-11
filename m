Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493B8C77B6F
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72Cf4Hbrhn51tFaF8McnXu03rlpFUSkJuCmPehTkXDs=; b=3FOfmlXAl7zMCV
	LXHNqFWN2KYq/4xZ2BqNmYBuRGwcgi4fcGnvFqOdKU+SMTy0FK+IYFA896vhfHUjDhV9S+dU+s6yj
	ERKZSpiSwjHMFgT0Y0iapJ4Yfc+h8iTb9Vs71bzaV4luFgd+mCmx8RqM1/dfGxqtWuK6gGcG3ABYy
	xGml/kMVgjIsN/jbmhIOXXL2UvlfaHdURHwn0TnFQmQP6Zs1aHxX4oJ4ji4J8AaT8sgRszEecHOhk
	98KytMOUukZG6a7v5M4qaDpszbTbknSd00y0fe1WFoRUSFfVqoWYCza/K+SJCHR1CGgYtm2WucpIn
	aI06YLNZvwWr+O5+Sh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEHR-0008za-2w;
	Tue, 11 Apr 2023 13:43:29 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEHO-0008w6-2O
	for linux-mtd@lists.infradead.org;
	Tue, 11 Apr 2023 13:43:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 45AB9240011;
	Tue, 11 Apr 2023 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681220599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1dCbFT5VKIbjHms71oFZy/8u7J+L0VfsXHy+SOmEY0k=;
	b=ftSsb8ZAyLUSONGkewKSwGPZyedH4Yum1pvEx1noBNj9eWnbdRQ1pYTaYCz5Eaca/mXGuc
	4X4DJS9aBUFobrzV3h1NXPm6OGtReRvRXmGFzPAZQkBUqel/cucEf9DlBcfVaDslgvuOWD
	FhOwemKlomnFkUFWGa4/hK2113B8ioxgzv0rs8X+nihTpr6lkMuYp5iiFbdUblEq6wlVxx
	32v6m4mdvBElehZuTevraINj67N+hyh3pIiMWnaX6DBQmAyb4pC2jYRBNefUGPg8Z378h2
	ZjG6wFOfX4mJz6bYZa9qPAgZsbJHxW8pKFZTpp4qExwYrtcSmHea31BCTdzV+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean Delvare <jdelvare@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH RESEND] mtd: onenand: omap2: Drop obsolete dependency on COMPILE_TEST
Date: Tue, 11 Apr 2023 15:43:17 +0200
Message-Id: <20230411134317.445792-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407190453.66efdf9d@endymion.delvare>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'94b8f77fdb6e10118d9df29351e11949d1799415'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_064326_910142_2467C5A8 
X-CRM114-Status: GOOD (  11.24  )
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

On Fri, 2023-04-07 at 17:04:53 UTC, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
