Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E9BC6FA8E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyJ907/lJY+JXZt7SCW50HYpA55hSWHf7SowY86FIuo=; b=V06Ezxl2qAAjCv
	lJV5tXrSy476G+oxSJZq1wvPFRnmownsnF+n37QQoKY+IU1b+lk9AbkN2hyJvEfSLAd2E/c4CSvBS
	7+NBhHin1hq0DawjTlqp396pPFsyukhZuuQx9xcNxMtxtP/mw/IU3mbDn9b1RzLz56P4kvHOmbkxl
	tRVijCbWuVkF9txf2xJUqiPmkA4JEghTbxisuDdxX6ACxLf1fvYTI6BsMrv4LExdxh6PQZ6aWwtnq
	ZmRRYn7Wx2g9+fqXPmR0J9gLIWr6r7W1dmROMrZK483Hwv2rHrCpw4nsuHwfk0xRJtr0EDphZp8ky
	dnFnsE93w5ff3XpEBA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYm8-001vHC-PZ; Tue, 20 Sep 2022 08:38:40 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhd-001rHT-LP
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:34:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A624F200011;
	Tue, 20 Sep 2022 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQweAP3HNPtak+u+oKPn4CqnRS5WVAKoyopZOUVCgas=;
	b=M/h2aeigHXMdF8T16c4yvwQZZltX4YIt500VAe457cDdLLk2ihE2gql9wYVNx08H1Rpz/R
	CXFYggUgVYoD3SK7naHQvReY9li2z0VU7aCfXE73E9ZLWp212fd5lD1rGE5Sfb6vtf1+4p
	Ve6xzWIwNIvpR+UWcDq/166jzIe8zFa0j+MPYVe06hxqJCQ0rt4xouzLd+bSNlr2iPsC4U
	l1EmW9x2ovSLlJVYYOEq1PnD/kaf2NzGcBKc+BTTIQD33G6KGuFh680OxWOzOjfoDHAiWk
	g8Lby1aSt0hmcFsjCMFtLoPhIDILK7eSh6rSwID324VcbezLabLUg8B3Shj3eA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: rawnand: Replace of_gpio_named_count() by gpiod_count()
Date: Tue, 20 Sep 2022 10:33:56 +0200
Message-Id: <20220920083356.601121-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830183336.49966-1-andriy.shevchenko@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ee9280aed58ddb275f18552fb256cefbeb9db09e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013401_983111_626A5C06 
X-CRM114-Status: UNSURE (   6.47  )
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

On Tue, 2022-08-30 at 18:33:36 UTC, Andy Shevchenko wrote:
> As a preparation to unexport of_gpio_named_count(), convert the
> driver to use gpiod_count() instead.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
