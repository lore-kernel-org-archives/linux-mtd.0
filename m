Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1716EC00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1EvRyz7So2PG2uGfIG49Czz6LasSBt3HUcys8rNOf/o=; b=hlbWD5jUHkWkhq
	B1WVP8SEJjgG+ie8KQb5hz+L2LWMJe67fiomcb+5BF2nh771R33z7yeFW69/kUkJQNxU29IkpZPxo
	oarhw1eo+rTfmSYJB3FehEWow//+u/0kbl1muTOvJSroAShdyNmriJVEocIMTAIiNuP4Bv5q7CdED
	qWDHWKYe/cP0YlbDAqrLIv4mrhaPacmFcPJhfMaQ9T5PxWlYPF8nxcq7LidI4YVe39wVdf4kiRoI2
	QWda8fqnGr7LDXBE1dNS1EzHvUhLgjqMdYO4D+uOm+MugrGIlUqr7u1IF7hP6n8+4Bfl+4b+9qLqK
	3axoCDct1aOAhuyI7iQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvC4h-0096ct-2z;
	Tue, 24 Oct 2023 07:43:39 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvC4f-0096cF-0B
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 07:43:38 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-564b6276941so3279981a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 00:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698133415; x=1698738215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp4zribyxkaMmeYlAPKMl/TvSUWz72GegqaBX3+CYe8=;
        b=gLzgNXHnnp5GCdjZQzh188Py+0JyYw+xEW7CEwufIt0HSBazSTN2OBsg+iwSjRgTJ/
         WMlIabzTJ3aSivCrKv/yvr2pLH1Tv4t389H/y7HBn89gGidaNhLQJIGsO2jMBOUnMP22
         AQ1hY9YmzHD+Kzi58k+FBR8uXg9gc/0XCuJ4ONIubCz9y8j7dmLeDZGq+k0qBr7xchrm
         kcpPwuLXWHuaInMVgGRaQVrU3a2KBl1NDpeyaqAqVJzKj978zy+4sGWKqP+zzxzeHeSY
         KVBZGnv6Vx9oyzCUSsgQv0mIABgsS9J4NfEbdVPdcTxZl7GvbPYZNg2Z//2eiIFmDEu9
         gxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698133415; x=1698738215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dp4zribyxkaMmeYlAPKMl/TvSUWz72GegqaBX3+CYe8=;
        b=YtuDTSezQ5ZC9h5xHfm5aEeenjkPLULNcETmwUxMA5Un3iVV9o+6GQNwTR398teEcf
         P9LwzUUyOZ+wbFdMGzJFhCTZdFmUVCznwuA1C0ZDPsJbBcAqWseJddrO+hjdzcf3tRav
         7gNZVh/P5w6JckXXuF8LtP0h2SfMny95amTwojK3droH8WUpmVYmGimlWeGkB8fz3u6i
         +Q2aD+rnxFd7dAir3vqgnANn0wIT+GT/Cady5UkQhKPgRBwMV9eEbquSjhNVPUlJF4hh
         e2lskg03sYsd3ewjf/CCg1N8uxgVbwR3Yv59HYcuSMo1w/j7LYkcGChcNQyHdZvVuvQZ
         nAWA==
X-Gm-Message-State: AOJu0YyW85hafLFRJ0SzZr9GVXXMNM4JhI5Kp4+ahyE5wCOMYEEDqdgo
	dgJje+ch+hUHFRHF0A4v6vk=
X-Google-Smtp-Source: AGHT+IETmKMrh83Ma+B4CDqx2Id4sNL93hgxEC8dc2nBxKXN1JyKY8pu9/MBw5gAqcQqL+K9MBY2tw==
X-Received: by 2002:a17:902:c411:b0:1cb:e412:c3fd with SMTP id k17-20020a170902c41100b001cbe412c3fdmr1692265plk.63.1698133415155;
        Tue, 24 Oct 2023 00:43:35 -0700 (PDT)
Received: from localhost (220-135-95-34.hinet-ip.hinet.net. [220.135.95.34])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902f7c700b001b8a3e2c241sm7032169plw.14.2023.10.24.00.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 00:43:34 -0700 (PDT)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Improve reporting for software reset failures
Date: Tue, 24 Oct 2023 15:43:32 +0800
Message-Id: <20231024074332.462741-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_004337_113586_96D89A03 
X-CRM114-Status: GOOD (  11.14  )
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

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

When the software reset command isn't supported, we now report it as an
informational message(dev_info) instead of a warning(dev_warn). 
This adjustment helps avoid unnecessary alarm and confusion regarding
software reset capabilities.

v2. only lower the priority for the not supported failure

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/mtd/spi-nor/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..76920dbc568b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3252,7 +3252,10 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		if (ret == -ENOTSUPP)
+			dev_info(nor->dev, "Software reset enable command doesn't support: %d\n", ret);
+		else
+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
@@ -3262,7 +3265,10 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		if (ret == -ENOTSUPP)
+			dev_info(nor->dev, "Software reset command doesn't support: %d\n", ret);
+		else
+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
