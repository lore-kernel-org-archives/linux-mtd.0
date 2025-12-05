Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204B0D3748F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Dec 2025 19:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLi+wTYbqj+UP390K7maHHx626X1gOqkwmkTMF1hEuA=; b=qus6kEhSGZtjxv
	58tt6GUzccmzKReNgNGwwFlykdBNJVh3yNXBbPSRXFj0mp7CdUWxePrKgTyJ8eUrJFVd1J9OCQZs0
	BsuePwRn8X2YMUjRwV8S+e+ia2txg1FE/KfZkBf7cV0zV0Lpp1QKrxsX4YshUdw9AdT+BBiH6DL/i
	qwukO8c32zHdmB/ZtdhSGf6H+F70Wve0s9Wc6hy4PYKJj3k4OtTmdhQs+/QJRHFhRqDVkl8HZzVSJ
	tNtl8U6Z6AMycFKPHipe2LZca3fZYSSxfg+HdDJExEi8JNTo+DuYZOH0M9ANBihG1Wo8DkvLoOrZd
	PSfwoOFfFXRB1jOHWRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbel-00000009xPY-1qZs;
	Fri, 05 Dec 2025 19:39:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbei-00000009xMx-3jsF
	for linux-mtd@lists.infradead.org;
	Fri, 05 Dec 2025 19:39:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 76F314E41A72;
	Fri,  5 Dec 2025 19:39:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 478CA606AC;
	Fri,  5 Dec 2025 19:39:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C20C102F1956;
	Fri,  5 Dec 2025 20:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764963590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V1ljS8mutIdNmKv1uTSb1HOPJkaHUuTFfvh6FqXD2eU=;
	b=nSdCXRxcvN2Tl6j80JiBHD5VXqmAb7ozAe3pOWLL0TCcmgz74lHnCUVCUSrEU0h4mGed34
	JNJ9VkXDTUIHl3A12525JxJqlmuFa26k2arTrtbB8a9xN5IvUj/6XHs3tbByK28V3fw+EB
	To0Wo+B7Wnzw11pFwQorDZXUR2VwwYRP+88vRe552E/aCI8AutOTrY4XhYJAgfcbKyeEq6
	53hZk46QueC2gXbjkX/ouxdtBvNbiAHqdNCcBUnUsCCN41z88bw5FV9eS3pz1Ap1R0NFvZ
	Cl4KHTzx3XaLEtD2XmviJoHz+l3JEVspmc9a8Lpy9Ln+a5+OsbO4MBZGhtbpxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 05 Dec 2025 20:38:56 +0100
Subject: [PATCH RFC 5/8] spi: spi-mem: Create a secondary read operation
MIME-Version: 1.0
Message-Id: <20251205-winbond-v6-18-rc1-cont-read-v1-5-01bc48631c73@bootlin.com>
References: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
In-Reply-To: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_113953_203278_AEDAA76C 
X-CRM114-Status: GOOD (  19.12  )
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

In some situations, direct mappings may need to use different
operation templates.

For instance, when enabling continuous reads, Winbond SPI NANDs no
longer expect address cycles because they would be ignoring them
otherwise. Hence, right after the command opcode, they start counting
dummy cycles, followed by the data cycles as usual.

This breaks the assumptions of "reads from cache" always being done
identically once the best variant has been picked up, across the
lifetime of the system.

In order to support this feature, we must give direct mapping more than
a single operation template to use, in order to switch to using
secondary operations upon request by the upper layer.

Create the concept of optional secondary operation template, which may
or may not be fulfilled by the SPI NAND and SPI NOR cores. If the
underlying SPI controller does not leverage any kind of direct mapping
acceleration, the feature has no impact and can be freely
used. Otherwise, the controller driver needs to opt-in for using this
feature, if supported.

The condition checked to know whether a secondary operation has been
provided or not is to look for a non zero opcode to limit the creation
of extra variables. In practice, the opcode 0x00 exist, but is not
related to any cache related operation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
The choice of defining two variables named primary and secondary instead
of using an array of templates is on purpose, to simplify the reading. I
find less obvious the use of an array here but this is personal taste.
---
 drivers/spi/spi-mem.c       | 17 +++++++++++++++++
 include/linux/spi/spi-mem.h |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 50f16943dc73..b6debc796cf8 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -708,6 +708,23 @@ spi_mem_dirmap_create(struct spi_mem *mem,
 	if (info->primary_op_tmpl.data.dir == SPI_MEM_NO_DATA)
 		return ERR_PTR(-EINVAL);
 
+	/* Apply similar constraints to the secondary template */
+	if (info->secondary_op_tmpl.cmd.opcode) {
+		if (!info->secondary_op_tmpl.addr.nbytes ||
+		    info->secondary_op_tmpl.addr.nbytes > 8)
+			return ERR_PTR(-EINVAL);
+
+		if (info->secondary_op_tmpl.data.dir == SPI_MEM_NO_DATA)
+			return ERR_PTR(-EINVAL);
+
+		if (!spi_mem_supports_op(mem, &info->secondary_op_tmpl))
+			return ERR_PTR(-EOPNOTSUPP);
+
+		if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create &&
+		    !spi_mem_controller_is_capable(ctlr, secondary_op_tmpl))
+			return ERR_PTR(-EOPNOTSUPP);
+	}
+
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
 	if (!desc)
 		return ERR_PTR(-ENOMEM);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 3092caefa0b6..099de23e7084 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -207,6 +207,8 @@ struct spi_mem_op {
  * struct spi_mem_dirmap_info - Direct mapping information
  * @op_tmpl: operation template that should be used by the direct mapping when
  *	     the memory device is accessed
+ * @secondary_op_tmpl: secondary template, may be used as an alternative to the
+ *                     primary template (decided by the upper layer)
  * @offset: absolute offset this direct mapping is pointing to
  * @length: length in byte of this direct mapping
  *
@@ -219,6 +221,7 @@ struct spi_mem_op {
 struct spi_mem_dirmap_info {
 	struct spi_mem_op *op_tmpl;
 	struct spi_mem_op primary_op_tmpl;
+	struct spi_mem_op secondary_op_tmpl;
 	u64 offset;
 	u64 length;
 };
@@ -362,12 +365,14 @@ struct spi_controller_mem_ops {
  * @swap16: Supports swapping bytes on a 16 bit boundary when configured in
  *	    Octal DTR
  * @per_op_freq: Supports per operation frequency switching
+ * @secondary_op_tmpl: Supports leveraging a secondary memory operation template
  */
 struct spi_controller_mem_caps {
 	bool dtr;
 	bool ecc;
 	bool swap16;
 	bool per_op_freq;
+	bool secondary_op_tmpl;
 };
 
 #define spi_mem_controller_is_capable(ctlr, cap)	\

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
