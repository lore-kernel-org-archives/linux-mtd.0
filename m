Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA99606A956
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=snwu6uN5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=on2qRBr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fTraCcTSR/OZ1IWyHJhE339PicfM7z02rsGqYd3zX1A=; b=snwu6uN5R58JL13RsWno66Tu+g
	NPLvOpsvkMAGwq+6Yrqk9wyps+8hJi4fhtlK3Y9qhegadPOXax7l7ldCXBevDNQgEv4rv+k3irhKF
	wnf3oG1EuXMiFBHckSjkt05PBtdrj7nPQxxFZl+MmnHkWXYziqIg8WEBYO+FJJsrCxwISObiWzmxJ
	1GGE7WArUT330kmPZ4S55KyBtO2OpjAszpKYdwAqcYk3e9cKelyshRDLJVGw+H7fmBMJXH5aGqkh2
	Bx795GGOgpK6JGoJs/2LXpLB7viDKwH6nCiKgzkff109AKw/2+GGxnDqc96+VK0oDGa5OHputdzaz
	6hVW0LOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYu-00000002zDy-0Cqg;
	Tue, 10 Nov 2026 07:46:36 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXh-00000002xaI-2YX4
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:35 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-55e0090c580so567068b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296720; x=1794901520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
        b=on2qRBr0GQoV0eqEKgFa5Gf47anp8kR2N2TmD9Sh0zUBt9Y4Cxx9EfDYclXnAISFzV
         2mXES69c5Kc+OuK9m6sH39i/GiyZsVYqfVLgr4PriTNw0OxN0gj/tzKpCIP06NQOf/X/
         f8kDEgi5hsVozGz7esmHyqb/DGDw4Th1PJB1XlWzgo2jVD1Uo9ab7WolT64dmVa8GXkc
         86iV10OpGnQ55qTby8hy5bVdwLl1Q0MFMMn/zYzLOEGvezID+tzpZZpNs6tbUFL/s6Xu
         rMxf3OGDXG+7Ph8joV4gDN/QCNrYZ8L3xF2NHyJ3OC1UkdkSxlRgcGPnrzpZyvmioSl0
         hCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296720; x=1794901520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
        b=wXs76+cOFGwov+AeS5Ldkayu8MinOvkccmW6vw5z+Em4DIfr/M2N45me6FiUywK72t
         W6nrEhKXH5vJmVjs7hml1Mgi/lvD9ukgq7YdOuARzWDRMe7bQvzRp4xP0Qe//JAIKovI
         uA7C1J4IdP3GZa8RPxeJSV/xoQ6mzM0W0+QcSsNuk7miqjG6PPc0ciFosPw1w7uP+WB/
         XZAIegw0jUktJ11POJTQ2FnxrSi1E3xnw74PyRtlVLgKDjV+Gje8SzRScZO/JuyLGmOK
         9lsanKBgK7YPTz9bPMiURuz/EM+9UKVYIgNqHwV6rvOtrVVuMovopBbgb7qJVADUaIMO
         2Dnw==
X-Gm-Message-State: APuU4Z/I98psHh0YX6pKPsXh0g2yNmatBdLyLqfq8T0JFhxXWLwZo95b
	gR8ruwMzy6YS5Kj85F+AoNXI0gqfZx8c2D4GnlseJeBlYM+4p3ocakG/O7Y8vvZb
X-Gm-Gg: AYBFou29VeluKlUHZ66PTMLz5TQFAcWDgH9K2AJ/2SXEHsTQu/FbCwB7bhMFN0QoAms
	XsxpfVUtUgwUgP5c9Xrlr/+WyzsZ2C28pveJlpfWQBb3yN2rLRhpoIF+fvwWMXsZKG/c3ZKDbMN
	nTka6hUfNc1N2JlzO2mJZMSWYxHB6XLyUi37j+T5ydypzY3oiROMvZ3di/GjMYWHWwV409BGk2T
	6NC5PQdmm2s8ave4HOfy8XsHClwlZJi/VVeFVbVrU1YtqDb3dRoEzc/nFGNCe1//VL4fMyROVDO
	HqcWmHpAJahKEcZ67ztPhM/kdcRRFjo39bfX+VU+YEN4hxy3PzSdrXBiORVc8TUM40HQAXvlMUn
	iTfR8pILw7eats+/scq3Sacm1YHOu0++mdT2rTw5tt5YDsuVi3rfjOquu2b7AwuQeswUikroC6Z
	3cTWb9CuEbmDeBUu651r7b/+peC7ujt3BcrxlEduWFYxxwiIrggpuGE1dR/iHCPyf5+0S5FAMQC
	7czXE4i2MrJiuUefsQvFTUUR6O+iylcomq3Sl9qTyQSdQhfVMlkfDpLK+snwQe+Krt3v05TFHJk
	sHg0AvTrqPjUedp0Lp49ZsHUy4588WqG2VLOJdB1sYKEU63MmALbCzai5F+4HgHa9NRFpiOZR5i
	081+h+AC7fvbeveIrvUPXiQoSPmcLLh+cxj3JosnQH8G/J8ckoXiZLkRiONMKMFzuRSH4JG4lhy
	I5HLdf6KHwlnbwA7NNZngMpCNclwl1sK7VYi7oAbMKJ/LUXximmQ6dEhKwCa47JI4NSqKi2toV
