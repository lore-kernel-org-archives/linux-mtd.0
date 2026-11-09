Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFC606A334
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VOKCmAC4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TrfK0m/V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qfV6R34w61fE0n/NbzDIV8oP6n63HIkMvsiO5YfNleY=; b=VOKCmAC4SCGM5UO7o63z6YcRBK
	JH4pwp420ZZeLaJcvrKeeIVb/9NXTgSdRjyLolnPF30MQa/8mURWWhrgKSXQfd3hlzYIcbI3Ol3Au
	chpqZtZb2TTXgXN4ZHuN6JJcyt44d8kqcW5txQhQR7/Uy12VcvqqXAXTjYFmFI46aYvopenU+5yMR
	yqi7YTXlR5k15VRRx2kSvHwOpfD0xyjLLKpdA8x5M9BhETfy27vyLo/TP08YPlIksREhcYOvi2GeH
	+LbWb648dQVFh0Hh2xEXu8xA+Hl5DLKbJpO9H6TsFkhSBq6yAa3lWXrJKfg7Md+ev1U1tkzUpvFtp
	sLjjgyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECX-0000000H3MR-0bRi;
	Mon, 09 Nov 2026 01:29:37 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECS-0000000H3Jc-2huG
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 01:29:34 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-7143451981fso252772eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187771; x=1794792571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LGO8kbqRjWmKCJdidhOgv7673/JPMkKyXcsVD0AoBg=;
        b=TrfK0m/Veoz9g0uvXxVEbzPT0PjrVugdtWtdmXls4XiEhljPQkToCFc6IgZPgYp687
         AkteX1g9NZaf82FnzOl0sECbtB2OZmRBOGxw2Rql0ktU2F6rV+JjV1C3ntnBNL6yzkc0
         str09Ca+DjthvRbUiATwpXvKX8/B8dgdielp9TWS/ZiSNnehk4YT4DEF3axNBr0L9gtO
         cMBpppQKiHF6QbKGsRXBp5RKJePBAAIjBxuc043pByMRSeSfLDkmK9SpjztAc18Pihuh
         dmPGxrfyxM2C7lg1WvpZxWhvOKrmOjaE1s3YY8AoI3fqFoc0c2eT0wPqN1N/j2KB0rRq
         qArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187771; x=1794792571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LGO8kbqRjWmKCJdidhOgv7673/JPMkKyXcsVD0AoBg=;
        b=IXgkUtz4FLmYHsQXRwoFk1cmbr/LqGxkW8teRdykm4NLtlLAVOi/XsRlOShcAu1A71
         9X7ivesdbIdftQ75qCUnPOnwjbKWOxOpbEmExC+evfEorpq0+zV8aO2i4o22+9o3+dvL
         4DwQvHGGP3vzfevl2S/79RqjYQqvkm/mj82j46/UGI40u7H91DQnXFO0SLpea+v64B+V
         v8uogcxony3+IXTw6sH6jLs0yepZY/7dYwdolRXqSp6b3Be7eoFej6QLM8tik3QzcI/2
         MTNBpEBONiiR6hNhez/65mpk0tZx8O3q9xU2ZIfC+fFwHnYtFz/YqzJwnYjGO2wbEP42
         AlvQ==
X-Forwarded-Encrypted: i=1; AL+hErHRuPiwugnzkg8HjY6WXXkaK6H9zN7Qc3UE8/U8NxUAtLmbZop2eM0PEJy5SdDqamdDeBpBYLeXqhA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/8VlltOkNMUtKNFOPVmkqhdMT3f4lH+aZfH4cfbKDL1siVRVuu
	ggvDyskn3ZG7GbT2AfrflXclscx3FbKczE5ho0OZNWAiDB8aYzPPNqVi
X-Gm-Gg: AYBFou2CiBvOZDpnzXei8l1IpYgKwTZyoa8poQvdxibidwqR/mXlhwVn5lMMYiB5GGG
	8OFyHH1eEquHDtWl4T2xlRGernoNvIIjHjfLvl7m8BzqShbSeg0gg1oTHCjP+Ypp6oFqOeKwI49
	DpyEEYFi13DYBIjSS9F8dzeDo/NBWd6iUvFZFbZQr8Z7QkdpPhlOozi8ib1MzHBQoMPD6KZkV1u
	hD/dVd4PM2aOUfw0wA2MOJ2oRCzukP5qqbFGpereyPS9dgE5t2PIK1TsdnCvwm6V78pgvHtvZsN
	+0ezcTfIVdVR2koR6U9yKQuKZUqj30hwGQUxJ1dzHb4ZqN3d9FlJ7jiJPcX5nSo8+TAIMlhIYP1
	vfcxU9y0cQtufB3mGPfXaMOaQqBRIyCp9PRr0P/8PJKZjXgULYDv+s4AWBqICj+UGK/DMHT8nu3
	E9MOt0ghgw/s68X6fg8+12aV4c1V6DfLXTvncVdx9CWbO5Fs6olXKi1ICfnqK/xD9lIz9e/berG
	L6j5EwrTaNymvK/xVdtXzSsGIw04KQ6SnDAfKOF3HzDuQPUarjNlBzKj7xenT+lySXBAhG1iR9P
	9N7AFFOpJw8GVJwoeV3N5jO/FowyT2li0AgBfbaxBeG+hHeP01DP6SO5jW5s4XQMLJpnLnILjFu
	1yBPZt54rigiRujpV2E7LqqGc+JucprdGucKDuyU2B4K4a/AwEqHBudHR0VBFtMRLnXoWjkHzLl
	8ZKMxHmFW69ebF2kQmWyk6FlEpl0nBlOcU7iMoTghr31/OouJEXaUJ
