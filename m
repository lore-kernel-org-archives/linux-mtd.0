Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC1606A334
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQHW/i+O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eD6j6BkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tpscBHnzNVzKzV/OFGVmXwQXeR1fYNAP/zM4UXlma3o=; b=lQHW/i+OyIgtDURGlx1LhZwp+X
	eXg0Tf/9zQ7hkvOlJC+bgcYw6YibkS8VjHl0e4gEsv5Z+pSKeQYbMzemufmaDYJFPH6tY8I9DBDyN
	mJobPlwwp3LLUjWwtiAO5EwWNDUu36tQDnVqHfKMgrO8yWCbNo4FTTI7u31AmgxbNgwfWd7xKtXwB
	UVPDOUcT3iX7GhDP7oweuLm1Rv0pymjibABhyHh/Ffs7vJBUMdH1REKo32RgabJbM43dDVZ1CfjTX
	d7HVRDcH+BiGWeEkoISp3K7TKn1dpSCGP5BynrmWpNM/xexPGwEdsJX0Y444HzTuqSSRpcFuJFnzc
	b+Ra2i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqKK-00000001JZ4-2JFT;
	Mon, 16 Nov 2026 06:36:28 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqKH-00000001JY0-0NCo
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:36:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cdb684859cbso2293456a12.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810984; x=1795415784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1J2czhvyPsoZVgP5LJ2w4r8ErFurOPxYzAJup69IfI=;
        b=eD6j6BkGTQETFOzguD9jb4xpkbOEydP7NITMgG6Zs54z8MweXRMbuGp25YrUXReC9r
         vCMENowd5PVF9cuuvsnp29y2Meg8IypcU7FVYb87yC8khRYDOm9WpnDDdi6K7hI4GPzC
         oQOu4/zk0wbmZFoOakCKfgEiRJk2FUqrn/sd3QPr149PmsuUMJClLNUJzNF0OqKjWk5g
         UYfwXfVJQjNnNkepeIFUnosovEwzF/a/osB9I/qDeqB/7kUx9nDkYLPLgpwWELVl8gFf
         OVXQW4v5MGBEHAZWQZye72NPKEp21WjP4B9Dm2wCalflnQS5cJX63IMq9yoz9i+PY2rb
         7xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810984; x=1795415784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1J2czhvyPsoZVgP5LJ2w4r8ErFurOPxYzAJup69IfI=;
        b=D87Hs4Ed8yBbOot14PBEiJaeTgMurhz6syS2K1+V1VXbLfTb/8znGdL+sbVdLlUG5+
         TkT8QH5Dkc2b+m+qQYiHK9Hh/eBkqQiCtUXDoysvGBJz2DeY9a2NqiCcDQPz6iWqTpfJ
         GBmellTnmYn6FTceRFzyw/2Gyv5Hsj267OGTOrbugRnOF/M8OHyWpQcTok9vqcbHbdBl
         KgKZ7NDT5oL+54YKKaqnXXm7DIzV5feGQZ0bJwe2hbsuChuW30JVKQLebYwqTtBNOCAJ
         HVwXBPrRq8l6O5SbnvVJ3vnFlsCNAlKQgq3Bo27CoCX3wVOq4dm6j24ja4rpOq/EMbKQ
         BrOA==
X-Gm-Message-State: APuU4Z+9RzN292GtOgNBXYPts79HelmCGtuZsusU6H4adHfd0y5qggyq
	/kd/D7vX4STLYm5CdfApbUn49ZOw5BFWNufUe0+y1/SVoMyqxPFWflHJSkZ67XNu
X-Gm-Gg: AYBFou0wwsDkf2+ziyQdvM4RraLG0gIQHo3sYqXGmDVotK8UVX1epcN5fudv5qxR4Du
	UH58imwX3SR+d5ZWpqVYjRSkBq8P2pcPcPhgHCgaKAxrrVqTrhBwhBexXAywxTCpDqrwZGcOk+5
	ByVUXcEKnC1/nVLIFK/AHmFNTodNpal+S6oGcQzMDX6nB0j+Z1flbR/R+W/DP84yUphJKY45B0m
	OBtjHh/Wv0XnxkyqCGUb1n+ubcHlTnrTb65EQ1bE5gH1w2JNmgKkDtFF1DIqr46EVroa5/WFgaQ
	znT03QrArXWEnbKijwtKSNCOl36nOOyk8vwPxVKiehiqVVLU91xcMIhZUJe2S3urLbgCKy2F4Uc
	qDH7RDBJ/ix8myTbImQ9wKl+ZTQywbqkMnqZGbeLAN3F4KOuqQz86/Gy8Jl/w0J0sl0aBS39Fie
	7+VSzlXOGzAqUo/1fqtTyz4iEQuu1fR/7rdSCLYIcwp9d+PVMa3o5MFiILlS6yEckHpJbBi9Ras
	R8FayOepeQijfOkD3w5XH2zSmMm+qU9Wxcx5BdMkB5tVUMm2OrjbNL8Eqi4Y0wMA6rsv0KYspab
	krx6wnHSuj+O5VN6wL2E3m4KFXAM6617miFRlqx4r68Z28e9yREF3Zs/J3JhRd4ppJv7hFbyf17
	dluFs5SM76lHo2jg1x7Qts9v/Up5Gpza4Ql+FNHMJj2QIlh2+bAEtnzbmwOy7S8kgF1zbxGG2BR
	Ss6b4cs7b4aIyBTOzsDQBkdAWRvdA5hZa6nvisSughV/McuDN33eg=
X-Received: by 2002:a05:6820:1518:b0:71a:fbc6:6a9d with SMTP id 006d021491bc7-71afbc68301mr179623eaf.41.1794810619676;
        Sun, 15 Nov 2026 22:30:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:42 -0700
Subject: [PATCH v5 27/58] mtd: rawnand: technologic: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-27-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223625_134705_C30ED204 
X-CRM114-Status: GOOD (  14.81  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Transfer flash-node ownership to the retained-chip helper. Balance the
probe's child-node reference rather than putting the unreferenced
controller node during removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 853034c7d8c0 ("mtd: rawnand: add support for ts72xx")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a4de53f954e5..98cf91136d0b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -139,11 +139,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +177,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_lifetime(&data->chip, NULL);
 	if (err)
 		goto err_clean_nand;
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+		goto err_handle_put;
+	}
 
+	fwnode_handle_put(child);
 	return 0;
 
 err_clean_nand:
@@ -191,14 +200,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 static void ts72xx_nand_remove(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
-	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
-	fwnode_handle_put(fwnode);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id ts72xx_id_table[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
