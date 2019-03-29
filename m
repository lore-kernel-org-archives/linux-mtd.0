Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06736C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 07:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64402082F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 07:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tFldy1l0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="x0unXnVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64402082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BNakdtxPN5x2PHU7C3oYi0hw42xsLoQpurppNH1Z0oc=; b=tFldy1l0begDLVmyygMxrsvlmv
	m1438Nj8mBKjVZIcd5ONExYQodUzDUfi7hDFkQKpjDk9JN1NNddiVC0GRJoCkRb7j33db8g5SmrZL
	hJxR1MaKQy7bKY1I7ErqWBerWYB3BZ5oVY7WVaj3XoVvYuADfRzItUZruMhw+xaUw5KeGyepfpKvK
	dryDXQ1OQi1e/xRsAKz3ughhmEAKl/nG4rWqxtjSk8pIu67063KilJh66U6sL3RBDI7Jicx4PAKl+
	dQ99OPq3s8m9a/R/ltVF3JK42XOurDgnecyvsYT4DcUMLB4yEqk2F6BazlamBTZtzc3S+g+JrFxzt
	D2uJyqXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9lwt-0004uA-IT; Fri, 29 Mar 2019 07:29:11 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9lwY-0004Q0-3O
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 07:28:53 +0000
Received: from grover.tkatk1.zaq.ne.jp (zaqdadce369.zaq.ne.jp
 [218.220.227.105]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x2T7SQaD002537;
 Fri, 29 Mar 2019 16:28:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x2T7SQaD002537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1553844513;
 bh=BRBvSJ4W65C/fPjveY5umdo5eBXm18HEgOWm+EkOD7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x0unXnVMr9Cy58s7P8cByEoY3byAv10ixm490Y5dvO8ih/ozmRirL2QF/oTQKM5Ms
 yiCyTKLBwt/RgaUPrYJbyogiPfd8lmHNEkRwN7CvJydf6hyNFRBgT7jcY7K6Nc7kQk
 47wf+GJvPnqrJrqM8wlxKtC+Q18rZOkRgsUevqS3TOr2o6ydUcPzNlEv8qvKwsbrYK
 7KlR9PKmn4i5NDFz9YzMD6blb6XuXAgqRIOe+CVrsuSYGQOu0c0IQ9+e0Qr9/i/uYj
 QNEFIucpBCTBPaQqkVV3IGI3z5kBGebdzMowmlensaxkH6+bt12ewPUz2onM+Pa/gy
 mO+RBY/fgEPoA==
X-Nifty-SrcIP: [218.220.227.105]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 6/9] mtd: rawnand: denali_pci: rename goto labels
Date: Fri, 29 Mar 2019 16:28:18 +0900
Message-Id: <1553844501-7119-7-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
References: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_002850_460931_06115016 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As Documentation/process/coding-style.rst says, choose label names
which say what the goto does. The out_<action> label style is already
used in denali_dt.c. Rename likewise for denali_pci.c

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali_pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index 48e9ac5..02eb599 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -84,20 +84,20 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap_nocache failed!");
 		ret = -ENOMEM;
-		goto failed_remap_reg;
+		goto out_unmap_reg;
 	}
 
 	ret = denali_init(denali);
 	if (ret)
-		goto failed_remap_mem;
+		goto out_unmap_host;
 
 	pci_set_drvdata(dev, denali);
 
 	return 0;
 
-failed_remap_mem:
+out_unmap_host:
 	iounmap(denali->host);
-failed_remap_reg:
+out_unmap_reg:
 	iounmap(denali->reg);
 	return ret;
 }
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
