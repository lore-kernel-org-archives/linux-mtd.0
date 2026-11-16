Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B564D606D95A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sCY5f6II;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPH4/bIK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c1hoWXB/BNwnsvJ0GG35B0a8+AA9XWDyD6imbmjQPRk=; b=sCY5f6IIdcUtEcAH6WY4gRmZsK
	ZmZ+tMyZng0KqzZ0lerT4w7MOaLSWFYZwsnYVhL5n+sjIwqFJoDZwTNWOew2X4N/0NGBq0tNpp65p
	BL/SZ8FZqyPVDCoDPtUONoqqOJqJbLmotAPzTToKVAyGno/CxZUriCsY7ylnxNNw+d+GTLT9U7xs5
	9nsGIeSw3EgcAamMZJZztnVzNQc7z2H5+pNriOTbxo4yjh+FezNT9OuepcyxLJkM4IpepEAADlKMf
	i8P6frHiZ/g/pTvwa7kOyfWDCxTPwDmx6+0H7wM8iUds5NEn72O02UjIy+d9Ws4vf1xnrwFZ/Valr
	5m30zDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEn-00000001GFi-0GLI;
	Mon, 16 Nov 2026 06:30:45 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEW-00000001FkI-3S5z
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:30 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71aed54d4c5so464590eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810627; x=1795415427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=hPH4/bIKFBV/zSBppQLyzbdxOsTL1MHvHybIUya1VAtjHzxDwd7bb1hFV8D9NMvITD
         f4Vn95JjhsJ1aM4klYgOs+gf6+rntKiLePFqWYJmAe1fjwZAdo+ZT26baN8HKFVqypTU
         0ZykPOmYIfP8hZrRbZaFGULH9Pn5shipS3Zcp3lAsC7oxFu7+9s3mxD0WOLDUlx1fvf0
         caeY6pgUm4H9sWEhcQMf767VBo+X4RxZSQXlRGzGSGt39pXamWe5U2/B3s2Y3/Kg4v5j
         pk8cdQHYHNIJtwTYsiA31h70XVW7kW2F024JenjD/E3n2b8Hz6NIVdvv3yR/Fcv2yLEy
         PxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810627; x=1795415427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=AHL29yWnWKfa1xnBszI2cKjaCMv3tK24qp39dsbVr+MVPOFm8AzI3FNB1MmprAl8HM
         B3+FzV15L1yiUvhypm7lOxzp5AU8ZYpFnqE6K8+2vLSGqu+NrZ5AVm8ra4WRUoaJBpEv
         6j5XbOnDhNruJqJ7etw5DzH0Q1jbodDqgOAXXlrf8UI5LdWIWeATS9ZPJh7hMLr1rt83
         vyQxK6smMYV6fKbfkNE7RgWd8FqZJomaFuWd3062HoXMBL4Y3sM6NPVdKtm9AcGZu6tn
         WXV7JMO+tYeX/rYoTQuLnot+Px+Gh2wPuKj133ZvJr1NYY7POIBnfVI/hflWw3S5Kvvr
         446A==
X-Gm-Message-State: APuU4Z/McBA/+14WjTEs+C0mBXNgBDRrEnrHcW9UYqktU9fcMMhIOw5l
	hLSWAhqx5XmTNi/4akYEClx047BZGQt3xBjhTCZqWUmKorftLRrgozoJdQ3KP40O
X-Gm-Gg: AYBFou2H4sTd9nvDzDk1E3Q045D1upgZh+N7x+cCWeaNKXdEVvbg5qyqci1HObNgKCb
	YZA7Bb7p7BMVGr9fPRrot5wXijHFJoRvATuwcv0DI0Jm7+vYYiJU1QkbFPn5q6ViEdL4wk/xO5D
	fCr9e/1qX7v2YNik9xf8R73vsgYMm4ZXIIrWa+9AP8NQTa4mTa2b4dwp7rK3hJRUZMt56z8GOFX
	DrTStEJlFI2si5UeRTJENQc7fkdhaHp4zJyxCD7aizbfcLlco61DV40XpwpbETStxRLo1roMKbm
	tz1YGZ0HBbrms9sNsisydnSPagzRazi+d2FKWYJ2Dmhx9aeZq3YvSn1+nXst/0QHnfnmnZGfFZn
	ksFsPGXnqKaJP6R13duhR0nzUTQMW8lAONaZ2Pbc9Dz0Ohpyd66mmJ1VbXOwLFSAvW2mYUwnba5
	K7dG2KSSR7q9CoVdCJJGOltVVcY9WV4KnnZ32ToKW6ZIshwyvyV3JOx0oi1wTaPJXEwo7L9HlsK
	cXaCSpjRYHGDbUGIbLdi1pUP3dzi19NFbVqipW1G/OV7/TOUoNgI4UW6MtDcxANpheFvrVRGeOn
	7jksh9VD5l4atDz+EwyEFWvb6Z54uOgZgQAMsv6F3SrvC6soEycA8mmrwVoh8+tvncLd4kjd7CB
	1NqFNonkOfTd4Dn8Al9W9+5Xl5eesGC5yTIZ4S6eMo/KbEL8sFYCt37tiJ0hFkBwj8DwjyMHGEF
	jTS0hAVso2ulYt08Im1RVp5S1tDdGN0yO77nP6/J1ciCtdd6c2sIM=
X-Received: by 2002:a05:6820:a711:20b0:716:f300:648e with SMTP id 006d021491bc7-71ab4cfcad9mr4542175eaf.5.1794810627415;
        Sun, 15 Nov 2026 22:30:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:49 -0700
Subject: [PATCH v5 34/58] mtd: rawnand: omap2: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-34-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223028_893606_995331DB 
X-CRM114-Status: GOOD (  15.14  )
X-Spam-Score: -1.8 (-)
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

Keep the shared GPMC lock for bound devices and separately retain each
device's allocation. Disconnected handles return before touching that
lock. Finish software BCH cleanup before releasing DMA and driver code.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index aee7df4d768f..12a978f5f724 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct nand_storage		storage;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2218,10 +2219,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	err = devm_nand_storage_init(dev, &info->storage, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2285,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_shared_lifetime(nand_chip, &info->storage);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		rawnand_sw_bch_cleanup(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2304,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2318,13 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 	rawnand_sw_bch_cleanup(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
