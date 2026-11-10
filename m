Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8F606A33C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rvWwybwf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0h6vXXsL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6guN6dSMVIMQpIAoBG+3CNq+GoPTuvcr2btJjbUjDr8=; b=rvWwybwfqJHuWD7qxVZI2ujZYo
	gNEoamo3h4nJByPIjdnObRA2JwdMplh+3x3LC7WRKi0sDPyIjvVZLBCxW+BR8NWhLkpQkjQIiCgdA
	JrXC6smbPswITtHk3jL/LEXa/943y1Y5ZGQ1h9GzOLcgUoq2/Q/b4/KW4UvcYTSwFNpQcvxqafJ7a
	LoZyO9MSN4koed6OYKnv4v8neoims6jOL1njTWVisMC1yyN5IN7L4155xtiRfOkLCzUSxC9Nsw/tx
	ItZ2FoZ41grD9Vvmw151R2beH7gGxExDPOk3aL6dlyaxZpYVWG4YiLw054YNalrIcmt89LagdP91o
	aRukGd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZ5-00000002za4-0r5B;
	Tue, 10 Nov 2026 07:46:47 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXk-00000002xgl-0TaJ
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:49 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-85a5455bd3cso940999a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296723; x=1794901523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwUJjWsLv0sbZcwY6lQaaStciK0Yii7zkSEUupy4QzQ=;
        b=0h6vXXsLjKR5YBV6h23i+mZzt77e1lYDAGchymQB9Vr3C631bxIsQbGZHPAYfvFRrC
         FuhBelzT+At5NRNOFsukPVPtGpU5Ni39fillDd25i7X3/WEQXJz61MKINww/oqChlXOJ
         TQMHn6A6MIlJQ8VSGUDnF0odcDnEZxgLKQ5wE9GwMgG022ljTaHwgCyyeosReJ2KUIqL
         Aqk7hZ/3n2L0Zc6nCEUoX24mNN62u91qOxMkO47s49HTEQBkHhvIP/Kou6peE6nBVsQ2
         oxcvodJlzrS3YMaJhLLV3sGwEyQDPdJZ2CwvCiZs9T3qO6W6W8SknwEYrydAHD/C+XU6
         l50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296723; x=1794901523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwUJjWsLv0sbZcwY6lQaaStciK0Yii7zkSEUupy4QzQ=;
        b=Na/XTvdVwLmKI3NYCMAl7FmJGarMS0aTDhD8lJSp4PBQxaze8NwJY58PIDsyZkF1ym
         Z3MHQetKLhmo/ZQNIah6Z2WC7nobMsrxRGpNGpd06oacxOv5BZppLXCcFyvNHNJ370Hv
         pskZdu7Io025spJswUyamr9GN5VAxK+ngGvRaiopuk3xPbF0jWujx+8Sj1Pkf8eGNvMM
         Bbgq/f8AOl8Hzx+vXPeRrphN5Kl4o1Zue0VRF0zw5pVTb07kEjUeQmh7rv4Oy245oqXz
         +2ywWLTS57UNHTYqHuOrsvs4zfCAPFnkoDIXyQ+mvlkY1Cg+M//njPnV7zYI0vosGcQJ
         Ne9w==
X-Gm-Message-State: APuU4Z8m9bh3G8O0HyYHdjSO8BtpiB89B/QPA/Le+6CikBtvYNyioUvi
	JDLA9W4yozIlhJ6Yyqpj6oHWDTtCoLDHIVw4KbSxI3PGW0V9F3LxZyZV
X-Gm-Gg: AYBFou2rQYKlCTsdYf/XONG+nNztqt2itTbq8oNb4nZdgYL1Hw4QZpNavmBvL/eK84f
	U5RKxrTzfDRrhvZv9wHt/7srSklF4nLqGJnzfPuSClP9n2IdTZp4ADUO0ooJWxUOQVbD26MqGa9
	QNN+jLMCW1IGUxPCvHfPOBdGQr5/PAsSEqrtPQ6mkwTv5mDOKZ6qQtvNGxFGyews9NyWuK2ZfBR
	z+IdHfwkvusNnSvMAuM+Ogr7hH6Akbp+rZGHY45B8G3UZEnGQv+WRN84zhMaWnRR7nl3EaF8KnK
	ApaK20PIxxWd4um7cN4TKSpMr9pdnv389XzoPcZ68OEVmyoSQy+9YSJo2CNuvyZzM9TnlbpUwgi
	ztOypFokNRUuobPHl97OFYZKvfbARn8gps8Akg6wZmf0pDhnWzmSQtR4A0BqF6stxHnVe/tu37v
	+sRNJohnO4Sr7kMAVbyG6vDF1SbrqXl4JaT4S3fW06E2ep7PDqaSPHDhLVFzFBeKnjnIiHFrSB/
	NN+IJmbQT59NGF1zZPBoRs67Oj1x1DwRbuZVIKEr6e7VusFUfr3jHHNoBebBPbnEhhTP5Cnr8yk
	Y+jvVq3B/pgcSNBuRTH9/lUapGlrDzdTQDxrRY2BVSHGwVTSf2E3gyN7Ddtb4kZI2iNSNSzmwn+
	SYdYwhFXKYiOVGzKdYjAIl2VXqslQiLpw7Jo2cV0JcdrcDMjUmePjhmYsOhahmS+ARJnvtyW218
	t0i+LgFg13dzw9K8bEGIhfG4WcGB6HktJDeFYFBHP76QAjA21ceKA=
X-Received: by 2002:a05:6808:4f5f:b0:4b9:e5fa:8903 with SMTP id 5614622812f47-5683cbf9608mr1759067b6e.22.1794296723223;
        Mon, 09 Nov 2026 23:45:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:59 -0700
Subject: [PATCH v2 56/58] mtd: rawnand: nandsim: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-56-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234525_857859_B3B32705 
X-CRM114-Status: GOOD (  13.84  )
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

MTD device references can outlive device unregistration even when no
open file pins the simulator module. Disconnect before freeing the
simulated media, and retain the chip metadata until the final MTD put.
The lifetime core waits for remaining device references during module
unload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 6716eafb4b00..0c8c741b2b85 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2254,6 +2254,11 @@ static const struct nand_controller_ops ns_controller_ops = {
 	.exec_op = ns_exec_op,
 };
 
+static void ns_chip_release(struct nand_chip *chip)
+{
+	kfree(nand_get_controller_data(chip));
+}
+
 /*
  * Module initialization function
  */
@@ -2263,6 +2268,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2377,6 +2383,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_release(chip, ns_chip_release);
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2392,11 +2402,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2413,7 +2428,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2431,9 +2447,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2450,7 +2466,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
