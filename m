Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CB6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1JvBFS3zx/wTFFkvQokzE0ig5a5lt8T9Kg3fb0SCBE=; b=rSKtm7iFUeqWu6
	HsWid+SZQ568K+aARZAnmjFDhLw/jYon4RjmZa8m21uEZTk5+gtpwTQeHh7KHEhXrcK5j6VERwbhW
	duVe2mh11rWxK6z6jK9lOrdbiA5CHmmlkl6rPQPX/rniy1LVW/7ty4kyQVsG5IewSd9Ixxx+x35Hm
	+yheXwwV2ixEiTYm/4vjCnVgMFUQPeu+7p38RYvXIoji47P0qhETU9VRIBfVMGM25dBO6dnFuN7Lx
	eTfN6DXztatUfdThNoLPxeQ/udvAcUXsEzCOKeTqXhOOxcs/+sOc49MVCrPrjV02uLfFtCmGNsmdF
	o6iLxaS+Nh3519gIbaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8GC-005lWb-Ho; Mon, 21 Feb 2022 12:57:48 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7UX-005Xzn-6p
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:41 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A94092245C;
 Mon, 21 Feb 2022 13:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+etW7jzC7OWPI2fMPjfRTOpJ5DdDj/wXEqI0+Wud4xs=;
 b=uh8hBx0ikTe7+OSBt58HDvOpjRz7vJfwfGjJdyt5YVAUTn3+jlUYxLZDwWT5XgTw49qaBO
 FPmPQHmnM3pGKhEZxf1L61Q/ILYMcQ+1XvF9fgJwzUFwKcF7CyW3PLASf3V8cJ0AW5Y2gO
 SaZ2xFCW3LcQNy3sLBWQLeUyKhxCtqM=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 23/32] mtd: spi-nor: xilinx: correct the debug message
Date: Mon, 21 Feb 2022 13:08:00 +0100
Message-Id: <20220221120809.1531502-24-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040833_472176_A815B57D 
X-CRM114-Status: GOOD (  11.42  )
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

XRDSR is a combination of xilinx and the RDSR opcode, but the register
is just the status register. Correct the debug message.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index ffd5579d45cb..9459ac2609dc 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -87,7 +87,7 @@ static int xilinx_nor_read_sr(struct spi_nor *nor, u8 *sr)
 	}
 
 	if (ret)
-		dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
+		dev_dbg(nor->dev, "error %d reading SR\n", ret);
 
 	return ret;
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
