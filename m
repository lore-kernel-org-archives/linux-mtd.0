Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F72AD20686
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 00:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hDnbp1M8EE4cX2zdiCaFyye9xkJ0cvmYLt6zJ+Mil4w=; b=19Lc3azG1QL6RZ
	NsMy1aD45Ev4/yC2/IQtPcQwPD+AdrMlTM7PP8SZZ28/HMxqsLf2roA5U6YcolYK/NOSyJNwNC3gX
	nPlwkwfq3CVvBdKwNz2gsJ+FUSG7N7oBAAbYQHwWN8sZThsPMgbQEKBqsfCCss6RK29eEuv0Fm96J
	e2Zv1SxHQngzQhHUrN0y+RKuTbCKXvSEQMw8AKOeknmJ5whwhDq/oDbBF8XEm9O1tbZFEDQOhMKEx
	ppM1nSQF6qL8IcD0gYihCo8uNWBofsU3OIwq2VGpeMcBPHNVI6alu3FTskGpGwbLzBOTRipvzKaKd
	ZPsmYiwNGLs2PUpE1UPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ras-00000009yty-10Vl;
	Wed, 16 Oct 2024 00:08:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rap-00000009ytf-2pxz
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 00:08:48 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e57d89ffaso2318659b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2024 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729037326; x=1729642126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tu4ub/w8prHmaP13/H0ZeTUSxTGNwYZq5Z6N+6Of7uI=;
        b=QCqtCLVDtTNAjauxPr/FveJyOJ8RBGb5vLPb2Fhg66HCfamLn6tE4npweruPvs3/eB
         Of5IhS8cCGqnC76WNRva+HMQm5BjxpU79pClCKaTII8fquVJp+k8hrAA/YwHQ6cXc/qg
         pKjsJWSaVqogXubYLBAZqmv7r+7P8NkJcTKZAqtEnnGcdPA/Ln9ywxUq8VQPoFdR4XSh
         TvNXJKZukqlyusuo6GbGjbPBBUFu8cptiU7SrFl5sTHV1oO3ydcSLSIMqmSwP9rVIA71
         mOg3dVOvUzrBbkt7t6S/TOkXdzELpdZLjhPWTxIakv1nBvjm9PHSeJW+XygVRqF+HF2/
         0xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729037326; x=1729642126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tu4ub/w8prHmaP13/H0ZeTUSxTGNwYZq5Z6N+6Of7uI=;
        b=XnlhCvIsyIMomjkRaTLcJ/aDkx9NC8QpXgtmkyKyO/9/wOKedrl5xQJWZ3J3WBHQlI
         nkE/khSnbW/8i5A32cqfSN2ac1hAhu6YOz2SrqNLpwuKAVnbnN1jKZT9PKiz4qO89ERB
         h0rctOqaT9VFtqdp2x9MvlhLVV9Uuxn5HPGCOhsuAC3wDb+s1HFZbaTPiCR00pqTsuXc
         IPAExkImi9DWz7rlCXzVZiw2niGc5mZcr9H+hM++PQ75BTxlpEceIFDlU7TrnydxSSGY
         mCduFwMgw1vSN0tMu7uK2fdzJoLIrBuHe8woTGl0s1M/6QsEpEy/564d77XznOOb2Kwc
         T7Og==
X-Gm-Message-State: AOJu0YwxTOzQLbeSSjK23g8qRTTM+0OZMcrxHas4V1rgc1lLr1B4+Ffa
	2iNmCvTdRYuG4fQlFUakTS8qtTTIF5vv09hbw1JqGo9ozTDJ2zZMlBEZqg==
X-Google-Smtp-Source: AGHT+IGbWhwZFlldRJ6dTcNz6lTswadhyTEzIBUy32RHNTq7ptmH7UOlbFULDxURfChRV+12Oj5KAQ==
X-Received: by 2002:a05:6a00:8a8a:b0:71e:80e3:d514 with SMTP id d2e1a72fcca58-71e80e3d816mr731960b3a.27.1729037325869;
        Tue, 15 Oct 2024 17:08:45 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e7750a524sm1910839b3a.200.2024.10.15.17.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 17:08:45 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: spansion: Use nor->addr_nbytes in octal DTR mode in RD_ANY_REG_OP
Date: Wed, 16 Oct 2024 09:08:37 +0900
Message-Id: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_170847_742046_FF66C29E 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In octal DTR mode, RD_ANY_REG_OP needs to use 4-byte address regardless
of flash's internal address mode. Use nor->addr_nbytes which is set to 4
during setup.

Fixes: eff9604390d6 ("mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index d6c92595f6bc..5a88a6096ca8 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -106,6 +106,7 @@ static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
 	int ret;
 
 	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+		op.addr.nbytes = nor->addr_nbytes;
 		op.dummy.nbytes = params->rdsr_dummy;
 		op.data.nbytes = 2;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
