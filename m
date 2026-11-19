Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E179260A5BEA
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nig3+X4D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1OnM2o3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TUftXskehCQsAuBjJl54YwgwsirFh6n7CoCH80g41jU=; b=nig3+X4DzK583BAmxjyLlxIMJx
	NRJn/rv3m3QAEoIIwNBmFwkJ2cbjzMBpVR6Rzw8HNprg9yS+cOwU0as0S0pffLpqkkXev7c1H8zdx
	h54WYMvrUXGw5l6IRS2Krnq6GOalKYDkap/igWO5zgQcHuVfFF+axncg2d+wpcsuPlA/2bIu7HJ1G
	5wyHodQN5Mwk3grVfm9uYITB5ID8RRRce0pHMGTPJLCqr1riFgqnXQhRQoLA0QAyb9wfc2uk/VpiR
	HleZnaaq/GIHYRVAWdAmzzVSJPSUtitzSerclxYP5n5yj1bsM+XEazcMoaoiknOLhqc/J/Yu2zYqA
	Xv2e35GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Dk-0000000ChCr-1zWI;
	Thu, 19 Nov 2026 16:42:48 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Db-0000000Cgxw-41Ob
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:42 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-717080a2d50so2122366eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106559; x=1795711359; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=e1OnM2o3XvxQbFchg7kzYCQKp0zOR/p3kXdbosskX5iXPsB0iClJWzoslTD0S7ryFz
         o9p+MNpmRsaypTXDOj8YwvY5V9agWe5mdz/F4OhWPKsDorp+aEy/2kblP+Ryy1AlFNzi
         JjMDw4qooAueMm1FpO3IhBzFODKxdjqPMB74MP6Xd/WVfM2Vmi1Bq/HYKDm7ha+FdH8z
         LxwBotvFOyo//65EGniD5j6SP/rEMk4PQ+SEHV7WR5IvQxY2/PUN8+WuQXLMz53pB5pf
         MIZAqUSyLbtJhh5AIdJtQhjGFrJvy4Ohr3y4JZ8R2jaF2jx/ZvThQ9hzP1YKL0McUiLp
         FbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106559; x=1795711359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=jNNVyFiUl5a1YXEg9/ja2ILyT8+3p+nCjkzOqD6WxdITbs8rUsZ6ElYxKpFgS1Lhfx
         wgHhebVCPo+OIaNqcLdTNxW5eH7GheZZbNACxRTBzi71JXpkpQbUo49RteWe4OFbxFUv
         7cgLyLTdXXGQ8EaRpk3QS9goyGRTPOQnDBmxYTB0GuECEJ7fcWbiDaCHSSwNidwejC7A
         Z4z23BTcQhe7cxsIPjADMr+bLFic5eWiXpx9/uOUV8HY8v0NBPnBQal7GlYiMHj1Js62
         xUtlrbDOGFjKdcmc91cOeIJc9u8j/y9BTOJtGEYOsbBhjGzKqFgrPN0aLcOlTMOXwv80
         DL9w==
X-Forwarded-Encrypted: i=1; AL+hErHJq10SKI6Q0gQkMrlzCAFjWjUdY+dTQlz/A0EPsEIVDnrKGgWUIXPv1o9wER/wWDnH6AgeXQOu+1Y=@lists.infradead.org
X-Gm-Message-State: APuU4Z+6xSSh3mo90f0e8rhebhPe6r+S6su1naErk9oqrxgT6C0qxYuw
	6C5T4iMQGIMKky2MVx9VUzqKAuJy9kzvAHzWJDXX6/QJ87sf2vIalUek
X-Gm-Gg: AYBFou377Ld6TrIn/nlJJ8wV1PWfgVA4/CRRy9BaHpeQmYbkQWEss8P3SOp+l4qz0sB
	jifIsj2NAoNYKPQRAfSyEnzZDEUb1YvceCF3/CTC3F+BB+7Mp1xPLOCDyxdluvGAsW6Cjjw029O
	oRwuvTF/a5iLxG2pC9DM54ZeawkQkJsI5e6bgbxgSv4hlloC/BJMtXSgHRap8sIwLvsR5ingTOB
	ntB13Vtkqitdu38HJXAfPfhIcOpmlLlowGGPhJxvawnPfR4K1a+FvBDqhkmaWc2mRdZWhXXv5pd
	TXZMbwgAfhCuBugAEcT2sM/zaGNvFQcgnx6ROP/2t4wLUNYSEi+54YLBV/1bxUo7n39pMVHGUGI
	yNzmoLnB80otHzWRJHovyDrqZ6v3UmDDLSdb/hzpj8jCTzDhZAE2aseIRmEt1p8QVgeUYF9vxrS
	gO/NIWMpGEw05DneZ3+WO6w63azc72sU221wqmZhHlwTFO3lhgT3Ui3Ld/pmH6fZgkiJQOyFAGM
	ndwYBCldfRlh8tU/KNRvuRnnOemL2nggcXnUWEFXVfQPc0pCm0x67uNEygAuominz1YiMf0pYQ9
	UOHwrjD5ZEXRIbg2vi3ZJvxTrwNCB6fnris/FmsMeyvtYggSTKYtagaWu1jgSxJ/UJ4IE3lXglG
	1kUqlSHG0zn3xArRhaFRMNvXCg4DyFcJIbkctJlEs9SRQukif9KKdBAJqGhOgn1B4kGIo5omWn4
	bLlXYy8+TnkaMENmbGqdkcdn5KW7drE/SgB8rgtA4dfCAD7k8RgazVfi05+NgJHIroTFD/dRK1
X-Received: by 2002:a05:6820:5201:b0:71a:e95a:34dd with SMTP id 006d021491bc7-71b39591d9amr80530eaf.78.1795106558782;
        Thu, 19 Nov 2026 08:42:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:08 -0700
Subject: [PATCH v2 10/11] nvmem: u-boot-env: propagate cell registration
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-10-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084241_004557_E1A31510 
X-CRM114-Status: GOOD (  10.69  )
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

The environment parser ignores cell registration failures, so allocation
failures can leave a partially populated layout reported as successfully
registered. The OF node reference obtained for a rejected cell is also
leaked.

Return the registration error and release the node reference that was
not transferred to a cell.

Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/layouts/u-boot-env.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index f1fb206846ff..83c687e43e5a 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -55,6 +55,7 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 {
 	char *data = buf + data_offset;
 	char *var, *value, *eq;
+	int ret;
 
 	for (var = data;
 	     var < data + data_len && *var;
@@ -79,10 +80,12 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		if (layout)
-			nvmem_layout_add_cell(layout, &info);
-		else
-			nvmem_add_one_cell(nvmem, &info);
+		ret = layout ? nvmem_layout_add_cell(layout, &info) :
+			       nvmem_add_one_cell(nvmem, &info);
+		if (ret) {
+			of_node_put(info.np);
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
