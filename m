Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9976DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Fh5oL+YET7PgvlqwjSrIia8oRSJ4KQkmi+SD+CxDC4=; b=mrIAr/g9jSS4n9
	R/fVFwgfd61hHqtYb/TQY31paPeRpAqaYDhZxFp6LVx57wMtXD+He2A5hI60oEzBkTzYOypZGTfxz
	1HbQ5M/vJ3jASTLU7ip1/yUWMdiXZ3EITTNS9GOTinR9RTSelf+osVMWKjs0BkiRDC7+N4fQQg3V5
	jSnXGtarhmKIW6YihWH4Tc2c4AjI/KJXY9SYEg4ez0cUdn2aBZMO2Nq/amvItktjANGkva42w3Drw
	go4Kv0PXmpaAcyQFpUuS5uoiCCKSdg4esz3irVYu43ButHaam3Bkqo7VOgresMZ9U9ExpIGQkHUSd
	bqxq+Uw8x2AfShejXUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8Du-005koK-VN; Mon, 21 Feb 2022 12:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Uf-005Y4K-9U
 for linux-mtd@bombadil.infradead.org; Mon, 21 Feb 2022 12:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Ckbf6Q/jmsl515Nwvytsj5VQqppc1StpRQJYAIW3rH4=; b=qn1eEGvnn4lC/nYcJ1ezQFT0Vt
 h/o0/hpCZeQRdrSst3aSslArvb+nNXqN4bpXAnlNZMBKO+z0PbBsXQ5USi7DxV32lqreWA1ZP5Q8B
 01NnYUbFi5EK87WP7tzVMuHiGZ3dmSBJq8lAoer6uKgkPaa40QU8V590vOdG7nzbghuNCsuuZNTtQ
 w0/CsFo1dVmztaDoZZuZc/uy986wyknjUGaiHGHjss3to4zgPy9RAYKH7YLUb8vs1wLOjNL7B1dz9
 hRVId9DY866vHwrsRFVDPNNj3E2LUvZZq7hpo/gYamMH0zx8Do0CzTBPcmbjC9OTHx9149kZ/OFCR
 6ON6b+LQ==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ua-00BdB1-6B
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:39 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 89F262244E;
 Mon, 21 Feb 2022 13:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ckbf6Q/jmsl515Nwvytsj5VQqppc1StpRQJYAIW3rH4=;
 b=cbB9PMM2QjXyGQMVH59bK/pI4I/aCouM1RmKPgzOAcjE5iC0mLB/DzJobb8275Gx8eAzAK
 5IB+YuaMT6lOl+smNHiCzujldaJV8KzRzMe8oDVy7fdDnn5ykZEpnsX703Y2AD56ehUdW2
 LievZoRh/IpBh8D92hPK8fC0gYmy4Qc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 31/32] mtd: spi-nor: slightly change code style in
 spi_nor_sr_ready()
Date: Mon, 21 Feb 2022 13:08:08 +0100
Message-Id: <20220221120809.1531502-32-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_120836_492972_D9919A94 
X-CRM114-Status: GOOD (  11.01  )
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
