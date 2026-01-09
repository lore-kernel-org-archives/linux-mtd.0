Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB17CD26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJ9lZz1xudYbvmb+d/4CyY1zB9sAvHgQmD1MpRDszoU=; b=mVvVBPSj/uLnHr
	Tpffme0599P5MK+X9sID9HKVt/tNKH1wtMm+xiXrhsPdBjGS380mWUJ7fhR4Qs5T99PJDCipvFHW+
	K+UILSdRkVK+/RbjG4Qpw3clL9pOGoLDo2VUnJGVXt+kRD0hnLUaRN7S1vb1Hiu5dym3khe4oalQ3
	Gf4PTjR8UXFVKow70f0ylkZgumm/wJVwE7p2OAJ/mHGiu7mfmgnayC+jwMjZWEnCD1F4RvlZB0Bni
	9AN36cFFB+asOXKHZOSnHqNKJXUyzpfeg4itvEUVHz38tXU1c+MNataT3Ggt8ryqgkJiskwqHSWQ6
	OFZmgqaHptY0CInKtK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGET-00000002o49-1gX9;
	Fri, 09 Jan 2026 17:25:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEQ-00000002o2C-3x0C
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:25:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6468B1A2751;
	Fri,  9 Jan 2026 17:18:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BC3C606C6;
	Fri,  9 Jan 2026 17:18:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BEDC103C89B1;
	Fri,  9 Jan 2026 18:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TvT8KJbAI4+CbX9ktmIBaXAw+sBQzrpvbOewgKo4BbY=;
	b=BBiadMXgp6XHU8+FJoxBFnflrpev8GygXL88DIWVtos0GJ1ahXR6wjXBRtB8KY81GcfEDD
	bQpszt8t7P06j2ql7IHAauo4wdTboUW8rQWyJKyGu5Kh9AGTpU5foLBlLlNydaJns3L6aP
	MXihlzvvN+v5LXlOhA9skPEikY5Mtd2oWXPPNzVfWUXw2jGTyz142C032OxWXshpoSZAhM
	D0uFefBJCi3j+CZW812mVmr+BCYSktX5nzG3fOh5g40BpVJG1JymH7uoHdB+2QxxO+j4ew
	7RIWpo8W6iHgFpBVX/P43Ivn5lQgGkCq58p/LAZ/81KFzm/UlUeX6K3eASwxXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:21 +0100
Subject: [PATCH v2 23/27] mtd: spinand: Propagate the bus interface across
 core helpers
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-23-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092503_141059_3AE17729 
X-CRM114-Status: GOOD (  12.26  )
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

For now all drivers provide SSDR variants only. When we add support for
ODTR modes, there will be a need to differentiate the type of variant we
target as well as the need to check if we support one or the other type
of operations.

Pass this parameter to lower level helpers, which for now is unused, in
order to simplify the patch introducing ODTR support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index a5166b49020c..019594182c60 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1410,7 +1410,8 @@ static void spinand_init_ssdr_templates(struct spinand_device *spinand)
 }
 
 static int spinand_support_vendor_ops(struct spinand_device *spinand,
-				      const struct spinand_info *info)
+				      const struct spinand_info *info,
+				      enum spinand_bus_interface iface)
 {
 	int i;
 
@@ -1431,7 +1432,7 @@ static int spinand_support_vendor_ops(struct spinand_device *spinand,
 }
 
 static const struct spi_mem_op *
-spinand_select_op_variant(struct spinand_device *spinand,
+spinand_select_op_variant(struct spinand_device *spinand, enum spinand_bus_interface iface,
 			  const struct spinand_op_variants *variants)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -1524,28 +1525,28 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
 
-		op = spinand_select_op_variant(spinand,
+		op = spinand_select_op_variant(spinand, SSDR,
 					       info->op_variants.read_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
 		spinand->ssdr_op_templates.read_cache = op;
 
-		op = spinand_select_op_variant(spinand,
+		op = spinand_select_op_variant(spinand, SSDR,
 					       info->op_variants.write_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
 		spinand->ssdr_op_templates.write_cache = op;
 
-		op = spinand_select_op_variant(spinand,
+		op = spinand_select_op_variant(spinand, SSDR,
 					       info->op_variants.update_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
 		spinand->ssdr_op_templates.update_cache = op;
 
-		ret = spinand_support_vendor_ops(spinand, info);
+		ret = spinand_support_vendor_ops(spinand, info, SSDR);
 		if (ret)
 			return ret;
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
