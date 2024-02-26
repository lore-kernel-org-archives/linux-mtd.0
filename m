Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742CAC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3YnYFysKPYzkFwPpwflAULigqK3U6gALCMBBWjNGKc=; b=CQQjWkN1+qOCtu
	u+24uzGepXlNd4QUzZCZy807ij9MJTNDCdSQ5q8hPuVozWRA8/z507IIAXJqy/CR6KMqpCVXTWL9H
	oy5d0b7l67i2fphIqmgT0YPWGqaxpcXBWfRkBtQOjzhFw1OHIo1CmWh6q6aGsP0+FCKDJDbWwnPFT
	uNnZQ6CYIFGMhEn6TgUEgVdnzfyN7NVDAgvr84tdbve4vHO7Uk4jt7dWIc5gLoyVDgzAVD9xraxMe
	kixxxvuolemghR44HiuC1MAs+2cg8Gvd7LaN6CtD/qtlZ2lNhc5l1/6CKOrrIFsDJpbW7ny9xZnDu
	68Yh7FheyhGqSopm35zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaO0-00000000fi0-4Bps;
	Mon, 26 Feb 2024 12:47:13 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTR-000000009Dl-2moc;
	Mon, 26 Feb 2024 10:44:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C835FF808;
	Mon, 26 Feb 2024 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UB1IOQo3ol1zgMkxzEY1pF40MDSbhNzWiuEXfhitfrc=;
	b=fzNGZ+YtkPXFUu15ymnBFHeanM/sUHd1Xd5ycAqqFj8uCd7XFNW3wj0a+U8R6qjWhVtqn1
	kZp+oHVdBSO73qt3/EhW6POoBWaY6Q7wM7Pq1/kRvhiCg4/VL8MNdmALyHInTVUzWXLQQO
	i7lcGnIDO3VFCi0ZnuiZjGwpnH0raSdGQKPy1AX29MQvXG5yJ7IYjxYri+SX0Pph/NeqNT
	qZPrfDqddX4jkUZk5J4rOCFrv1LN1FLC9GZforSfdA+MVTdn28xBAWCh84mJDX9QyoG32j
	b2jq2Pvxyu5vZcsbcNvOhSH0kERLTbd5jxMvd3cnfoqx4rCSisnHTlf/tgz2sQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 01/13] mtd: rawnand: brcmnand: exec_op helper functions return type fixes
Date: Mon, 26 Feb 2024 11:44:37 +0100
Message-Id: <20240226104437.489832-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-2-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd4bba1501f72e8af09f2cde3d327147de1b69f5d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024441_944207_47150ABE 
X-CRM114-Status: UNSURE (   5.91  )
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

On Fri, 2024-02-23 at 03:47:46 UTC, William Zhang wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Fix return types for exec_op reset and status helper functions.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: http://lists.infradead.org/pipermail/linux-mtd/2023-December/102423.html
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: David Regan <dregan@broadcom.com>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
