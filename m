Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F2606E55A
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v5MopBzA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2g465Sv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3rUw5YsocMJK2mTcBF9yXm0M6M4UmLzw1VF95LdlGcU=; b=v5MopBzA3FgR/drAjYiEMZ78l3
	i1mn3Vcen8ZLvv97Hke900FoQ9D/cmLRcMxFue8rqvx8ioAcRzsdkvGrXKu4aSz1ppXhYmjVyw2P9
	sc66ak2qmsAE31HQt/Dv354Ej8+DTv2//k7TRkdN7tqDUGxCpjjlk2N3P16w+dniSRPl1nyy5JRGt
	/ryDfyC163T1+WF+iHQdwWhgqyFz/pH6XdoQVI2wwNlJFoTOw/xN1baeX34GxwxtYNGMn9Cq0lGAX
	VBmfA3tJr0ONqNmtjbfOZqAd/WdL9iIWlxvvQPUga1VpEVZ+SH8pC65ZDPd/UnzbI3ZagpSda7Vmw
	vLtMmHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvz5-0000000DwIe-0ojR;
	Fri, 13 Nov 2026 18:26:47 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyv-0000000Dw72-33fV
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:43 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6f5a0893610so1715815eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594396; x=1795199196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=t2g465SvUSs3DozkuhKzDuYy66ZIQ+TNOYJV67l04uQy0ONKrlOMyzKcjY1sd0pjN6
         kMAeagpkIqDXXW3KOZ8wHViz+5h3qQnwZFCSooBdFFSCXcrBUKrAcUg9cMO+Cs0bH3+C
         eeU9hu4rmYLYdnEaQEv6rJGhOc4U4guPNxkANEXJsxHPpUTFCW7n72+7aWdVoOIipNkb
         P/MTG1h3NMq5HUmdNPvdvHKWkKUMmnM9Ki7FYhpbw2xA/Nv2pTOlDA0mnspmMHl7cwu6
         5IyQTfruulnsuCSK4phhbJxqHKIcDG9lbvnVGzVDVF8tc+U8nzDLgVgs0LKTwNcDHKoQ
         jdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594396; x=1795199196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=Axt/onKVduv4GYebUbBrSTHJCbQqibBa+Nzz0vS93dR7oFl8Ew1ffXcIsMdLnNLjwJ
         3sUFRoRWnmq+6/sRuhC3rv9HWEOD5yP75mpto3Atil1cPKugh6uhoMTynkh1wdpJECVS
         xdvhCwjuxgFR0143OPV699PCrgz7KzLiSwyADfZoBo5wdNyAgmgfwNiUmkYo9EtdVgKA
         4r1wbUucTi5C6lgKlGevY7NVdBEyCGlJnOamRlt0ezNRryLYZMObxrnzEVdHF069YUP8
         oeLRWhM7gfvAAdC9GqDa9zS4j2gwPO/UhslsrWb47cis90RjuEyOLL6SIDxDXvn6qu6s
         B0Ow==
X-Gm-Message-State: APuU4Z/yhUGNbLeT0zAo+Ps4dz52M4h2kU3q4xSYz3VU7lLICK5v5HEY
	V52jqtmU4vj7YeVzQBpSYIKJZRMokQeGdfkUy2+5j34JSr8RlZ7PdqvCXxcRpzMV
X-Gm-Gg: AYBFou1t4UpCMIzdE7NbaBfpxgBbNejSMqqr8hmZRbW1P4Yx0VZo5v3Uou8jDLbyLGf
	EzmT17eHFYStgDev34QaXSkM/x4bh65n1P46BW6t3246KQFwM8VqzOnzM0jNrrce/T4aVjLrunZ
	meha8bguj7IaRBCxyGq09bjFs4y0EzHEgm5aCfIdUBd22jaaVo4YKQDPL6CvhgigPfQ12jwkDgq
	j22dk+A77FDzuUYDpBJubTDzYkMhwKJLiMvwKnfs4yjzK4O4vm504bxMSycrwMNRTHznZefMq1F
	dsDOjj28VmHRQwv+Iz5TIxbUbMh5CBkuwLE11GumWcDfejggkel9/pdoP4NQ7u+Q01l2LjDHOJ8
	mXAFIREJSpcQ1e03lGJ7R3+RYenu1QgHqTLCK03Hcrszl3TXEEAIWsng6AqMsNYgV4QUDNOKb8d
	FkscxCC+jkJ+st7rXDnToU//mHEFZ/2p/4VcMbViubF6d/VwwJIblI9LzybgxomAtoqC6xH+taq
	jSxrU7YtYyWqkuxItzMsqu+S4U5ozE3a6HfimTkdkfvRog58CvO8Y5crI+ZPyPuea1XPdFf2xes
	nHR2ErSmKEvuC19vyUGV2P7z6HfHsKjfzgjrWpS22yyOmVXoN5FxctS7ex1csy3uNP0wCM0fkfE
	SYSk/j34xlBOLBH/RFfv5bzn257ZsfhsdkUYZuVlUB1VNnX3x0N/OthT3qZuTQp3CyZsSjwSnSi
	raPCx4948z7cUNl7M0yaXw4inh6uUcRTpfpWKVFYCWZlqK/d0jsi8=
X-Received: by 2002:a05:6820:c449:20b0:70a:598b:12a9 with SMTP id 006d021491bc7-71ab50bcda7mr1553769eaf.53.1794594396542;
        Fri, 13 Nov 2026 10:26:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:13 -0700
Subject: [PATCH v4 57/58] mtd: rawnand: cs553x: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-57-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102638_353126_09DFCD0F 
X-CRM114-Status: GOOD (  18.36  )
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
