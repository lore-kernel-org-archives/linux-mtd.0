Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D928C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 08:05:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D739D206DC
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 08:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hv3kxpsm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRvZD8N5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D739D206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yzvRI7gK1bQcqsowtdfwgMumgTTSPrTqSviVvng/Hug=; b=Hv3kxpsmT7sSIl1RadX6NWcogQ
	lMFUBp6frxNHhYAfzD9y06aXpLFkiirH9C91O6P1jG/7Iw4AunK+mCSU6W/ZLyOCIs0U3YpaClY0n
	mTkVndGgFX3fLC2rYCnu7U/GH8liu+8/3p4qIbFCRqW4Q+dB/ZzIuR3rtehA5Buc7qWaAH9xEMrG6
	bVushh5U0E6tSz3CBrilm/I5WiX3NEAgTK0XSOdz9FI3ifkhSkPgmkGsf4Rezqms5/h1IhgoCWzo5
	+RUOiblJWGXSqoXuEOPH/ugDTp5pTUOOSZtxadasnywRzc6k95EG+3FFc84PjK1cdu41kw/hChN1A
	6WddKSrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJXrW-0005rb-6b; Sat, 19 Sep 2020 08:04:50 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJXrT-0005r7-N3
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 08:04:48 +0000
Received: by mail-lj1-x244.google.com with SMTP id u4so6904094ljd.10
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=74d+3zdIrItu4yPjssRFwYhLxV8d+x9MW5ISlAEwzIM=;
 b=rRvZD8N50pyTKZUu3Uq4YwvhiMedpbQfrgkiEcR6sqlFbGxRDZ0es9mmDSXY49F65c
 kHuqDBwRu2yzu8+g6L3YaN2t5FLGs0AXIVoXm5Nl6ZxFzTexLoPxVZmwvQ5+cLiHjmtX
 7TKh7LEoYgTAA6xyNKTa1toLP3hniG1Hc3RyRq7uifBfPDh7ue+cb601ENhbhyE6kf7Y
 xKqcGZq1exzBZuHT2XMrsBMghlaEP8AMzFXgXRJSm9ZwEP3+dUeMMYTwvywKqYSaVlz7
 2Ty3Aql/xVvRWyyATI5hxvgSvae5yZfmk9drBJEJnp+Nxk9OTXogsbmTGA8TWJBaCzEU
 m/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=74d+3zdIrItu4yPjssRFwYhLxV8d+x9MW5ISlAEwzIM=;
 b=Z77q1VtwVOs67j/D3utNZuvADFNtEyc5pBq+T+MO6k29+dzISKEr1iQzzlIfys1ScW
 02fKAVHH12jrD6449H3WwNuNGlAeXPode9eW/Ckhjf0FoqwD1MxgSL4Rrg/pK555j5y3
 e1tmx5ahZXuK1S2cRt5xMAcgd17ezbreUa07Qh14F1QJ2gfDbnRapHgBldCMHl+88X8r
 1vIHVTUDcq2RazN3ZXNwTRRXqMKZ56V4Q6H5KEleGtM+N6DLOhhzlSmOnRf51DOeJLoH
 wHVZkcnyPFaTCarC0wi3kKMSI6Ftt5XSWgxlLYka36xakA8xLuD5PCAmYmfER7hiRDD7
 mIAQ==
X-Gm-Message-State: AOAM533izKmujPey6nlXBsR/X9q2NaWinQ+G0FVal6m2iTpLaPnVjj2v
 YVxD4fD83KsdDWzZbr8EwSc=
X-Google-Smtp-Source: ABdhPJw99VzTK4mNA4zbDFoHai02D7/beIuY/UeI5WSDlDYUJpL1QZ6lxuec0lKqKD6xilVG6V9A4g==
X-Received: by 2002:a2e:8904:: with SMTP id d4mr14161289lji.322.1600502683030; 
 Sat, 19 Sep 2020 01:04:43 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id c22sm1110110lff.202.2020.09.19.01.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 01:04:42 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: ams-delta: Fix non-OF build warning
Date: Sat, 19 Sep 2020 10:04:03 +0200
Message-Id: <20200919080403.17520-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_040447_786106_DEB5EA75 
X-CRM114-Status: GOOD (  13.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit 7c2f66a960fc ("mtd: rawnand: ams-delta: Add module device
tables") introduced an OF module device table but wrapped a reference
to it with of_match_ptr() which resolves to NULL in non-OF configs.
That resulted in a clang compiler warning on unused variable in non-OF
builds.  Fix it.

drivers/mtd/nand/raw/ams-delta.c:373:34: warning: unused variable 'gpio_nand_of_id_table' [-Wunused-const-variable]
   static const struct of_device_id gpio_nand_of_id_table[] = {
                                    ^
   1 warning generated.

Fixes: 7c2f66a960fc ("mtd: rawnand: ams-delta: Add module device tables")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fdba155416d2..0bf4cfc25147 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -400,12 +400,14 @@ static int gpio_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id gpio_nand_of_id_table[] = {
 	{
 		/* sentinel */
 	},
 };
 MODULE_DEVICE_TABLE(of, gpio_nand_of_id_table);
+#endif
 
 static const struct platform_device_id gpio_nand_plat_id_table[] = {
 	{
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
