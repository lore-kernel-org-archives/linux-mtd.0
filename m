Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E628C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qd8L/n1YCdRVHVXq0tLeLsbh2CyZ8u50+v01odzd01I=; b=IkdHBJcj1bWFRS
	FaYHgWCkkALagncKiXlQCyFU0FnFr5PcVjmh3MT7M5/E6t765orGrogN0n3uXsMKkK1yzjMn7x3I+
	cfgg1k6PSHBfrMRSLSx4U24/My0bnsqoiGtPOCtL58INbVLfadK/X4Y0DqUFQuidu/aP5QEzuDPcw
	uMiad7ZdSryx+SnolXEz3gBVy214ua0oeFDpQ7CbjSv5C9CzN5bHsureUeqqSEYSp6W3OhXaWWrFa
	G5Rq8qamHQb/WwsgGEYi0z5BoqjkoVH2w50Xgdl4KCOOGrR/iwwa8Miy9jYQip3iA0SeWXFMjHs8j
	MLS34lzLzVsHLLJ+7Qag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np6s6-00BXwo-V4; Thu, 12 May 2022 11:20:42 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np6s3-00BXuU-TN
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 11:20:41 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 035B222249;
 Thu, 12 May 2022 13:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652354432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=afkJX7Cvem/WO0jznzGUUKL5imd13N9V0sdXQ0gf+3Q=;
 b=oifvKZEFSeM1JFyaN/jJ/jlQXViRPnY/I6e4F50GXiltvpKQkZCIjDkwYpr/D500uwmlmX
 eryzl0s5NkWK9zPzZvBhcE8fsw4n3PuirvL9FqadMaFx/ILsefabG4J0ukxIBIsgkjcHJP
 QCKVd/IxHGZiQS+StBYBsFsHh6A2A0k=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: spi-nor: debugfs: fix format specifier
Date: Thu, 12 May 2022 13:20:27 +0200
Message-Id: <20220512112027.3771734-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_042040_139680_036A8EA1 
X-CRM114-Status: UNSURE (   9.34  )
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

The intention was to print the JEDEC ID in the following format:
  nn nn nn

In this case format specifier has to be "%*ph". Fix it.

Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via debugfs")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index bf9fda5d4d0b..4b972bd4b80d 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -81,7 +81,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	int i;
 
 	seq_printf(s, "name\t\t%s\n", info->name);
-	seq_printf(s, "id\t\t%*phn\n", SPI_NOR_MAX_ID_LEN, nor->id);
+	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
 	seq_printf(s, "write size\t%u\n", params->writesize);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
