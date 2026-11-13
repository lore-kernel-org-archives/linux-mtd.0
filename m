Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233CD606D677
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c3YGghbG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPqjLsMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vKgWzwt1TVbm1fEIqMqx+a8Bqz9PXA/BK6aNde9AZHU=; b=c3YGghbGMpj1p+s2VnAaIFEKMY
	1XNlG1SfzbzJL1ze+G+hOrzPYQ5pu1Ijpcb4GfcLMDJctGjfSz4ODsER1A5Iqx8nZ81/4+Xr9hyqY
	EzFnMb9VTEVFADnPqgDt6VyTFIEzs7uArVovGJixdbRNipJVBHdyTUPMwSh9pDPbgZnIGHmz+DVo9
	Oobd8PpWWytZiDimn4w8DZOpiCx5zuFd75konvZ2T656kIqLNE8bBe+Mg9S+G0o02z8lxa6lMg/DQ
	Y62VJzbaStHN2SFANnMU4VkZr6n96RpClZfZ+gVLV0Gbp1pR1CZKp7oycAqpAia3SV86yKb+4H14v
	Bkqc2ekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyx-0000000DwBI-2GR5;
	Fri, 13 Nov 2026 18:26:43 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvys-0000000Dw0Z-289E
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:35 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-706113e92f9so1507660eaf.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594393; x=1795199193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=KPqjLsMU2XmFagtZCYT291on5fvRGenhb0mIyZ20kFkXylfty8eiHKRKXuVSX4+Uyw
         S03YO0bJzhHoj1gLTPs6o4SuIJX8lxIYHZNnIbeCLr5bgibWW8BbSC7hMGf0CptX4Tjo
         MuCxX9fexAQtV8gfvfWYBkDOJ7I85d1A9A0azAdN+qsHqIihH411Np0SzC9aAhNWAmf5
         YQe9HIdJn+alI9gpPWHcpMlcsTehja47UVYTD8oyXoH7r4u+8c2H7jFNhm4VHBqNP/de
         tzh9tsbxDGb7VME2YbiglabvVSTQZwZYOtTqu4OPBYJeeF9uNaEGn8R8lKjaHLWAO6da
         gs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594393; x=1795199193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=F2nFug1ph8CaxhXeIJcnB3xIPuw7Nk0Q86aleb3No+3qLi8aOlYMX00SxO7hKlrhUi
         nP2hy6b38duDwOjuiJSwD60HBOEmkraembuaVAgfk92sUSgO9NhUuly+x6otEmZldusg
         RK8nTCCQ+VSyzHFufWQePSZ4m4tG1Rg5YsO6MGrwHFbZShFS+TNHoPGxlP2vcR5dbgSO
         jRqAWinCZ578Zy8tVl1ynaF27l7ZwMXbguvEhXgJQs9DXO1fULatcm8ysLAhZAuRYmGE
         VOxTJZOCtuJRqXYu5bJuu30hP679c/akAs22ocHhIGEBFH7Ulx3QMpfJ3RHRV7ggL5LU
         1iMw==
X-Gm-Message-State: APuU4Z8uNMKjJ3uX26HReaDAdsB7VXA1oiYUdNNFetHYndtYDKystzVC
	PQys9aBOXDWjVsakCBssEBfeeaj+23X1C7vupxizjGCSL2rmOc7p/ZY0
X-Gm-Gg: AYBFou0NlqUi3kbrNBHT/VOQfov8OE2xqTsGg34/+tF7fup7pmkU8w5Yk5lSY6GwQPy
	KyweOUMZZLCqIHVTn2D/hqPOKtUxisr3PcW/PNATiJ2yYEOrnwLg/0bSLjQtoI5+jTGKLZ7nci2
	6ehKJS8Vy75yxm8jvLed6xpWZFcdWGsJPxvqJsZ7bEY3hUR+rzee75eyoMJ6lyvjocNZXBC3tdV
	DX3GDWEQyLKlQoR+AhZDgzDODjoEFkIr1tq2uuUDOEgWLUAGCdP+P6MRIPnFosbpXJCwK0N8fg8
	wrUIXKNUAtTg/Ycfs4tKjs8CSm7Pn2F8kpCWImxjl+LueaFDuiRZMBalvKY60NeLuOFBF86Z53F
	vCD37nT5FUda5mJBXI13Qlbj3B9pXrSCHX9cZdZHv3vggXbKzVQ3QN6STeH4uB5Diulpl2IrDQb
	qCHrebdSELbQvW1NgOO2XHbH3E0MA3jrNdZ0W21hPjJ0SGJAN+yZvxSGygSE7zjbtewgVjOXnwX
	kEJjaUmjjPJZsbj8NixGmo9Wd4jyWAeQdfoW0NytK4dsT94zrqZcDHYDen3ENflOpgxfllN+lWJ
	t3XmwNKniB0AIiM7q2GiNdVR5zvvaOom0lZu2OZsiV032CWmK69PaRVN6dzFRSOM3Shyp+ZEX5r
	bfOQpWYpNO1gza7IyJvgQ6m3ujtg9myOGAHDoYz5uq/MrAgoaf1zg6PIT6A8ogwFUBl3OoAUU9T
	7J58Jiehm1Kxs9ARfmAa4e2MVatw5wr43/WMhdP9Yj3Yg3ZkiAohg=
X-Received: by 2002:a05:6820:1607:b0:703:38e7:c3e7 with SMTP id 006d021491bc7-71ace4db572mr144272eaf.44.1794594393456;
        Fri, 13 Nov 2026 10:26:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:12 -0700
Subject: [PATCH v4 56/58] mtd: rawnand: nandsim: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-56-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102634_561462_8D19746E 
X-CRM114-Status: GOOD (  12.80  )
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

A failed registration or subsequent debugfs initialization can unwind
after MTD handles have been acquired. Disconnect before freeing the
simulated media, and retain chip metadata until the final MTD put. Use
the shared lifetime cleanup for both initialization rollback and module
removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 6716eafb4b00..dd000c766ed3 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2263,6 +2263,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2317,8 +2318,6 @@ static int __init ns_init_module(void)
 		chip->options |= NAND_BUSWIDTH_16;
 	}
 
-	nsmtd->owner = THIS_MODULE;
-
 	ret = ns_parse_weakblocks();
 	if (ret)
 		goto free_ns_struct;
@@ -2377,6 +2376,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_lifetime(chip, nand_get_controller_data(chip));
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2392,11 +2395,16 @@ static int __init ns_init_module(void)
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
@@ -2413,7 +2421,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2431,9 +2440,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2450,7 +2459,7 @@ static void __exit ns_cleanup_module(void)
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
