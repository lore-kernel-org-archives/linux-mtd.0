Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F46606A336
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJgPdHiq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgLFA1Wh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3rUw5YsocMJK2mTcBF9yXm0M6M4UmLzw1VF95LdlGcU=; b=JJgPdHiqdGWT0zr2DP2p/x8Bie
	KqjW0hh6macncv7E8FqUd3JQASXW0VDZw5NV2HXx4A47T2F0ABK9j+a/5EYejyTY1ssjdkNwMezyA
	lmddZaebMY7tnYYL3rpUFBqqS07rBsam4tgmteCPjyixB99gLkbqUZhr18EgyX9/D9pIjiZHzWVPa
	a+TWrR0+zqVmiXDGIxrqrtIbRpCdKupDh56FEKTN0P/GT82Z+RgsF4OnyvVk+5Nob/+Mq9YBQOvky
	nr7K8IrC1u1z4JRf09h71Zd3cvusTvAd63JJSSfbyPenbIEBvHg07A466/fki708tM3h1id7nZ+pk
	Br6hljrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFb-00000001Hts-41F1;
	Mon, 16 Nov 2026 06:31:35 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEx-00000001GZR-0vX7
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:31:03 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6b19e291cc6so3903239eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810654; x=1795415454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=vgLFA1Whlxsydqe8k61vckugCzJgVbKkmYmbV33XqMO0rfACL31p0uEnjzZKnd7Ful
         hHLEuPAgh6S5BGA8//4CI9O6VMixapnb6bj2rsrCcZrDkoEfZqY0FvMtKyaWOxHa3FwT
         MJ3Ye7cDy0I0FQyo81+4GAHEXDwZZ7RxKOFxwwM3G7EkD6NCnc/lGXf8WgftQ2qcRf0n
         2rl9sBOUOSWXmcoDwGcAjDIS4MxzEISKwlj3b/DHlQOr8jbql66zlSBKZDgMH1RxflVm
         pycGEnnXZNGo13TDcgMx1nDaanBdaMEw/pM9wkL3flw1+AfibOvnKNQY9MrVqeN3vVlR
         HMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810654; x=1795415454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=sB6GYR+JK9R9LIP8Q7NPH+MXK2wCUXwItK2Qp7b60J97UKJIjmocC+vEATriYuhydO
         V4PN/6cgesLkIQMq6Iyg+E4h7XOSvzC6O7UWh1Cy/BZztXnAQI65KA7AFihB6uwCcfGj
         8qSyqkCvwb6N6Tb2UdAIUgjTpbLtV4G5Ad4XvXJKmAwiez6dvQKDMcANXjWYBZZxVGbe
         23i/KknDWqX91pPRVFD+STKop4s/YMZaMeBonnJKXrEnUUU5GrMOn3p5vG7Rm81UfYeX
         AwfqEMc4vk0zXHEzA1N3ubuZceWttIk09SHv8tTQafLwvL8Sorl3pwbdSnkyUA6IHsh/
         MBOA==
X-Gm-Message-State: APuU4Z/H+tSarmFBLtCXutcQSWOKojQGNaI7UiL9EmNOtrbMZPL+fwy6
	qYheOcNvL0w07vP7SSLyO/gBUs9oIKwzSItKRefMwAxVBTN+xnaptFTj
X-Gm-Gg: AYBFou2MRsh3CK6TYRd2Ghws5VfCQYVYDwUdf20fTx4NwG6mKU9u5PJsj6iQZy+1QNA
	F3O85xWv+aBCRyzZWcREHjeCX/29Ig6xheQHb5zCUVcCCQW4AfYmpRjHoZ1BPcJFFoD+cpKSbFT
	hQWVkc+6Q8ZqfJsjVjfQSvvj00K3hxxv88fCH+E+S2+edjsgQ0wACVFJy3x/69QsbSz90tCRuGC
	P1A89bSLLgjHWTvWd5gT9c2+oPJaPERrxKDhkAxFFX77fvgLsnlRHQywrKU29l+jfzjOIyv1J4j
	/9ONRgZJ/+sSG/M/RnWD4t7uCDrcqQUyx5Jz/PXFddelBRYkhxBrmSaQFFEwUbfG1dI3KtknszI
	Aoe76C/+DPgHkqxMJFTiA+0Gy5rmvoichScPTnMRj69wYrjw/NksUzqlXgqcaND63bTJjBXLS/p
	Jm3rJyXPSRsqTalqIrviNFFPW++4B31DQJBivF32HvpIDubLB3MLZXqfcl218RUE3xP9al81OnI
	spCpijpi7Ja85KK2Bluf3GIOoiFOKjt27pfp4Hzge2GacJpU6Vw+D7gFU0mfuQU6qPoDC2qlBJ6
	7kR38LwuSinj3zwnQ/kcEVs8cLi6MHrHo6XWLwfv36PMmJDMk0eM4UMVJ3p4kVPgsWdAZ0+jpTC
	jIRT+teQDkDAzmD8oAW7mUT2ep5dGQIaplLmmTvar5GWGn0HmpurTLs6P6QDbQgdlIm2xXit7MZ
	/aaV0eZ9o3EYE0T8vFYNpzUKt3wrZKKfZOmBr8sQDH7ao+ltEcOQM=
X-Received: by 2002:a05:6820:607:b0:71a:f0dc:ed6 with SMTP id 006d021491bc7-71af0dc11f1mr1538395eaf.5.1794810654136;
        Sun, 15 Nov 2026 22:30:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:12 -0700
Subject: [PATCH v5 57/58] mtd: rawnand: cs553x: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-57-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223057_278629_B29F60ED 
X-CRM114-Status: GOOD (  18.35  )
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

Keep chip metadata alive while MTD references remain after a partial
registration is unwound. Disconnect before unmapping the
controller, and release the backing allocation at the final MTD put.

Check registration failures and release the corresponding controller
without leaving it in the registered-device array.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 44 +++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 0b872b1e3b04..4a43f5e542ca 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -263,6 +263,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	int err = 0;
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
+	const char *name;
 
 	pr_notice("Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n",
 		  cs, mmio ? "MM" : "P", adr);
@@ -285,9 +286,6 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	this->controller = &controller->base;
 	new_mtd = nand_to_mtd(this);
 
-	/* Link the private data with the MTD structure */
-	new_mtd->owner = THIS_MODULE;
-
 	/* map physical address */
 	controller->mmio = ioremap(adr, 4096);
 	if (!controller->mmio) {
@@ -309,6 +307,13 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	err = nand_scan(this, 1);
 	if (err)
 		goto out_free;
+	name = new_mtd->name;
+	err = nand_set_lifetime(this, container_of(this, struct cs553x_nand_controller, chip));
+	if (err) {
+		nand_cleanup(this);
+		goto out_free;
+	}
+	kfree(name);
 
 	controllers[cs] = controller;
 	goto out;
@@ -344,6 +349,7 @@ static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
+	int registered = 0;
 	uint64_t val;
 
 	/* If the CPU isn't a Geode GX or LX, abort */
@@ -374,14 +380,22 @@ static int __init cs553x_init(void)
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
@@ -392,25 +406,25 @@ static void __exit cs553x_cleanup(void)
 
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
