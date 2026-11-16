Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E16F606AEC6
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tD/5XQmJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BOZJFngG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgoHA/vw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TR0CuypnC61jELJsl0XF5lPLsPWUkWFMZwCPhmVBl8o=; b=tD/5XQmJaMOSkOaeIU4WIrZqGh
	/2FV81nPkXcT36RnvG+EEc3G6srs/sPxPLq6BSZfGjkPl2mbQwO8uE5YxM4lG4zOIxVjWeptMG8hY
	qOKfbAMB/eKZzXEX1yLp6B62mp9JIS+IHfI9IAEashVbK/RtaFtT3LGY3jJ8I0lfNs1jwScyuDPTC
	84/hQ93OJN4ZUSTRsuM6o4QutOvVMGic/mve3b/abYcaPVYq7YZsGoy6UvkOaMdVTd0DwZURznW75
	W/clrAv3q6FglachW3XcAVlPvzhcxScCAQcFQBU/MWIu1ZUbLnU0RzZTfhxz0aG6/c1Sgp3Vz/scu
	6SMw5wjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEo-00000001GJy-2y3x;
	Mon, 16 Nov 2026 06:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEZ-00000001Fpi-43yn
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=; b=BOZJFngG5G6IEZHhvpb4IDVLnm
	sSY2smVIKNSPfzNiPTXE8Pnz4rYQbWRe72Vw/pzhK18QCFg03nrIaaTQFjufvw6tPBc1bAkth/1MX
	lRY9z4KHDtEb3dXDtzHE9mPij0rnMC97WpLRPNKdZ0WctC9eoAwmUkyrwsg3wnK4DoQ4Ha+mu/NYe
	h78bYI8dN1KEdMKYSYb2FoJY3aoW1JcuCfB6Btg3emOBXjpwKIpSjeEoOtmw7mGqXTipnHDmg4AQa
	b7UQIrylD4itUbyYlzhZYMl+6WX26PVvMqWUH9r59KxOv3l/RxMIZPWnKf0rdXyJh7Nf7AzjSZjFr
	CRfkFIUQ==;
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE8-0000000DP81-3JZX
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:29 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-703be215729so982842eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810602; x=1795415402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=bgoHA/vw137+lVCM1DQXZiZTjuQPCqiivQ/0qcqQoSljSFpmVpoi7b86Px/HunkS/5
         Obgsuaui9XUcOmVuIHq5LmiSmYZA+g9mORfHTOHohu9Coxn6N/6Ppxgn38IeybIalzrc
         TYrvcZzjKdx0W+qU8SkFxAjv6kwwZpOHeoF2o31uHLOp9ReKJ+GacoCXpa2IVO3UY6oh
         wdDX6xEBCbJj4T2iV0tdGdkqMz5VsHlWTzkgGQgQfBkXP8vAvQGgcLov37wvyrzPOu+3
         ashBnU4z1MmXsueKV1zQrjHZrKTr0xdwWUc756HllxhiKhPHLf9SoimvWFTgT79eMqfu
         WUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810602; x=1795415402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=U8T/myxS02HKPJktx2wVB7lZ0RCfxaUb76TF43hBRcXKaNHBFk26sekSWmQng9Pbao
         YgqPeZLIDFxMa74TzCSjAt76+VVw1aVsrK2JPh5bQQdYgnSaIRZ7TEkSXyZV8Qb95d1J
         WWaVU79D30ZWQzpgujcSOvAwgyMUWncxNRBBMJvjpypxTUwxZ7QAEjiJ+unGXppgKXKi
         iEo1x6PpPyWRK/8256q7BWzKcweqNw8N9fHnu/7bFyBLOcsp/eb0Bxd2YMOvcRVcJjB0
         P/ado1VjOiFMiI3PzLjIHjx6AychYyUKkZEwqY1ofhendNv2L9kc1JXvM9aGQac9ILGP
         SwyA==
X-Gm-Message-State: APuU4Z+dTDHpZ11gZv+bBedq212MUs2X+qlbDNcoNQpAQEzzfU9T0gbY
	GRHgLe2au/dwshEY6UMyGdYu4ak36RDj77wTD99n5G7/3QP/RDQqW5OG
X-Gm-Gg: AYBFou2tooervgvfrF+/dJLJ/tfLC0rE/3Jlb5fRg94XiR1KZLy1vhu1WTZwFoD28Lh
	JhHtzPRREq2t8MEPSEdmkNOWnrUXx520CESSe+81XvA5bfA6sc5XIQVnuNuzqIFDFE3GKCuqC4g
	bCGb7Z6vAxZqwUIrThkTzi64IUGGG3m0UI12P1z7hZcniNFdQlEX4+0ZUYF1BB50h1+806CSwOx
	6ekAyJAnjgbNEstIq+1yBcrV0Q2iuprwNLYVqKmSRlKi1+p9So1jLqE2IKZupSxWrA2I7im+q/6
	LjwzV1lxxSEnRYHDZd+I7HDJ84B2CLHmvGMWnrWAYUcj9U6rpJyfndCS4tjgvNLXr6323ttOyYe
	HVaWLZt9uUgTwyWPB+/2tddL2sRAJB/sAGj5qSnHecUzsOQ3c5ND4w6OiLkQ5IatVjn29KlA+mZ
	dDsIhwoc86Ble8ksvU8QeJCPy+PEOnpLMQj0gsr2OeQc6ZFRYcAwtfHtvmPubdh3RbmUS6Vczal
	EvMP7R2YIavsfpo9+PWLcWRlwqIzczpLw+hUKuW8WFQz7k74x8DY6uHK6wKKHbYUkiIq9m7HO9F
	gn6mUSqvmHrXVCYqo4XW4LthqSRgLyTXeSASQBuMZtDtE1Qd8UUKwyebjmOHsR3pcuv4QbeWT3E
	24Rtx8586idDDFHCIKiZPwUImN/zMSQSrBtRhEvGDGLCWhFCXU+NM8cUjW04JkJzySdEp53OxrA
	6gLO6vUhx3F8deeZI0gZpI7moNMWjLZsBth+uDrpu4UbCjUHQe8ig=
X-Received: by 2002:a05:6820:1689:b0:71a:f583:67cd with SMTP id 006d021491bc7-71af5836de2mr1125386eaf.42.1794810602259;
        Sun, 15 Nov 2026 22:30:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:29 -0700
Subject: [PATCH v5 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-14-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063005_135144_8ED8E7C1 
X-CRM114-Status: GOOD (  14.89  )
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index d8071180cc0d..42a1d85b1cd4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -585,12 +585,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_host);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +694,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		ebu_nand_disable(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -717,9 +726,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
