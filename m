Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00851606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CLy8xNmf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFC6MJe+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3rUw5YsocMJK2mTcBF9yXm0M6M4UmLzw1VF95LdlGcU=; b=CLy8xNmf5tfhwdnssF+HJeZhdH
	tzqTUtaFHhWXzTakozO1FCA63fY/Bq2bmzQ06a7RHQwe1/Y8gggQshAPZeWq6nsp4VV2LbEZBujKt
	QdjhGtRzB3zYOlzo9J9IojvAPsZO6smdJ1QCdEwjlpJh8vX73nK6dto00LNucn2pVL8kZ9C/kKUXH
	ASGNQL3KgSnEb1cQpLLiRZUkodAkN4mU1AVZNdDvzLHkHcdI6OGuyqsT6+CfcuzObqDKGARsBnYW7
	F0s0Ctaeg4PkDlx0QupOCBK8l2z6MWkXVnlC/sMeayx48UBUBENzkrNo5jSOnj/KfjagMlJEBhiSD
	j8BUQcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdx-00000008OSK-2Dit;
	Thu, 12 Nov 2026 01:30:25 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdA-00000008Mq5-2zuf
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:44 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-843b6f8e2c7so3946289a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446976; x=1795051776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=bFC6MJe+I0LQ6gGfle30bRYe5ZGcz6cp6VUOhUIN837sJKq6AoPrSJFfNKn42YMa+u
         MW2n/Z6FMUQQvm7fCKLWrX5kCvp+/t+dObDJClFizya82r169Ywjj716j9R20c3+GDBk
         qnCm1/2c4eri/7V3zIxfmxWKuK+WZ60gF7nenW9l8tAlEqLENXXMGRIJdm5IIWoDiRSD
         zN5y4gRBP4Y+zs1qKMYulE7cyLu6qEplQfrgDXGLEr5kjLUM7QCvUl8BKQGsfSzVB1YT
         FoRhwWqXKtW6UHjL0pTJINpxzOrRsjOVCRte+WTdwPVKpQAScGJ5YhT/EQ9gfUvyG7Px
         ErPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446976; x=1795051776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=sLnDuJs/76mrFTeeTzmS4pPGW1Jk4Re+h7wBkQer5xbi5QqSIRGCeaqnzUUtC7Ds16
         kl3r0kj1UldNKMZCr/FZFacFUX04I7f8bxpXtEpQuHxr2UJzLx9foTZZKrSVmeyoW6qN
         3YaElpAdlaLo49o5kxmZsVdJrY1PMXXK24MAReMZKfTTzgmSKnpPy++x6Z8QhwZleVgQ
         6vIMgrOXveIOtEPrqUIRB3hzGZIVAcRiEq6og4akTiuWo446ZosfIHX9VzlFqpoGksdY
         rndSzmr7GCyNJzg8AVW9igPUE/hujnZN8z9+x2nohmJJCLHzayfn8b9y2l1U+M/+b5fD
         KHPQ==
X-Gm-Message-State: APuU4Z8BI7nNxhxRuBjlcQq1vJ8jORYdSzFgGCfbiMq/ifyd0nwqbguC
	kSO2zR9FjUrEisIT/sot6EA7hQlcTFxd9fJKO9WJrna2BZ5B1nm0INem
X-Gm-Gg: AYBFou21HQJmt/hMpo0FqLgDtBOa+MstZ9P4UTlG+pcw7E4G9GF5ZppFxDnxtLZRM/d
	Ntwaa5qUlA/m7Ps4D4Zdz4UF50ZC4uibyWTOPfu3TaCcUHGHKTqQHPkbqfembcJEjSkuFsHV3Wr
	OugKso8dmmHvL30Y2jDP0BhyYsSLIyFLOgqltz17LEi7pTSkM0ijyi/E5z8PWlJjnyl3P+XOIKj
	meq6zB4fUyGCpbLS2nluu8O5sZErKflEMLQqfLlqjri15bRoh2o5Ghb3ZvzjofqKHl/fHsi9y7/
	GPBPCw/V8W/SFGn2op4AOVD9glB/YTlHkVmnwHC8yJlgiMCLdNg0NPJghoJNZxqLAdmC2Gf2RkY
	1NEsQxBRAKz6GNrmpNHBPXM6z1bnqQEHhdHSBodKdQoZu1DwzWV3CfzVmHb6sdFXJud78wZ4Sli
	0jdYrRyTbU2DzJsNFO6t4T945SwA+UUFk7JZ6Uv0BU0o7bv1TGIsZNzJSm3wwbFupyC3DdDxSj1
	en3CNHLqp3yUyEIMGHlMsEw8UBCwdkkX8tnxGGvSbEoh2sLri8HNbKr7YIid6GUxY4EPh6R3iXA
	hpkZ6vcZ1BeJXZq0MlgedO/cZ3xbzpgf0bRPXMbc4I0oaTSkMiq+hNXxcslN6XMSvbFrw3Murds
	D3bnI70WaiejOH2a/LjwEk+FWuHrTTZgM4hrsnRaWCgZ6TPjfjID3X45l98lKQ7OqdPXqs5Z7kV
	op4X+tFUUFNmboiH63o0TLCzGqB9lT7l6Y+nbeoW/yG3MX1jX9efyo
X-Received: by 2002:a05:6808:15aa:b0:4e8:e73e:e945 with SMTP id 5614622812f47-56b9872af1dmr4381563b6e.63.1794446970972;
        Wed, 11 Nov 2026 17:29:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:36 -0700
Subject: [PATCH v3 57/58] mtd: rawnand: cs553x: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-57-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172936_812310_68D84925 
X-CRM114-Status: GOOD (  18.82  )
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
