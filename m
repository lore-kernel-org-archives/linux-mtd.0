Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFB606A334
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dcz+lWGV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPTZIKqk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5HyMd+CgPGQOM3DsJ7lY+gmGp/DHWJa73tsQMGtQGJQ=; b=dcz+lWGVzI4tD5P4HFqSoTGv/4
	FlSZoycrcWLgZOiPeiG3q/wO5dtJ+AMt0s4y7nxW6VraAWiIRVyDD+IpThpKl8WFSseOR48dJkDCt
	8L43qIbvtOZVi7SbX4jIvUXtMRxHinChT/GeCbyM/6uJeSEpUpGWTqqxRIQ8cz5J2yUmIiEm7VkUz
	WELFifkg20HuCHgfooP/7I7U087TcZd66/jYrdu60Asl8wvcGOSs1Acbr7CoWl0JgGNgwXZuyg7+5
	aTnhaA8ZV3eAArF36hW9VLz/6/8tWzf45e+i5yPmmcx6OM2snMK8pOjpP1T3iEVDknw9OJTiDLXcG
	GlkC2rMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAAD-0000000Ggbs-11UP;
	Sun, 08 Nov 2026 21:10:57 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAAA-0000000GgbX-2vlX
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:10:55 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-82109f51565so89289a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172253; x=1794777053; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OXxfToL8LXg6Oh0k9HdrHfUTYtCfhx6snQVUGjyIGDI=;
        b=pPTZIKqkRYETcCQexYETXfwmFnb3WlFp0xp77Mtkt3dPTtJYof7UDidKMgSqNkZWcL
         2mM9Vtvktay8NpO7vsKBINJYGSGkWuYnNGf1b+wgG7NQjyPozRj6zMnuaNaNNqmRDfMr
         lumdo0IV7LjJxb5fHdgdCSl5SkZuGJPHY4bTUUot5lTEP4n+83oV/aNxIayfb8yl7QW0
         MQCXIkcVahWNNbH+s9sNCEtXF2z+W6dfJIfI/hwhNZc0KxaHN31ERkjxKTzW0In1PRTA
         9mOu2+/8z21falT7so1OgVTY09q6UUFuZ82KKoubqSR+poD6MqnQCK40M9ZUOlFV6Zym
         Q1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172253; x=1794777053;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OXxfToL8LXg6Oh0k9HdrHfUTYtCfhx6snQVUGjyIGDI=;
        b=SjggRbIkFJABaB8Q2Vl3cLLHCvRBa+K0BXnaMDMEKWRmEBTMe9612Gi+6nmtkGKp2b
         a1xDRVP1M+9IGEVcDzOxNCkmOs3FYoWgGeg+UMyHA+JWdCxHDFK1S6gUYAsBsGZiSyvU
         8BFau3ZJN6jGE6cEnFs95Ir1XC58bu0QM8liMS9kmefgCjYp5eUbT2zyGZwkCYE+WmRG
         axohINNh4hU/9BfSYHVj4ZuNqlljFpYFSJGCkORkVxQuBQDkvRQPHMmJAxd/5SsMaUZM
         5f2HC+orqrm9IXrCYuriuA5vNUdvBoVfcRqTO8qHHSv9HM/hSNgKnhQXVwUKugfYuOeh
         HH7g==
X-Gm-Message-State: APuU4Z+T1TsFuC7DSY/xdfvbS9h7iW/4C63AMT+VWXHmRAQTFxN5N7jw
	B/NFkqhTM/cgGG9bYoC/Ecqj8+MpHCXY/7GNqzPp9J3Y36B/I2iQyLNV4afGzQ==
X-Gm-Gg: AYBFou33JbyCwg9T84AwCGkQOTdsO2H2xR6xfGPHm8PXgtPmiiYQOPer4aeMBkY1JfY
	Pv2tJfP9bgGLjWjioU/HU3KEfhTe691CX1hGwdJxXtT9t5HddRafy7uOhZ5g6do7td8pSpq24pf
	ckFyzNnfiJpi0kMf2V3zSUcVuI9XNmET/VtYPJoj/4U7Ccy/Jqmc6KM/GX1uLHxXyzJKmNJqG1v
	T4sb0DhmRi83mDkQsyJsJc1Nox1MXUd1HpVUcc86FQHhWEpGYvCKteTVkBx/ou/8oCwrQR8Viw8
	jSGf5ixZeC/BKrIg2akSRdiMlCvBf1QTq6O4q60v7U0uD66zn011D7WzTC8qV80C4UOyBO8K0MW
	vRtZozQR5gOXIF/lSux2YLatTUkmSIIB/Ozj0/cOux9PJKzStdzKsgbkU3FV2s8P1gzssPcMSX/
	otd2n/Xyj1ZKMl1eUgaet8xC2HEBybjYG40aaqtPqvijBYlsItjGhxl6lVoyzsomlED/swW34i1
	U7YMuu0GpxFvuf+ovipGHSsDh3hkkNpHRitcwpDFLeipaQxvaErfn4dNuynIyG50tVJQqrHvp/v
	qfF58zD+AoXBmi+QppGQ412PVdQpfb0+aEwEi9lWDzF1GWu1kSMQ+kjVvNM7QSmqsowcHG9XkPn
	ZNZz62BMIrRAuRzhE6UfRypwMhjfUhggpp2nMF06meCbzIKP7YqfTIYJTBIKi4LXQMCZFl6grll
	3LrAOdQ21qvtYAofH6gxXP3oTHyhcjOBCmXAblh6+H9de449piNziWl8wrFe5LttqR5hC60cin
X-Received: by 2002:a05:6808:f13:b0:567:cbf5:bb96 with SMTP id 5614622812f47-568147067d9mr1423302b6e.44.1794172253510;
        Sun, 08 Nov 2026 13:10:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813db1b41sm2618100b6e.8.2026.11.08.13.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:10:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:10:40 -0700
Subject: [PATCH] mtd: retain the partition node reference across device
 registration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtd-partition-node-reference-v1-v1-1-ad30359569d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw6DMAxEr4KyrlVCf6JXqbpIwlBciYCcFFVC3
 L1OWXjxbM+b1SQII5l7tRrBwomnqGAPlQmDiy8Qd8qmqZurtfWN0sePnGnMHc1OMmcNUJw6kKC
 HIAbQYqltEfqAsz9drFHZrFf+/osez53V9EbIxV4+vEsgLy6Goay04FhmT23bD0+Pr+eqAAAA
X-Change-ID: 20261107-submit-mtd-partition-node-reference-v1-99ecfce4b351
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131054_751701_26050A1E 
X-CRM114-Status: GOOD (  12.39  )
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

Fixes: ad9b10d1eaad ("mtd: core: introduce of support for dynamic partitions")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
