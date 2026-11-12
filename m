Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1360A2629
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VdqQ8/Lj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RqifMuax
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ce384O4aKXa9uzJk0mNjJWyLb/6pJB8ng+Ef9DPoaRg=; b=VdqQ8/LjFygN/Qnn6lDsQcpu59
	dhapFaRL2IyvMxRZqACKapf+M2FjFCRh76fxB7hkMjljlITmGr0FsQidOTIziRDlNQfagJ7sdBRwz
	kCRDxfD+C3XRY8A4u7Dw2vpyRvuLUTP2skHHEPbWBVoRaXrgKuPU8EYWYungYGVWI5zIKseSU6rmR
	hEdKMDatJOqpsdkHmhh6ihBnyeORm29jA6HvJZnh9kJHPWLyPhujYKeLBycWdlMaN5ChuncEclbpW
	rx/H8GkT8akaGKfrRtgMX3n7b/J2lgHGkZvrM/SU5wqaHbCMNJ2ErV8arfb/GmHI5zgIgStjcg8x+
	ri+0JlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcK-00000008LMI-1Fwu;
	Thu, 12 Nov 2026 01:28:44 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcD-00000008LCo-2ka5
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:41 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-5641f26ce05so1557516b6e.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446917; x=1795051717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=RqifMuaxtMCcIMoEc/nMW+LZuZVJ35XWUJh/bffkvreLa31t1FSNCwkLAbSTuXmYAZ
         /q8ggRBOtX6HgvoqIKpP7wswUrpAtC6Hk0fwtoHFEwQIdOvv5TdIJw8/957gSXZRkxT6
         k+ij36I9OHAvEOoGUDEaGDg5TllFO68UQ80oE7JvABasQeMLp2766W7hqxm6qO6LLQ6j
         7BhwjUVVerTuJpQTLxg1WPAZwJtFIgBY3SJwPmh4NtesxrsXtX7wKARfgQLUKUWNuiCS
         X8M8p3NdR18or41lx11TL9PK2yFEDZEHB5+roQeWAf+MX+ron73hnM9lE2yOPn/8R6zN
         jKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446917; x=1795051717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=P2Zk4olq3R9rnEtdMBD1z13QKwWduGPvY9bQP+s6nsn4V3kO58EYBgmGZAVFFm05iV
         Arv0Fh6J6xh50yJiep+VMZIJ9mXNpGJhuR620rEGs/LafnR9byQAORThXTW/WkNpTh4I
         fm2y61JyxBNJrOXSLA06e6mbzZgfHN+YAREjLOCw29AQBXVYZnM+8esvznnMfe1hkm0S
         JUih2Q3S/WwjojyLV/pF0QQ1dF9UB9vFaosMXi63DUxCg39t4RdaV2d9Ud+ypLVdiARp
         JH/8YiniqRMXZovMHuigV0YLs4wDr+KEWFrtLVQLpSkR6/ankgZnsvsq7ZWdhCmwidVU
         W8rw==
X-Gm-Message-State: APuU4Z/ID11FU2rk1TNHzQqGigs88wcJ+rV4dIsGFgUT3foVW8jIYEjJ
	iS7u4khrNtwMB8sLuqIbyVmlW9MflX0t4v/kiL6X4SrKX7fySK64b6gi
X-Gm-Gg: AYBFou17zKXBgpyC2FFsNIRa05qFNRLDQjJhsVRD4oss2uBxS85A/HBkIEkDuxhuIIF
	MkUvZzRqv7fp6l5NpzNvLN0m8ctzMrTj8vFmRznbUZUIE0wTQLUlxEVokFeslTViaQf4fqT+5+Y
	A0CBG0F7ZqSTDtXHIXZ4CDV5ONk/9WZQ7ldtYOQ5IgIUWTwvFFMHw+3emWPizUXDjIHeHZ2lyiP
	0TWYuj0CwyQ9/gE9yHpcG8DNaOQyD66Jk65riR/7JVYSb4yO3OSoYf3LQ7ynssCXQcn5vGRAwgt
	8Co54HYx+zg5PhQDPT0hiAPiVefaJNQKynRJBBiAvPge97OZj0Zf9oD4eM7VpHza/UfBdccfmC4
	AqdBnhBgJ6Ek0x8tGxY/4fUhs3d7ooMPmmtgvNiQYzJRcJeOsZPVLOgc9xx5IeIutEOnu1scP6u
	uDRfsR4dTXXqkqBeoHYvXW7cly9X7uQgSybHqqYRQDpq9h7snCzOaFTpDyvDHQ4GaLWT3XMBqAB
	nJ8w9xaZOwod4o3xuN6d4+aaXPGXDIHKgt3RP2W11cOe2jfFdeydQTCcmifZmFW3poY/6EtAKad
	U547QkUVOvHCHNkNdlaYv8QxSlO0lsc3/EGK6u8SXStYmEkE5IQMAwH8Pjt5E4WkvQvAxDBBgpP
	zWdo0CVfWZWdMCi59Ai5+q0fQ0guY4/tUqVGQXgQNkVO64yNHFfzZvPDvHdEZR0+7tLNdYGRJ3N
	bMgAdOAmKRWE3X1mNVOXHNi8olLofZy7rd3j5j5ywfjCgEAfCEkiCa
X-Received: by 2002:a05:6808:5087:b0:55c:928:69d7 with SMTP id 5614622812f47-56b97710a41mr4004524b6e.67.1794446916902;
        Wed, 11 Nov 2026 17:28:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:47 -0700
Subject: [PATCH v3 08/58] mtd: rawnand: plat_nand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-8-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172837_910095_BC8A6DC5 
X-CRM114-Status: GOOD (  18.02  )
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Run NAND cleanup while the platform is bound. Keep the chip, controller
lock and copied layout until the last MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vitaly Wool <vitalywool@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index a2775886e7c4..7963ca2d4557 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -65,10 +65,12 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +79,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +127,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_lifetime(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +140,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +160,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
