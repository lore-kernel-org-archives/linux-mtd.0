Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88960A3829
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FcmWJqZK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVH1NcOn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ml+4YDHp2hTUuPvYFaJmkbFYWmKn/EUTqdW9I4YfFic=; b=FcmWJqZKqEPHQc2f6yMk/iyxf4
	SJ9eLNp5rHPYbIruHC/fQJRKPpyUILq1jgUql7THF1JWvQ6HQLGDA2qn/A0kmAhLLJQPq0FQJ8JL3
	3/VwXCHNPtNjZvIV1p7IDDl2nr40pMdtfgD0WtuvbjBEBp9luefHO/wmhzzQyZ4g9/WGszf2AUy7C
	SkKe6TAIR19NMyoVq+mJM3xRDMIPjzT/zk9dOkp7cm0hI+nbONHHBQhqfu0kOn2QcqzarAaAvEC1h
	+Zt3Q/sVYFGGeUA8b0tafsnxR+ZCT4Y7Rsd4/MIw8bYPs1DrAFJ/UpFz0I5L2w71LI13psifMq/us
	NAY62gNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEG-00000001FHj-2oGI;
	Mon, 16 Nov 2026 06:30:12 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE5-00000001ExA-3zsH
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:03 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-702fd86d674so2708653eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810601; x=1795415401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=PVH1NcOn7LQOUOnso9yD8wju2RqZcEN+oqtov6e28KUJrqShEe0Bd+vDOADcvOV0qa
         jZgmEg8BJuiAGRbEWShEzlPSdpLeixMq8nf1ZTpNV+n1PJIOeh0lF0a0dLmr39bzERJG
         nVMF0ZMqWrcv1SrnJk+7G4OEZ+N3xQXkF5GGVjAAq26V5weEwAqiMDbrKw09DjKJ1dxv
         a/I7tzez2qdzuSc/WxnNg4FnySkTgtGzMBISsduc5jMhOPStGqxIk11vLfgCBpp1MoZo
         +hyqf3P+J2Z9noAMSgTglsX5X2/V12/+IbNrTwwnboGU9bk0A3zfO0lI7A0RthQXThNB
         yPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810601; x=1795415401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=M+c3YQqN2KAX7F+PbMnH3uHsnCZbPNL2uj0FB9/w6KVQnyWy5J0gSp4sW8AiVOAaqD
         YkTFQDdszYL8blsEF7qKmT0H1oIuPMhTTSZbr+4hdigpqgbCeTSwktcxYEs3eSkmvInH
         699pCWwUQ7Rz0KXk6R/3vihEZSbILwvOmltGDXa3JCeoipE6+mkKnWlsudpGGtEjuMnh
         q3X0LiKNR/ouRwA0mgmiOMUFRQ/8dBcoVwT3f9V7ydd18r0Tk89nYDkioFM4Ycjpf+Pw
         1gnLKQqn7i85qCzk/JtI1u3BD9yDoN8Td/OtR9zBWjVD27BCzQg7mvylbn7zaF3Jq9IF
         tTVQ==
X-Gm-Message-State: APuU4Z8cUpWjV22tW35pWeGxEQpqeQLUaiHL5hDUHEzzXPtZBlFwensX
	JNZ5BXnUwOgPAptsdgj77oSjoKsfxZxFV+pwPSiYsMRKOsZBNbn1/MMF
X-Gm-Gg: AYBFou3Ee8CO0IrrVtbct+H7RtFv9BMOXeuaTfCBfJiJByi/x0r71F9M3tVhwIU8z6D
	HjE9vWQ4JgrEbH+LThfZwLlKNlgIH4OiYkB3KD86zX1pBn5syv/Jp5Srzs/EpF8hTpsras7cwUW
	Ji/orERlLM5Gso7oHjahn6IBASi9Kv83r1z2TeJ704cPQqypbO/rA8QLQk0xYRKUB9TQStKqd0f
	PR675zUpL4VwMCdkUVpNC/XInEHvS8B1sFGQD5eADeQrPGq3IKMiG8qh0s5826yuD8MQtjFmmEb
	xbyPnoKJd8jfpOUGoe73MOlrkqCWsw2mecrd0J12nEj6sRVooMMHUAEhAgSRh0qZEYpDHiqkrUL
	YD9wkdDLBYrkKDPY3AMQUQxcvHPWrgcKvd0RmYsykOaOTqXhq65EGcCJbdRjuXYCT636qJ1T7CC
	m+srjB01AGp6V/1UpAm70pmjzlBeuEYItzJTEIImMNP8MSJn1EVEPfGqZSFusyoMiiTTcb2/lz/
	EM0pe99LDHVnWKAahqtIygWRbmx7F3eMtYPUluYiNmvdC+j5co7g/i8lj/5zBOe8PGu5EJ0CZ4u
	2z2HdCqZVS63PnG0xov5Y5+VdHQoBGNh2etVYN9y+hM3y/XouOaDO9IAGwd4YvJ4SKA+7kGBJaZ
	9L4GcmBFyXIbcNGa0H2wtTVtB8DCOM04yIYNIzihs0V4Jn2IvwqK6z+vvrPGtH/v99ILV0SCm05
	PTuCsUxL5Aa8A/WUroOVIN2uf4MsP8K1PjPSrxe7MwhjZeZjMc+F8=
X-Received: by 2002:a05:6820:3383:20b0:703:8835:5fd5 with SMTP id 006d021491bc7-71ab4f55eb4mr3884991eaf.25.1794810601026;
        Sun, 15 Nov 2026 22:30:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:28 -0700
Subject: [PATCH v5 13/58] mtd: rawnand: mxic: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-13-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223002_054171_037480C0 
X-CRM114-Status: GOOD (  14.75  )
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

A retained MTD handle must not access controller storage freed by
unbind. Disconnect and clean up NAND operations before disabling clocks.
Retain the copied layout and controller storage until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Cc: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index ce9fe27fb4ac..9b666a2c0a8d 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -492,10 +493,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +526,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +543,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_lifetime(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +571,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
