Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD160A2618
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yobOElab;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ATa6ikPn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPQbYXUj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u8upg7Xsnvcj8PiggKVyEpEjpadbPdiNk8D7THO5H48=; b=yobOElabdNXpR4LLgrR3pDkdoE
	hthXriS6Dgm/JgT9/cWD54FSknR5hNqkHNmbjXe81ksncOoOJCdBmJuEixtD7ZSUsMPSBDRgqZLnP
	W7P3rXTnN3L0sP7OmIiLh/onjpJr2G92I/Jn9IIBQiDZUBGrAcJHNuszNaTCumYZamw19SwYImSJx
	4vxYXgfUEye6NjP4rQa3uhCcWf17QqVMbcQKCjBkk0/vR66aSFs+T8j/9rEY7hSCAvAOCYcynjpVi
	35r29ZUocu6CFrA2jWRgwwrEzQDGR4tMULbzyjvnBkrnmmFb9HHwYYPzcw2Pg2jNRSZCI0mAerH5/
	asB8Ropw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcr-00000008MOi-3YLO;
	Thu, 12 Nov 2026 01:29:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcY-00000008Lnv-152o
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=; b=ATa6ikPnRs84v6vQhXjY7ImXsL
	p+UmiyPEPWGJAtZygcIe2is+sQXyz9B9h/fxEi/CPu6DiAg9p5Z+lhTiPRaEVJrcyk+udYADztZ8Y
	NX4JP6Cz/M6aQo7PyoGDhWyGfaRd7YxIP550lmoXpz1EBSGct/xloQevUtcivtv+9mo0e00dvvzmU
	lWyVU1NKe/Kupuu1nzBjCYbg5wUK/HXNnqhuq4yQtxTLSOYjJTTKO5MybXet5prU4vy8oa3M86L2K
	dZpRmVzyav8jHwPOuyUrkqLGnhXBjgP+3DHAW31P+sJ0awFmo6N7eibzjFNtdAHr4i6v0THwp1kgh
	/En/intw==;
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcU-00000009ml1-3Ir7
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:56 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4911df1e196so2048230fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446932; x=1795051732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=CPQbYXUjjrxp0GIpz0Lab+0mLl2hg/64Luyvsj1sJhdWpIC1fc5hF9KfK8YP0Ay8Ln
         O/Z/usM5B4Oh4pwVpe8dt5d0PWaSnbOX5LcuI8zD/ZI70+TuQrKPokZD4Lb+2Qk1HOPk
         w3Qg5dTAdA21kzIiGfgp+5/sSdvZ9Xb+kLbAzQN5UlJuKtTgE3vvHnh3zW7+Wm5Jkt5c
         MprKbaZhbkBK6lvBnwUpGm6vE3TO/DsaHBX+YFJq4j1gaTtJx47b8/JFQ3/fMYK2Vpo/
         0zy1ZL5bwqueZqeSphvNiJ8LT2+OnphC/M0anRIYyYAY3+SP0uDcEUvn5awKbcI5fBtk
         2mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446932; x=1795051732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=CkFVhmFvgQZGb7c7UHi4+/HnGz7f8ePnbnLVtsxY3Q7pqPirLiVUgp1KKl58Uc7gIy
         /EMO9wK3DW/D85IS43Momfp/oc+Jlg63MCw5TuVvWrv/g4xKJEg0ZzlQIUnki2rDUe5u
         d5U+9IN80zWzVmNHpItiOxTEzror/fU7q1NPCsY9foNtcrU6ut5jFlVIlGtgMk+xPusx
         GakM16SJgRqtT0zz6UDLizn/iFUoJZfMCY7byP+Xlsth2Br1Y+pUod/dnqA+R13F7+g9
         uuPCsZWa8Z8QoQYXbrRps26OWpXX4H7XmcQ7z9tVj2WhNudWx19+7gNUB+Cconp2bck4
         MiLg==
X-Gm-Message-State: APuU4Z/F9DL9M7nI8ReLCwPXKs44YpNcal1eN6yKeze3dyB4iqVehh5K
	6nOQ6jaTOA1VBmytDAh0XwAiOEh5UK+PWr8ptpYpbDQIT67FcufrOmKs
X-Gm-Gg: AYBFou3z9vBtukzjyTq0KXCa25m9JzpT8pqkc60EjKaSctaPDjpg9Gst6tqysaMKkYY
	LT6kXzI0nkD+gyWGzQB6N/+qeaWDdIIri4iAD+879TGBs9Wl1mpwSfuZfHOE8xoLduJilIVa4Sf
	2bPg8HNPuJPwtFSb35evBBSFZb4UFBzI4iyTelAtVP/NApGOTpgcX6/SgNKTiY5/6i+kztjFfUb
	Xm5eVo6cHptwX957tG3LGC8gtPjPhFNnnZ+5rzNOAhtH2LJgB/OA2PdGFypZJiR14g3ccX8UF+j
	esYqPOl+1sug1CXmY53dWk6nWXIGrM/+7NdOQrWAkWndUXBicRjiM2k6kLww+urJt5bC+KeSbBz
	1sROtogThZB51SfNACQM79d5RBRlP487xIwfCSMRwysqoCEiodZOjRpAJKdbZ84XXIN1E/OS1aD
	U15ahUnvkGHf4SciosRmUcGXqWqfKHQf1d/25OQMxwjJvjn4Oe29XrRjcGBkk8kwkN4ec0HubpU
	D8e4bU3ysohAoKKzt5LATThJa5lvpTazefHKl7J+znhtSRi6FRUcboKPS3ewy2OEUbq0g1iztZl
	y/FZ7hqRkBvUH4hx16yTYRWWFi1YfpN70V+OmVm7Uu7A6l4fLfvBFRfsz6VBi2bpSkzyxar6x9T
	v/GZFKG8iAVWqgGEfRRb+eUzmtBYBvwplpUkZJlPABIMyKdZjoDJhC1+ln8BIU271S/Vt4GcANR
	A2P1H+deg4AvlC2Nk9Rvcldc6UpQDC2GmDTSEWCwWJLzkgGIDZ46U+
X-Received: by 2002:a05:6808:11c8:b0:538:d44:aaaa with SMTP id 5614622812f47-56b97e2acd8mr4058417b6e.63.1794446932249;
        Wed, 11 Nov 2026 17:28:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:00 -0700
Subject: [PATCH v3 21/58] mtd: rawnand: fsl_upm: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-21-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012854_899885_5F063523 
X-CRM114-Status: GOOD (  14.90  )
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

Also clean up scanned chips when partition registration fails.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 5c249c5a57dc ("[MTD] [NAND] FSL UPM NAND driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 28335dedb987..f9e02e355317 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_lifetime(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -169,9 +178,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +234,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +255,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
