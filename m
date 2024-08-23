Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29206C531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeN9AM64ts6o89ooaFnggVaJW/JjbwbQAQglVLfXdMA=; b=XoEqtEBarXZctn
	28hwGYNvtlOlTPSh35tsPpD6k/TOpSfNhPAjj/h2sU5krQ1qkNybkZXFXq1/R/7vgUiba/NdHyP9j
	bOKa2MrUNFvzuXqnF01KB0qdTzf4XnWTuyc6fmy9C+uL8TFtEhQ64uxDNUPzRBpNHBg0wS1J+6MsN
	1qj5f62UU3Uq5Dgfx2P0LQt1ukhxiCyi3JLIwkQEIYyNnoHl/CrckAU0Nxi7BrifESixuj2IID4sd
	lqxi1SKY6VdC/52EIJ3u47/jsJ/0Gxl4Ddzc9eGe63k35PSkHrYYhKQOvSTS5/k4AI15Bdrpy6n03
	25jA7h1vXtDADUBaepsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYBw-00000000AQe-2dYs;
	Fri, 23 Aug 2024 17:35:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYBs-00000000AOZ-1YKp
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:35:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66366FF806;
	Fri, 23 Aug 2024 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHT1Wq5o5PPv+C7Lif3dYKEgNEol9JXhGL5aV8EY8LI=;
	b=NgRyzyva4Eb6wFBSJyYUhNrI6dAQ5mkNelnNwv/P067aQ6G27jDh31zX0YkOPMT5xyb9gE
	lBUPdJRvLt5mX3nS6U+hoVI9pdigU6IOgGwf/I+YgaiLYuBp8H5XltOIILHuwepPdlLqoh
	0DDEAloF227FqcAP/fUqx3zMSJTiNWtH/kcqbFZHOgSGh4V2wTeYf6VjTCgh9UsbbWeWPK
	q6U7/8tWxzjm6FfWfEiuEQpxd5HfQPNId3IXxAw1z/15qmOCedhB+8mIiJVAEB/PYBhsq2
	2dDeeEoNJQpOBDj0DOiLvdi7XRhHNpQBwTJ3T7Uyqv67sYoZqbiSkP6bNfDvVA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Chia-Lin Kao <acelan.kao@canonical.com>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: set bitflip_threshold to 75% of ECC strength
Date: Fri, 23 Aug 2024 19:35:08 +0200
Message-ID: <20240823173508.517440-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2117e387260b0a96f95b8e1652ff79e0e2d71d53.1723427450.git.daniel@makrotopia.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1824520e7477bedf76bd08c32261c755e6405cd9'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103512_633866_E3EEBBE4 
X-CRM114-Status: UNSURE (   8.63  )
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

On Mon, 2024-08-12 at 01:56:41 UTC, Daniel Golle wrote:
> Reporting an unclean read from SPI-NAND only when the maximum number
> of correctable bitflip errors has been hit seems a bit late.
> UBI LEB scrubbing, which depends on the lower MTD device reporting
> correctable bitflips, then only kicks in when it's almost too late.
> 
> Set bitflip_threshold to 75% of the ECC strength, which is also the
> default for raw NAND.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
