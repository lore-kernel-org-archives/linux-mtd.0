Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0C606A322
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4aFCBU0I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYgCVGbr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0ENi3jmWynnhwzQ2mbgx99j5shDfZ7vHejiyRxVKZss=; b=4aFCBU0IttXTzM2NX3PhZ54Fzm
	nb6HbPfSrBiHMXViWaCEOb/9x0SHEVmM1r6dxod9rt92LkVHxQRXkqvLHfLrMQy/49LLMa9BxvLHS
	xpupFAi4+eOCmHAh8dzSdZ+Y8O5gcv6tZNhR6RW75xntVBlF9xqxk3Bi6gu+ErSv4y/MccrNGWcLz
	2SYSsod26BBRJguaI1nrUzX/fHV4p+EYUCwqs9xpwrM3Ycq4QGDky10fQp4+4LPK94VGuZwEibOHh
	K4kwyDX0UIoUH5fIe+Ylyi2pHuJDwQYHukrV1Onich8r7M74wdhNfnj5MEuZOfqOrnaWHjAxf9ylW
	+Vn7w1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBgX-0000000GrnZ-0dEf;
	Sun, 08 Nov 2026 22:48:25 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBgU-0000000GrnD-3Rf9
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:48:24 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-4adae187d94so190972fac.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794178101; x=1794782901; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uofTIzhW5+iZlj90wLZvR6NRcqUfnbP/7W7Hv/CMg7M=;
        b=SYgCVGbrQnGL1C48zHtVAnaWyw9nrnZ145M9ZK+ASosQ5qEFi9i1MtmPMYwmQSA9cx
         VRqOsWxUCd4rgazh93wglvEhPGrMJY9UdPDOwcBopuMhOVndP6NJtSRC/6xW9gF64/6B
         dRip/KDBURk5Auk+qsJzsmWnjqzgUc775GHMGYxNII2qbE3hS/YZsD+se5rfw3WnSuRq
         c/MoOZcnjCObhAn7V6NL0WJpGgndEs+j68DVJcpkNPTkkussrdurrRQWjItfSNLZD5QZ
         dvyq2NNJy7Q8Exjf5CRSP7L8vaG+vRJxrPPuFfmlUoG/xLfRk6jeW6X7/CEjFlBy0R7f
         Olog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794178101; x=1794782901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uofTIzhW5+iZlj90wLZvR6NRcqUfnbP/7W7Hv/CMg7M=;
        b=XPfyFxdtgD4hoMXpAoMPTJSbGuj79PvftJESxbQsLmgdcPpIIrlBWOOBuC9TifUbaf
         wNVhS7pb8bingMYx8vl6DA9W+8Gqb2NFbKPpkjckgye9z0ExkEqZQEViQbO8AcMJe5f3
         8ymltSP6dnul6Yxh+vm6iJTT4VljJemBYtZmVrf3g1jS9Y68RkrFby/vFy1VuHN1ZF6O
         +7pTPhfPt/p2egrvAMf2RAopSrE05Z8ifCbTxI0uhe++jA9ib8BCu0asPaqdWk6alzKy
         2KLRRnvTSKchOQunsRVIidE2SGjKrUhpsX0j5e/eG6j1HLJRpQixbF6vJ4uRKXchU1tx
         CNmg==
X-Gm-Message-State: APuU4Z9Vy1QRvmnFP973kJlRDChqj/IJ7UAL7R3xnfKhlyjj1dh0R61Z
	1REIF761BeX1h7j0qW/rMvZG7hPT7S3DBNV+/LpjYjHkZp9jnRQ58xT/
X-Gm-Gg: AYBFou1h8xOgcz1WDm03GvxlDH2DMm+JA9FQPu8IBVNi2nFEVt+96Mb0J1E5RNWFy3c
	nYY4DyoPehzUAX5NbJ6loLMv9lPOaHv4T9TDTByjTJwbm02KdJzVZZKzC7de2fO7ji1ijRApGJA
	qEbyJx8SICk5x5rO8XFwzeUQwVRBLovtumW8QyiTDDc8Lnz/gMNFK8kpOgB6EGY3vbURL+sKqq5
	gW9Exg0ym1F1rM//jHqZoZStKYJ8807qdgc85Jmpt12d3Ff1wjZYAEsbH/Y1C9maLajQGO/E7DZ
	p0LVp5e3/AUlnsRvMbNX6W2mvCwnWNN645Ur3uxbL/H8kpaT8ZmDAm1hVSRN8jd6UjrLVYrpi1I
	+b7DW1HnH+GK7pXYuJcKJ4JYx7iEcJxfVqw8AxIGLtdBieO7kKFeqjtlk8c2xLBAMb+OSFNpBzW
	qd6tKUPz98LihEMpTuxZQsNNhEVDPQPJMOGaO+hg+penYE+iHN2PBGx9gcr19bFwIlvUoIL0txJ
	5PoOknLrH7xGlWKKgSdZrp32IEa8Eu2gqYOtFSnzuEEA9LliadyQsZgonAHcsyaH2LXmLWmZPmV
	Pux7Qr68qXgm4bowXtCzukVzF92i3FgcH4RxEs8/8jKiQ2wrUDfPj5aW2tS31PC5MezRAOlKJ/H
	6+iaZIWFRTqhLCJFrREx+YWxTkHj4poYE2ziTvJKpOs0TrwBk0GuOgzKmJ4Dfd0FRF2N9Yf87fa
	X9E6GtNAh0acNMJqfkpTPVb8qyFq+Z+NLvK5f+j/UeVL8ndEDoGaHS
