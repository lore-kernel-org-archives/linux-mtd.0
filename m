Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED852606C4B3
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CywMNfRb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MF2CoblZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u8upg7Xsnvcj8PiggKVyEpEjpadbPdiNk8D7THO5H48=; b=CywMNfRbXK1ahKRzedxIQ0E0dr
	Xx8uYXg1gPhohQjQ0lqKsRbIDbT06AZUKFF1zj+BzHQeBZZLyP4wiFBuhv24YLS5lmbp80vJyubBJ
	p34tKXIEMXsfcMQaH3v+0NRdHVaMVTYLiExFJE26GK1LivxZMI1C6IPnlP39u3ZZ4lqSVzhAgJO4p
	8Ki54SQZfG1xTQeul3Ii9o4KPIYd6NodcPEtZEKq6nfyI0tGSwJZKLil4wuXUtE1Doceo5oAmaAK0
	timCkGTT5FcUNeCQu+GGeazBkD/zUHSgJCG6Iuxarcod9RRM/9nY1DseUb9No/OYEXVWP8KlnWOi8
	ZkxTJH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEY-00000001FnD-0XR9;
	Mon, 16 Nov 2026 06:30:30 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEI-00000001FJW-07Tn
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:19 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-70b875f6f1fso3471935eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810613; x=1795415413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=MF2CoblZr90apxSnZFHv1STgIEvyHBjAKFedBrnRpc+dY+sg1ARPoBW3fjvboZN6Ln
         z2Uo9JF/8ntcB9kL1W+IMzhSykRg4GIZo56qPIzrIjUeUYVoYjYUgLYz2e3b/vBtDexS
         dX2DEljR3E7KblKGBE84VrxHWtbmcKHyc5dokjzyaGIC+Vyj4yeSMAXNpZ7JG/8HMmsG
         2BpRSPNlcx0NdnXRDqq9+yxAjjeW4Kk23A4ji4TVYMeewT7alqupsI93lpAODaDThyuq
         aFGMteBGyPZbNoL4YNhomsBYHXZ5NHDmehpQKONX66zG7CX7GkMlUVDhIQzeqvi7K+bY
         6yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810613; x=1795415413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=axY+6MomCqPqfZDcxZBywiVMIoCVdrppN8nWiOixJTB/JXRRATdgtY4XA8rW9Bx8fh
         PRpkATL0CypiQaw/IIW9Fp2eQGjckRh/wu/SNw1Rt6Rcr25nvFamNOjXb5YDKAsFCFEp
         h6j1lXZhLPSH1Q1T3h0oO22knwTFBq249wExOpjAWIgAeq/IQpCgA4Odysf6hyxMiNZB
         kiTYR+EfPLhiPPvJMFZv8JOjiPvMOHvFmkeBx2qls7aFdhUag0x4DZSvOsTHuzdLO7fJ
         H/M1KvK9KvWW2rF//sNASl0sVUVl6IGPGUXTUkplUmUk+P/xsh+lGZiGu4i0NDGDxn1J
         ZbDQ==
X-Gm-Message-State: APuU4Z98JGYJFPVQ2OrUeRWwDADhSDTBdyHxg4EH67b4AVdVMh6228hL
	zI4RsY4As0T4EOQQPYtyPDGwnHfIrWjzTAmm9xG1lOD5UtsUgkgYFwMJ
X-Gm-Gg: AYBFou3L17B2n7Rd3a8RFsxqglDn9KkbPt6dRfslfhvDqgoiW31yR512NxFLTdxjjYP
	qN+3O+iBnr4a3IAJ+LqEhFD+64lmUjj5DlV6icOUpo/hwT0++KH3AokOupk41uhgKeIs0HfXqJK
	Px5LhND9sTc0FgJQH+qwH7r+1NyXEY4pQAgXA6R7DcEo1SzgXNb5Y0R2m0oegfU4jX712AMr/NA
	RLuaEsxiUp/gaAYMPrkMboez4AeR381ML2SLwXTOxKvIzPSYvfX2JZXol14kY6kqbCiCqU2MvNy
	+536eumIJmTZyCDwX9MjXFN2XMdcLzpatHOlB1ZnGhe472MqzU24HTfzJvJStXC7rMD0j3cNOox
	rBFAfYLdkfakA7yRUjwEFnn0Cru9nSQ2mkOmPCQTdc+9/VkZ+PE8H0+ytgvzKGrsFOtm3VuxBSW
	yMOAbxxAWX4u81Gj4BPLE9tWVa9c0EdJ6c1cdBka3/zYkquyBpdC70ygYh50mw2/CMArmAInX2i
	gTN4T681lNE/3Cl9o6Wywv9AjWrpC5wemIKjsrx0/bNuY3GeT62tEY8S1ichdb4JG/x1nod+mAV
	NiuXBO36dii/HiMFQFbbTv8GbFpTjMA8BRUWi7jNCWaTi+UqTzseitpGfKQC4Y01nRKz+jxU4bi
	SCQrLvqbduQoO8EC3+GQdFKHpCKYEiyTJ3fpJ/h0SBsvWbi7tnugGKgSyfvoXufVkcXzXlmKMmo
	MJGeg0V+LXZ1O207CtEFJRWrZ+qHRnjP4M9j0BFpld0x1vue1RtNo=
X-Received: by 2002:a05:6820:806:b0:6d8:1b5b:3a7d with SMTP id 006d021491bc7-71ab4fdff73mr5913711eaf.22.1794810612867;
        Sun, 15 Nov 2026 22:30:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:36 -0700
Subject: [PATCH v5 21/58] mtd: rawnand: fsl_upm: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-21-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223014_143227_8A08E06A 
X-CRM114-Status: GOOD (  13.52  )
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
