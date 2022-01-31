Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A53C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3EqjBt4XwOy2o0PFSJzuvAoQAh91NqeXtmKngaLczA=; b=MkQyMczSIvBpjT
	ZceFqz3s4NpIUKQ8PN4cy/C2a49XD+Ig9e/0ZGQCG0U7FDELA4ID9Yz4SHDWmqbISWtNCO0BlWsIv
	Gt4RJuzAV9MBnfiiGPmQtJgnae4yvF3A7dZFO505KZGWU1u6pcXff0fkQUL7O04iDUoEetPUT8HQe
	hHmLFFLnJvoybzlrK5U81hyHgREflIhQFLizh0jrpf4RCg49MpaoKk3QdT8OZq0pbHXlij6sliMoT
	CCd23GODI5EIvl5FeoLBVQwrJVLLqnlwnPbAX3DRztyv2FfGV6HmQ+Yi1z6pP+Lf6quwAefYveaVO
	O8BUKt96gellgCP2HPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZZL-009rvb-UC; Mon, 31 Jan 2022 16:30:20 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRp-009pvQ-J8
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC08DFF805;
 Mon, 31 Jan 2022 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dL05merQzECnv1Pr1qf2OOcN6nM9QYBPBxi/5okjGxo=;
 b=DZlIu5KroUI7Z92wv3h4G4RmWoab5R/QmWa8fuMSiUkD+UxQ21TD1RjmpzBA3YOotD8MkE
 pNBi0m9UCe7DSyHZ2LHtMiTYS6G9J02ZGzNSZ3+BcR0uI2GetFlVjeJ78knc6kNi/A6nXz
 pSoj+4HYvi2q4zsEA2YOqBZccv6O3XabT9l8maBgI4+ndgmc3UvnSIWSVFlN1eRzk6q1jR
 hihnIUpu613oaIoF5wQzYj/egmUojwIj9/znoAhvIsBggeN+Qqm7VSkTCBfpXZ2PaquMYR
 fUF7zSBcEVvdov5cTQM+dIoFmyAlaUkqaV0pwvWRg9P5dqgB/5Z9uwUzAcXSgg==
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
Subject: Re: [PATCH v10 05/13] spi: spi-mem: Kill the
 spi_mem_dtr_supports_op() helper
Date: Mon, 31 Jan 2022 17:22:30 +0100
Message-Id: <20220131162230.24106-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6e3c0bee1a87893638cdfd9e2865a82158cf8119'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082233_856108_400045E0 
X-CRM114-Status: UNSURE (   7.22  )
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

On Thu, 2022-01-27 at 09:18:00 UTC, Miquel Raynal wrote:
> Now that spi_mem_default_supports_op() has access to the static
> controller capabilities (relating to memory operations), and now that
> these capabilities have been filled by the relevant controllers, there
> is no need for a specific helper checking only DTR operations, so let's
> just kill spi_mem_dtr_supports_op() and simply use
> spi_mem_default_supports_op() instead.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-6-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
