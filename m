Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7119D606A33D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYigbKfZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rCLssr+9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mESfeHiD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iYfSKYzp9E0paFY4TF3SGHYj/TBP96uSQq3xJGKLsvI=; b=dYigbKfZiUPGe5OtLbaBk5mUQD
	4p6reQxSyi+r1+/rXMACqGIfChTgJpZOCEYSv4Py+YKfmIJ8xOdDge3JMoMGISmyhUUK8lG6vSR+5
	MwK/5LLtLQtuf4hNBGKiTfDNdyfG2hfvLMWQJu0+rKGHZc6Sk7d1UfThtuTkC3SFY3i69w6IqlcSV
	/J9oozojqrUtNJQhzpHvH1Qa9ddMFZQlw1iP1TCa483bY+5Cv9cVxVs6zfG+0Qo/L7JVsJWrAdMmm
	AN0/E3I1Ahl+TXTborj6HAnLUfgpfSbb8t7UxoyJvPTPuo1sYHk4Iu6yvhrN6bU3tVUjin1FJbBir
	Uafe/uGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZ0-00000002zMP-1EsI;
	Tue, 10 Nov 2026 07:46:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXr-00000002xp9-42NQ
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MLnGLzTCg3KFo3iPJRR+p8d3VN6v2zJ6pgf1CAq58N8=; b=rCLssr+9+AqObUWWrq8ILGgY3a
	hu1E/4h+2WYSODrIW8UywecJbqO7Vqha1X8TvrazMEGxfrZQUyyNq0bqoPwswgXSqZEYk2shuLcJZ
	GBvrktRev5raezjirSyItwqapimO36o98H2oUYqyVFqOmE3KsYKAkVkMFf1CX20pCm3qnvGotujoO
	/Az12fZxcM+rD7I7kYqY8SxBsAFwbPYvUK3992IfITYa4+lOVJfr7Arana3o5MI0HLMMLExbKaPX6
	0YntmK/+veqL7W1tEjTB+Yv+cQTNR49de6LGZZpxH6eA8l4a/mc6lb/ZPkFrIuLDoLj2ZMrrgq3tU
	ZbLXP77g==;
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXa-00000007e97-2lyg
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:29 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4e4a4d77e5bso997381b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296712; x=1794901512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLnGLzTCg3KFo3iPJRR+p8d3VN6v2zJ6pgf1CAq58N8=;
        b=mESfeHiDWbtPGqnLrzx0Ywt5cy79jBha2Y/OLbVKdiAT5D/3iLbA8rwiueru4T3sAD
         W8sSJU6aabQNO/MzuCJfIZv5jc1xI0hoGeGv9yCvrKGfZD0DnRjuyvf3gI510zN6YYk1
         rCbp6cUnHYn1cG6UbmQtbZuy+co+UdDKW5+MdTlShgu11zFSE3emgi8oLtCd4VlfmCcp
         9avM08nCwfXklsFV0Vpb3/MnkqS82bGtkx2yLm6QhYIWjATBRuaGG50q7ahOIhIWJ3L3
         ZLOtZreI4LZkllj38+Rz/ThfoA75RlN+mEaqbVUHy1PUbfBoEWq05G92/32julCYIU6u
         S40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296712; x=1794901512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLnGLzTCg3KFo3iPJRR+p8d3VN6v2zJ6pgf1CAq58N8=;
        b=GpKtmc1u9eHHZnv3MpvRfn4PPlVi4P65kwNL9Z0tKiFZHQincGGPV400QLSo0gOARk
         F87l6LqzTPnN1VRkU2biDCe1yWjqKYEr1A+bNdeEOjPdKJ++RzCLUXePRE6T+95Ov5l4
         Mo3PNhVrhiboMcut9BPbIf/QQisIdIaFMepJjRnJro+Ovte2lCLKZa3+eeCgAJKx0haF
         xwN4GcMUPVGB7cha8BWDLYVcjVD5DMtRvbRz8HPwkHaPwJTwlzBOPJoAViATQMvL090a
         G3cMCKrrRncvqZjqk6HZxEWNz9EJp7mogg9vHjrHBURk9UhSz9Gu7GRFwwlmfkJ2ZZoO
         gF/w==
X-Gm-Message-State: APuU4Z8c0IW352m+3A+Tj3womLsJ+ofkDBTFtnPJHzhRzeTUVzTQu2kJ
	ZCjU9iIwxBSbdlIMHESoFsL52O2kCXiqNc11/vG6g9stOfCv/YtzQHEm
X-Gm-Gg: AYBFou0j8FD9ZyYEV9jsRI0d0/7eR/t3+iSLAINDBl24cbkmtqhBCBjvBlAwI1fTQmc
	EckdG3erPT7QEwljvw5ZjIQTOCRaYM0JcpVrFwBRUpCuqiG87XY+ucl9mvytQ8zMoVKfWdYanQb
	Df+YedfZgddXcCYKpOD90mnBFD8/th4uSIVToJl5+w5ruRqwBGzcDxjeK0SvxrSAdpp5OMPBrk/
	NYj5OsNAgXh28IEJrR67jQuhaHp5o8S4XBzGubQN1P+6niFLrnD96yxzqOxM/SpjJnGpfgRwLyu
	zjvtiWyJ6ubrHOyzYYhTI+jGo+C9qWFIly1ux/+Spb4d/1kdIzd+DCRtxEFi7mVCFnLFEMCHKO/
	EDiZd+6oWxPx8ZXjcSV2GUsjYI80hSj9/M0nBTIK7e9CdbEdaepRmkc9vkIATiVOfah/kCiD9Rl
	aB0yOTHPUq57gm/4mpn8klrk8uV38aYuhXqKmh3TZC/pLaCrRuyhWgUOuX/8imtqisosOhlQ6Za
	gyt+o5NgKS1/qT14pr5ZHeLdxbhH2lekcWZ5swavbW+belGt3LIRKSR9E8LC4GdSvjLjLtpDhVI
	v2HSLASMCuaUGyUvUgTieySCQj2aVcZRGJbGMG85woI6/MvRy0AaHv9j9Kl2tmg6Hcc/vMOUcMg
	iloCs7H9qjQRXxheNQZKUbdMS8DB52ebsxHAtwmf79yAmVdoJNcfLyMM9UDwWCOvPccupR9SMlm
	Wd7onucIzx1aNdrY4BLHlPbsnLyblzPyPpkSJP04ofUWgCQ+4a1hw=
X-Received: by 2002:a05:6808:3097:b0:4d6:9133:cff6 with SMTP id 5614622812f47-568764d22b6mr889637b6e.29.1794296712310;
        Mon, 09 Nov 2026 23:45:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:49 -0700
Subject: [PATCH v2 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-46-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074524_679265_35146908 
X-CRM114-Status: GOOD (  16.97  )
X-Spam-Score: 0.1 (/)
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

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa9267..85945e1dd25a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -817,6 +817,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -829,9 +835,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -915,10 +926,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +961,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +970,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
