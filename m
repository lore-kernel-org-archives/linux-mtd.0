Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C56AC67861
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xV1vsQm3G0iCuvdtrLkbeEIcBEJnLn0FzCIXYiGDz9g=; b=TuvucICRzDvQy1
	9f+toOReVRDNlWFtOLncB8XI59kIBP/yD9qVFMESRoMlYNyJ1pOZjWCtMQCctXsa6ov9pJNrHa3j2
	ngKrScmH/nm4hV0timLuPSHgk/X1U3BEfjs8rtg3ANwEEK4+laHIL0CaWEEJ2O2x/ANZbHJkPtuS0
	S6f5U70Qyw4T0F56/kdGqH51D5MF+71CU1eqOvb7k1VsDiWIb2nhSQ8Vf6fRIaoR5HUNg/wIOtEgI
	eJxwej09iDdLA+5ORho8q+zBqIwoLJ0sIZYy2KwrFO3gGZyQZgcW9GbxG3kAt2W7cGuzsbNRcYJCu
	/Zc4GO6xE5yVEKazeLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsgO8-00000006Jre-1MOy;
	Fri, 05 Apr 2024 10:01:36 +0000
Received: from e3i57.smtp2go.com ([158.120.84.57])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsgO5-00000006JnQ-1bvb
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 10:01:34 +0000
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rsgNo-rloBs0-2e
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 10:01:16 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 5 Apr 2024 12:01:10 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb entry
Date: Fri,  5 Apr 2024 12:01:04 +0200
Message-Id: <20240405100104.480779-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405100104.480779-1-f.suligoi@asem.it>
References: <20240405100104.480779-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Apr 2024 10:01:10.0828 (UTC) FILETIME=[2FAB8EC0:01DA8740]
X-smtpcorp-track: 1rsgNor_oUs02-.DxvtHifCfDNWh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712311279; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=gbk6GEaZFm2CqJE8OhLPw9fpnMMZjNb43lrAdGQwPeQ=;
 b=kYVGQEAYR3vXK6p0E6VsTKCfEC77UtCjojp2D+HlPcWs6pqAXmu8u7VSQfKC6ALGzohVH
 rXKmd7Gv3FyqkfCQqqE64a1K6kvk+WVChjWdZe4F6HrxGEU1BUdsm8k6tEyLqKyo2nOw231
 9b+voD8pThrJw9JqcX/ZAcKAj8CtbFVoOcZPMjObuKp8IEOkWJEfsd5eklbj3REFgoVFA5b
 hiUPiF5htNC/BkRURwSxmRnITwHil1leYmCIO9XFKdVnk/KuqhGMGPw1iNNDv/+PXMNkfoa
 VydD05gUY79RrF5fY96IZGq+1Cm72niC+YaTWQXU6WzvHDoAIAAD4XYwWOJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712311279; h=from : subject : to
 : message-id : date; bh=gbk6GEaZFm2CqJE8OhLPw9fpnMMZjNb43lrAdGQwPeQ=;
 b=hnQrxXdvth9wXhnf/taYhCbRNlXx5lcK1MOZBPK7R7FGMRkbLECbA7Mn9rFkbWkJBQpjp
 Jd9t9jCiYRzAX9Gak0FfCcli8AVXA4pMon0erN0FdKfrbPCmWLqxmYGQI17COkob7/tdaYH
 faE6k+ogvaojnavlgVEkhtEJKycWWclCTuIod42sSEwmqgCK2l/+wcEK2Cfi8GG8/ULueBS
 YdguF0Jyof74My2NpMGuLUzHKIaJ9yzcCox5y/Tno5b89ABQnMmhiHMkccuCAGh2WzAaRT9
 ydeL8Ry/Z30JkgDzgzTU4NO7SjJkJUYaay+FvI5IDsrK47RQJWAVgGERi/oA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_030133_621811_976BCCEC 
X-CRM114-Status: GOOD (  11.26  )
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

Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
Memory.
This device is JEDEC compatible (JESD251 and JESD251-1), but it is not
able to provide SFDP information.

Link: https://www.everspin.com/file/158244/download

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/mtd/spi-nor/everspin.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index 5f321e24ae7d..4741930ce9a8 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -31,6 +31,14 @@ static const struct flash_info everspin_nor_parts[] = {
 		.size = SZ_512K,
 		.sector_size = SZ_512K,
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+	}, {
+		.id = SNOR_ID(0x6b, 0xbb, 0x13),
+		.name = "em004lxb",
+		.size = SZ_512K,
+		.sector_size = SZ_512K,
+		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR | SPI_NOR_HAS_LOCK |
+			 SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SPI_NOR_SKIP_SFDP,
 	}
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
