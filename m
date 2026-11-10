Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4137606A337
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=31ajT8zq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+59cQV/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VuuhBErht6g64JAviPatNlLV4WLR/hPRgSSIh/FpROU=; b=31ajT8zqHlHgInjaolCIS4WFEq
	/hwscyCzcJFxbeudKRYf08mIV0QQgCm8bjJO4Jw7wCVpH6NGEM1pmgNmJbPJZRRgcvqT8RWXwCw/y
	+wWSOMkxRg7/dQv178JC6e1GIygBBZljYCh868Fvgy+4L9GWjZm7FinCK+8GsUSOcpZDElZhtdkSv
	AkzJu8Sc+wTp73LM2D+PDkwFiHdRYgcZ3NST4PNJrKnZInKpdDKwaKzSCDwXi/AKEbfLYcXDA+DEe
	mkGxwgh2jUjV+B9jxbKGsndsota2vrUJasR16+EODe+k2dwVwQ0RfWutbkYEDNa+vCLocmo76ft2v
	fnYLulWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYQ-00000002yZO-3nrH;
	Tue, 10 Nov 2026 07:46:06 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXW-00000002xDc-1s0y
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:16 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso538505fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296709; x=1794901509; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
        b=J+59cQV/7jxXmmj/XuwffqnJ8Es36pP8b7FIUOnSkIwwU/4dp5F6DqVginhTCxzo3a
         YoWL6wYsDoCIwst/EaIOFb5B9cuM/onV4+fWh9tsK2RUS/wBtFsf3z/KzFeK+p1T44An
         h7upS4CbdkhsyZXECjpPli3KlZ6fatVG/dmXD4cFOcIetE/pWiD2tV5BZaUXJt7M8BxX
         uCR5nc74rvmWdchTi0VRIPg26+M2LGvp4xIs3jQboTgrimxQMhEvNwoxC0AmUOu7GuAA
         x345CoUM7pnCUDBR8DlyH8B+gm4UKkUJcqWVdcQbuEuQYq+WVvucp+9PloE4iIPEKyDG
         Xwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296709; x=1794901509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
        b=SQ9xGxiU3Z4l78G5T1jzC5TMH86mdMOSlaqbQU9v/oaOSA0lElpiwfslmQkhsS4zJ3
         ggsvFhY6hhG0CTyLwXAR0X6DUaPjTTPMesw159LLfyXRGnXZkeZE/D0cc5ZlJ38MuAZS
         7RlLEZu887yPXO4Cek6PZ27MspU9EtnBhKNEw2LUbNsWY5yjWdW0734K1+kr+UQDkJGz
         Q2UWiExr+MqiTILGlIZFZ/T7IDeRM138lO+wYddO+2f57csg1rzl9hSfpaA1e3qLg9JJ
         yaMxr2FS8lTwgH9bMPPjNTeLkFF52O0y6VfO58tPjF9cszqv7WRym5oKVUgC5qZ1FHdK
         iuEA==
X-Gm-Message-State: APuU4Z+Oozcw92UHfCDCMl2zrT87vcut+eiLYY5Q4qH4vTjynLutS1sX
	ZeTZlfEj67OLdhc3m4rZQESpSXLfa4cZzTOLTPPis7kpcKuUg4TWmubI
X-Gm-Gg: AYBFou34qGPT5R8AZOFMc6avwVSMIItrIcoFLgdok45juDx7XofnMvW6a5nSDOP50Rn
	MO3ZIGNUMBLvkNM8UMHbg6WL4mbV1/mKLcHgEkwiaYfzNrTGP9lk0KN3i1Kd2W3MKKJ4mpyrL0X
	ckoJ78ms1wM95tUX+ol9yxP0cKOSProW0ZHdJ99XJcdC4GJmke60LpwGdt9u9Zna8fK/hNsQa89
	R4EQBT6qTSimqlT/rnWpdw6hwUGxjNrJi4/8S0Wk1uC7T86KfHostXce/ABrkbuEGWQuQP43ohN
	oxcijnoWUC798541x9LJiNwIX/HVuK+ZWTNhvty1KO3hdnXNXM21ahvhOIJm3hArj7HU2aWouAL
	MtZbU3u8OOsozIPPpzsZOc7PH9rwpBCoEB0YHn/rqKe+HQ8k2tOg23IFuczoZHYBfReVpVktaVm
	ClMmTqrsQGTO1wJ0Ee/NeWNo7BAYsMAaI/RmWi6ziM7z3eZF1lU1/NqCTMQfjaUZ+4HRjPEhUhz
	R1e5XoET7zzqfAZWcBVksyzGO6Kvxp5EF0sfjhee2chviyh5A92vi9FUvz74UHVZ9m2pZO076sG
	nSJWKqD6JJix/FwVfTKzdhZHe6tP2ZGkOJwFhb6czYUtCC+KdoSHLK7FLgJlZNRCI2hATqc1LbH
	NW2YUIC72sgJ+AHaRLIXYtRmCUz4alzaadK6jDBJ3c4KvW9eITPxawVqoLFsUqE8y4i5fCOtf9W
	aifJBSna1cUF6r3uNp1XBdFyJKAVlxoETkWzHuLj530gQVc0wx7Meh
X-Received: by 2002:a05:6808:1a0a:b0:53b:9d67:60bf with SMTP id 5614622812f47-5683c999877mr1345321b6e.9.1794296709015;
        Mon, 09 Nov 2026 23:45:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:46 -0700
Subject: [PATCH v2 43/58] mtd: rawnand: sharpsl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-43-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234510_588194_2E141B9F 
X-CRM114-Status: GOOD (  16.40  )
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

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 4154ab74f169..1ffd2b210d20 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -114,6 +114,11 @@ static const struct nand_controller_ops sharpsl_ops = {
 	.attach_chip = sharpsl_attach_chip,
 };
 
+static void sharpsl_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sharpsl_nand, controller));
+}
+
 /*
  * Main initialization routine
  */
@@ -135,6 +140,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl_nand_release);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +162,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +195,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +216,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +233,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
