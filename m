Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE991C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXkR8ScGV2i7Fh9AYgsdBqq1nFCvQfp4RNPHikYDZaM=; b=C3PQ7gsUW1b0b6
	nDQuIEr01m/AUAVvsbmApZt20KfK8YZHYH4rGdPPzSmct661GMzs2QF1bOfosejG6yyf68JqmcEG5
	JApNQyygi4iOmPhtS4bpexzwzcHqO8ZqaxqpdFaKwrops6PEntjrWqml1aAi/tLnkDP3d9DTE2f3B
	VSU40iP24JORTxyRzi4VLx8ZgqJ4llIqdEVevBr+VEe0AnvBftK/eTwWbGe0IXCOKH1fgAW1HDOav
	UFxeuXyc9VjELU5M+1BflUTIpRdXg8FDWEKKBmDEJnaFTRFl7lWIi7pRxLPpLOOGvJT0tNb4zuJRh
	VEL1PygltsET860f6H+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHF3-00Fubj-5K; Wed, 02 Feb 2022 15:08:17 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH6C-00FrWd-Nl
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:59:10 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 24C56223F7;
 Wed,  2 Feb 2022 15:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643813943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7A/4WH3Hp3ldUDbngD7NflORly3uSPDOIhgEgdq0hw=;
 b=kfkZ45SxsKI7TCjO+N2K7Kah85y6nqDm0YPnxFVOUSZu5fQTe63ZDUdGdKN1Is0/jH3sHA
 qX1+7Fld7BsLmOg+QAgcA8kzDMmWYDquRqzTBATHYIaHgXkcXZqreT2vTOJNs46bfBc6bV
 k3s9Un3L+Qxv0gOMSOd8uXJEPiRB6Ew=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v1 06/14] mtd: spi-nor: xilinx: correct the debug message
Date: Wed,  2 Feb 2022 15:58:45 +0100
Message-Id: <20220202145853.4187726-7-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202145853.4187726-1-michael@walle.cc>
References: <20220202145853.4187726-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065908_996447_F858BCF9 
X-CRM114-Status: GOOD (  11.24  )
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

We are reading the status register, there is no XRDSR register.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 3e85530df1e4..9e3ed9609250 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -87,7 +87,7 @@ static int xilinx_read_sr(struct spi_nor *nor, u8 *sr)
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
