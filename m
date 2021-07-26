Return-Path: <SRS0=DmD4=MS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02D1C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jul 2021 14:50:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6290760200
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jul 2021 14:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6290760200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TOdYaIiEofWMEC12TayopNPxRXWl/QXPmY8i1XRhUdM=; b=CRx5xozAHuQbtk
	31b/cDyVU3KuY2Ya6U1VQc/EJgvOg7DGijGNBjS4BM9eEXuR2IyvsqPclnll0xaYaP4oH7ahnt93D
	clLq7YVuQUOpCJhgIYqdudoJNmKq65aCP5ueypU03H/XW7ODUi1CFzoJSHrLdLQGSK2EpTe64Nvom
	fEaRkH5+W4gRGzZ23jJa1G5TjCTVWYBTPp28RxCIePmRACbvrO5AGocEg98oalm/ME1lpFVIGRLCt
	AfqiujyAiqm317jmfIYEl2wiP+unu3e9nWGXAF9v4oSLVfshWS3qDh9BIY0H8rMiBK+nY/ZYw+L0c
	K8G53jv73m1hiyGgFhgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m81vh-00BYRY-Ds; Mon, 26 Jul 2021 14:50:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m81ve-00BYPm-7K
 for linux-mtd@lists.infradead.org; Mon, 26 Jul 2021 14:50:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id l4so11421645wrs.4
 for <linux-mtd@lists.infradead.org>; Mon, 26 Jul 2021 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xLmMVn1uoLATlywyndSzCwv/MROV9xIhKUlgFoTwd7k=;
 b=JlM/3iQLY7TfHfUPiWz2d2R/A8LnY1phSqqsMTbyRdF+6wMhlD9S+CmVkFcPZWx0P3
 kVVuvFfBIamUbsXqv+ba3OMyb0GkECfrL+lFWYtOVty5GmYKF5DN18gcSqMbLwqzB3Lp
 K2vbQZnEUQyNlG5VmeWMT17DJ9z5yWrJFiwuvf084qye+5QHTrf7paHWK7u1AMOzf3vz
 MnMzQK0yXeZcwyxQ6lKekh/EbSGmUHiPQSIl6nN950wvprkhGwbDPX7APkZ+JivWq2OV
 ej9Lgv4RW2wAUedkNqRUhStDLHgviXoyqlV3olLq2o+8L4FiRfIwyEaZir7J8zA8/wlM
 wSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xLmMVn1uoLATlywyndSzCwv/MROV9xIhKUlgFoTwd7k=;
 b=Zkr4Dp8OCYQO9WJwHfpeZ/DtGZFt10RRbb4z3iHTd6lGfdjJ1FntJYIXvuOLLInytR
 ZljX54HT8LyuGKvZcngNehK+Ddd3uUg5xY+GSywp1vSWs67fDF43r36J/fLx3H+hMBiK
 pgPPh07v75tuu+EzaARO7pqpE15p3FdVk5OySMBlAwJTUXRIJFYpdprQk4u61UATquIz
 rbS6Kmv7cCk5qUivcmwjHMZO85SHB9304RVazeAg8wFbE6dItJIHP1y5mXFFHwkqr0YY
 WKeSXzC9Y1trRtOMeRTHDUTUupX6c7yp4tytocmnGtOfBMmtdGoQWm80Of5DaqnjMdR8
 A8wA==
X-Gm-Message-State: AOAM5337IgUH9raE7/haYVRGEfr1ZZRKL6EdStVFOnbKDi1Nlfv7djtS
 u83sauGQTc+EPUNijQUgZ10=
X-Google-Smtp-Source: ABdhPJxlbCS5XzYEqJbNfoMho+XsFVH5CnPgy+fdBeBMGxuBsqfFlF3fLjhd7F0oc4QoPCEF7oc6ow==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr380018wrm.191.1627310998260; 
 Mon, 26 Jul 2021 07:49:58 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d1a:1100:c32:37a3:94e9:cfea])
 by smtp.gmail.com with ESMTPSA id q19sm13480481wmq.38.2021.07.26.07.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:49:57 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 linux-mtd@lists.infradead.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: repair Miquel Raynal's email address
Date: Mon, 26 Jul 2021 16:49:49 +0200
Message-Id: <20210726144949.10439-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_075002_781445_5930D1E5 
X-CRM114-Status: GOOD (  10.98  )
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

Commit d70c6b026069 ("MAINTAINERS: Add PL353 NAND controller entry") and
commit 813d52799ad2 ("MAINTAINERS: Add PL353 SMC entry") adds Miquel
Raynal as maintainer with an obvious invalid email address, which can be
easily fixed.

Repair this copy-and-paste error in Miquel Raynal's email address.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Miquel, please pick or ack this patch.
Krzysztof, please pick this patch if Miquel does not.

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d69b2d4646be..f31922d0503a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1476,7 +1476,7 @@ F:	drivers/amba/
 F:	include/linux/amba/bus.h
 
 ARM PRIMECELL PL35X NAND CONTROLLER DRIVER
-M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
@@ -1484,7 +1484,7 @@ F:	Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
 F:	drivers/mtd/nand/raw/pl35x-nand-controller.c
 
 ARM PRIMECELL PL35X SMC DRIVER
-M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
