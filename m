Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1D8C63798
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 00:08:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4949221F1
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 00:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQgZ+TTg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="I5rn41Zt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4949221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ti7yZR1WFj4R4hXGxJ07P1BwNkjnN/Nv/SVcu5SX+fU=; b=lQgZ+TTgIiWSfL4P9G7oe1PPSb
	j4IwpbQqv4gQQQbLnzNldsCcvmLOEjrhbp/+tgzNNQdYE558dMR2cxW5A7DBcYWT0z0ZV0ZnLOfis
	Q6X931/X3zYfCRG+OR+tOsvEjJ7zvD28ZKe+u9eDctS/Zz62MfFviTp1O+d+sEEsalJt8GT7w0Fqf
	Hgjuro1GiGpw3rph3EBnikT5ZS4Dz0Vdk5tyo0qGGdR2iaVVXjBK2VopsarSzc+mIpKrSn1k+KRx5
	PE+VnBQTEkZe8g+AHJ2CKT7eU39U4WNgh9UXjNypLVeEdLyquEjaFas3kddVMscMcPF6qlxrAOex0
	4ycDtboQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiRIN-0000MU-5a; Fri, 27 Nov 2020 00:07:27 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiRII-0000Kg-8R
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 00:07:24 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 67E94806A8;
 Fri, 27 Nov 2020 13:07:11 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1606435631;
 bh=ysNOC9mDar/YWxTg8eC9t0K4NcYlI+Edjxc09rbq2MI=;
 h=From:To:Cc:Subject:Date;
 b=I5rn41Zt9O+NuKKmZjuGStY/glUEHmxDKTZwTy/g/wEYWEAmwBVLnNNG9c0UC/G+r
 eox+DoUY421SHuYB2Ey2+Aq2xR7iELVRyCNukY59ZWaxMOAY0B4ZS/mYcwyDLIotNG
 iSzZbx67DIt4q6UwU3Kz0bsTDnnRQ9Vot9WIn5PRr4U9f3WAKCQ3mNm+8i9bWx+zuP
 Kk+gqRNwiNnqoLOPU3VNGfRPtCu1AswPZHBIAinnZLbPorQqKmrwgYjcBKX8FuEEdn
 ujDFwe3vync3H6GTNb/MTPgDhGcJMeOjFxzg2eoxszESmzsq9N9PzEqAtpiQLaQ1bZ
 oqwFba8fsJ9QA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5fc043300000>; Fri, 27 Nov 2020 13:07:12 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id 1438513EE9F;
 Fri, 27 Nov 2020 13:07:10 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id C34E32800AA; Fri, 27 Nov 2020 13:07:10 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Subject: [PATCH v2] libmtd: avoid divide by zero
Date: Fri, 27 Nov 2020 13:07:08 +1300
Message-Id: <20201127000708.2894-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_190722_778513_67C69F9A 
X-CRM114-Status: GOOD (  17.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The concept of erase blocks doesn't apply to mtd-ram devices. Such
devices set MTD_NO_ERASE to indicate this and some report 0 for the
erase block size. Avoid a divide by zero when calculating the erase
block count for such devices.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- Use MTD_NO_ERASE as suggested by Richard

 lib/libmtd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 9d8d0e8..b581d80 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -791,7 +791,10 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 		return -1;
 	mtd->writable = !!(ret & MTD_WRITEABLE);
 
-	mtd->eb_cnt = mtd->size / mtd->eb_size;
+	if (ret & MTD_NO_ERASE)
+		mtd->eb_cnt = 1;
+	else
+		mtd->eb_cnt = mtd->size / mtd->eb_size;
 	mtd->type = type_str2int(mtd->type_str);
 	mtd->bb_allowed = !!(mtd->type == MTD_NANDFLASH ||
 				mtd->type == MTD_MLCNANDFLASH);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
