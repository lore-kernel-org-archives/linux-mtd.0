Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5896BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lam4GcS5mP8OIhwCrkHK6g82d1IGKW/zIB6H0lbNxd8=; b=epTYGP8up9p9Kd
	UpUV6wHHKcYGLXuU3DsoHQlLwaog+WGJy6d7Jo04TY28oDVdhehY5zBd+PknfjMUqnrATeoNavcV0
	5G86DHC666pHJkQd1SAZ9/uMHC4ij97M0j7mjdav4LYvcUeNzWSPCQPEwJBqsNxJjHvtScRcxsR3F
	zK2dmqEwMNFw1S5qsfJxF6Ws9vYTG0l9mejF659IubxuUxARhreq8o4NqawmvYoXc9A/ILATlC2no
	94zg9ShIwscFX/RFOrPNf+Vu714LPV92q60+Ez2tw7yJDg5UF6qYtt+vNy2Tjk7+tPOqv1Hp4HVAr
	XvwwlN1vSAHUtzlPhxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6cX-00B0AU-1k; Mon, 07 Feb 2022 16:12:05 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH67K-00An7Y-OG
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 15:39:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3274160004;
 Mon,  7 Feb 2022 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644248389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6v3WSju2B7mSE36VZ7dx7Lp44QoojX43k9fATwrWOw=;
 b=o/rXLu07Eyo+I46bH5RdHiVgOo50cTJXJ+LCyfSjwRxVM6AYZ6D3DEJjnlRskxk+UtCtCK
 cPijAl/ds1puX65m3yQJORcsMlUifaf+Noxcpmi8o8tvI+bv8Rgte1EEJTUOktO3PmlQjC
 LndxjUGY+60VxbPoVVNc0CKUJbcLWQggjJv6bdTOPFpUfCQMPTWSPJe5GI1gupmZEaLgy3
 FSWzLsYWLB4CgimoL3hT/bncNKa+UV1tj9fDahA4RtrIBkWFumDgfij0cJeuKIdwOBLQPK
 vX+w5V+lxnW1Opmhm177ii60hoChiUnwMzolibXjT6VyAmoRVXLMVO1UmOtZ+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v11] spi: mxic: Add support for pipelined ECC operations
Date: Mon,  7 Feb 2022 16:39:46 +0100
Message-Id: <20220207153946.710556-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220202144536.393792-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd6986e74ec6ee6a48ce9ee1d8051b2988d747558'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073950_987677_7E76973B 
X-CRM114-Status: UNSURE (   7.99  )
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

On Wed, 2022-02-02 at 14:45:36 UTC, Miquel Raynal wrote:
> Some SPI-NAND chips do not have a proper on-die ECC engine providing
> error correction/detection. This is particularly an issue on embedded
> devices with limited resources because all the computations must
> happen in software, unless an external hardware engine is provided.
> 
> These external engines are new and can be of two categories: external
> or pipelined. Macronix is providing both, the former being already
> supported. The second, however, is very SoC implementation dependent
> and must be instantiated by the SPI host controller directly.
> 
> An entire subsystem has been contributed to support these engines which
> makes the insertion into another subsystem such as SPI quite
> straightforward without the need for a lot of specific functions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
