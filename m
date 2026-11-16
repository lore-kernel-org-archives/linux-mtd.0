Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4243A606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNYJbBDU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eCQ3sLF7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7HmHW5a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vKgWzwt1TVbm1fEIqMqx+a8Bqz9PXA/BK6aNde9AZHU=; b=iNYJbBDUvrm7n/8gKLKH2v9YQI
	+JPYVaM++pwQ7deLZe032dNzBOLqN6dNYnKQAI7GTnPVsV9Wrb83af2T2vWnyZsw0Hssf4fNBZpwa
	aJ7yYzQ3w0otc60oNarw+CnxNB3dfwZbJji8mOrtAdVZsCgdgzCXHT2M0PQWXWVU8EwoR8QcS7v/s
	oqpmhQk5zaaFBljFkV8sR+lJiZFYC9zQqwD7tLbcPHWJkLOtNZEU2skcSVI8lpzi+bSSnFaWfjliU
	kdvuaSKZwnm0q3hpUxn1BTemWbrtUqZmwaAt4FtL8K6o+cOufdextM0aq5gJ9ptOQNWZ++yx6uBtQ
	GPQXO0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFY-00000001Hkv-0bMu;
	Mon, 16 Nov 2026 06:31:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqF1-00000001GeD-1Qzt
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=; b=eCQ3sLF7x8qjRuOzTchMdkMGP1
	IlEGAUsQ6iApWIlKgfAmW4dP/FhlI5SU1o/USUg+Is+u/kkv0nbiVmsAlZlVgx0QFEt5IEQrwHX/p
	iK3hSh5V9vTpPz5YfP7n/rTLO/EUIqEsxgzW/5jrMpPzb9aMR/dxkB/axPCut08TvYWUkz6pO/gNH
	Wrl08bru427PbeJpqQHnhpEgTiZruQxZ+RpvzDsuj9WoQfHpqnCgYSbF8yYQvsD67OkBlxe/GLGXA
	Yey21Xx6cESd+E2rMr6Dc4X3VHMoSSkg44rQLsmzLaJsA8V0nr0S5V2ziHRToxhzWw5T9L+PNQRho
	+UeEGGRw==;
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEx-0000000DPP5-3bld
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:57 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-717080a2d50so3388809eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810653; x=1795415453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=i7HmHW5aRCIZBaGKRoynhT4iVqxf8JcpNglD+RVHcIh23ShZn02nvim5/HUVrgVrPI
         hiOt5ONBSA7LOi96LZqEONvn4MyfGQuwfu7Z/19EOEF3btHzoesLf8l2hrFxOwDaVM2A
         LMdBXeHD6LZ9WJeAe54sV7fRcHANcofRpbW62bycaT5wErddfQ59DnddG3ON4rLnvYJL
         085WVc8vUZX5CuJMu9gAVtFoRPaTRIZgHw/qfMo5+rkY+3fUFhikWNZiibpQ8vnRoQvm
         9aF33ofDEe8T2UnkeJ/EBOQADn+VEf8fjYx2j1HxiMZzpYBVzzerODUN1vFADSpTaZSC
         dFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810653; x=1795415453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=joVqbiIWtWt+pIOtYfL0i/sfa6/ORr9elwXf0zSpOrA7CaTH8slZBlF1/04FAkEO4D
         9y0BdBtLbXlWi+3Qjgw6Ho9KfbP6QjKBY6CacNmHw+uF4Z2Y//yej94tDBNYUsCluVIf
         bOvR4KXM/cQEb7ISxotwLNNO+d8WvsWoMVwc8ZQiIG8XxkleTRgti/BfvzZYRzy/8FT8
         rOjb0a7J/sDRkrt1vCKvluL0gtYulgbkPdf7PUnN7jmXuw6Uw78sWkrSecCk0jR8fKil
         pJF1CgBI3RhhREDQGhpduq8vUtB0wL6y5HBLQx39/m8epiVfq539J/dMCXRohcoG//tt
         pfDA==
X-Gm-Message-State: APuU4Z8JYwXon3HjJ6+OEInbXCaLTqv6OZdtYIWXgthFtQs89yc+MM0W
	7VIg05sezV9aG5Kbwd2ILRUHHb1oejsfWdo63vxX/N/uFvUPJUALPwQD
X-Gm-Gg: AYBFou2OWp0LU+etJph6IyZetO2tgb5gnFoQZ0jaMtQvc1htq6jTbPXFt29rFVHXyre
	RRpo/LCvWd9Xvushns9L7zhDSvcv6Rjp+yZJte4rxRnC42AJKMEb7/vIVUmU+PpagW10w6qE+Iw
	5O9WjT2hrrqpq+DERb1mPYwQEMYDAODBWmK5KlFj/+4jaG9tXA+aXKMY1cysQmQf8TMyEE9aKlD
	nY6Dv9F8wiUKln5cEV5o9OgGQ5ezZUCydWvLwNq6uDJgW27k/T0VJmqDOLKye9xDpPiOjyuA7m+
	eyUX7hZXd3KbHFjM/e3zLKWfPbEGmyFvJnHvVFosR40L/l4dT8cZnNoKq1Hd5QgeJBD4buvcLlB
	ZavIfhQr9/6AJRE58BzU3YPWapn1MOukkM+xJGjEBQMgSiYJGbGC/mY4WHeYGAwOfDx2sHVqxK7
	snYLIKjfbwGQvR4AhvwsTfxxSZDoSuOhD64J9a0lVJCDb6foCDxA4BTxG17AC7uuWVx2cK/eSRo
	/67vVE9/OoF8oSnoOmIGYBBRrytDoRq6LnQxYNrAYdzuFTee3Yo5DPrNvFqph7AuZCU622Gvw5t
	8cn73wjat8MzyECBDvkTcu5K9coyMgrkaxfstbZbmnrQLlmR1Bxr7t9jYWc4HeP8HHaHsnCjR0k
	UxpL6y15u58PUqEH7Z0y4fiPjEhJPoyUE0H6yIWG837aRrSQ2JgEcYcVyeqTYWoH3rSoSeumAsD
	7hPXe92GG5xd5kue0dQ8jSSrHMbaJsAw0A+78NiojpYyYkiXHtuQE=
X-Received: by 2002:a05:6820:a09b:b0:71a:ea6a:4f64 with SMTP id 006d021491bc7-71aea6a57eemr2049976eaf.50.1794810653156;
        Sun, 15 Nov 2026 22:30:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:11 -0700
Subject: [PATCH v5 56/58] mtd: rawnand: nandsim: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-56-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063056_322549_F1DA554E 
X-CRM114-Status: GOOD (  13.78  )
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
