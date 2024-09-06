Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2748CE7B1D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAUySvguwV7pUqLszKpnheYLowOxG0fyh7ouPXagcUo=; b=B/fqRFjKAhuF9x
	Zi1Kvfo1xlp173ptpwPO5pbQTjSUrIo7baBjyOINwzSWow8W+7EWWZYOOUOHeRqfRU7OvLT6h1je5
	hVHtPFzQsLiUTTj/72HzG6Fz/eJXh/KzWsL8OMTwYJQLXWfpFlhv6f6nr6RPs1ldRn2Ra//zGx6fm
	5haO2pB0/XjVKwey/RT8Moe8iF9CGhUUtXg9Pu1EOLg3AmBrtWGmfFiUq3Jh1Okxjxbdft3gOlOUv
	FMy2fLSy8CtWZCNE4pSQiHgyK9AmZvaSQeWO/i+VzymaP6CzxBISICgLUniHh4WcTbSQ4fqSK8Mb7
	u5DPbyI3QKD7UptKcRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY6-0000000CgCC-3xlB;
	Fri, 06 Sep 2024 15:06:58 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUN-0000000CelF-1oNe
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:03:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C92A660008;
	Fri,  6 Sep 2024 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT0YI3b+/r2+AXS837CiJjSFYLBKIiMwYJ1W7BGN9sU=;
	b=Qmj+0e2l227Pfgcjck2mxIL73yIbS4QQNTcnWnVWH6VjrAFeiq/Zhi9K/Ku7DMf2OnUEYB
	Xb8nqIIZolX6sVUSWoWRukrurTrDQ+heXOpNrmmpSrovsqe04xBIlzHNOEJG+c48nrzntQ
	7lbAL2o9corhmOl8OlBL7jk2Zg9XlDkll2t5AnM9lG0Tng0lrsv08BYGtNJsPPxWS9ewhv
	KIwMA7Cs/XaVnbT4fEpKNlSJiP9dDEx/yPmPdE7sbqpiwbGmFijaZwBNv8MNeNIcU+B1YP
	0FvRZbKZHf8L/oKNtPMYDwiIBKIqZg/HmAIUQcNKCHIEY53Uv0en5QlFJkH6zQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 5/9] mtd: spi-nand: Expose spinand_write_reg_op()
Date: Fri,  6 Sep 2024 17:03:02 +0200
Message-ID: <20240906150302.734329-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a06f2e7cc4de104b14971e08d37f9d08c256b053'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080307_771393_E778419B 
X-CRM114-Status: UNSURE (   7.17  )
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

On Mon, 2024-08-26 at 10:14:08 UTC, Miquel Raynal wrote:
> This helper function will soon be used from a vendor driver, let's
> export it through the spinand.h header. No need for any export, as there
> is currently no reason for any module to need it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
