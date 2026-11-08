Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791F606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pw6V0sQR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEfHSWO6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=waJ6l+coW9oUP7x0jyjVN69H1H9V2oJhAZyEt78JCkA=; b=Pw6V0sQR5V1ndmvuB1MCG5uOfJ
	PmU4nO0p2d0biv4LjzuBElb3xaRdwl2wzmK3UTVuPWhRVbLE829zDk4zdQU4mVPxFxPUKNMOIvM3A
	GIOadKu3sRnQs0y0JdRPnE8ioqcgWVUb5azuB4vWMI+TNVnxHmkU4y/ajWMzMF1GJQgU6NmB6UxJ+
	w3N00XDUNAzYcgBnzO0mbdo6F1lKvxovUb26dkTBTk9AIVTNM2sw9bK3d6WAx7d8giABROEmGBnAO
	lxAi7N62iQoxinGmgtcXj81tex5tpfzpsQJLo6/VRQuJU3zH8curZBc0iW/HV151lgTuV6GuAhbC3
	GP5zImJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9v8-0000000GeJl-0kv2;
	Sun, 08 Nov 2026 20:55:22 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9v3-0000000GeIG-2o7A
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 20:55:20 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-854e904005cso232162a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 12:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171316; x=1794776116; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K8i6P0KFfzK6HjaSVdFTUucMIIRoYWICC8FPLMcToIg=;
        b=FEfHSWO6DoHFItRHQYQXmF+HPC0tDpKgLzBY3sc/yA3Hb0eLMbsUbkEVvkkj9VJRFf
         RoDjmt4pt/EbNmk/OHGvVdaFL6jc5NIxwaiUIf0VHA1/ryUcSAzjSOUw+kAXhm9AGPOy
         ia5CtjYKhZkOHIcQ56fla0wGvAWh32kbPZEdYmecVXAG1seGmDu4EEMxmG+tK5+mTgWW
         3jQhFomOV3hqpHpDkDVOVgeRdDwSnSafNkd4BgnxpHnF3W96vQwEnlTxg8ARWQ6SDjr8
         NCpQbRGCwDW289kHKI6rSw7/CmfKHQxxDfT+wBdoliMipkoPjEX84Ly3e99CdSRrhE/5
         UASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171316; x=1794776116;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K8i6P0KFfzK6HjaSVdFTUucMIIRoYWICC8FPLMcToIg=;
        b=Tdoz+Sj7nI5z76qi6QInMcdAKAgszg6axd+m0BKANTcRW2xAcnosICO2pqi7HNim0y
         TYggGFcJS1xxZu8eOlttvY29c70p0PTzZ2JQQsHmoW8GO14MRJfHr8xUE7DFuD8oiVvO
         PbbB3X1xX96WtMOujR4MW0HO1xd8QEfqnoF0vEKUvwiLjeokjp8euNsueskTI5yAOpUG
         JbmFLKf/6SL2n+KpMSa63rcniCiColxLh3ij0Xkfo7Kn2JrNsLVpokhhDRZ8PO6vMfWu
         5sSjbpmbkiS0dylpRsUY+IDp9mdA5jazWqjT8kTnarqUKqc8EfAutoYUaEBz4anqUPVN
         HAzA==
X-Gm-Message-State: APuU4Z/kghdoQV5W9k0p1zaD1YuDKSH1P1uMw/W3SdGaNWGfNL5ZDEkp
	v4MnVBNgtxErPfMiSmA+gsXKEnAi8YEuVYd46wY4ddz5WEoW9yu/eqql
X-Gm-Gg: AYBFou36AAW53SSJkmnv+qSy7oCt9A6I2J6BEz/PcNMa5+lLR0wu6MtA/+JJJfJ8YNB
	98RrAbpyelveLLlDSqLGMw4h6B0V7/GSseEAjqCaCIDPkCEVXJkZ/KiVIkaUP0ATuHMaNfCma1L
	aRZFUF9skBAb5+9hhZwmFM8oRW9yaH8bsgRREfVQGZ5TXihulYikkigby7vraj+KRg6Dr3Mjb2M
	BxHima6CWOTnNrTJqdMyq7eUPOyKMK3J7UibHFKEnFiBwppsierWixmYJ3ohMEX93dQLlXe/1mq
	8g0yRFUhKKiXKOu8KUk86ar4T061cbQs86KGelxlHeNrU7bxoFhuxZFMqLNQceH3zmGpTkNra9E
	Hf7kGjy9uCxMoGNwWvDTabq1vpMGLnmGFMlFng2mgoizJzwQHynwVYce522t+kNOODtNEHkqZOq
	4x7j4rz8Slg8RmuUnnV5v0ivDAo0XD39jr2+ENS4++kNX8reCeg84cxgQ/wGVI9xUoeJbyKr1BY
	6rRF97yOo1j69slXWtG9HMKCI6FxShdjCZeiQzJ+4n46GhVoTLx9g3xMJFEMI3ySgsqdX+969H+
	Wgoo6W8NIfC6nIE++bfDnzL7eVIB4n7YB3Zknbsd7qwc4/m7rhU4My+l+u52SxS8jZFsIX7I8sD
	YaJ7p5WJNp6wcrlh3ujGeBYcx9abxDYm7r3xZVa3773tLAuzTe0cAJL3dQcQ95XvuNOmE4O6lFT
	JwJEOH8htWGrc19eWfpPoXKT8xqtzE7RZqGgcu1l6qVUgIfsPty8sU
X-Received: by 2002:a05:6820:3389:20b0:713:da3b:9530 with SMTP id 006d021491bc7-7170f2f0ffcmr657630eaf.44.1794171316382;
        Sun, 08 Nov 2026 12:55:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8b5825sm1917175eaf.5.2026.11.08.12.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:55:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 13:55:11 -0700
Subject: [PATCH] mtd: rawnand: au1550nd: fix the memory reservation check
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-au1550nd-resource-claim-v1-v1-1-8f4c694fdd39@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wrCMBBEf6Xss4vZSFvxV8SHXLZ2xaaSpKVQ+
 u8m+jJwhuHMDomjcIJbs0PkVZLMoQCdGnCjCU9G8YVBK90RqR7TYifJaBZqWxU8Rk7zEh2jexu
 ZcCXsqe30cL14rwiK5xN5kO33cX/8uUhe7HIV14U1idFGE9xYqyn7czChBG8ZjuMLnW8gEaUAA
 AA=
X-Change-ID: 20261107-submit-au1550nd-resource-claim-v1-71562f83dd01
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Artem Bityutskiy <dedekind1@gmail.com>, 
 Manuel Lauss <manuel.lauss@googlemail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_125517_720003_8658300C 
X-CRM114-Status: GOOD (  12.22  )
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

request_mem_region() returns a non-NULL pointer on success. The inverted
check rejects a successful reservation without releasing it, and proceeds
to map the NAND registers when the reservation actually failed.

Reject a NULL result so probe proceeds only after claiming the resource.

Fixes: b67a1a02d463 ("MTD: nand: make au1550nd.c a platform_driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index f1e99197ab84..6796afe9cd29 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -276,7 +276,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto out1;
 	}
-	if (request_mem_region(r->start, resource_size(r), "au1550-nand")) {
+	if (!request_mem_region(r->start, resource_size(r), "au1550-nand")) {
 		dev_err(&pdev->dev, "cannot claim NAND memory area\n");
 		ret = -ENOMEM;
 		goto out1;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-au1550nd-resource-claim-v1-71562f83dd01

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
