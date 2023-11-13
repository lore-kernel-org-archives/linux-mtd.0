Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30C8C4167D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30DLFKf1FnvRDD238QrmX8+zbnoknJnf+4UBAElTxf4=; b=V/wOKoMFkMsqHX
	WsRbg9ztyEEjoJZWkiUkYG6mkPXnaBl+FffYl5c88uhrzSzmvYjfNBaO+FsrnBA3I4gT6050TCy/L
	OPLqyX4Ht6zoyv8rTLpbnax5Ji7gYUTdqMPvY1TBXsWe38+wDLpjN0U1UmrtaYBpgCPm2aD1gNZ6o
	CX7KoCsUgiC0uj510LpnkVh8Q0O1qEJgrP+J08KL2cLkF+V6D4i7806twsZZg7tH8e5VrjUH26TIR
	5tBzPeMCnFXJ5JAaIBQqLXclBGKnrkmtHgxxnRfXMo+hXJQudRlNcYtDJLUs2zS1SH2nKGBcAFBsg
	QbVkGl+kd+xZ0CpqV5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2UoT-00DhGo-0y;
	Mon, 13 Nov 2023 11:09:05 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2UoP-00DhEv-1s
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 11:09:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C701B1BF208;
	Mon, 13 Nov 2023 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699873734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eaphmM6hYiQBBEFR2QDcmwO2Aw4HESGApRcZOOVCqXE=;
	b=BijmxQERoMJLuoyPvHgHMppRMk9EGPFtaz3Er9me4bT3uAkjxg5jxzib5ndPgsyoGKC9S4
	ksq886+JqTIBAoRgkjYzJdFrTR7QtQWZIqDda4l2Fkt7O1CxL6hq0RQu/wWe8m89URQagd
	zOBZursmeyUeb7YQlYNHwiHDfqKRdt1kRWI9WCBomfZwFaps46pHL0z+/YqpvH/JRWJsJG
	8HBzaDj+uSpDQy6/dxmUZPEDLj3sjU+2cmC70YhLb4hQqwsHcx2522TAbIRe6A/G7Clsuc
	yDXasF5fP8BqEIyzA/oZp0LKJ3iD9MrdWpyqBdSB6utpfpbVHNSe1i2FxC3xXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Stefan Roese <sr@denx.de>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: gigadevice: Fix the get ecc status issue
Date: Mon, 13 Nov 2023 12:08:52 +0100
Message-Id: <20231113110852.281040-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108150701.593912-1-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7c1b1906229db88c487e21e1ecb622db64a1830d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_030901_765803_22CBA9B9 
X-CRM114-Status: UNSURE (   7.08  )
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

On Wed, 2023-11-08 at 15:07:01 UTC, Han Xu wrote:
> Some GigaDevice ecc_get_status functions use on-stack buffer for
> spi_mem_op causes spi_mem_check_op failing, fix the issue by using
> spinand scratchbuf.
> 
> Fixes: c40c7a990a46 ("mtd: spinand: Add support for GigaDevice GD5F1GQ4UExxG")
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
