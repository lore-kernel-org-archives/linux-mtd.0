Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7390C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g7eaXOGwzMh8EvbXaM2riDc3ZKh6v/0iQH01Vvt7m24=; b=vj6WuZoiHK+gYD
	PJ1MxtSm0nhzf4JKqnXon+ySC6XKKrIROB/dCN/tm5UzX9T3ogTJkyY0LnXWC0isbdEmeo5OCCOab
	zGUNURhXoClPzMkkrruDnG3RGyaJFOaCFpDfyQ2eQqLqFkgG89DeIJUI79hBkc7Yew9fzz88ZRc/F
	8p+izMO0LFo0OYphuFFF++F0OoT+kci8ZHsFwJgPzi/wYZmf1qYKR8GbO9sRm2XWmJkHxn0vTYura
	xoYmj08vU3Uvr2inCzldZKYRL2R+TCAQS0IX32bGLkyjBr5xL8blBphPBpMypBneUe4tU7VRXrAQ5
	4wPDnyFfehYq4a45KhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZRwG-00GWXi-AC; Tue, 07 Mar 2023 07:40:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZRwD-00GWWl-O7
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 07:40:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id da10so48751834edb.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Mar 2023 23:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678174841;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5IpSKyXyeFe9/34ExltwmVNhqdaflxRmwhQAOMuSGk=;
        b=Ktfkc1GCbZfBCATHYdSFkaawD4zQyKTqA7JZYwaqKWhc+HVXomvDx/3o9sLo2/HqoA
         hbw/9bVUv6ukVu/0eABchQbfGBi02CJAE/66AaqRued8zleO76QN4BPpcGrMaA9W+/3i
         6rbqxMbBcn7a7He0tEGb+nv1iRPU3lg6b0vRhjWL+a4y0w0OkOXa23bKuuZJRz0vBfsE
         foZO68/I4M/+lRvofB//8HZUxQYNJaAXuvORSDQ1WDbIAofmQYHjtIhIwqMK3poBZt60
         /NeSHYogP+4tg40lsCrbnZzxLWD8Y1XHktwlwoodmVr3nf04nzlk+99pyUZMtv81SuSS
         k4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678174841;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5IpSKyXyeFe9/34ExltwmVNhqdaflxRmwhQAOMuSGk=;
        b=C9/2V7hH53KUDPIzQIeltI++uGfkYYpMstAbED8N+ECs0KxR2yPnhwLQpXHl0K62y6
         Ncodv7hymcXODabKpXik/UI10j/c78ZJ/oUx5U4Vwlte8lzw0k3fHcK/jNIo09grE+52
         4lZYomRB2HXm+Dhy3qtH2ohIKXQv8UPWfo/i7iMVNiOJk+QNyro5YNoJVsahxch07jSF
         7P7nqaem8eTyULLki6ft1BYMDiqKPUlNfuXrEtImE32OuRtD1Ep8sP72cVtqcFrJVrsf
         U25SGwDQq9YYfi1mGqPddw583PqdsaHfbY12bbGriqjbuxcrIJP7uDkLFuwuJIu0x3LT
         BeGA==
X-Gm-Message-State: AO0yUKV60rAFCRxA6ieJ7qRtT7bruqDwbO1sV65wn0D3ClWsQfzDStJ5
	oD/FhVDNoibd+wiLkUMOhGk=
X-Google-Smtp-Source: AK7set/9jJyUKVijolFNnzdZe4RkPQrD3rXz5wZWpxUGZUr8oynFlSwBDKwxTCqglSp7mMVRbr0g5g==
X-Received: by 2002:aa7:d683:0:b0:4ac:bbb4:9772 with SMTP id d3-20020aa7d683000000b004acbbb49772mr8653860edr.40.1678174840834;
        Mon, 06 Mar 2023 23:40:40 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:a517:a52e:cdbc:e30d])
        by smtp.gmail.com with ESMTPSA id d26-20020a50f69a000000b004c0239e41d8sm6167084edn.81.2023.03.06.23.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:40:40 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] mtd: parsers: remove reference to config MTD_NAND_TMIO
Date: Tue,  7 Mar 2023 08:40:38 +0100
Message-Id: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_234045_877476_B75D6F72 
X-CRM114-Status: GOOD (  12.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit 568494db6809 ("mtd: remove tmio_nand driver") removes the config
MTD_NAND_TMIO and its corresponding driver.

Remove the reference in MTD_SHARPSL_PARTS to that removed config.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Arnd, please ack.
Miquel, please pick this minor non-urgent patch on top of the commit above.

 drivers/mtd/parsers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index b20e0c38b517..60738edcd5d5 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -149,7 +149,7 @@ config MTD_PARSER_TRX
 
 config MTD_SHARPSL_PARTS
 	tristate "Sharp SL Series NAND flash partition parser"
-	depends on MTD_NAND_SHARPSL || MTD_NAND_TMIO || COMPILE_TEST
+	depends on MTD_NAND_SHARPSL || COMPILE_TEST
 	help
 	  This provides the read-only FTL logic necessary to read the partition
 	  table from the NAND flash of Sharp SL Series (Zaurus) and the MTD
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
