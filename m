Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB38606A33C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iWXv2j5m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/xH56LQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yHwUFoo9q6Zka3MYslKvwXZdBvqpBUiAlxpEQ4t0zoQ=; b=iWXv2j5mTriyZy+gUFV7sf2F5E
	73/aQlXSnre8Ke4OHLU6p8wOtyuDXHAkcRkKXEp96Mx/1Bk70VOtecEBFbZ+pOpcM5+HsoRDFUOD2
	yo7aRedsnvkbyCLIxZtfJr3ajsTi6pTzco5470kYKGiX9I7bXsBKgy8Jv5giJ9Jxnr8YDP3JFkSVV
	INnEGso85re1Wb+POAONhNP4AhRB91INPksK+E60L082ut/zN+AuS2CfU43cgPa00Xhdz3/W7osOz
	FRjyEkinPN1saKuO+WK4IRYCeZ17n3vZWI7JWC8049+bhSCpkMLbfGTrVLWV/GHcDxSZfKBDIfwj+
	O27TxUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZ4-00000002zYr-2Ge2;
	Tue, 10 Nov 2026 07:46:46 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXl-00000002xgy-0j9U
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:48 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4ad587ba293so1077295fac.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296724; x=1794901524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
        b=A/xH56LQ3/cr2jTH/+Z2qqVTkVplLNGlAPEGBZ8+TdyrxM80rF+vDyXfmJ6jgWfs7F
         1KbSl+P81Cn5G2GHLDlVbj1ald2Yj4xknewwMO52teJPLKjGsxJjMqDMyYx0C2lsNFVw
         PGfqyXVbY3yvFt7S3zE9H8vWQa/jjI/6S1FwIkdX7110ZBJG37qkh3NZTLrFjouDByLX
         D6A7yauCLhXFxi5Q73HskW+3j2xbUnuqE5ZwFveAen92R0Fa8GEtHc0I99oFya5swKN9
         etjfqiDpyVmZIfnPJONLIssVmUMDzggvwRCQzO5ERVzdJ8vGjqzkkZ1vUx3L4Gp9BUyI
         ymbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296724; x=1794901524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
        b=qkt4wQT6QOdn/2JPs2EhMcLzPJ0LYQLTV5Ya1W7R04ieH/saU1+GtCSyIY+rLsPb0q
         tkOs0s0WMyDXwZ/MRjFl1SzkHt+lczPeaC3w6m91WaZCkq2pQ7qtsxlx0zQFjCejWw3n
         w0yXQZ3bB/p5neSc8HB9ERv9wj+d4knaqjNvm6yl4W8JW+QYwvfdF6Sh/4y+nCsfwb92
         2k/CsV3qX/T2kSOYFtzofnWr4x60orgDcx+oQIAlJxp+NZHOd+PL2dpvXJgEWEOVezN8
         +FSFauO8/5dhuFwcG0Rx0rjiK9qLw1Y2oGB8NlvNNYUm6xy35YBa0PBfF/9vTbN7kZ4M
         9qTg==
X-Gm-Message-State: APuU4Z/Q/3vlqUzUxpmyY+RFTgbx+zQvbKE6xUcGIhFY8PZfc8YWf6m+
	7l39ktJm/vYMTLai+wtlw0YLmAdwNFFNbB42oq4znFi5kMA0Hz4K1hHC
X-Gm-Gg: AYBFou1WUPBwARZowrCzE8fkVj9MmiRJ8dmY7fm4BWKaup3Erfnpc8tU2vEw+QQnx/G
	M9Dmov4E9dpmT1Y6OnMweXEk553FO3btMlGCqYEZDmsca7pQvUQ6B4W1XS+Z+mq3PrnRmik1hct
	jN6TjgXq3frU3yzI2YSqZyqwW9ZOsB7RxgkF6hnhcTQg6vYP27YN8rR8mHoXreCy57zG3SfeM8Z
	H2lPxTITFAY7FNeH7A2UD8N42nbq/ultv/Ihekxn64Bdabc0yxWiixbEPwxAaF6sCy8CxzH8g7r
	gvgpmioCSZiBC5G+VZAmu7UcUChD0y2CSvk5P3ROfkKcaznb8BTKY/jV6jB2ChN/5kVWwXnKZQ1
	dy1xXvQsUC3FaH5a9LexD9qiexIjJs+K58/CpnhWYYg+u2Jp5bvhncA2QTJjVjm3anjb/bmK/cC
	6EYaEFHFE2Cj01DvMeAJWQcMybUiGYMgzpeuca8TGdkgsCio5qxoXX+g5auQ/eM0RPKC2cOGd7V
	tR+tUONnnBoZ4na8OxnksSwl607WRvQm/5HwZ62UGHLvgJRsZSiTfhDG9gbr0e8ahzrMi0NYbQ7
	cBTJkYsO7fd4C/y7UhzHPJ/UvfBhd6Njw6JgL1SceQTqdOPAYSglv4aDpMnHZUwN2EfybhHoS3Y
	tsP+/CrjZaWirooMoK2NLcT9ZY73HkYo4HL9XGTrq/e+pH5MHpchAqi86Fj49Csty0UdLKoM8ym
	gOikCDPrOuOsa5M92XJYDc+k3S/pvi3ECxBWmbOIEhzUc6luVJx/0=
