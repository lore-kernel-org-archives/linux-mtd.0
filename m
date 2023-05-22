Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82050C77B73
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtMa+hAYvBgIRIP0oQ5nGZqYqWkSMuNrEVIXnAllUMI=; b=tcJ7fkIA/ljkum
	SWWh8V3rl8qyP+dfbz7DV/+V+2yCT7mP7ZSy4DLohyslM8snR7RlrGKNxtbCoLt5+H5GUEm1mKUbS
	ZODcB9dzzSKhMsv/K7+NOouf4eLhe84LP5lVNnyPWODtzTMxxib53lVVJ6UN0968QLRhMskYwIyzZ
	p7kGcGpjo9ffUI6hqYColZTFarl/tfmJHKoEsTkZNvi3hdohbE2wtLGBvhnJ0kLRJ3uKIUST35y6E
	GHwVCQQiAwWUWpHrApYalQjMuKUFhCnJObTe/mnm49ffbKQol0+TgEfdvA+qSXrqwnmRzuIer1vti
	AS2h0T9JXPG7Fo4sT+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17w0-0077bv-0B;
	Mon, 22 May 2023 15:58:56 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17vv-0077Zf-15
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 15:58:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6214EE0009;
	Mon, 22 May 2023 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684771129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kRhN3nhoRvLHX9ULUKdlTr8n0Dhwe8XNUhXojW9CbN4=;
	b=fnfSSEjrrah/faLLdXMylzu8+6pYud74dSSedOorEws0D3Qn7YSp7rNMOoX9Llv8RtdBZW
	z2Vvffmru5f16h3WCyYcTNi29oFJeqCvXyV+sGh/18XscxQS1hLuOdAgwS6dmkmpFO2LjI
	k/WboUXnk3SacFWJnvzU+cirXlTzvVKlk9lxGr2oegYsRWGaCtul8NM6Ag4//VGP9Tn8S+
	HNThRHR8KhoyogMcD7Ggo5aHc9uk0HzmwxJyyUnSEqRFqyqGQVIGbgceNGm7HV87pwEGEt
	bT7tU8pLkTTkqFP5MZaWBv3HdY4IwNsQ39U2s8n4wV4JJGW2cBdUlnFuWYFRSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	miquel.raynal@bootlin.com
Cc: pratyush@kernel.org,
	michael@walle.cc,
	richard@nod.at,
	vigneshr@ti.com,
	Takahiro.Kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: make sure local struct does not contain garbage
Date: Mon, 22 May 2023 17:58:47 +0200
Message-Id: <20230522155848.46842-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509193900.948753-1-tudor.ambarus@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'38d1384c83954ad3eec90bbf0853034d1680ede7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_085851_503090_624174DC 
X-CRM114-Status: UNSURE (   6.65  )
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

On Tue, 2023-05-09 at 19:39:00 UTC, Tudor Ambarus wrote:
> Following errors were seen with um-x86_64-gcc12/um-allyesconfig:
> + /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]:  => 495:27, 364:27
> 
> Initialise local struct spi_mem_op with all zeros at declaration in
> order to avoid using garbage data for fields that are not explicitly
> set afterwards.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
> Fixes: 6afcc84080c41 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
