Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2548C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AU7vWGf2IFxo+W7w84NySsgjSZWF1+PfhqYnsXFSn/Q=; b=RShv7b560Prmf/
	PpEYrgINh7BRnsJtNdyjIhBmfb5vK23iXFCwvOAzK7VN+qhxb1Hob3fsUNwPr8Wl4Rxdq8pgFM/t7
	dtQhPjVbSe0nOhbwTKm9tSFCEsLJ1zPdh+ILHabeaut5LVVfW7izPJSITa3WzfbjC4WYtiDckAgMm
	4e3TlDRC5tARvwoV0VTHmhvIPwIa6gn6Quu8UyEmODt+fBmTbce2vuzGfILsvqxoRrLYlcfaUh6gF
	j2IFtSPZM6nHqhEyTlKGylwglDw/gfQ0/SlAQ+uKY+NAzQX1Qs8CX53MrgCVITumBBGUC4UlUu63J
	eTqINzFNpo1KVw1kQ7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZVh-009r34-RN; Mon, 31 Jan 2022 16:26:34 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRX-009pp7-Ux
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9AF86000C;
 Mon, 31 Jan 2022 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJn1QbMcgZm6/T7SOxKlGYjeS/P8gdlrGz4HjM7LvkE=;
 b=euulx/ktdTkX5Skgjo0HaavTzDO9MNgcIfZHTF+U0oZfK7H2vSf7bB+Ob85fsZI0C81d3v
 h2veZYQQqi1ATf3DaMAwomDEH2jFynDeTnQv2SR7of6Qz8vEeItC2+22UALZkm6z/ehkW7
 GWq0Sb0dxxPaixe67Y2XqWtJkUTopL6CYgqwcF41/nUUpYsWx1pnt3XaK9glwhQ+lcQo/o
 0zsyGJZYwiATsGF8Jsrsl+ESHDA/CLsFlh45Jg3g5dfG22+v9YdgWpTHW095XLWz/FIFvD
 ug+Lz3fotsGc0lyyUaihHZh3lrXOFAGDhezylwVWhxh5+Nm5cvzqs+lMcD6DdQ==
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
Subject: Re: [PATCH v10 08/13] mtd: spinand: Create direct mapping descriptors
 for ECC operations
Date: Mon, 31 Jan 2022 17:22:12 +0100
Message-Id: <20220131162212.23914-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-9-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e501cc3c9f1dc607f5d0497ca63e321bbe0ce57c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082216_177595_D9897619 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, 2022-01-27 at 09:18:03 UTC, Miquel Raynal wrote:
> In order for pipelined ECC engines to be able to enable/disable the ECC
> engine only when needed and avoid races when future parallel-operations
> will be supported, we need to provide the information about the use of
> the ECC engine in the direct mapping hooks. As direct mapping
> configurations are meant to be static, it is best to create two new
> mappings: one for regular 'raw' accesses and one for accesses involving
> correction. It is up to the driver to use or not the new ECC enable
> boolean contained in the spi-mem operation.
> 
> As dirmaps are not free (they consume a few pages of MMIO address space)
> and because these extra entries are only meant to be used by pipelined
> engines, let's limit their use to this specific type of engine and save
> a bit of memory with all the other setups.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-9-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