X-Received: by 2002:a05:6808:1302:b0:4fb:ac9b:b06a with SMTP id 5614622812f47-568143e3ef4mr1605617b6e.48.1794178101544;
        Sun, 08 Nov 2026 14:48:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e010cfsm2738303b6e.14.2026.11.08.14.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:48:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:48:16 -0700
Subject: [PATCH v2] mtd: retain the partition node reference across device
 registration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtd-partition-node-reference-v1-v2-1-73e93921db68@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41OSw6CMBC9CunaUcpPceU9jIvSDjBGimkr0RDu7
 hTi3mRm8ebN+8zCoyP04pzMwuFEnkbLINslQvfKdghkGIsszSop0yP4VzNQgCEYeCoXKLAA7Gg
 QHLbo0GqESUJdo241Fk1eSsFmT2bpvQZdbxtmpzvqEN3jR6M8QuOU1X08ccAh7qZivicfRvdZm
 04y+vxKnf4txSNBmTzNy7qsalNcukHRY6/HQdyWZfkCAh9vUw4BAAA=
X-Change-ID: 20261107-submit-mtd-partition-node-reference-v1-99ecfce4b351
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_144822_896952_689EF8C5 
X-CRM114-Status: GOOD (  14.33  )
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

mtd_check_of_node() obtains a child node reference while looking up a
partition, stores the node in the MTD device, and drops the reference.
add_mtd_device() only takes its own reference after the helper returns.
A concurrent dynamic DT removal can release the node in that gap.

Return a referenced node from the lookup helper and transfer that reference
to the MTD device. For an already supplied node, acquire the reference in
the same helper. The existing registration unwind and device release paths
remain responsible for putting it.

Fixes: 5ab9bbf6c678 ("mtd: Fix possible refcounting issue when going through partition nodes")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to identify the commit that dropped the
  partition-node reference before registration.
- Link to v1: https://patch.msgid.link/20261108-submit-mtd-partition-node-reference-v1-v1-1-ad30359569d4@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/mtdcore.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..f7fa895ede35 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -636,7 +636,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
-static void mtd_check_of_node(struct mtd_info *mtd)
+static struct device_node *mtd_find_of_node(struct mtd_info *mtd)
 {
 	struct device_node *partitions, *parent_dn, *mtd_dn = NULL;
 	const char *pname, *prefix = "partition-";
@@ -644,14 +644,14 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 
 	/* Check if MTD already has a device node */
 	if (mtd_get_of_node(mtd))
-		return;
+		return of_node_get(mtd_get_of_node(mtd));
 
 	if (!mtd_is_partition(mtd))
-		return;
+		return NULL;
 
 	parent_dn = of_node_get(mtd_get_of_node(mtd->parent));
 	if (!parent_dn)
-		return;
+		return NULL;
 
 	if (mtd_is_partition(mtd->parent))
 		partitions = of_node_get(parent_dn);
@@ -679,16 +679,14 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 
 		plen = strlen(pname) - offset;
 		if (plen == mtd_name_len &&
-		    !strncmp(mtd->name, pname + offset, plen)) {
-			mtd_set_of_node(mtd, mtd_dn);
-			of_node_put(mtd_dn);
+		    !strncmp(mtd->name, pname + offset, plen))
 			break;
-		}
 	}
 
 	of_node_put(partitions);
 exit_parent:
 	of_node_put(parent_dn);
+	return mtd_dn;
 }
 
 /**
@@ -805,8 +803,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (error)
 		goto fail_devname;
 	dev_set_drvdata(&mtd->dev, mtd);
-	mtd_check_of_node(mtd);
-	of_node_get(mtd_get_of_node(mtd));
+	mtd_set_of_node(mtd, mtd_find_of_node(mtd));
 	error = device_register(&mtd->dev);
 	if (error)
 		goto fail_added;

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261107-submit-mtd-partition-node-reference-v1-99ecfce4b351

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
