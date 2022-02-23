Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C39AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzXFuUJj5hAgu5VWXQQWr5YQa3DsG1h0k+E2YNyXf5A=; b=lEut9BkU2buS7i
	mtwhgOw05EkQn0NJ+L3oYTF+ZSI7N4X3f1cINvoGDOcSNFHyjcb7YlEcuvq54ppzE+POazaGSNo0E
	nH5xZ4B18J8mfq33S44dCyFvw4WTt1F78Byoxk+EShSrb6gjW6vjjVrUDZLCRYNbUt+KWeai1snGc
	4Kf7n0SeeE/ZWJWBp+2TwCOgEuyXU1MOsASTf66RyKuBSfAjh3ob1JcZtCiQ4wJPVkfJJMygkcxce
	SbdtUc5hD/5FuO3zmBgkzlHps8UwkTonODrPu8XXilizS0XonrdvN+NjcQTvBjKFeaPLPOoWpeW4w
	e0rCmiz/+r++sNLUVt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMsTT-00EhrH-K2; Wed, 23 Feb 2022 14:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwP-00EZbH-BC
 for linux-mtd@bombadil.infradead.org; Wed, 23 Feb 2022 13:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=acuMMmcA9VmQZOASvU5gU9zXugIenhc8Io0FNHjds/g=; b=EbTKTnn5HqwO48INMwjSBVkew1
 xgAM1aIpP5ikdZSsW1/8e35WsJgibzIB0OhXJcp5QtZuH6Aq2nef+rUMK69KbNCb3/Tac8RGaM5S7
 hYBOfXE/MwDpt+GsGH7ZEI02hoOQ8JPkeh8BQ+yW6Ad8+AyUfZiP+srr+jr9tnaMjRGPX/QZ+VThi
 Yf8riA6mwls1svUiOEQgn4ATagiiryXvCDD801GNLHEFfOF2tRqsOPphjkKZ/8phaoxmAZHMsn8kx
 p+3cteSM2x5lkB/eP+cfLwWWB+Pa8hi6CJckP4EX04xmnamMrZqCun9yG38LziS4Jb/l3bPug6Q2h
 Fp1cDNVw==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwL-00CH7P-Ai
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:23 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7957E22481;
 Wed, 23 Feb 2022 14:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acuMMmcA9VmQZOASvU5gU9zXugIenhc8Io0FNHjds/g=;
 b=paHkoDs/LU+X1CypVRs/Xr2CBe9Nchjuoqk/jB4dgSJ2oQTpEGFVeN82iQ/prsK2Ye7bdR
 IewnijdV27Tlu7/0fSYTcjxdRFsOB1x0YUIidGJlu7k3mcdYrTWH3yhrOclmPZ0TLJ9Oaw
 vLitYBad6NqYWRfIo6QqzwPFBJXNlaI=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 31/32] mtd: spi-nor: slightly change code style in
 spi_nor_sr_ready()
Date: Wed, 23 Feb 2022 14:43:57 +0100
Message-Id: <20220223134358.1914798-32-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_134421_514419_D8F0F28F 
X-CRM114-Status: GOOD (  10.74  )
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

Now that there is almost no special case code left in
spi_nor_sr_ready(), the return check looks odd. Move the function call
closer to the return code checking.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f5a2f37d140e..9014008e60b3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -563,8 +563,9 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
  */
 int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	int ret;
 
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
