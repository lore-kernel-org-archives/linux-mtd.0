Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wh7nPUrKYASK+OY86NaKHqoUYAsyMjdbijFwmlmLK2c=; b=ewZxu7NuP5lCGq
	3FcHnea6Dtz2DEVMl+vQKm/KgHgJ5vGYeMbK2AFHYj//o9SWr3OvDWVE36QaTg8q5LY6YYfHS/2rl
	EdUZVwVzihX4nwwjtySjRK1FuQDsKqrXohLFbbAfk0erxjZTc6cpApbxu18rIpDxNcUX7lm+aoBHy
	9kJ36FDKNEDoABtuDaOqXvAS/GMqI9x7vElLgVVXvPbHYA43TdvQEQdVRO42rv0E4sykFCZ75L6nz
	b2K3kfNMWksZb9vj+Pf2trjbO1Z10cyeP9WVxEPDDxHH/5iKDTijhNlDZJNK5OX/+GDcE5l9Hds3W
	DUDfzNHL5flP72qTzGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZXz-009rZN-Lf; Mon, 31 Jan 2022 16:28:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRk-009ptb-AW
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57107FF803;
 Mon, 31 Jan 2022 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKUycR3XcVmomFNR09l75jCJm2qK8Dij9qhq6ySE4tk=;
 b=gHd874RhQl5aQEtFurgCQMreQB5RnNi1GgfjS/DLWKxcG6FZDm6VJxCFu5Zk0jZps+aZnU
 /lDQvWBam+Fmkwv9XgrUeSyfF/vp574Zus0RNFg12u1jhkHWqWG69Dx0TlT63tfRz+erOe
 1axtyUdiQzI/Gij4HCLwI4pd0gb82ZOfmRx25Yg5M2INyqskr0mZ8B57JOmPT4nUveyM4G
 5gjNHOeMzAC8tQBR0/mRBCko7bhVsSI2GoGnYWfGWvLEmJX4se7P0KXHZ+Lyd3FoQ+dpvb
 Zp606KZ6pmJ3nDIeqaENv+fZV8QmdSVxSTyM5DaU5GtfcJs5hCM67+PGf6zhfA==
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
Subject: Re: [PATCH v10 06/13] spi: spi-mem: Add an ecc parameter to the
 spi_mem_op structure
Date: Mon, 31 Jan 2022 17:22:24 +0100
Message-Id: <20220131162224.24042-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd0020bb2d2a6719287cf8f53dbc1eb710f82fd57'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082228_587337_0B7D13C3 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu, 2022-01-27 at 09:18:01 UTC, Miquel Raynal wrote:
> Soon the SPI-NAND core will need a way to request a SPI controller to
> enable ECC support for a given operation. This is because of the
> pipelined integration of certain ECC engines, which are directly managed
> by the SPI controller itself.
> 
> Introduce a spi_mem_op additional field for this purpose: ecc.
> 
> So far this field is left unset and checked to be false by all
> the SPI controller drivers in their ->supports_op() hook, as they all
> call spi_mem_default_supports_op().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-7-miquel.raynal@bootlin.com
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
