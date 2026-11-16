Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E60C606A31C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TzTJ2uv6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PxAGpZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I40VdOmHs1pTREmgH9CdKFPnSQtQF/kmnDtZAoesoMY=; b=TzTJ2uv6l45Hc2MPSQqCx6V1iy
	vPaJjl7If38Svs2t5xYREVPfzI1M3bcrV7/HNcAtfYK8Q2V94D14UoBYOP25KO6WSdqzkWSuz1nlY
	oIVLCcltcGvO9CR3XsORlUg3mfXrg2QcHKwJ2qO95mnDDWcRf2Vhml6Wp6kvQ0o8dHxw44Ake4m/x
	1jkK4WVEqQHTeBsILwSLrBedKzNp1t5RR2ZsaEW59ifVWFqOZKOwRDrdYAoWJuPzCSTEIxsfx6BZT
	F5Vwk5dGcVal8g4RXvEQoQ5dqPBdScySf5RTTlbFBEnIBGRCbYg3c7OwOBZiFAQgNreo9vrJ5GTH4
	pd9z5FAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqMU-00000001JuP-4Byi;
	Mon, 16 Nov 2026 06:38:43 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqMT-00000001Jtr-0stJ
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:38:42 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso3076533e0c.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794811120; x=1795415920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=0PxAGpZX3ZXLKBsnUJJ3bA9AlIpvmNbc6h49MTqISIirXMbSjFZ2zGNTSRvosend8G
         eFojNqQ39X3/3skVNkCw4QlzSLKzbi1nZIp1GLyaGhXLd1wgsTE5Nq7iaGljVjpKTvM4
         ozZ+CZ3IN3xFNDDEc3sCA1UoIIs7bn+lf5qi7JGSZt/99MEGDcSCw0VPpwQYEi8Uj8Go
         s9dY/hver0f5Wse1cwwMyxjoLonmDhQGAiUbj1H71v5I4CSVD7ypf+cBtqmfQI9r50xZ
         m0D0moD04wO563yLRoqkztowIq4wzPjZMKhrj82tupTpUk2VXsA+jTprRgc0tUVJgDFL
         PoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811120; x=1795415920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=aOWNZ29eiz99pZD0C+IKwH7n8pylppBE3R5E2trIodbgkbyGvkTtXLGx4CvLXmQRaY
         h4v3pDm4mNoS/zFmjCOD5nxzs/MvCmpQ7vYgxVm2N1ys6Fwdekq/S5svtyV1CpspDhkg
         KfjbwEAEWmdeC0Cgkk4+FS9FWGOK6aUBgsBa3T66A3YXveFu9T7VhF3bqWPsaHj1m+5k
         Fr7EF/aKT6sdg4qf9qu/wX8OkBaRGUqlBU92dgP9MmIUHwpy+0NfgKWLtjNm2xFQEvDG
         xjG6/Wp1b5SrFK82rZRNYTZd/lp1mHULnFvjs6Lnfvp6WriSOLAqJUtq6992wQ360HWR
         MSkA==
X-Gm-Message-State: APuU4Z/dEfpwIjPwkdh+b7km65w6JGHZDXSeB7++cCElve74c/YrC1uo
	Ltt1YTsZqaEzQgiRycMhUju8K+kcDrTVraplFVmdAA0k5VU8dwmInajpPw6btBuC
X-Gm-Gg: AYBFou17bjMDZDB4RQ0zdoXXvxKtUNVV8fow3o1Q7KUdscWApDzecgJvJCjGsv8b8ko
	mvfjR0Xwv0f7bklvIp4q6hj7Mui9RAg5fKXotGpdlI+wjF7cwWQc2AnuebTfR6ixJ78F8CY1Jyo
	SGJj2fSn0XWPo/0EQH7qWu0iBdsPk/8xXsN7JOMAy9UFIcazoPJ3TzXdPj4X0J9GZj3b8iZuOyV
	i+gBzmRobz411njBxu8xGV4O0KfhyJnpcYHBrQHBGSS7ih9pJ5nvg/TVeJSamu0bg/bLGUpjZGg
	ha7c1IiPm4abscsYuQMg6jCDRHx/VcrLtmacSYTGHgWGadG88wADPAbroWJ1IFYRMDthaY5vSJq
	6TBuyKjKBDJlgAddn9jeeM+fmkpXsnVJs94VEUx2VMYTn7iSbBq9Kl+/aExBEC0XuDP9JJUp+P3
	lNV2UP5UUL/PwxngA9X4oZ4nn+D47C86Xkpki4OKtwHwqFTGzMsu331gBy1dF5uz25NSJPp/xnu
	ILUbQcIv1FAwutRjrhj7Ojc9lFL1+g+dzWnQCRO2G0KEu5sjuxj77T7S9XBrm7Bu4DsqBr8LgBC
	1d5I24eaEs8IjwN9+/lQWX0vUwnBV20ZOH16yuxEikA2k3UoayUv5YMxxgLXZMFuv9sKNwZfCti
	ADJM1xyVoc3PrG4ZBJ6t5FucFSHVVpCbKYiLeoovut3E0A4PN3LtHjXegEyWevnaJYQHrW2y+To
	LZw8fzjBVe9kpTxzYmm0rIYBWAnAC36iXLGf3klO+7G75EFPrlEwc=
X-Received: by 2002:a05:6820:a281:10b0:71a:fb0f:810c with SMTP id 006d021491bc7-71afb0f8686mr259594eaf.63.1794810618510;
        Sun, 15 Nov 2026 22:30:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:41 -0700
Subject: [PATCH v5 26/58] mtd: rawnand: vf610: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-26-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223841_262585_7F8BD99C 
X-CRM114-Status: GOOD (  13.21  )
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 57da9eab940e..16e84ade92db 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -813,15 +813,17 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, nfc);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
 	mtd = nand_to_mtd(chip);
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = nfc->dev;
 	mtd->name = DRV_NAME;
 
@@ -873,7 +875,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +886,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_lifetime(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +910,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
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
