Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3457160711C4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bA/dQNPh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzJrJ/EI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iPvSo2+rOgDuDS3DXGTHak0vuML4Ew1bvdZYQlWIImk=; b=bA/dQNPhNATQBulsTQpPMEBKaO
	UAELlpx33WzUWT20A1RBiAuWxoFGwjQwgw1251r96rB0ll5HA6QDBmhzO9t7fQH7Q++ATXjK9yytq
	5jgLmLEZCY0dvRHOrjjbzP5z5G6D7qwsm6gRQHT447BgTRfP6kmEyoYOGoA0S5ETZSuOv1MDUUNgp
	PO62yRU+t5FU4GQ7M5gskOMnsftZf5LuXKRuEGK9DsyI9ckAnc6BAWRZiDD56pSOskIkhE07GEdGc
	Ikpn/MiYeCbKfJ/IngHFWi7PtCJfRF1ZrC97rPioWdd5FTF0eYeqjnZjWZWDF9XLw/oC8V/ZajrJQ
	xY41HQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXW-00000002xFh-2ZJk;
	Tue, 10 Nov 2026 07:45:10 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXB-00000002wUU-0fuD
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:00 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1392974b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296688; x=1794901488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=RzJrJ/EIRAF99s2GilhwLQr4RLCfoSKu96Wsd/lbFc/TuIWMQOLoBDSROj/rv3eRZN
         qe+JMNRMCGOL/nIOnNzQYpJu98OvK55vSF5SMj8G3MBdl3Sair5dTFgVY/2LPe0CRhs3
         yum5Y+g1idOf+OznCt0xNtlCeurUBOMtto/0vXHbsXiKq561dpUaTVOdaN+Dag+TYCWI
         KZeDMhAKAT6vGUzVaXi4xz8a2IoNjNj26MyfNBuqGaMUGBkBlPpkRyycsQemSiNzROf4
         O4jPC0t2hCT8064+mSk6c1Gsiqtgeb+Mk9Fwo94eV2RpPfwbGKnWum9jmNbWG4mM2uTe
         F5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296688; x=1794901488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=D0iXdqFAKReSwyLZixUMrPLhFFjgRiTrm/D7SYAVP9y6zHYimKCbtObsDaSluDhw40
         f1a2t0eEtBm+qIY+KKoAJCgTx5yuTpnVDxDAnJ0zEtqcdaQl4mLGrtIrOBbdywmlcIm5
         7AvFRJNBKm9J5UV9pPh2Uhc/AZL5u5dtC5OXeLQfOSpIKN+mAwXCsevXhqj/+mYpgMda
         nIFYRtf2erFICaY9lwmtWPuFEf9STQE9e61RzHIYFjYmV/ZilH3k886v1ZGjSO38lD7Q
         DDxxhBNkX47a1jdWFx8pY3CLRp8Qu/QYRjQEIZZd3NzENj2Uh7Oc59iprpFn113yhtVr
         kEBQ==
X-Gm-Message-State: APuU4Z+5vfqYYHt/Uv0OVGSCNkU4+Fv3ZP3vzXBupWjilyXrJVO/j95N
	GzAFuN5OqHmiuNyRQirXsmI9SRSIYj2iC85m7OT/nJppjPnZLkw+FTMU
X-Gm-Gg: AYBFou2MGk/krWaCS0obr2aTLsGaanU5dbUx6gS/P2/epYeFqOfH1uPZjkDY4SSt1M0
	8hCSRuM+hneth4/grMmOdV6ioERi3/xnuStrakspm4PoXQ6Zt1yyXwM7/6O1Opyn0V6bYOQW7zu
	OcsKlyA60ucdMKJBcOsSHZK44S0FKdZmCMHzkMN00nCKUgs5dXc4Vlp3JkBv+ZbQv5wLB9ocCQj
	jYfKSxqNlR9Xql/AlUVd9gJ60abujRZp2Yz7lUH01702/rhPEIYMClQ1DpiPqcZBiZ8OlZGOql3
	gGBahBXTZCG4p4Bx13/1xz7yhb/Eglrt7AaP6qtTTww9uifEfrXVIxqZY8O5XFyWxGt/TwJRmQ9
	RXLFFBqUM5kZ4FpuemQr5hdCz01/gtKkcLE8vSG2SiT8qvgfFkuuDStjbHXX0YZFdcNzTlYI0oi
	YCHhPV+bVPvDsV4ItUOC+P0cYZKfnpbOwRxJx7Nw2Jjj+3aSBOQKqOX4IC8iw0pYWYrsUF0/T5D
	0prXB91hXGSxDT92gNwQPvxn369wTnYt5ip63lbChU9oiGD9UZcyAqvaFMPcCE507wozuzx31ak
	CGJO/spZz/K44R/7FSyAUD57AqXwQUJUu8tDv7zvrLTEbF8xPGIpYw/eGS0WsRCIvp9hs9mJie1
	ZRMCl+d4PMTqXOIp7mwwRzWOc0fD0VIIgPPtHKY+6NXdE+J/WOsJx9zOWca38GrBsinFFKmuLnL
	Q5C37X2HjWahPo2LCnwauFcb2UfFDIzZ+UqKhzXgEFdSIv9e24Pis=
X-Received: by 2002:a05:6808:4f21:b0:4c5:38f1:80cf with SMTP id 5614622812f47-568812cf121mr778987b6e.21.1794296688140;
        Mon, 09 Nov 2026 23:44:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:28 -0700
Subject: [PATCH v2 25/58] mtd: rawnand: hisi504: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-25-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234449_245286_74EB9964 
X-CRM114-Status: GOOD (  14.17  )
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

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
