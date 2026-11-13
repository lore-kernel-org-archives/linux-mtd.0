Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2B606A6F1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I9bKFJbC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OPtfYLyh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JxroZQuV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QJ0Jc9u09jG1UR69uRDoz2v7XH9j5qlPcYPvPj5b9B4=; b=I9bKFJbCl1JK5KYcaW+R3FxbQO
	ox5ALWI+JG2FvajjO6duFbxigAGgTzCmHUSgK5bhjds44WJY4551GRNUJW9GPKd2pAh2rg5AqsJTE
	+BC6pp/jaHoghKnL1Yn9gWSBeGl/6vG/2pPrz77T3XxZsCmIP1bZEe0i/Hn7XbdHjHGrkMF3QQMnf
	bwEi36oiLShzIHQN8os5pS0i//EPXqL9Y0XMUEFoBxckDbZn2YbhG+3ap8PwwhJcnJaPRurkJF4XL
	9/CgsUVvuthTPJSP+1oKWuxtNdNGFpcVQ1XkvHW0y/VTjPUpAvQXgFE7Rq9SVOrZz0dSBpI6ASxmv
	AcLJwYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvox-0000000Ds7n-3FHR;
	Fri, 13 Nov 2026 18:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvod-0000000DrTV-2VB7
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=; b=OPtfYLyhL80lmeg0jJE1QsHnnS
	iPuR338zwGs4OVAyOlLQSvJCP3hJkBAlhOq0xNfArtlekT5cAjfFfce8YIGwXetFC4qyqiX07Ip2h
	NOSBZKajhcHO11DTlwnKA0mhlITqBlIfBdNuc/SDlwar3nQ5BQGiQHnLPrAeSvLvI3tAOV2Jw0Ef1
	rouOdykAtFnylJhNixckTLKYqmTODq/6FKaNQfxrRCI3waK4EEEn0plt9PST1v9R6OLEgUw1ZaREm
	s4IdVOCZPvr2soiupXEdVDurVEkh/dYUyUy9Ni/ZRdkpRD6LF5p4Hbb95qQ4rjjmd2UiE8LnNZZO8
	hm1lB4WA==;
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoa-0000000Bdni-2U8b
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:58 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-7190d9bdb2cso1588430eaf.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593754; x=1795198554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=JxroZQuVYmhdqz6DpEtQrx2fFwma0m8IpdbxXMNtNTuF7Ey+Y+u1wUM3MX3V9icNFY
         ZgQpF/Orz02PinoKNXV5VOwJ2XzxOYAuGH56E8C92jGVOgtH/KiVNUYifnrx7TPDmAph
         Jwep48Uu38GNf/CN+WvdX7NVRF55PhqPnW/dsTvYrHn05qZoq61aCK/0CRviYvmy63Uf
         TZG8bSKYRSVY0Acx4yxU6V7a0/LzemRed2gg2q+gdZC9GXi8Ff+197nVpuvFoLNPaEUo
         qmTt7/2Wd7/ObGS9nT/m1uf8xCesZvKIW9/ix+y1SJb4SWNcrbLws2iIKzDWfrOprJpf
         y2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593754; x=1795198554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=mhCFQS4gHAgcgudXf8ZyMph1SmAiXFDKsOmQSU4wajEEtpEtKf9eFrU54PhAfltw7I
         s7cfilbA/1/Er1OWzLt50Er53VNw9/AEI4RuH+PEJ67YjL3A6Jf+tWTB6R1Klf7N9+aj
         tt3awsNyp7ogZEckGldF6PkJBrM88MQS5FTw01qQkry0CgAHbyD/iaZfzCd/Wus8j1tn
         AAAjbokGojLE50V33yM3Paf80s/7TnRtkTb1XiIPkSGkfZG9HBbtMAgwI4EjO4LOjB7G
         4ZqrOhTsPFmOT//B2Nfsx5PBh2A7D6wFWDqMue009c/kNi7NP8EgxuRgDUarpLOS+58Y
         iZJQ==
X-Gm-Message-State: APuU4Z/fgWtI2LEFV0FdgMnLn/GE6pz/xMzV19l3rGwXnq2yST0oN/pm
	MbjkK74O8rmFKPbSjdsKKA2kgywe9WxiFR5tSpOaCIjoY4Iw8jfCa+ib
X-Gm-Gg: AYBFou2IbyDiEf6kc7VYLlZJcEvP6c5gkMFK1GH1bNruKqlsfzMzJ9zX1//sXIvpvQQ
	/PBpE2ZGuVfVrdLtmPNa0l7r/CaZJ+GYlgp8baEIjX9rcE4UfZqnkt9/bx24J4Bfm6OpJD2DS9N
	mNDwagGPY7v3b30n+pwC2w/X+gghxMzFtEGnGnkuZt6J+Tqki5XtiEXY4ogj78V/jQc3LlWA8Iv
	kruOOYlzQa369YW5+47gzV0x3W8y3r/Cf5h4vWm3mtnPdJxiKlweJOE/O31BrBWOVUctNmX9um0
	oR1tFOpVa1/IscscxrfTcCu6MyH6UdlDGUYwiKti4gotVFh5uqfgkEKwEtFbu/tYMwCKRi1+rhR
	YdVRvgBdVVRvWNSgmHUxfCGtXqSWgBDuia0g/9v9/2xbYj7SiyGUrLG+tjB86LpLHTO1ncV6Wxw
	iRofN8ucGHdsO3KJF1eOZu0HY9z6+iBbZn9aoX25boYVdK6RQQhlUDbR3h6NMRV8k9gnGfvdaXM
	xKkExORiDtP1J4Qa0trtKdcStbQ2vi/NQn7aP8+x+zbvoHqSqyPvrajzOOMlTVNgGDc2xXxzJue
	6WgI2XQn4leReJTtjwzwNcZ6udPY2nSzpW6VtiRfCcuAjdnOR7LmIDKUYJJrjIoZj9GfeWvkZIp
	VS2QQU7rYbFJtLuXOvjXIakHWIKnsULYgWEuM/OWP3YFdxS74FrOBgZf1FRkTaLvYkDlsGoOxKM
	xES21gKUvgkKWarqkS8MIQkx9cZ0jo5PnR+V79fZGp9rBZoblRF2U=
X-Received: by 2002:a05:6820:1517:b0:6d7:4af6:e292 with SMTP id 006d021491bc7-71ab4cd94a9mr2120429eaf.2.1794593754457;
        Fri, 13 Nov 2026 10:15:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:45 -0700
Subject: [PATCH v4 29/58] mtd: rawnand: ma35d1: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-29-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181556_756185_5FFF0A68 
X-CRM114-Status: GOOD (  15.40  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unlink each chip before dropping its initial lifetime reference.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 23db2f4fefbb..9d89263ac09c 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -866,8 +866,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +875,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -899,23 +900,33 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	nand_set_controller_data(chip, nand);
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, container_of(chip, struct ma35_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +939,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -953,11 +965,13 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, nand);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
