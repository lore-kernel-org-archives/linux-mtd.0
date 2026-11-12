Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BF3606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yi6NO5Hv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cTsE2xYW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oQV5JApz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JJLB0L4GJ/JogI0lW5CxdnlzJCoolXgSVsiSBZQ6MeI=; b=Yi6NO5HvAqUptsNxp3nD6xLk/7
	phSbnv2EJq4QHDm1oeFBToB4d6j8AfqAUM02IkTzjgCH2XDGbe9nSfPV8LGfMy+qaeqpdgC1iHdJ+
	I8/du2qa31AeZ2plUsWTAw9K5sLOfZ7XL5rLR88r0haIaDRNsGtP8GKHOd6V8L9ii9h6CdlAnyYFn
	GhvYjYdbeL68XZpw9lcKcrHuLJK+DmyhOtuL1727O+Bq27pM9Tvw3wlLHp6LRt5NA4W5Ro9bw5pJ+
	mI8zG392jzhdTDNilf67Y4H7dcSKYA4VIz4lI6YSPctymiJr4aY56GpG6l06UPAHJzlozlRyuo6Hi
	rAdT4B7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJe4-00000008Ogk-14xU;
	Thu, 12 Nov 2026 01:30:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdL-00000008NBd-1MdD
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=; b=cTsE2xYWHJcRAo8KniadnaiuAp
	dM606rhIExLYG4T2ymm7tNV6wGn2kWEZ0o45UFOfyXvMhAflg/UlEBQqHSdXQLHR+Hzr6nj7/7l+U
	9djl09KFzD4PnjXKbGw4a53RTLoICxbMU8ep02Dya3vaa8qUyq+OEBniHKPjX6ZEbnZyApe903eec
	3Tgk4ioqUDUjPDSFiyCxIdEgGEd1Xob6degpM/tvn9UPiXQvYJMb4BCc1RyG/w+P16As7rdW7IFg1
	QXYC8nuPkXMqbL7TLbwYP1eAUfCojecIYbz7nM6L4JQWH4Sy+YRr8Yzf632jcellDG6Qa+HaZ5cH4
	Pd5DVPbg==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd6-00000009mzO-0Bbp
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:45 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-53a448f86e0so2102629b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446970; x=1795051770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=oQV5JApzwl6HYlv2JneBcnG8TqjKrkvpxjebzcwprgmns+DwW0wPKyS/NHPg1rDvsm
         3JLhokrzvqwWfYe7JtcXQTjsliVApMJyQEIRSYXJZ7DgkaSyDK02+BCZlvM6cjMcYKbB
         W0XyTKl6sc9osPjAyebsIoQJpJ1Jmvw8ZWWT3Cw0ci/SA6r1sip6vSpUBJ63SDtfTDnK
         U+zKh23+9cneqU/DTu/1y0ECTpoUuhMrmlM01s7wKDQhOBM35BRZEH/nT1/DQic8aJaw
         qGzGcTAkFCEfy/432Vbwpw5ZefbtM12Oy+eysxRZ9ky51zDQjOXhtsPh8EEnlBcUQKoc
         SBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446970; x=1795051770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=DyJEKWyzT/SuResxFSDftveTvvkOC4FPWSMeLrR5BE1NT0PUh0Wu3bCCqZaKkI+lp7
         YLJvq9wsEbyOaXGa17lbYo4aQueMibGk3wxgeS1jurVUelp7GOue8ik4UmtSadMMEk58
         zpZimxX7eUOQGmpAE11fsxVxehXoi/Jb0pBAQhO+2Zek6xPnthBEUWcMA1DTZdxfNScL
         h5o0xDWdcten5rMvbQJ69K1jqbHfEVF4C1oQ9tp7dcI4jEtlxsBDDsMFNElDUy2k++w9
         1LzFJ2cWdKBgC8gVdh/JnvNVmsSSU7Otf9o6PY5h5sO4ErnqwiI+TaY4pTuSqQB0vsuC
         VPmA==
X-Gm-Message-State: APuU4Z+eRjhafyf5uTNQ/5II1yrETUtTegFkS20Jlo1YVACD85hbmnVt
	Ocs6YmUD9U63/eBzN+nhm1yMXZcceMFNV0kVcp7mwdpCt5AHS527k850
X-Gm-Gg: AYBFou1SrEp7Wt8CPGBaTJkHbd4AfPDrd5BFdktiQajZfGbMvXA3yt6Ll9v9NlXqk1V
	NHL8yx65RqDNluo1IateczHq9kAZsJXAAM3LVVwcLsTc5gUe+bMhIlBZMYwLo77zUcCfgH7EaAQ
	dWwsKlbSEoaRTjvaBISkJaAYcz7p5oKg1YY7QNX4QBUT9TTDFkdQkVJIHsONRwh+LxLj1m0xM4X
	qv3Gap2RBFK5sv0dHA0X89Nbqze2ynXIcH7S7szit7thjl79XbwKRK43rgIvTyv5JdmnAMDHrT3
	BaiK1hNs1EFm7nqUFXQAPD8VGFfhmbmsPZLCGgO0A81YESGDaZycBJs0+nTqsG3rJSvysyOICg6
	h0+FfVcGM35/E8nesL1Mma5S8+n8BobBixWJQFXFuwibhXyBYHcPNJzf1sbjxlXa/1eoHm61y0w
	58/oN5OHvWKu5v+sI2gjb1smEayIr7mIjNKNO56CTVVKWxRHIpfO5y7WncQZ+w8YHdmcjLJLHxa
	fwIpven8pYAK6GvKJMa7yG8y3KqdV9y1n5s3p7OmGO0NbqXGPFVN8KTf3brDsyxs0rr9rMFYfuI
	A3GfCPJQ90bgtpcHEykPEbhYW5RVkOhq6uFvKcZ4sgqCBEZud7HjNMmAeZXO/RYxceF8vrRAUuo
	2qY9lw+000GswN56wbN6vylO1/+o1K66RrNdffF5bdpnbWpw/DK3wBR8qdnB8ITK8VrnNHw/joI
	0ssNySluCFQiV4EjjIjaFSE7LENbNR+a4qHPQWVjno1Wez6QCnofAzRA==
X-Received: by 2002:a05:6808:16a8:b0:4f7:867a:bfa with SMTP id 5614622812f47-56b92845782mr4040150b6e.5.1794446965567;
        Wed, 11 Nov 2026 17:29:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:31 -0700
Subject: [PATCH v3 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-52-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012943_106446_4E5B1E1C 
X-CRM114-Status: GOOD (  15.14  )
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

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4cccf00f67f7..fac96ec596bc 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -26,9 +26,13 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller, b47n);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +52,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_lifetime(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +76,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
