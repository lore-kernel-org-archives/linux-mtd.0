Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DAEC25B7E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GfYsRgV30VPPxxfN7pgto4umr/ChA+mIEKyzrhz0kY=; b=jYGO1PiIr64/JZ
	uL/lZvzjvAESo0lWN47bB4f7ldneDDcXUl0GH9Dh1twl2aiS0JEm2atczT6HFjS0d+FWj/VHk7tQM
	Y6++MjvZenHaIjOLFdSIfv0pdMGvwDHvgNJ03Naq/Y3m6JnJGEJ/MQYm4P+Z6I+FBqp5B6GEyH1WM
	62wTmema2XDTv7To54RoNg3j8K8LKf4WFZFyQiNCo9Jy2xlxfi687ZAB7Zhe7luaOQWL4ApgR/v6C
	BjvxVgBaxOEnBuCEfZHSx3ibYBxM8p0tVSI7hizSqxVNrBF/9XnaYOdQp6ggGwolL+Etlv6wdJAc4
	W/pNMO4qONIjrJJwyxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFx-0000000EoZT-1A7B;
	Mon, 27 May 2024 12:15:13 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFr-0000000EoVH-14fj
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:15:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EDC9FF806;
	Mon, 27 May 2024 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycfn8V0TO+0cAWPu0IIelsCn5K2PufFE56/wIItVhVs=;
	b=WR5qzrYZ+FJtkM9EfQGTWaCz/RdiUWlsx+mC+Xqi5c/XiuJfHb8WjSnbR7DcLKFtEF1R8V
	Up3IzNtko4qOU0jR4+qtvVZLE0nPtIRQajRuIgAx4jPt+XGZnc0lamW6MNedJK++rhtBJw
	tJ1k6aoz02mGLEvYONFhqU7IhjTu8IiiwrSf1z53/xLqOAhFLUUw3qn20cGtYaE1v5HKKd
	TYqJQqMgHdhqBVRw3tE75YwfYa0eeXF3s3AREg1DaWJTeq8hcr/Cw4sMiHtvFaYzYAaefV
	kjFoei0TxER6V4cQe7oJ2Y7bETlOARjw5V0/w3sNLTXtR0rG2WTI8udxzv1pLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: Ensure ECC configuration is propagated to upper layers
Date: Mon, 27 May 2024 14:15:03 +0200
Message-Id: <20240527121503.29794-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507085842.108844-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3a1b777eb9fb75d09c45ae5dd1d007eddcbebf1f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051507_524861_5F12BE94 
X-CRM114-Status: GOOD (  11.14  )
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

On Tue, 2024-05-07 at 08:58:42 UTC, Miquel Raynal wrote:
> Until recently the "upper layer" was MTD. But following incremental
> reworks to bring spi-nand support and more recently generic ECC support,
> there is now an intermediate "generic NAND" layer that also needs to get
> access to some values. When using "converted" ECC engines, like the
> software ones, these values are already propagated correctly. But
> otherwise when using good old raw NAND controller drivers, we need to
> manually set these values ourselves at the end of the "scan" operation,
> once these values have been negotiated.
> 
> Without this propagation, later (generic) checks like the one warning
> users that the ECC strength is not high enough might simply no longer
> work.
> 
> Fixes: 8c126720fe10 ("mtd: rawnand: Use the ECC framework nand_ecc_is_strong_enough() helper")
> Cc: stable@vger.kernel.org
> Reported-by: Sascha Hauer <s.hauer@pengutronix.de>
> Closes: https://lore.kernel.org/all/Zhe2JtvvN1M4Ompw@pengutronix.de/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
