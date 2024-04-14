Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A797C4345F
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2024 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qLscLbBnRnvkvQjcHF030sjxCj6Y45qDicn154WaLU=; b=IbbY7m41cEOFpK
	ikio0SVNBegebyhK62eYWQOUS1EF1lXoTAXGtPfVpsppCqFzmfpXLZKZkKGeEhkW5+U/8bEU+4Lvl
	GMLt9Fu9ft6eSydL4jmJXLi2ZBFJK6FswVegLvgcC2XhQiqo4d7FlyZB5I9PAAl/CPXqIjmtLgdFV
	T2d1d5gIwtainFyuREVAD9clG2lKgW+AcU1mzBtPwGsFh4FAlutnP/IxakZmVY4nJ9wa9rCaiCCE0
	PAZlm4gjoPUgVWOXsoFQ/jRt/37El7GuVLDndxTO0OBWdaGmimr2kRlMgv1RaZ25M8ghzt3knzjiz
	5B7op2QRzZjj5+zSz06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw27e-00000005mnJ-0ZEn;
	Sun, 14 Apr 2024 15:50:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw27V-00000005miW-2aXP
	for linux-mtd@lists.infradead.org;
	Sun, 14 Apr 2024 15:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77B92CE097B;
	Sun, 14 Apr 2024 15:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5AEC2BD11;
	Sun, 14 Apr 2024 15:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713109811;
	bh=1siY9G7c32/jXXjmIv0pzxqYCWLt7XapCGkShk13+8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJxUIf6opbRLmamr7yUQE1j/d4/xq8J4ynotLlQB/lNvpVgNgQMXj/XZ75l2Vsb8f
	 a9zEEOCuQUXVz5uITy8NWUmgshUTipuwuaY+ruJq1egAoPoj4wsmJ8ngBj+2RTr7L1
	 zPKeoLuHzhUghhA2mlVAakHzhCzOYwNZOkNO+y4Kx7mq7aiABzcYPpj/1UliDgog6y
	 XY9DLmpPDbNy1zvANNyxLTdqRTrLXGf6nGDnzq79dBfwXNczneuGW0cXUB8xNEoAaF
	 +aX45htApFHAvRnXBjOzlqeaY/C8GC2scd4aJfm+MgEedJhgv2anuBxVX6Ns2jSXsq
	 l5ZLL8xWleCAQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] eeprom: 93xx46: drop unneeded MODULE_ALIAS
Date: Sun, 14 Apr 2024 17:49:57 +0200
Message-Id: <20240414154957.127113-3-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414154957.127113-1-krzk@kernel.org>
References: <20240414154957.127113-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_085018_348353_54EB3B10 
X-CRM114-Status: UNSURE (   7.86  )
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

The ID table already has respective entry and MODULE_DEVICE_TABLE and
creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/misc/eeprom/eeprom_93xx46.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index e78a76d74ff4..45c8ae0db8f9 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -578,5 +578,3 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Driver for 93xx46 EEPROMs");
 MODULE_AUTHOR("Anatolij Gustschin <agust@denx.de>");
 MODULE_ALIAS("spi:93xx46");
-MODULE_ALIAS("spi:eeprom-93xx46");
-MODULE_ALIAS("spi:93lc46b");
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
