Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F10606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bvcqmLwR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FzOVKOfr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8oIZV4k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QJ0Jc9u09jG1UR69uRDoz2v7XH9j5qlPcYPvPj5b9B4=; b=bvcqmLwRTYu8I05s70LYGV4vNM
	iDlBEKgH9D1FnNorQMgig6gDAjJB8PSeO2fdlRzFV/LW4Za6cu96S8pAFcHX1SfNBi7gQMPxAzEQZ
	8weavdRb7nSFILOqHe6UgpNHl/PV1BDkX7TLib5TWN+GwyleyC7+SnCMdsUGUE6pT4VWCZDh1cu6w
	AmzxLeSQdgddVABhp/qRu9dFSERXkuZ6Z8sc83oaIa0GIl2IWdIUSa6k6TP9Su7P54aqFe9QIfbVq
	5UyqgBIgUNkvSYCYta9Wndg7rXVkWf4rx3v1p9CiV1byDBg+2EJpdLNTeiIMOpMv+nY2Rr/ehGsZ+
	Ve6gFS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdJ-00000008N9r-45Wf;
	Thu, 12 Nov 2026 01:29:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJco-00000008MHF-1oge
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=; b=FzOVKOfrFuwFEpYfoXd5Ev0aBs
	vkPOREpfB1Z66jBvWO2lCek7cx6YVYbfkkPgX71/ds9T4c3qAJ30e23LzU7LrVlxHmYUaeUxei6RS
	/CV51CSdnP2bC55DCIvBLRZ4hrbm2ITNdd9cPasbxW9qfCfwscAMa5wS6hYRIsKyPgkFAbQwOD2hd
	GBCghNdueRr7FwhXUwgnUlbXzCmVttSBELWD7RtZyR0mM2C5NXzaAOTCdNJBwvVfANevbwRu/T6LV
	I5tcSwsZLT3+U95LuFoqqyceG4liodr8LYHhMOV1JB5bRusGcJWVqtgYIWmZ5MH7lU2ldgbXrF5Ue
	Aq45CGBg==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJch-00000009mpQ-28ve
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:13 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4af81963f35so1874800b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446946; x=1795051746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=T8oIZV4kVfRCrDKZAgx1Sn5byskijwOw1aAFwCnNMBynVcfZnxeXPyHA0bknlQnmpf
         1ydeU2+NnhNTPlsY3P/UqGFTuHcpqJ7c9MysL/FWO+1l9lOtq5iGGpYYZz82R6Aqr2Ys
         V5AkeSTHrSNISsFXiOZsZDkvn9Gy5XmD+Twb6mkaDMX7RnGuS5KDW7iE1PFLyqEQZ6EX
         QiG9LBzdIN0CzxRME9x9mFLW36aG1sb0ihkSdH+uNyM/qZQb7ieNmmDPddk7dPXwLlhk
         3QPmB53y6FkbpnLMO0fKmwJ2uktKPW69kkKUzztDIXd4X8VwyhvJuFn2uAtcWPwqlpAk
         +lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446946; x=1795051746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=xvFAHyBOjYjrxVSiu7LNtgLeVQt8lxHTk6EXjQd/KojsOSrWC6W+sVd4bFNNVPt7KE
         474jPkSdKB2Qd3QLb+GzRYK+fUKAqLtsa0XuOlyukiGmhsOXv6a5Z2FlrqEud3AaZtcC
         EK7j0MsDcF0OQlNZ9477UvsCu9WrZnnDtqSawpRaCf+72uwEuxI6dFk8M1pI3csY3lNZ
         bn6uZVY8HIPXhf6hzwHkN9wRw43O1iChRWH2i7qOafb/CgYSB7o3V1fGBKWY7xDTzXAg
         yfoeL8eUVbi+MY7URuVfvOJFh2pTNIgWDm0orjrEr8UXTnoP7txndYESIePgXPjqplfg
         fTmg==
X-Gm-Message-State: APuU4Z9LROcBqps34nOkUhcgeT2h8kPjOxA5OvgsoDeSn2VJg6ZLwMbj
	7GBsM0a1YFjAll1oTVwHQk8nIC8in2bcngF0m/fkXaK8baNh3jnDnXGZ
X-Gm-Gg: AYBFou13/AzRsO7B55nrndS85r+WgKg7k3v+G8m+uBeUzIBkz9xrvri6OWGNHYc6h6g
	LENtjxyrJNjNMIMSqN4QNGyS/1UIXg45XmyWTkhFbfAIeguJ+r9Q1ODuN0uZzfQFWPhJkd0+tb3
	jkSjW0wHCd5aOElti6/LffDhU1dUYE2COWmfyu7QBmwAg9E1BTD2RmdNpZe85U0AQ99hz/Vw1uD
	Mj7N4IIjQxmLjET7c9HkKu09y3MyVppSQm1KqwFvhTm41J+WK+0YZM9JdenWr8XGGgo7itP3+al
	VITNB74qdZ9QoUnf27Syg386Y2jEwzvIzbZJZbe0A+TpMi5Sz72JM9aQhdtFNVNLow2mnjSEZ3e
	TwTEknDGhJpPgBMYZrkW05xNucS3LKRLcl1h9RxGu9MsPQl60ScWZTPGzl8srVQAxdad2LqU0ki
	PapPCpDDXsG1XQRuD7b9DKPt71pYGnLe5ZNNSvapIuU8WJfCaqMZX7VO8nYCou3AqV1ixh+ObKR
	XhvY/rearQPKAw7HSIS7TMn3PhaFiqolS/ALdA/n9tdjhZJ+EPCBl/zX02DLphO07z07fP84ncj
	S0u6SrhQoUF/mze+UzF2/25nu2Nw1G+YgcbptepoHaA0VMbY4UBwKCqTFAGMFn18sP2ftQqVF6T
	dFQfmoB+jhhTdUTB8uMuy4kY3FIsMAMpFWVxQHIcymv2lTCiX0qK+H0hINQx4pW74ml15hn7q56
	tiKJ2xPPYggP6HxG7Hv1BR2aTuQYbxw1K8ZAksTDzeM9lCE7s1WvOqcA==
X-Received: by 2002:a05:6808:318e:b0:4cb:f21c:a794 with SMTP id 5614622812f47-56b95b7b26cmr3796157b6e.28.1794446940953;
        Wed, 11 Nov 2026 17:29:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:08 -0700
Subject: [PATCH v3 29/58] mtd: rawnand: ma35d1: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-29-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012909_976642_DEF23007 
X-CRM114-Status: GOOD (  15.92  )
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