X-Received: by 2002:a05:6820:83d8:20b0:715:2147:23a9 with SMTP id 006d021491bc7-7170f23a98cmr975721eaf.19.1794187771525;
        Sun, 08 Nov 2026 17:29:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:23 -0700
Subject: [PATCH 4/4] mtd: rawnand: r852: restore SmartMedia and ECC
 initialization
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-4-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172932_704002_0C696C18 
X-CRM114-Status: GOOD (  18.17  )
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

r852 uses its own NAND controller and attach_chip callback, but
sm_register_device() installs sm_attach_chip() on the unused legacy
dummy controller. nand_scan_with_ids() only calls the active controller's
callback, so the SmartMedia setup is skipped.

This leaves the generic OOB layout and bad-block criteria in place,
omits the SmartMedia bad-block marking callback, and skips rejection of
unsupported page sizes.

The same conversion removed the hardware-ECC default from probe. This
PCI driver does not set a NAND device-tree node, so rawnand_dt_init()
returns without selecting an ECC engine. The zero-initialized engine
type remains invalid and nand_scan_tail() fails with -EINVAL.

Restore the hardware-ECC default in probe. Export sm_attach_chip() and
call it from r852_attach_chip() before the ECC-engine check, so both
hardware and software ECC configurations get the media layout. Propagate
its error before scanning finishes or the MTD device is published.
Remove the unused dummy-controller setup; r852 is the only caller of
sm_register_device().

Fixes: 7ef969a04228 ("mtd: rawnand: r852: Move the ECC initialization to ->attach_chip()")
Closes: https://lore.kernel.org/r/sashiko-outbox-204208@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c      | 8 ++++++++
 drivers/mtd/nand/raw/sm_common.c | 8 ++------
 drivers/mtd/nand/raw/sm_common.h | 3 +++
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index e78606b97b42..ce7def018099 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -820,6 +820,12 @@ static irqreturn_t r852_irq(int irq, void *data)
 
 static int r852_attach_chip(struct nand_chip *chip)
 {
+	int ret;
+
+	ret = sm_attach_chip(chip);
+	if (ret)
+		return ret;
+
 	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
 		return 0;
 
@@ -883,6 +889,8 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	chip->legacy.read_buf = r852_read_buf;
 	chip->legacy.write_buf = r852_write_buf;
 
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+
 	/* init our device structure */
 	dev = kzalloc_obj(struct r852_device);
 
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index a6387111d271..291aa21dff4f 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -167,7 +167,7 @@ static struct nand_flash_dev nand_xd_flash_ids[] = {
 	{NULL}
 };
 
-static int sm_attach_chip(struct nand_chip *chip)
+int sm_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
@@ -186,10 +186,7 @@ static int sm_attach_chip(struct nand_chip *chip)
 
 	return 0;
 }
-
-static const struct nand_controller_ops sm_controller_ops = {
-	.attach_chip = sm_attach_chip,
-};
+EXPORT_SYMBOL_GPL(sm_attach_chip);
 
 int sm_register_device(struct mtd_info *mtd, int smartmedia)
 {
@@ -200,7 +197,6 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
-	chip->legacy.dummy_controller.ops = &sm_controller_ops;
 	flash_ids = smartmedia ? nand_smartmedia_flash_ids : nand_xd_flash_ids;
 	ret = nand_scan_with_ids(chip, 1, flash_ids);
 	if (ret)
diff --git a/drivers/mtd/nand/raw/sm_common.h b/drivers/mtd/nand/raw/sm_common.h
index 57fc9f86f9ee..599fce778fb2 100644
--- a/drivers/mtd/nand/raw/sm_common.h
+++ b/drivers/mtd/nand/raw/sm_common.h
@@ -33,6 +33,9 @@ struct sm_oob {
 #define SM_SMALL_OOB_SIZE	8
 
 
+struct nand_chip;
+
+int sm_attach_chip(struct nand_chip *chip);
 int sm_register_device(struct mtd_info *mtd, int smartmedia);
 
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
