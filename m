Return-Path: <SRS0=Ld/O=SP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8BEC10F11
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2019 08:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC77A20850
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2019 08:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ufumf9QC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC77A20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zahvUeQoxYlrxxEcWQ42jdQQ/Gve3UsFG2Yem1wt2qc=; b=ufumf9QCWNaMsJ
	TaHET9htPW0FKsw6kJRlXwKZ5h7ovF2vFe63ztiImu3O4Poo2DO3vUyQ9HeNMAkSyo4s99ZwhTqWz
	yf3LbS92LVgIkgkhMLRKi3Y9uedw01Rl410boWfz6TGepZ9QZcEgQ0Z8SIxlSwsMzVOk5SxkREVFL
	Ji8buLSH5qsgDSQ5FvbQi5a6qjpDxvOFNUl76pjbqocAo664zIvOHOz+5okPGL6RmiohEjHokCgVR
	IjIt4qyHE3X0bMqpM6hcNilE6P5Vz8Iv2ikyobDow9Yt4SBZ/ZpU/c+1PtTZ0fi/3K0PZyWhBjC9s
	9/xCAP3jbaime+BMQn2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFEE2-0007vL-9N; Sat, 13 Apr 2019 08:41:26 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFEDz-0007t5-4f
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2019 08:41:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 87AAB1802DF5F;
 Sat, 13 Apr 2019 10:41:10 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nandsim: Embed struct nand_chip in struct nandsim
Date: Sat, 13 Apr 2019 10:40:51 +0200
Message-Id: <20190413084052.15416-1-richard@nod.at>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_014123_478103_79B4A795 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: bbrezillon@kernel.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We well need struct nand_controller soon, so more stuff need to
be parts of struct nandsim.
While we are here, rename "nand" to "ns" to use the same naming scheme
everywhere in nandsim.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/raw/nandsim.c | 49 +++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 933d1a629c51..3d80e2d23b6e 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -298,6 +298,7 @@ union ns_mem {
  * The structure which describes all the internal simulator data.
  */
 struct nandsim {
+	struct nand_chip chip;
 	struct mtd_partition partitions[CONFIG_NANDSIM_MAX_PARTS];
 	unsigned int nbparts;
 
@@ -2216,7 +2217,7 @@ static const struct nand_controller_ops ns_controller_ops = {
 static int __init ns_init_module(void)
 {
 	struct nand_chip *chip;
-	struct nandsim *nand;
+	struct nandsim *ns;
 	int retval = -ENOMEM, i;
 
 	if (bus_width != 8 && bus_width != 16) {
@@ -2224,16 +2225,14 @@ static int __init ns_init_module(void)
 		return -EINVAL;
 	}
 
-	/* Allocate and initialize mtd_info, nand_chip and nandsim structures */
-	chip = kzalloc(sizeof(struct nand_chip) + sizeof(struct nandsim),
-		       GFP_KERNEL);
-	if (!chip) {
+	ns = kzalloc(sizeof(struct nandsim), GFP_KERNEL);
+	if (!ns) {
 		NS_ERR("unable to allocate core structures.\n");
 		return -ENOMEM;
 	}
+	chip	    = &ns->chip;
 	nsmtd       = nand_to_mtd(chip);
-	nand        = (struct nandsim *)(chip + 1);
-	nand_set_controller_data(chip, (void *)nand);
+	nand_set_controller_data(chip, (void *)ns);
 
 	/*
 	 * Register simulator's callbacks.
@@ -2266,19 +2265,19 @@ static int __init ns_init_module(void)
 	 * the initial ID read command correctly
 	 */
 	if (id_bytes[6] != 0xFF || id_bytes[7] != 0xFF)
-		nand->geom.idbytes = 8;
+		ns->geom.idbytes = 8;
 	else if (id_bytes[4] != 0xFF || id_bytes[5] != 0xFF)
-		nand->geom.idbytes = 6;
+		ns->geom.idbytes = 6;
 	else if (id_bytes[2] != 0xFF || id_bytes[3] != 0xFF)
-		nand->geom.idbytes = 4;
+		ns->geom.idbytes = 4;
 	else
-		nand->geom.idbytes = 2;
-	nand->regs.status = NS_STATUS_OK(nand);
-	nand->nxstate = STATE_UNKNOWN;
-	nand->options |= OPT_PAGE512; /* temporary value */
-	memcpy(nand->ids, id_bytes, sizeof(nand->ids));
+		ns->geom.idbytes = 2;
+	ns->regs.status = NS_STATUS_OK(ns);
+	ns->nxstate = STATE_UNKNOWN;
+	ns->options |= OPT_PAGE512; /* temporary value */
+	memcpy(ns->ids, id_bytes, sizeof(ns->ids));
 	if (bus_width == 16) {
-		nand->busw = 16;
+		ns->busw = 16;
 		chip->options |= NAND_BUSWIDTH_16;
 	}
 
@@ -2323,27 +2322,27 @@ static int __init ns_init_module(void)
 	if ((retval = nand_create_bbt(chip)) != 0)
 		goto err_exit;
 
-	if ((retval = parse_badblocks(nand, nsmtd)) != 0)
+	if ((retval = parse_badblocks(ns, nsmtd)) != 0)
 		goto err_exit;
 
 	/* Register NAND partitions */
-	retval = mtd_device_register(nsmtd, &nand->partitions[0],
-				     nand->nbparts);
+	retval = mtd_device_register(nsmtd, &ns->partitions[0],
+				     ns->nbparts);
 	if (retval != 0)
 		goto err_exit;
 
-	if ((retval = nandsim_debugfs_create(nand)) != 0)
+	if ((retval = nandsim_debugfs_create(ns)) != 0)
 		goto err_exit;
 
         return 0;
 
 err_exit:
-	free_nandsim(nand);
+	free_nandsim(ns);
 	nand_release(chip);
-	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
-		kfree(nand->partitions[i].name);
+	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
+		kfree(ns->partitions[i].name);
 error:
-	kfree(chip);
+	kfree(ns);
 	free_lists();
 
 	return retval;
@@ -2364,7 +2363,7 @@ static void __exit ns_cleanup_module(void)
 	nand_release(chip); /* Unregister driver */
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
-	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
+	kfree(ns);        /* Free other structures */
 	free_lists();
 }
 
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