X-Received: by 2002:a05:6808:4441:b0:4f4:73a9:f838 with SMTP id 5614622812f47-5683c9bbba4mr1482552b6e.22.1794296720144;
        Mon, 09 Nov 2026 23:45:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:56 -0700
Subject: [PATCH v2 53/58] mtd: rawnand: fsl_elbc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-53-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234521_713924_DAADBBFB 
X-CRM114-Status: GOOD (  17.90  )
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

Keep a reference to the shared FCM controller for each scanned chip,
including chips retained after unbind. Count active banks separately so
a new binding cannot reuse controller state still owned by old MTD
handles.

Unregister and drain the chip before unmapping its chip-select window.
Release NAND metadata, chip storage and the shared controller reference
only after the final MTD put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 68 ++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index c655d27bc4cc..c27e89050270 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -48,6 +48,7 @@ struct fsl_elbc_mtd {
 
 struct fsl_elbc_fcm_ctrl {
 	struct nand_controller controller;
+	struct kref refcnt;
 	struct fsl_elbc_mtd *chips[MAX_BANKS];
 
 	u8 __iomem *addr;        /* Address of assigned FCM buffer        */
@@ -837,23 +838,35 @@ static const struct nand_controller_ops fsl_elbc_controller_ops = {
 	.attach_chip = fsl_elbc_attach_chip,
 };
 
-static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+static void fsl_elbc_controller_release(struct kref *ref)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
+	kfree(container_of(ref, struct fsl_elbc_fcm_ctrl, refcnt));
+}
+
+static void fsl_elbc_chip_release(struct nand_chip *chip)
+{
+	struct fsl_elbc_fcm_ctrl *ctrl;
 
-	kfree(mtd->name);
+	ctrl = container_of(chip->controller, struct fsl_elbc_fcm_ctrl, controller);
+	kfree(nand_get_controller_data(chip));
+	kref_put(&ctrl->refcnt, fsl_elbc_controller_release);
+}
+
+static DEFINE_MUTEX(fsl_elbc_nand_mutex);
+
+static void fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+{
+	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
+	guard(mutex)(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
-	kfree(priv);
-	return 0;
+	if (!--elbc_fcm_ctrl->counter)
+		priv->ctrl->nand = NULL;
 }
 
-static DEFINE_MUTEX(fsl_elbc_nand_mutex);
-
 static int fsl_elbc_nand_probe(struct platform_device *pdev)
 {
 	struct fsl_lbc_regs __iomem *lbc;
@@ -867,6 +880,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct mtd_info *mtd;
+	const char *name;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "lbc_ctrl_dev missing\n");
@@ -904,21 +918,25 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		elbc_fcm_ctrl = kzalloc_obj(*elbc_fcm_ctrl);
 		if (!elbc_fcm_ctrl) {
 			mutex_unlock(&fsl_elbc_nand_mutex);
-			ret = -ENOMEM;
-			goto err;
+			kfree(priv);
+			return -ENOMEM;
 		}
-		elbc_fcm_ctrl->counter++;
+		kref_init(&elbc_fcm_ctrl->refcnt);
 
 		nand_controller_init(&elbc_fcm_ctrl->controller);
 		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
 	} else {
 		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
+		kref_get(&elbc_fcm_ctrl->refcnt);
 	}
+	elbc_fcm_ctrl->counter++;
 	mutex_unlock(&fsl_elbc_nand_mutex);
 
 	elbc_fcm_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_lbc_ctrl_dev;
+	priv->chip.controller = &elbc_fcm_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &pdev->dev;
 	dev_set_drvdata(priv->dev, priv);
 
@@ -945,11 +963,21 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	name = mtd->name;
+	ret = nand_set_release(&priv->chip, fsl_elbc_chip_release);
+	if (ret)
+		goto cleanup_nand;
+	kfree(name);
+
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_elbc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
@@ -959,32 +987,26 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 cleanup_nand:
 	nand_cleanup(&priv->chip);
 err:
+	kfree(nand_to_mtd(&priv->chip)->name);
 	fsl_elbc_chip_remove(priv);
+	fsl_elbc_chip_release(&priv->chip);
 
 	return ret;
 }
 
 static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
 	struct nand_chip *chip = &priv->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_elbc_chip_remove(priv);
 
-	mutex_lock(&fsl_elbc_nand_mutex);
-	elbc_fcm_ctrl->counter--;
-	if (!elbc_fcm_ctrl->counter) {
-		fsl_lbc_ctrl_dev->nand = NULL;
-		kfree(elbc_fcm_ctrl);
-	}
-	mutex_unlock(&fsl_elbc_nand_mutex);
-
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_elbc_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
