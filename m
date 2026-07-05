Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36976C43458
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jul 2026 03:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3/nThQn+O4RboL/TxvJIIEdNa7h5NQfuB6vC0HWp6tY=; b=hjkmQRqZjmsdL3
	kdH7C/YPbP9uU7L/fLIvoN/5LeEPCmWgAaouqpxdJ9zpYDbn81Ye2wo5jXnNhh0X5mgzwOZbOmCPO
	vGwuRLGX71zbtJpqoeWydvs2wdwLw7YTAYTfNA8Ns4Y4+PFy48lbXrcvWPMfGbGW2QjfMpgTXXo/d
	MRnL8vrDbOcvn2aYtKgvjCGkGRGGWaMcthr5RhkHprGeNJkqdoPCIdrJq5a7RFlrWcFCQqFhQDpFC
	5e2mbzubVn0KxaAxNEaWvAoLkub6blV/FKZvrP/31Qva+hjOXFCXwxRmu4aa6IyOjsrr3fc9qdQdm
	s4Ebk4tpqVbVACvGJm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgDbj-00000008wLV-2utR;
	Sun, 05 Jul 2026 03:33:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgDbg-00000008wL2-2ynZ
	for linux-mtd@lists.infradead.org;
	Sun, 05 Jul 2026 03:33:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cace91f112so14198165ad.0
        for <linux-mtd@lists.infradead.org>; Sat, 04 Jul 2026 20:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222403; x=1783827203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjO8H2mcxT/IP33CigLie0DrQz0I1vJlicZMFF6nVQ4=;
        b=EDfu/rC9N8wZhGpG7KHrVo5oe/85ri4EgNnH0cCg74Sj1ssV8TetOjWgGNeCJ9wlNq
         RchzMZoLekEbjJJgr8mAU3XXsAWPoHxkun6Slnk85MWIHdpHfXoFx3e1uasAfhUChKp6
         jtYXO9IRrwOBHLF2BbGzasEDELI4Z56wYF9it1qiy32cEG3HZk/PiquHIH09flYICkqR
         tBJ3Ui+Y+k37O31EMPvcvvSG2eq1P8lbnnlrdcRvO1MjX7O7Q0+hoUYGCHFBpPUS5kw1
         M8ijKktwX1MFfdMPkaZe17cK/Z9dJndtCG36UVbOeQPjKUpiIrAMb8QIvAniWk0bVTEg
         7DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222403; x=1783827203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjO8H2mcxT/IP33CigLie0DrQz0I1vJlicZMFF6nVQ4=;
        b=JyHq3AiHZMq9ROHwikZw4kwBx877KRlapRonQsV71QxMuI8Pr/SmqQtZ6enN/nhsbI
         qvekNi0rCKFAlWjSQmP8eO6hagqa7FrLLHN6w7QqOD/LTLx4woOehKixqgRoRNFnibMC
         8tl6cltF2dggHEhi2R0qvBpzpMFXMr6yIpZ7zNQ/96igK2gZ1vxC8XjDbM2h3/9jtbbZ
         7rh8BFU1EejW0I/FUOLSNF4N/WeKCm3CkaosAi1gFk2aMUnvaBWlC6aL00YJSr+22nOj
         CQ4dLF+LcMtsvfWE8Oy4K4FtRONme5ML38z+CmbiAHc507Y7QEBonRp34E7gWmc28rHe
         kygg==
X-Forwarded-Encrypted: i=1; AHgh+RrMmX9xTkK41Xr8CzHAwkvBB/j/PkAIPGCkfwOTVTw3mnEMV/hEbnEhguVhD0tbRuBhiFm5I/RwC/E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCnHfLTI3m88Tddetiu84rM+knn0fe87wjmbUXpijiN46sVkpB
	WiWf/vnpoYDYEzWql8hmQxH6Ia9cde/GVmlvr3SUSh+VJLwLg4x/v/FP
X-Gm-Gg: AfdE7cl4abggHAn1yJq5cO/k3yaKdEBM5Ikj9HC48hQuTeyjd+rpQxUSDKoz6phmdNm
	hHmHztuaCHJBWwcBnMpqy1xYReDy2cx9vPLuMAKhvE+n//trxWH2Kh5xwy0gX2mHab8nCSrcXky
	bndVlECWyWrlJ8qhfL9KpX0QpH+2v+U1c5XW5swZaUkMSzdtnnL1o3NLRPD1NL7iQlmeNfCYgbr
	PimGvAl9fgsVJ+EVU0P1DqxpNgm8VUN/saXRDmzgyHNnpsvY4DVsHTI3ZbNeY11Jz3G4J+AfdU8
	I09qLkRUDNn+ldUcrB+cNQmdZmI40Q54erTCJQuzU+1bTGtxGGKTMO7ApZ+WsNwA/irSjnWRGcK
	TsDB7CUUzzheWxtBVdC72053k8kwPBPfnIvVfTtIaX0z/5vBBnszdMiX+8nvgKCnotBMj9nE=
X-Received: by 2002:a17:902:e78e:b0:2ca:d818:61e5 with SMTP id d9443c01a7336-2cbb9ea8998mr58813855ad.26.1783222403362;
        Sat, 04 Jul 2026 20:33:23 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260c7sm29822645ad.12.2026.07.04.20.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:33:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] mtd: intel-dg: Fix runtime PM error path in probe
Date: Sun,  5 Jul 2026 11:31:07 +0800
Message-ID: <20260705033107.276450-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_203324_757423_CCA2A8F0 
X-CRM114-Status: GOOD (  11.64  )
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

intel_dg_mtd_probe() allocates region names before enabling runtime PM
and before calling pm_runtime_resume_and_get().

If kasprintf() fails while building a region name, the error path jumps
to err, which calls pm_runtime_put(). At that point there has not been a
successful pm_runtime_resume_and_get() call to balance, so the runtime PM
usage count can underflow.

Jump to err_norpm from the kasprintf() failure path, as the runtime PM
reference has not been acquired yet.

Fixes: 779c59274d03 ("mtd: intel-dg: Fix accessing regions before setting nregions")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index f2fa8f68d190..a566e86eb5e3 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -780,7 +780,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 				       dev_name(&aux_dev->dev), invm->regions[i].name);
 		if (!name) {
 			ret = -ENOMEM;
-			goto err;
+			goto err_norpm;
 		}
 
 		nvm->regions[n].name = name;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
