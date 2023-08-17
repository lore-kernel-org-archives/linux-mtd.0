Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA43C3DA58
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jG2gLj6qID0Acci1fx7QEe0ty+9nig8FF4Ye7vD9ykE=; b=F1Z
	gb+CCVbIsNzGRN9lcwV45m58xFgmWD3xyNd+eQXIGkVOH5ScWQyS6BGiDSGdxggTm5bqeKKhmH3br
	PVMDJgya5z0MmJjFZNoJA4YXfKk0hSMvBcgh2wjIy99iFmZ/Mxjukt3TuHXdK7KxQIz0EEqYNwMZm
	eYWyIYc+JiMg9FbOWnqLBjruICktkg/O24qSXvlQ/EvDvptWZhGx0VL9CkDerfiZImhneOgWSe3sp
	TJL/Lmrb3BFZB64GRCD9wi80wWdz+M5uvZbZdCOjijZbCKOcimiVAftAA2OXiTQSUYr9dnIIowQzA
	yGgHlQgO+ZzZgiyUC67RHuD5YpGjc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWhAa-006vI0-1j;
	Thu, 17 Aug 2023 17:52:28 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWhAW-006vFc-2g
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 17:52:26 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-1bf00c27c39so9171319fac.2
        for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2023 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692294743; x=1692899543;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2UG2OG5KrxWJ0s3qtnx/i+Fr3CRP1zZ4JSm6GFIF8c=;
        b=camaHaV/Gbd+c1ik48sZSGrt5XHK8lSjJ9F8mxQ8gLFTx8n435uppOnVSxPbS/8nUS
         4uVnoANdukrwQN7xcDWOUWsUPjc725/cuRivpAvQBhIgg6CzB/aSMHIlyh0G0EgNj1Qp
         xlseRYQh4Fym8TvlpTtsxzYaJutZpSvYLdRVHFCnjq0P7HspwTp8XdfkwSXhM0QaFv5j
         84snFfINaQiAptUy7r4lVlsr3D2JGzcYWqpD9iw+iBq5pTW5Ju/bRMC6yDqTTcvUscc7
         Q2SGV9kcFEyWXJmEeBKXjHlCwSjI4T58yrXhGZS5J05eSAXz4ogD5Au17r54xzjfHatF
         BXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692294743; x=1692899543;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n2UG2OG5KrxWJ0s3qtnx/i+Fr3CRP1zZ4JSm6GFIF8c=;
        b=lEACQUDtSp6xaaxJ83dpc49Og6D+Paz/xUTyEsAYf47pH9oJbTAvoJTRjbx+dLLdO1
         DTY1XMe5C3oOBu84umU3iYW1w3cJW+0hi2RzwSN7nsxSOmwIfL14trWA/SvMbH36MpZM
         Pb63vPf//YBB6rzekXmwLYED2mtov3ATCPwrxAqsxqxd7JeoWQYQVtg0tXe7KHukN6Iv
         2a7s89ad9/paTjXwh34nawkU09L+0M538Eetp1ybS1qze1IdzllzMFKjry7+ofql2fIF
         4gu2vCIm3eXqmlzJqGheZBggg8YZiZqbHgMWkm80eXgOpLjCWsUVqEDhPYzBmz9dLayu
         pVYA==
X-Gm-Message-State: AOJu0YxdNndow36RWRuaFirIysfod5gk2KedL6KCHEPc5Xz3Sf0C0hg0
	W4tzvzwQ7kWAFrcMM8xwCzB90z+X7En+kCZegg==
X-Google-Smtp-Source: AGHT+IH06wac0SBG25lJJhXNOWcsSI2IvrGrskfXKVnJv8hj8F+qNwDIvYHlFs8yFjiUbo4MsE/swog16j/Elyccow==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:a8a5:b0:1bf:d3b8:5cae with
 SMTP id eb37-20020a056870a8a500b001bfd3b85caemr2392oab.10.1692294742832; Thu,
 17 Aug 2023 10:52:22 -0700 (PDT)
Date: Thu, 17 Aug 2023 17:52:21 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFRe3mQC/5WNQQ7CIBAAv9Jwdk2hBRtP/sM0BhdoN7FgoEFNw
 9/F/sDjzGFmY8lGsomdm41FmylR8BXEoWE4az9ZIFOZiVZ07cAl5EAGTKRsY4JlNeC1NxD1C7J
 TvL15h6Cwk4PrRX8fNKulZ7SO3vvlOlaeKa0hfvZp5j/7Xz9z4HBCVLLjPUqFlymE6WGPGBY2l lK+MSeyT9cAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692294742; l=1720;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=MouGUYg3kqvRKE/s9FPfueuRCAtPM0lCpE5G1aOdCPA=; b=0qynUlCcs0UVl9/8Ugxh9CjQAoBaOahFyRH41Qo/Dkbl4zK00nH7C2j1ViGwNZ0iDLJGBWUBo
 sgWqOz6c9VeCZ3x2xIFjaBqNJmlKt5jXgy0SlqoZ0OqWSxdtsgE9+uq
X-Mailer: b4 0.12.3
Message-ID: <20230817-void-drivers-mtd-nand-raw-vf610_nfc-v2-1-870a7c948c44@google.com>
Subject: [PATCH v2] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Stefan Agner <stefan@agner.ch>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_105224_906707_142B1E89 
X-CRM114-Status: GOOD (  11.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When building with clang 18 I see the following warning:
|       drivers/mtd/nand/raw/vf610_nfc.c:853:17: warning: cast to smaller integer
|               type 'enum vf610_nfc_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         853 |         nfc->variant = (enum vf610_nfc_variant)of_id->data;

This is due to the fact that `of_id->data` is a void* while `enum vf610_nfc_variant`
has the size of an int.

Cast `of_id->data` to a uintptr_t to silence the above warning for clang
builds using W=1.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- use better commit message (thanks Krzysztof and Miquel)
- Link to v1: https://lore.kernel.org/r/20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 86522048e271..11d996dc655d 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -850,7 +850,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)of_id->data;
+	nfc->variant = (uintptr_t)of_id->data;
 
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230815-void-drivers-mtd-nand-raw-vf610_nfc-6c358f424b8a

Best regards,
--
Justin Stitt <justinstitt@google.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
