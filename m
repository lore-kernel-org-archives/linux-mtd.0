Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16484C77B7E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 May 2023 13:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q8Qhvdx5in8SzqXRdQXxWW3ImbNGhiw/DR8C/mB3hkA=; b=C3RIk5MRbfcQys
	kiNa+bbI1205mpwblkra6gsRhw8T2BbjwKtxnTBpxliJUSTrFuSfaRGw1+ufuC/wSXNF83VP1k4Wq
	0fJNAmOV5JG6vQAn5iZJLL2jbQdJ1o91QqBUcELWgBcx+Db6f+ZgYo3FkjkDv5oTE27lgONFl4EJE
	MhMIhug3U+kmM/e4sxft43NI1tMJQfST0z5N8J4n04HYqsRzPckfqwuFp5Hq3Fuy7NGRnO2I5alPh
	gRRH4B83l+Iy8x8m3NP7mippI8RT5kRW5VXQ7qYKS1CuwXbs8ELT2ipm94lBoro86DKNTsiMdHonr
	IpsYUJIpywaU+Bt2BVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cYE-00AWxO-0Y;
	Mon, 29 May 2023 13:04:42 +0000
Received: from wiki.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cYA-00AWu5-11
	for linux-mtd@lists.infradead.org;
	Mon, 29 May 2023 13:04:40 +0000
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 38F17440861;
	Mon, 29 May 2023 16:04:17 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1685365457;
	bh=K5sV6MnO7PKzKLYx4Gt7V7VVvZ5vHhbzgybPBl0GnUw=;
	h=From:To:Cc:Subject:Date:From;
	b=m0fDn+pzeFeKOrOVmnu9fn6xxsAcxhA068MaIHszSoOQVdzo+eHb5agdALDB890lP
	 qgNQoQGYaRDsppdRDA2ljsNqgftMonGMoXg+AEJ5SJkaC0iWNE4rETL7/OIN4CAqiK
	 22dVmLkH5+e9FU0qyaw447EFaKL0iIibQkEQTN+uPGCN6WGvBhxoHHyFZYuHlLDGSQ
	 SFThtjEhMZsbgNaIHDvOBW3bu7SPNId6kariHaVTf8QCSdcAmBT0f/qByfnRVgvyXo
	 clZH7UuHZTcDUsXnP+FlKW//TTiYOHm9WPVYqlT7enJKCSCXzcXDtqW/KJ/U1CG4n8
	 NzqnhO7rL4u0w==
From: Baruch Siach <baruch@tkos.co.il>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] mtd: rawnand: atmel: fix dma map error checking
Date: Mon, 29 May 2023 16:03:48 +0300
Message-Id: <a4eab1fd60905b20237f70259ef293124886a14f.1685365428.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060438_847260_56AFB3A7 
X-CRM114-Status: GOOD (  11.11  )
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

Check the dma_map_single() return value when looking for possible error.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 81e3d682a8cd..a43bc6ad11d6 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -373,7 +373,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 	dma_cookie_t cookie;
 
 	buf_dma = dma_map_single(nc->dev, buf, len, dir);
-	if (dma_mapping_error(nc->dev, dev_dma)) {
+	if (dma_mapping_error(nc->dev, buf_dma)) {
 		dev_err(nc->dev,
 			"Failed to prepare a buffer for DMA access\n");
 		goto err;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
