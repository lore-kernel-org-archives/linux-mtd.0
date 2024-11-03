Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FEAD10C0E
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n2PMMMGT023aff06eJ/BktmTeitlLMwIwAIvS7clmhA=; b=LZ8wZxYhttqa3V
	jcEuTmCqtgoHZExq1ikKIzY7hFwgEBh2ltiVwuf6EiyTeIBQ4zS64TeL4LrCWqPWl7CSgoanL4SvC
	9JlVfoKlU+SK/Moxym6aHkc3mJI0DhW03hH784wQSjfAKQabIic1/8jEEvVjFoPCR1k0y1U3q+EkM
	7yPbC9O1O2+xC7ljawz7rC+FTh3QTlWrhaoCF/lZkOcP3/icPbhEC8xPQGwihCo3WtgtDyfO/TNGh
	5MwfjI2BiV3vGdLkO13CHjdiPyzkbtsvjL3g7MVuamoyJ3VTBGMfClnVOl9Tb+dIAzw660l9wt3bQ
	hl7NvoVZx3VP9A89a74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7bUm-0000000BXIQ-1yv9;
	Sun, 03 Nov 2024 14:22:24 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7bUe-0000000BXHu-2gcR
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 14:22:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20cd76c513cso25808355ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 03 Nov 2024 06:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730643735; x=1731248535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9U7b7nW8Ll63MkV0o/e6AOsrC3EgGRqpsICJyXJSdk=;
        b=MiAtWBoVhDnCttHQ3Yg/MPpb+HIvxylrro5YUyoHO2qVg/VyN369GmZNssUuqpCm/f
         oPaolPIIHobGXi8d/Fy9tXNGFg1LM25pz32ZxSff4JdQLXBjLo3JJobvHq7UDWy3CiEY
         jNNA1Qd+Vy100hsgNhej1BQ9TxAE3V3jQkmTp0AbJmzkCW5hPgLuNTa7sA2xOe5WLwWi
         ZM6VI6KZeIWIRVeJljgblSBygB/jW4SKtii6BCjj2mafLb2VDXSI7n6k6Ap3MXfMrvKd
         Q+hr8JsMRcTrx/DxnTwVlwe/eMmRps07wvDekEXKpHVORJqeQaiGfh+42ZZp9U2qQ9fb
         qN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730643735; x=1731248535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9U7b7nW8Ll63MkV0o/e6AOsrC3EgGRqpsICJyXJSdk=;
        b=w1JA8j6BZnZHCFS541yPuP6REHmeIBe6kBSHtj5/pR3zWnqXrFy9XBGTqt+Zb0tI3H
         qWgjdj9Z/hwfQf6A/4cahxKJksiYxQV5bnpdpBGJgBAuO6qXzytY6zCB75tKmPHidNJ+
         IEKqOCwcjWUp2zFSBFLXPuz2OHjQp75CT9Rd/t6hLc+3M1I02ZJ/K3HSg9u8WeTTh4l5
         q7fneTPPuvI0Q0E2ggt+wrJNbqxkulViWZyw9SVMUjU1xZ4COiVctiJXQ3oASgNBH3uD
         +DKKxcJqDO+V+Be/mbSN752tPtPB35E15ecfOg45fxcQIGyXXZqjTpZxxl9uj1G7A+E7
         qVng==
X-Forwarded-Encrypted: i=1; AJvYcCWAEZLW2cvscvYEyYW1GQ0FEQRPri0HrxX008kBiJK58jlrClu//blDQyn7ysQkaNsqHZw7frztScg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRDdRXlkF1vTqT56F6rDWN5hPkHRerIqDTnbiCMRjLiswmk4y/
	4QVIcZXyl5Ji1Ddd+4BrcH6gico/kKxIeOBS8sq3HP4ANiXLAwYq
X-Google-Smtp-Source: AGHT+IHRls55sAYe2GadwHaPZlJt79tpTzkiYauCPfPPnDHp1yZo7s/hLrcNk44tqJwlu6Uc9E42zQ==
X-Received: by 2002:a17:903:24f:b0:206:8acc:8871 with SMTP id d9443c01a7336-210f763de46mr235460365ad.31.1730643735101;
        Sun, 03 Nov 2024 06:22:15 -0800 (PST)
Received: from sun-virtual-machine.localdomain ([222.94.41.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057069dcsm46482325ad.74.2024.11.03.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:22:14 -0800 (PST)
From: Ssunk <ssunkkan@gmail.com>
To: tudor.ambarus@linaro.org
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hhlee@google.com,
	roccochen@google.com,
	Ssunk <ssunkkan@gmail.com>
Subject: [PATCH v3] mtd: spi-nor: xmc: Add support for XM25LU64C The device is produced by Wuhan Xinxin Semiconductor Manufacturing Corp. (XMC) and found on some routers from Chinese manufactures.
Date: Sun,  3 Nov 2024 22:21:26 +0800
Message-Id: <20241103142126.3406-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_062216_701601_E9259853 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

The data sheet can be found here:
https://www.xmcwh.com/uploads/954/XM25LU64C%20_%20Ver1.4.pdf

Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
---
V1 -> V2: Removed redundant Signed-off-by information
V2 -> V3: cc more maintainer

 drivers/mtd/spi-nor/xmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..83e83c1c1266 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -19,6 +19,11 @@ static const struct flash_info xmc_nor_parts[] = {
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x16, 0x41, 0x17),
+		.name = "XM25LU64C",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
