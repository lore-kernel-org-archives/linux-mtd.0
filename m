Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936BAC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpfRVq3Wy4g9u7gNazWyRAHMugLkHmurlDKiZMDPIMg=; b=AF7TwQtVdfwPYX
	aw3A9DXtHUOZilbuWbz9ftvCi5WPuJYR+A/pT4bj8WMetv2mEaZc6Vj4C2kb0DMjQ59paq1MuInuo
	qilLwJTZ+Pp53NYds7No+S/KEXRoYczPlvLLJnDtFyD+BZULfOJsKDgfNDCm02RQIKlpP/aVeKkk/
	op7rQU9gelNRgapgyueks0JvUDh10gqvWPinMXroqJyaYLg+ep0PuGYOk9GLuXNZ516QB8jlrI5I/
	QQjD3tm5kb3zeWUSNCsaf8N4g4FTwBqspD78+49ZmzOSPfYbuPOeEo1FntnZvTWrjdZ2v+VFsX8YH
	ZilQUxxBa2ejEa/wAlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZWp-009rIf-JE; Mon, 31 Jan 2022 16:27:43 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRf-009pri-Hn
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D0B4FF80E;
 Mon, 31 Jan 2022 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKLqyEQnVslm98yvtjPp9oskrhJ+hPB88eL+N2otoMA=;
 b=kDkd5wwFe1l0bkBVF+LcjE9z5ia5nN3JWatgquLgwoJm3KYrJvxOLbKFgEEeBUll841XR7
 RjcUU5Rd8ErJbh2OsCN27pHQTKdyGgm0/BA7o8Mbr0nvVcaTjlije4w+KGj5zfOb0MbFDh
 p4XSm6R/MxHYl1Y13xWXDPS31VWj95iKcUHxoKztGb+MXAkKZdRhXTp0UWUpI7Xb3EwV/g
 234IkNATWmWs17XXn1MuXImUSqFFIdodpaDW9VKuKNpS/aepjWZ0NYU1ybd6C/kjNDW/By
 e3KyinSPTdyyWs9KyKx12hflpVPTx5NY0J7TgHpFPDVSKNbRebT+h+sem0NnVA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 07/13] mtd: spinand: Delay a little bit the dirmap
 creation
Date: Mon, 31 Jan 2022 17:22:17 +0100
Message-Id: <20220131162217.23978-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'adfbe3dee2d1cc4e06aa218de6682014343632a9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082223_789691_A6969F60 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, 2022-01-27 at 09:18:02 UTC, Miquel Raynal wrote:
> As we will soon tweak the dirmap creation to act a little bit
> differently depending on the picked ECC engine, we need to initialize
> dirmaps after ECC engines. This should not have any effect as dirmaps
> are not yet used at this point.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-8-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
