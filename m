Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763126073C7A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zpaNfgvH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ED1EQxDG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MS1ReJsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9RfLzZmEnJHtI+9auf28ajp3Cj6mrGY62QQgYOyG1hA=; b=zpaNfgvHqilgplQaDyzk9Kb6fr
	uYdzHWT+wdajpt1nWsd3VbqglylAg4ikeMZFObI48mRhwRCFkQwCJwFAKUXGSMSq8ce6WwipzaY6c
	3QAZPrErTgF+pFUsqtPjI6QateWYpWGMp2OJAKn9ke0DNbYnMe0qgNcCd3zyKP8CTjlBQecNCK0/O
	y5bf3slXYKKyvpezoZgmlwi+VHnwxHbd26qE990bDJCn4RCxHb3z8LD4Ag669rO2Ui6XMPGJQ0E+I
	9FG/yR9P3jU/zjrEObGelpXundGeuGBCiNh0YdFkdcDXfGTcUjVFPRUbZ1GDpkEBTbQ8DRgMqva0U
	w8oItALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXc-00000002xUr-2ozq;
	Tue, 10 Nov 2026 07:45:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXP-00000002wxJ-2YNe
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZpsePWqmYNTbWvoSp5jGUgvnOP7GU6uaxozkU4/R0Do=; b=ED1EQxDGi+tmnzxAbMVZYdCCML
	oeAwA+jqHeHBZdOmuTR6lUxEBVBirbyBfUcMoGiGjr+rHDMaNBfKsE5qZoP1vE8Uz7QJSExrB+kxn
	EBWvhjeA9E/dg61LiOPIP1dRyeEt2AnC6m73nB0FmTjxZoo5LjFK55ImnultaGg2+2JM4yeOuQ891
	8GZYrM6OtvDnOSBqjM3LaxJmmWt8xJyh4ZNxad0lwsfEvbqlrF04ihdACedwcNhAMTqEvovdcLwh9
	eV3AOryxv74rcQDCKoBEW3pn5CpozQDIEibFqxI9EdFJCLhm8gHZe02q2/mcR5B7sU2W4smj/IgXV
	93N2oDbQ==;
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXK-00000007e2r-1nw0
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:00 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-48e9476e26aso650069fac.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296696; x=1794901496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpsePWqmYNTbWvoSp5jGUgvnOP7GU6uaxozkU4/R0Do=;
        b=MS1ReJsy+Z5i+A0YHNMZN05eEkKiQeU03sGXzEZsEE20qIPNpDHDfbRakmSZc2uFyI
         qGbgJlZxpoE9hzYUtIqu+QRej5we2AHGIBZ3ril7qpx7s9JkTqHRNg/2nkWRqMro09S6
         GuOZOqHXumDVSpcjHRj+CnBEVv2KejS2zuF88/kKc5QutuECgmulzsz4vB189r85p/Ly
         lK5dT7vces8oX0JmrJ+wHJnm4eHCVhR8MObRCkd9GIgQSvOCEfWcuo2GUY8sjk4FIiEX
         sLEbgYMXcnKZ9tRBj/CJI9PPLeHq+aWtTQk0/+5pEkfgQYHSeExaeuZxr8DWf6HjUj0/
         FeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296696; x=1794901496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpsePWqmYNTbWvoSp5jGUgvnOP7GU6uaxozkU4/R0Do=;
        b=yr1wgDi55VRKHVNo87IqynRpL0/V2PqGuKZ6LdYuCowKU1TmeBI9yhhsvFNUP5H9PT
         iBqPKGNMOhTh05tCsEU88kZhkB1rViyHQpU4hlfwrmnh22uyuqUCUWxWqKjCK4zFqVXT
         isgkxVTdWdrCine7k+SVaHNDU4ugXq7fQq/mPnU32M3oMga2s7PCSuwsxhnraXIkVd/F
         i3LwzLroCRUzU0OKOrA9UnDVHo4TMoRKMmD8VcmyCMt7wSRBhFVvfNNtPML3L+kiJn6O
         OYX45fNPDtcJZoyN7QAQUV54bGSndTRqQ8qJRYZoBubWmQ7f45z2P4MyXnoNA9A3oN2u
         ObCQ==
X-Gm-Message-State: APuU4Z+3R6J5zd4ziUTOXbJdYXNC4CCe0KgXw4WN5ESdAZcYT/e1QRI8
	sV/R9inuI3wz7sgvrcOicDiNsRloxY6Q27IJtXsfkX+jK/mAr+vyLJTB
X-Gm-Gg: AYBFou3JtZqTGj/bNyOesoYMCHXJchEfzzz6je7yWHb6ZxISSGi+dqmLfEPjQnYXZS2
	gm8b70Bd+2za7H/vjq77F5XuYFX6cPpGoS8vp7CUwmgJ9O5peO4XJ1R7+JApP8w+3gr0zuoF9tk
	KTubgOCS+mhI0xkMzsHpYt6qdJP4I5aM+dJ3M5zX69xAv5d4kgZ5+mqNeH44d6w6UkvwZqOmCrN
	mRCAvBNmAutk0T0SFC7Ru5HsztApXAd+FxIpxBVfyEcyYUqdg3erhwc1THo944AkRKY5N1w19cZ
	tVYO+HFFt3IdfB3++lkInw00TIeQqxM4zmcTh46WXEr/9qJs6V4AXoiqbZCiPMUTZRPMokdIoxa
	4VPkAw2B/Z1yMgPl6QSve6mkDVRv+/gM99sF0omV81AEbz+sHP6XhrXGKmupVudYiaWfM5pTplm
	3d9TUqi2yErRJOnPsuUzk26Q/QM/qKqnluEBbERKy0mqr+tqZI9VbhPEp7hv2DVMrAw1iAnDVko
	5BKemX/FV7TTSYildrNg85fOG3a8VCQHFQ2GVcvss1QoqPJ3YntT3gr0loDmF+lNFR3qXvi6uMs
	m8Zliqb8vAM0030PTLi6SWs/SYHBhaV4vtA5krv2mQB1ui5na/WBdNhMuIcsbtLS+hmV1k4Ujlu
	p80iP4zQhE83tcYMcHaZ8fty0P7FWdIl2y+nIBLzpQElqHl0IplUgIoW457ofILObXEEwM1RX+O
	Ds+Byu9U7UzmwexMEy5LD2tF+mChFtkPVwcAm/5lIcGKbukqtJUfY+GCXp8oqQTOD1KWkjfRGc
X-Received: by 2002:a05:6808:138a:b0:4c4:9f7e:92ce with SMTP id 5614622812f47-5683ccd9ef8mr1560560b6e.38.1794296695733;
        Mon, 09 Nov 2026 23:44:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:35 -0700
Subject: [PATCH v2 32/58] mtd: rawnand: fsmc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-32-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074459_119374_F64D4A78 
X-CRM114-Status: GOOD (  16.22  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect before controller disable and DMA channel release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0b1817cdfc5a..d9cdb03e8149 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1020,6 +1020,11 @@ static void fsmc_nand_disable(struct fsmc_nand_data *host)
 	writel(val, host->regs_va + FSMC_PC);
 }
 
+static void fsmc_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsmc_nand_data, base));
+}
+
 /*
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
@@ -1037,9 +1042,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, fsmc_nand_release);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1136,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1147,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1189,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