X-Received: by 2002:a05:6808:f13:b0:4fa:8d48:3a5a with SMTP id 5614622812f47-5683c9f0ab0mr1473563b6e.38.1794296724363;
        Mon, 09 Nov 2026 23:45:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:45:00 -0700
Subject: [PATCH v2 57/58] mtd: rawnand: cs553x: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-57-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234525_873393_47E9F794 
X-CRM114-Status: GOOD (  19.02  )
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

Keep chip metadata alive while MTD device references remain after module
removal unregisters the device. Disconnect before unmapping the
controller, and release the backing allocation at the final MTD put.

Check registration failures and release the corresponding controller
without leaving it in the registered-device array.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 46 ++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 0b872b1e3b04..7419308a740d 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -257,12 +257,18 @@ static const struct nand_controller_ops cs553x_nand_controller_ops = {
 	.attach_chip = cs553x_attach_chip,
 };
 
+static void cs553x_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct cs553x_nand_controller, chip));
+}
+
 static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 {
 	struct cs553x_nand_controller *controller;
 	int err = 0;
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
+	const char *name;
 
 	pr_notice("Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n",
 		  cs, mmio ? "MM" : "P", adr);
@@ -309,6 +315,13 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	err = nand_scan(this, 1);
 	if (err)
 		goto out_free;
+	name = new_mtd->name;
+	err = nand_set_release(this, cs553x_chip_release);
+	if (err) {
+		nand_cleanup(this);
+		goto out_free;
+	}
+	kfree(name);
 
 	controllers[cs] = controller;
 	goto out;
@@ -344,6 +357,7 @@ static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
+	int registered = 0;
 	uint64_t val;
 
 	/* If the CPU isn't a Geode GX or LX, abort */
@@ -374,14 +388,22 @@ static int __init cs553x_init(void)
 	   do mtdconcat etc. if we want to. */
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (controllers[i]) {
-			/* If any devices registered, return success. Else the last error. */
-			mtd_device_register(nand_to_mtd(&controllers[i]->chip),
-					    NULL, 0);
-			err = 0;
+			struct cs553x_nand_controller *controller = controllers[i];
+			struct mtd_info *mtd = nand_to_mtd(&controller->chip);
+
+			err = mtd_device_register(mtd, NULL, 0);
+			if (err) {
+				nand_disconnect(&controller->chip);
+				iounmap(controller->mmio);
+				controllers[i] = NULL;
+				mtd_put_master(mtd);
+			} else {
+				registered++;
+			}
 		}
 	}
 
-	return err;
+	return registered ? 0 : err;
 }
 
 module_init(cs553x_init);
@@ -392,25 +414,25 @@ static void __exit cs553x_cleanup(void)
 
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		struct cs553x_nand_controller *controller = controllers[i];
-		struct nand_chip *this = &controller->chip;
-		struct mtd_info *mtd = nand_to_mtd(this);
+		struct nand_chip *this;
+		struct mtd_info *mtd;
 		int ret;
 
-		if (!mtd)
+		if (!controller)
 			continue;
+		this = &controller->chip;
+		mtd = nand_to_mtd(this);
 
 		/* Release resources, unregister device */
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(this);
-		kfree(mtd->name);
+		nand_disconnect(this);
 		controllers[i] = NULL;
 
 		/* unmap physical address */
 		iounmap(controller->mmio);
 
-		/* Free the MTD device structure */
-		kfree(controller);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
