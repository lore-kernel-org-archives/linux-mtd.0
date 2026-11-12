Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056C60A383E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OdWuozqx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeqapQng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qd+10QarzHJYPbnj3Nw/WVBfZmhPYmrw50o4wLAmAHA=; b=OdWuozqxuI4HB8b/ANwGXTH4+8
	joSect2om9piCz63I7yt4KUJ8tcoqzEFEcPpmqvYE93U8Yc+fzAEIPFfSkH4S7UzVFmsTCOJI2sgQ
	k07XrIRyKAhpC4eIMBJncgf6vcUHCGYq8lAH0Tvo2gmKZkYCJckr2jO8geVolGWv/UY91QtF+Y+/q
	yD5XBv42YwqIu9KmAVU2g2TgIhHcNx4bm5D/bGSog7YD9DdFJBXXd8vFnR/uIKRmtuxLDfnySnbdH
	2MH/SahcO5nrgYmldD4iMFahMUzJtneWUHnwCM/TdFYqJANXaRedG6MvUgn0/Bgm1oEHPP0aizjs8
	GVbSqJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdr-00000008OE3-2TMn;
	Thu, 12 Nov 2026 01:30:19 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcq-00000008MM4-3WPY
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:36 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-53dda625f63so2444591b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446956; x=1795051756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=EeqapQng+7uAl7sNh4vaIGYGVZTGlrEYBSXh+ImVszB4IaPnoIUBSpDp2u2ZK+4Jsw
         t7o7H90HlKQlXbnlmtXtnpUH4iNJ76QqA5BMx4085RtG/71jBnJbqTFaNpqEqVHkWWns
         B0RD5x2HS0EjSV0cN/JHUeL36hNnC07Z4QuuEHNUpyJKAseGbXADxTRMwFoFc5ObIVng
         oyDsZ/f4CGCU+RMvEHForK1QwieO9ust1It+7rq3xqdTYK1uRHuBAYgjaio9N0k2wJtS
         6DnblggKCZXhKreKKrIU/x4DzRC2y/nnajhV32MrpNszU4lqs62zu7teqrHnxSrKg2g5
         aa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446956; x=1795051756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=MZkY1OuB3AQ8VD55QhGlkmUSsFysB6fxRk5EqnlH94cYHjiIbyRybdCJf/S30QCEAX
         tzWDfw4FNJcmJUYCqXqiTQdEMGB750qo3LJj7JNgJlj//VOyR/gJ7+TZLuPsLEC9RIM3
         C0EhbvTRyVx0GDNdDroXqfm76wCL1KW+khx6fU5Z6jLJfOoA7dDfbwj5p820ivZkpMd6
         4uuTNjiwdDR9RRjREhhhs6cQpG57Pjsb4L900D/XzpuaRAwbloAnDntDqGlynWU74RXk
         qjHVuswFaLFa5NGkyO9TF4QGO6n+05Ij5Td9xd12e8+wwIu3jK/x0etrgPUTqsFI4HuF
         uJwA==
X-Gm-Message-State: APuU4Z8jFX33tE5zAhUJ1OrHuUT8Fk52Gnsrmu9wfsZUq9EIHFjJPF+t
	8aUisxJv9jE4NC7okidtw49RLBeZyKMuActNV+tkk87CQQeYjgyKPB/x
X-Gm-Gg: AYBFou0O/Ear5ubrD1TpSUZ28U+vTKWfWwG4XUhY0/sORSl57w5UYLGz5SLWHpAbRAZ
	v79QGxtAVa5STyphKEO9vwUjSDkjdilVdikFAGKM3NjCL4YxiUCS7Cz7H/Hj+8GaMV69aRigxNj
	lMhjWB8YksSu7uvm95Ja9niE/k0Y9iy7s2OUaK80vruKLfKT1jqjjj+tZGqiWDg4OngBF9pm/Ck
	cZeMzCywmKxNcCPp/9WgVWZH2nWoi9jchUt9IKszvmvQvS9isnTKcw+NZvfVpVHiA4fJEADKgd+
	ANTSC56Z+AbIBJHEw9c4cOmGrwT4dcPQDFLDiaQK/tqhle/8PLa/FieTIKX4sOf4MxDwT7hhY0a
	5/3ttIFn1gDVhTY0T2wvydIJw+99QbnHQZWwD5MDBaJoRgU9s/Ogo6mM7cxR4T9xx4Uz9ejHtIJ
	hIK5Yb9L+8gjA9w2TTtSKwTKhBhH1Ntz2b2aCzAhYPM36DsPPrQGFqOB26je4A54+GmvFEUQxi5
	ArsAkMlzqREaSX4DKtxEOTji8srCQDtIm7ZQ72SOo30x3qcMQNuAZq0R/MhWXUuNzMbzK14IzHM
	Hphff9Ic/pcIkFaaw56x4KD6gT2GJC9M+yAqRp77i79vg1cW4gdm8eNeK+sALVNhluolguOr7TV
	cEBj5YkQ5bZymzaaZfn2eu+sDQUkhTna4MY3kIuQ/kiCu5V0ZOYHlcBBB+TnkUNSi7NUID5liS0
	HhLF84c3SxmB98GeAXa2s+P3vAY4a5/x3rNG99BKWnN2wfzfG+Wt1Y7CgENjIYecX/ShIA8hm51
	Q==
X-Received: by 2002:a05:6808:c12a:b0:4f4:4eef:52cc with SMTP id 5614622812f47-56b97717f4emr3823958b6e.43.1794446955801;
        Wed, 11 Nov 2026 17:29:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:22 -0700
Subject: [PATCH v3 43/58] mtd: rawnand: sharpsl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-43-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172917_185388_EB95BDC8 
X-CRM114-Status: GOOD (  15.62  )
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

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 5aea5afd480e..8376ac823c98 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -135,6 +135,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +157,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +190,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +211,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +228,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
