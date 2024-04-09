Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E76C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amZAUy4MPbD75FHWVsn4E3BO30geyPZx8EsRqkV0OnE=; b=Ztl8CPVVzqGjGp
	lYbQG63Rj7jAqT9y/MBotzit4ssfFb78+erJNGZtDoluq7Yf0DLScbIClakoMearE+sEY71Tj6f3/
	sFI4bKf1FgfYge9FH9mn/JwmfroHYL7SlTE+csly6l+Y53C86tUqeAmoNIGjwOQVGz2zTDSg9wu9G
	qJ7gtOUlR5Z/MKKJgO8aDneDYsUJUbNW0/E7rCPcjtnaCWPtcd+iqOxI7rshK+MTZY7bxAgXYqTy3
	ysNXbG/SzfcvFtaBp2h5lyPOv9NRUSS+WrUs6L/WtuegN88X0KTKHFmtSRqyn8hEgWCNMqd9PG0gy
	aDDanLJjHd7eaT6O2iyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5AE-00000000cYD-430T;
	Tue, 09 Apr 2024 06:41:02 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5AB-00000000cWZ-1uO4
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 06:41:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD3C91C0006;
	Tue,  9 Apr 2024 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712644855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jM/2z26pHl1ahZGM5qsx5eHbqGHFWgwdLhCwXDhXfU=;
	b=XH5Ev4GoCWiNGeuljZR2mZAVid1756rDIx9BMDPGPJEPuz/AnpYxKPJM5z4XBXWaP8nema
	Yoi+rYt/q0fY3akBTuLWmv1cxWW07fpVH1EIhtEyXQWB+rVPB+HzeMmvcMseHZwBPJIO6G
	P3fKNhH2aeb9DBvtR4t7LTO78ZhXyewJegqV4ze33Xtmwo0+DdHWcnju35j4Wtd2IdP8Bq
	BQycnPZP0DNTe7cpvXpFNUc+bXfxp36lrm23IXP88OOU4zzrBiur6rZTdAcy9JVi/j8NZO
	BC49GccZpVP6CKy5JtO8Hmca6lIrXkqwUlokzBzQ8P2iLNB5gFJiZokID1zF3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Erick Archer <erick.archer@outlook.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: sa1100-flash: Prefer struct_size over open coded arithmetic
Date: Tue,  9 Apr 2024 08:40:51 +0200
Message-Id: <20240409064051.91775-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <AS8PR02MB7237AC633B0D1D2EBD3C40E98B392@AS8PR02MB7237.eurprd02.prod.outlook.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3ef4600f12269d489933b3835fe8d43621e4ee6c'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_234059_661331_790A8155 
X-CRM114-Status: GOOD (  12.58  )
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

On Sat, 2024-03-30 at 17:55:35 UTC, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> As the "info" variable is a pointer to "struct sa_info" and this
> structure ends in a flexible array:
> 
> struct sa_info {
> 	[...]
> 	struct sa_subdev_info	subdev[];
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the calculation "size + size * count" in
> the kzalloc() function.
> 
> This way, the code is more readable and safer.
> 
> This code was detected with the help of Coccinelle, and audited and
> modified manually.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
