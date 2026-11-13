Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF960A3811
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VHzU4kvy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lnXTW85H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qAcQJjl1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u8upg7Xsnvcj8PiggKVyEpEjpadbPdiNk8D7THO5H48=; b=VHzU4kvyc89Je880BH39O5JLqN
	EhvtUIUghF2nSauxmrNXKjwkG9oLOGF5Gn4uEEWi/vA7XBcyWcEzwFrAnUZoQLurJhgSbYeyKSD2i
	I32CbhGLt4qESImB9+/mccklgcspIWf0boDKnDXeN6emFEDf76RJGp/8D2HYEQ9NMl4Ki9bqT6e0m
	6inCIvTKMtxotA//xrwRHp1ew1RChYblKfBjt/9sywIPWV0Fr6CKvbH9AvfbU6bY2qWwLpXIoQg9m
	ewAjQCuobPWVXEdppszXs4BgbBfvOb0fxUB1qGTI+0TZRx1+WiUaHh2aWmcc3u2DmQ+aqfohqdsZF
	2ueaOjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvon-0000000DriC-0Qut;
	Fri, 13 Nov 2026 18:16:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoP-0000000Dr4a-1qqG
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=; b=lnXTW85HnrD9J6+3XL6E8aCeDV
	bsBGnDvZTTZOcUl8n5UNmzikaAnShtOpiJfsjbz/NKc4ZAb/TvoF1lCtH3mlv8kFcVe23z5Mvyhpe
	iIdYBYsd5i4rCujPFfR0zMJItEt+c3wrD5qTkvjkLbunUP3OaPLAdyBkMy6m2l88Sa50NoMdR6JJH
	fkSpIr483RHP6dLfZvg32kQ2WP9u9x+L+K15cxSlUwfgvUcEpELwgXKol+zwVVqtzQLhgKpp0uh/D
	7Noe4lH61XvOeOPMQ8LTsx1dqioMFDY/Am1tdJy4m2rtK0FFTBZjZ0gx9rcEv8Trx81V4Dam0FC2s
	jwtpJZ2Q==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoM-0000000BdhM-1Oqh
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:43 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6df5e315bd1so1811388eaf.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593740; x=1795198540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=qAcQJjl1vLVA05W/7jY6k9rVzHHW9SR00hWjd2UhdGEU1psNv9e5i8hP4RkhtkW32c
         lsVnjojnyxqe4Pc/Lil6PF3Zj5M/ct7zQu13eFaYzYBc1/SZKXBBDMnRbufHFx/ZEOfS
         2JPZhKLNTiH9UchU8yk8zp0jB8E7KpQ8VCX4lOrqo2/DgAW6zcOWVmuWMTywKTN+zRpA
         utROIMiyNLV4mD00vn3bTEgupXAaef9m+La6Hl/uxYWtmWotEgv02XE8LEqvN9eZ12KH
         1DA0V8jTCcGpXMfyMqkE+yqbDpDcZ6f0cPr1PXo3WMMqfhVTVxb1kS3mSOfTA2k2CpG0
         lizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593740; x=1795198540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=G7GECSb5OXEDnKgJ8U4GVOmabiMYYRI5oJHxHRpNWanzA58diw5KB1A2hzKZEVNopC
         2Xr0vnrwlafKhvhnPZL9/A4DmFL7bR5rw+xFfKbzwXl7NTh2XkR7hC1yn+uI5GGhnWc3
         9Wf6HTX/kdDATLu8+zSb5boMRAqiogvShK0LmuXoEewP1wXIngv1hkscPV7FJHegPbbJ
         J+r4UEpIhdSTkRGPpbIdrGG+f/6qIDQUWlV1uxt7SNwL73CKhQCeW03/NAHrLTOWR6c3
         ifLbCJru+XH86iLjJpcNEnDzXdaTo0/H8IYO+gRjFv3TR2WmW0N/C9AK0EApyGOnMFXa
         lP9w==
X-Gm-Message-State: APuU4Z+37cqYF4QnZQFQ4+0704ftmA8+QphktehRNaNHXobLA+4Kcrnb
	4OD3BROo/lfrFGXyi2/KTphhBtRBvC4exprQDwXT7TzKC3zRY6SNUQQb
X-Gm-Gg: AYBFou360WqUi6Mp9xhd4gLx14go6pxntXolKEL4YaVXs9KkmL3ZMjU8amspW+d60yi
	/Gtl4vmmemquU2j3ukbj98yM7GGkl40wOY6IlEJEqmvIXXcZtdImWbG6RMB4ZZjLdyXUAduMBwU
	RsiY9DMRWJqewRl5Ox0oQ9XGrL3abxBPLghpaW3jrPJKASeiwCoB1TCIII5Top0QNyRhEicOqrt
	DSrqckMGkM4GzyGe/CD9s4WvvqxVBogsAEilXlkCWrPH+kDG/HcU08r3VAKLF39RkUn5Mzq3l+C
	s9MphVvch0stmFRHR2FCTi6WcXEW4ebc9CfEio/uoNWZ0f7K+QEB8ynJn/ID/7enpaPX3dHy2g/
	4cFP5on1Tr6ieaMU+6WsuyAUNcx5D9sniqz/MV4OcBvw8tEjK21PAgENQS7Z5wWebXQRN9Ersqe
	tbPgdPw5OgnEcNS+93iLJ8FdcPlOTmuLalGGCIlqsRgS3yAxh1kl7AY7mCQvJBpSAAcCvhBW8Wp
	lFWp111OD9czg6dyAj4/Ldw8Ync9vnMH+oYwFvRziY+qF7TMUG5Mpzdwm5sKDmqZFMrSQKHTNd0
	Y+R42xjwi5qqkm9Kl8wPjX1WHIiaXyjMhO/NzhQ3/hhASoBQTdfw6sfhyeYeiuk6iQZvXN2vs7C
	dbo2vvpG7Mw38AZ6QckOFA5mIqaPya7XaDoAfMj8G2d4PqbU+RqQg5lbE0UVt7wrlxI94CTvyFF
	5MYsF2Zp9d/k8Uq4BVCLhmWILG+f8tVZo7Jh34PK1Yi+H/5JP4Oz2QpBHVNJ1xBt9a8fqhQiY9
X-Received: by 2002:a05:6820:c0cf:20b0:719:1e32:866e with SMTP id 006d021491bc7-71ab5070652mr1714642eaf.38.1794593740141;
        Fri, 13 Nov 2026 10:15:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:37 -0700
Subject: [PATCH v4 21/58] mtd: rawnand: fsl_upm: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-21-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181542_274082_9B9D4FA3 
X-CRM114-Status: GOOD (  14.38  )
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
