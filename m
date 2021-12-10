Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD69C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 02:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTAZpZVt9GQJvrPb6QUmRRBcSeR2Efvt0COPmNGy1oU=; b=Iwr2XVmcK6twT3
	Fp3s7T4iF8baBpTngHcCxIwwXO4KjYEgZcoPYdpr5AuRXfvgOVsZCchHrlUI8Gm1An0StjbZ42Hif
	eGIqCPFbxOKGCQv0VJEV7RlOcpVKNUE2oUBw+muDY0e33O7h5KgGVzyh4tsY55nZeMGQZCsU3RaCg
	RcM/PaRh3HvcDZWtfGwQYS/l8izf3QIP/ZPTMiBauT+4l7Ixtu/awEb/MRnx54BG4U4PIKV01pqZC
	BrBUwEIEYECIp5edT/jizcuYa9vkirzVrDNUb58ygXl2tOPmNzHc6kee+fcGYmIlxVgcPXHiSEFqY
	KvMqjhmPI6FyuNMJwU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvVUV-000fMr-5P; Fri, 10 Dec 2021 02:18:31 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvVUS-000fMP-7q
 for linux-mtd@lists.infradead.org; Fri, 10 Dec 2021 02:18:29 +0000
Received: by mail-pf1-x431.google.com with SMTP id x5so7244127pfr.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Dec 2021 18:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=poNSG/gxo2Fhzr7JKqoglN/TlnftEObbhIqVh18TXuQ=;
 b=pZQFulNnonlKgH7+dXRF/vCwQt8w5zzPKB5f/V0va9u8wKzma0xk9ISqBBpimCFyj7
 iTwKPa3eG70jVKX619oLdukAlEEnTyXNwzJJbXsemigerDOIPVVAdRdsFUKfoIpky3bU
 BjeAK+8Ak+kehQ7t5AldpQr7gyG/Pcs/J7S6oycLlKuZyslDNoXXVyCXGzpNUZZsG7Li
 hd994rtNWZJt/gHxV4K1e99354VPHmANsf2LPa2ebiYN+/9ttAU/YaZpdOwjcWQNaagV
 44IQHMzzhLRWM0yCFmE8dShUGgqjJDsEVMpDJFfJ9WFdek9zBwFNVPXIWtBjwm3k/Eu/
 eyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=poNSG/gxo2Fhzr7JKqoglN/TlnftEObbhIqVh18TXuQ=;
 b=DF9f7tnGo+wqTAyDGfW/5q2DDe9C8ubgqtNAuWvTCNB98dAz/PpbjozJBAijLVf8eX
 jlbXIzaZMeWCoMCPof69nBEJXQpdE/qfiQ/qF77owXyQAJLBPH2jma8+qrCU3C2G/iU5
 1UCf86pMlEqYqb3NcNzOu9pMDjDuYfGuwaB4luJ2rX0ZC0tXz+ofFJYwyP4e3UUodoIE
 pSydR07Jpf1mpPIS5yw4tiNnuoY+T1+kYeudJx4UTaTBFLvcdIpfURJXdBZ3IXGq/gkx
 FoomsJL2W3G8lWres2I7dev6rOl3NUZXb48nuSdhNs5ksWDfN5d9ZxZ7GqooVpxzfPlE
 OuOQ==
X-Gm-Message-State: AOAM5334GOpj4v3RCPq9OpGii2Ap7NZmhCADXc41WMTwm/57IplvBaxp
 rG4nzZrm1Tw9Q8/gEMiujHQ=
X-Google-Smtp-Source: ABdhPJyX+9SXt8lpomYrFFuvvvVEaEAAb0Fq4qTprNsXW5/3HNjOCWtqJKcWyDKG3mTMnEvOgFFuHA==
X-Received: by 2002:a05:6a00:1516:b0:4a0:2c42:7f17 with SMTP id
 q22-20020a056a00151600b004a02c427f17mr15524711pfu.74.1639102706632; 
 Thu, 09 Dec 2021 18:18:26 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id n16sm970534pfv.123.2021.12.09.18.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 18:18:26 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: han.xu@nxp.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cm>
Subject: [PATCH nand-next] mtd/nand:remove unneeded variable
Date: Fri, 10 Dec 2021 02:18:22 +0000
Message-Id: <20211210021822.423833-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_181828_306576_0C1EC43C 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return status directly from function called.

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 10cc71829dcb..ab9d1099bafa 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1425,7 +1425,6 @@ static int gpmi_ecc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int ret;
 
 	dev_dbg(this->dev, "ecc write page.\n");
 
@@ -1445,9 +1444,7 @@ static int gpmi_ecc_write_page(struct nand_chip *chip, const uint8_t *buf,
 				    this->auxiliary_virt);
 	}
 
-	ret = nand_prog_page_op(chip, page, 0, buf, nfc_geo->page_size);
-
-	return ret;
+	return nand_prog_page_op(chip, page, 0, buf, nfc_geo->page_size);
 }
 
 /*
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
