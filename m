Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3CF606A88A
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VaWeYjrv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BV3GM/Li;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/hDAn76
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yKUUne9jTHsLyRc1Guy01mloIFOQXeO7MASDDae+I2Y=; b=VaWeYjrvLchbgogiPg6+svqexL
	dQSJ2PedQyn5NGRHvcHBfTvzW2OgaG3s0dIVmoGP88fvWz1Z2kSMl2PUmICg5ejzeqSoblEt2qSwj
	R1O4sifelqouhEbK5Qbo8kdC3AEuk1DQrbXD5jb9GsIa/14PEuh0GvOyMseZ8JAmxtbJp98uN8T9J
	3t0Swe/9MSQhLPvBZhUueyvTSIW/X3/0qly5h4sQhMXbiERw01EIF/08gzskSm8EgCsR39b7aK7pP
	/UUKy+diVrb53rhOWZEMYtKHh6pSDoKQvyA61wF1hUMY4QOxvl8CgqVhPjvwFD21ygjsTY64pZS8N
	IGRiYNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpV-0000000Dt7r-3Qkb;
	Fri, 13 Nov 2026 18:16:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp3-0000000DsGU-3sz4
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=; b=BV3GM/LiHilMeQrWv8QAx9/pgf
	ExcErXnNZbat8lNWz7gjdyOMIKdI7o8sZGnJml6gLuvF/pTl5f1sVEGlPAVJXAQm0plwrKyRFoYGd
	tzuEnn2zkOOXbwIytHL7jvz6iQ6fWpu4jtOrHS+hSwfpSWdtSsHTtTyiYYzPq1S/h5iiMrTUrsRCA
	PyNfzxuRvlzjKcxj7NPFFBADggZA3Pl/Ftl3NN5XaMccLsC4J9suCTFOEXPTi3ak1ifA7tgT/UWf2
	wpgkujNPNrADweytqXTC039op+G2sQQGnP/PBA4mo4YNuDXhssYdXQk5rdg8SPIY9UE8zShWof36Q
	rynxbuBw==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp0-0000000Bdqk-16dZ
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:24 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-823e4047037so1627886a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593780; x=1795198580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=U/hDAn76hsRe+cGIkRbh1AaHnA17HqTOtHq/QRDPrvMEzln+Wrk94cgMLB0COzOgtJ
         HvAtdQu+rU/m6tdBKkGhmcUzi14FVFaU/FBzF5ej2pOE4ktplgAimtgtvyfvK2jSfrgL
         V2yr+1B1t127GHPADONr1kGbXX+9eHXOHWN+/klcigXrkOwFURNHGoMNe5Uw+yqlD8VX
         Tk58TAUCranx0a0Qt9IhioFzuLEtPe8QhBA/A8l74vBEqPu2uKja9DqCJqp3Urp8JYXU
         YiaGcTMj63OUeP5X84AijF5Qdxs9evh0K+bv6sBL9gBKt9RpYOq94CqKUDBoJ2a15+c5
         28nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593780; x=1795198580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=jxmBm8J2VK1bBE0xmzDNPFnJraTnY2QPU/Pzak56XU65z9hRTFIKX5kWt9gQpcZNQ5
         nlAnXiLf6+LLoVgL6rJtexaQpXby6DBmYqQeoOwCTYbKazdZX5WfiFp5jcI88rsIa2Jy
         xmJ+rhbpu7vh0zY6iG+je+IWkoDve0AztRR6QLOn2ZELnep0vgT3L1yqs3xxk+w5yTA2
         yIMiWhv01/VseSH08sMsn1JAnSuqlGJtjC/5qU5eZKtNm4FfjT6MgzkzTJsSlqeOuOYQ
         So1o3iHlCoXj8X862Xuvvpc7x9JYOQ4GjGL+V1qKVWb9b5El/KCiWoQnSiJcDX2hTbPO
         QkZQ==
X-Gm-Message-State: APuU4Z+Lvuo18gaP+6QK+P2cqzqVNeHpdJZotFfvf5H1TesDKsZHm9bm
	CKJ0aaRWUTwhbrrq3SxofCFyox1BXsWqJzMzEwqxTtKvItWjxlU9mGTS
X-Gm-Gg: AYBFou3Wwo2aXIP/NjLLqh6W+5ffZpzm1sgHqnOBa03IvRK9oU7DePCWWSICQ1ds2uC
	Wj6Nf8BcVVCXQnNSLCPngdWYmQ4OMc6k377oMVdZA6fGm58QHcjO3E4gSlr3sHI+szAwf+vdx9U
	BPgKsJIUkt5IMbOAFLK22tlGS+Wcpiwm2Abn8Q3gshD7suKbKZc3FootrdA5RugMFWb+BkrRQxp
	P56s6LZ5ElZFKfHatUOoQmZ6EPxfDdtLGQiHNmFnRNYJqHHF1u7SVLq+4MYwO98cFqSHEG3aRMl
	6YguuYJAnhvkjFP1mZdibUkryLiT8rHn5ujGzUN3h7bA1GI0Y6hwBnwj3u6AnONhbIrTYilcZua
	jHvOQyt5WMkUosLn2aoZZl6NoTpnhoXnGq5tpPou0lGdq5jNw5pHXqcDcbaGCtTchk03Win5vDT
	DanDN5MYh4cYrxvHfiEbLUp0xcBXMEsXiN67L2zNmOfGrqGcfi/v1Vlgu/oWOx2gUXIISneCsxX
	0E1wvtDxayv05YKixjLWng8kXVLjsR4bRNk1uDe1BP0OZoknJQcCrX/04f16pyBFkfs3Nf1cnwn
	paNBbTF/Uj9cbPQtmEoXAi+gqKtwEJNABmetTg0l+NhCIl4o9At85kHYDNx4VHQbnBUIUfpo8/S
	BilOnTwMHY8pu9WQA1/KCj8i0S+Klxzlmwlt5if9x2yte8ecyb1/esmcirihQY0QSAOlIXd3/Ju
	jeOGu6QWn2LOWc4gVLU2aCnnJc6EIywE6otzUyHX6g0FlIQHCVCpY=
X-Received: by 2002:a05:6830:34a2:b0:81c:e293:7d66 with SMTP id 46e09a7af769-862898d7d7dmr2413051a34.21.1794593780042;
        Fri, 13 Nov 2026 10:16:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:58 -0700
Subject: [PATCH v4 42/58] mtd: rawnand: au1550nd: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-42-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181622_187519_AF506060 
X-CRM114-Status: GOOD (  14.72  )
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

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 01c2c8b191eb..83db1963c449 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -269,6 +269,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, ctx);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +305,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +324,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_lifetime(this, NULL);
+	if (ret) {
+		nand_cleanup(this);
+		goto out3;
+	}
+	ret = mtd_device_register(mtd, pd->parts, pd->num_parts);
+	if (ret) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto out3;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -333,7 +345,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +357,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
-	kfree(ctx);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver au1550nd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
