Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F75C32772
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Aug 2022 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qS29XZ2jLQuRKFGRUX6cDtUyKEaxjUVsIrfbE1EyRJo=; b=gAMqpj6XhUahzs
	Pz+5uNah53MuCvozU96xFIwpwIEtvBqomeB3n020+x0hZa3qbsR7lxW2K1U5tgF2ZuRlCpGXjdGn3
	HXjKulS1+tTPpf8pRE33CFdM7XJ3bsqVSpFBGE1CUx8dkwohDhzpU3BH6bNzXIeJ1Xr3SqdgSqQ/L
	eSE0m23YGpeIJ5L32EimoR7qkapFpq/PhTqcIv6eOjrHcX4ijSeJtUWpy3pxLkj6u020e0ykzkM44
	QFj5zQqA+bWozfvgG2niWU88NMwSvSpsEVx1kdWTfHCR6x7kPoW7sSpIxVtEuUpnY+6v2FoAXfJEU
	ib1qjZOYDAo/tZMiNgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPNp-0043jL-I5; Tue, 23 Aug 2022 08:35:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPNj-0043YP-Dp
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2022 08:35:33 +0000
From: Steffen Kothe <steffen.kothe@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1661243722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHZhUu2ccDpg1lo4D8KBFtM/joMkDfMyakRY3YyWn00=;
	b=gtYJzZh71Yq4zXhLUryU2IGXEdU774iVhG4Q2Q3UOlWbWxgGkl+1z6UQEk9WL7CGmOmwAs
	wpI1Fm864XCcmHVQ5zFDwNOBDzeW0dX+xoXctNjhdPlcLYIt2LK7dre+fBmLkfyVreC7My
	TkpuRVh90AHjqJ+xdMzrplxGLhtIrqexP6zz+U07vRB8prH21wKcRKAP13RhYNfeS7GgC/
	Uf8xDmukywZdWBD3fs1fKcjUTf8e7AvrLHxJDeY/SlTrs5Sg9I84w6HP/7OCmlzlp84zcX
	woBzBEOcAOXmxhPyRWvy56NBz5RbznMizqaReWUlnVbXaoPgWwdkyzWbHtKyzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1661243722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHZhUu2ccDpg1lo4D8KBFtM/joMkDfMyakRY3YyWn00=;
	b=tZOjiEIiw8QfvXrbfE5ZPXRzZ4jPhEy2SYGTT12k3WHUo9OunfBJwWAuDc/n1cKpVw0XmO
	oT0xL0swIyVLK+AQ==
To: benedikt.spranger@linutronix.de
Cc: review-kernel@linutronix.de,
	Lee Jones <lee.jones@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v1 8/9] mtd: spinand: toshiba: Demote non-conformant kernel-doc header
Date: Tue, 23 Aug 2022 10:35:17 +0200
Message-Id: <20220823083518.26624-9-steffen.kothe@linutronix.de>
In-Reply-To: <20220823083518.26624-1-steffen.kothe@linutronix.de>
References: <20220823083518.26624-1-steffen.kothe@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_013531_687113_9F051FEF 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Lee Jones <lee.jones@linaro.org>

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member 'write_cache_variants' not described in 'SPINAND_OP_VARIANTS'
 drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member '0' not described in 'SPINAND_OP_VARIANTS'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20201109182206.3037326-10-lee.jones@linaro.org
(cherry picked from commit 6a21a1176f3b83464ee20687d48d7618b508de37)
Signed-off-by: Steffen Kothe <steffen.kothe@linutronix.de>
---
 drivers/mtd/nand/spi/toshiba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 21fde2875674..7380b1ebaccd 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -28,7 +28,7 @@ static SPINAND_OP_VARIANTS(update_cache_x4_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-/**
+/*
  * Backward compatibility for 1st generation Serial NAND devices
  * which don't support Quad Program Load operation.
  */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
