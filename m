Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B44B606B208
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OuKuO4td;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMRP4ONg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5FhiL+G0gHQX/+iRvHVoRqV6ce8h34gkpF8SxVU2eU8=; b=OuKuO4tdMf9VtAqRGmsumLmeor
	E3OWtJAAFOBvyMSRfhP7bHMdcsE+ZJbEVx4haXFb+mV164bDyzJoKOA1Q0Bpx8kLI+S3nc+h70q2v
	g/mDDr3a5KgvQWuuV1IsVsSpYKlvqnuWI44OeMoLhzIFvUM0Ezv64As5ycMufb/XlbBq5v3lwmXPj
	aL+v3hotwxFyBf6gJ06bB5z1ehUVNAoN27FELU2rROKXWQo8fD2WogKIPW2F2I0Tf+/f97+PNAsDo
	LDuKPSNuKYnce+PmYqaHtYs7dmQ//eSP6mjWIQXJ2Ou/we6wlqUMjSCKZxNFHKFaWE0BN+JPddhTe
	VvsisGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoo-0000000DrlU-3lxu;
	Fri, 13 Nov 2026 18:16:10 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoM-0000000Dr08-1nrT
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:47 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-8615687a9fdso1574311a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593741; x=1795198541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=AMRP4ONgv5pX0FHIWS7oOZ3yBMgcdD0KbFWNQ6mh/r3L4dWuEMG5VUINGkkQ4nnwJF
         DS59mTfjpfOAy75g+lyX8jRdmC/fv7nmjhNXBGbZRi+syoKCvgWVrWATTyals5y9AOfS
         ehdsp8G+TzqcxrNvHYn/xxl/uwMVuOzAatkmTxLEFlBk9hX85BduBka7bVuIoz68dXB2
         ONKwDKPqU/9H0Jigtc0EEXC5cJDtpebNoo5AJwDVeQQYyxKbMHpZXJg+UX/NJtJQcF5b
         rTwG/bS6ln3lQtDfIDLaAgoh/QLiEOG4BnGTW9hi0/VkE1Jz+oCpQI4djn0Rh4bTi6Yu
         EY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593741; x=1795198541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=Z4yDGQq1MJmengKdBmqfH4OcQ1gRVp8ugnDJZwVaCc8VLaUDubWqvNlNWrkHBDEYHW
         KoLxAXd7W+Kh5E7vmLauuxKDzIQjZoq6FS80taj1l3C11+ZQXB/70iQ2qLn2Tkp6X1vu
         uAz0ujrgtCOVed2lHR90dVaY1gYenuGXSMygT0e4uvinLMBVSmR6TXMJubJPatktF1aM
         MsNtUdNWnS1IOlwPMD1XxyJTlIPS0N7DsowfgLbO0FabMc4WKQo4q8R38WxkIjk4mc8P
         lOGoak0RIZokw1CtZqnpqb9xsiuzvugBBRcu978ugkQJrhs8x8CmQwDdYrMJUVjOa35M
         N7Kw==
X-Gm-Message-State: APuU4Z8jLPmgI3JULqwE+Kn2Ttw27N9mqqC9j+fvA7br2cyW4ARjWxg7
	JGDZTUm+ctQuiSs8UpQUkzeqjfHDwkqx2b7Go2FNTPvW6oe0xvL/BoI/
X-Gm-Gg: AYBFou1LfyctWZVUXzg0vwbJnldgnXl99xdDJ+dLK9YRWOzZD1T0Hv37Vj9EwclRRSm
	J1FVFWaC3bgd1Svasg0Otv8hwoiprWq+fDtHgipfxeMQmzFaAS5XA1iOvO8ygJ6tGcOzT7Z9t6l
	smccItk+DyGG63z9yQ6E8fmk7BONiNiKx9BHDRJl8r/tngB4usi6zTYMKavhDMJI+UA0b6wYOYj
	tQZ+GYQMmqcx/0HqLoX8fJZ3nG7g2zAQTeakYbobZXgUvnnoS02jgFEUF/HlC5s5I0AK2ZRG8o6
	OcMpjJ+TR5qc2V4W4XArMzmdD89MLQeUXitvTkfeAtEia9FWg1/MR7qPh5Q1+H2llqL+XMzZ+XP
	QAjEdBlgAHj7yQYj4+RSdQQHMskUKojRtUINmQi/v1mKdIuaabLpMHbJpXLuCiGVCcK1atIyPiz
	daoZTYcZsUwenMY0xpvB7bVgNv+eCzk6PMRhO+ek7Mqy2JWjS1jZn0nxnUlRz1R+Z3Jh+85hqAT
	F5NRxZyfKlhzdBqtYuVvdI+ULeUU5Q8pkO7TvPVeu+uU3OrQcc4rOgm9xp616ZdDxAV75tpunoV
	LNlUI5WjXcP+BlBfgU5S+sa3Awoe5NBvu02f91PoJ6AiHiHS2rQ1br2hY65leb/qgwnkK3B5Kg2
	EyL93YtZYX5rOEuWft1IaBgdePo3pI5WcDc0d6EQ/S/7TvKrzP0tXG4ddI8YJIum/IXKOosQjVs
	14RPYh2J7vYKIOZjcs1hKpTyCNLWcwutDHuWmj9snZp1pGpT5x4Ok=
X-Received: by 2002:a05:6830:7188:b0:861:56d1:a00c with SMTP id 46e09a7af769-8628972cba8mr2936125a34.1.1794593741461;
        Fri, 13 Nov 2026 10:15:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:38 -0700
Subject: [PATCH v4 22/58] mtd: rawnand: pasemi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-22-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101542_577894_2F41D537 
X-CRM114-Status: GOOD (  14.34  )
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

Release the LPC region and NAND mapping after disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index b497e84636c1..0a2d5e5bae07 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -122,8 +122,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, ddata);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +138,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +176,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_lifetime(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +198,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +215,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
