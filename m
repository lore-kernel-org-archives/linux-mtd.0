Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650F3CC6B03
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2NUdMHhB3U/ySOECB92A04DO9mbYl3d6j+y/fwFiPlY=; b=mVfZ3Z0rb3sNQe
	+Uo7vd1bm5dGHpNb/K9Gb0RPy//0ra2nyfquBk2wpTAOvybGfDJPH4tHQwpcKBsAdwqLUuDppbaF8
	ykIdFVtLpnk11NKkVOSK8X+ru0tSLj2ENYX0jqFB5DJ5M4Vpe6PoQp8gXUIpJDc5Nm1adesS1beTh
	HCBp0HNpV5ku89Tuc8ygZNC5FK2ItflWNMdxSghogl9CpSSqSpRb8PW1Pr2K9vVfAL+KL5Jpc/A7T
	hv4gnA+T/mu+87KyV0QwJe5V892utZ18ppKV501faamgNxVyyJ6qxAEXSg8qLwruuGoVv/LyfGr+1
	bf7HsNVbHW/n4b0R/z1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZoA-0000000Cabm-3yF1;
	Tue, 13 Oct 2026 10:32:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZo1-0000000CaWU-2Q1W
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 10:32:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso23808775e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887544; x=1792492344; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ln3w1ZtEGqIVHWsrNbZbcY9fGH5uqhlzYmvQ7c8J00A=;
        b=P8Xsp08NLPcxeGXdi2IqQE1seqT+RFgCgGAziphBoxbSLXcFXa38zSpInROoUr8tK/
         vKOxoN1ghMRiYdET1maY5pmoOA7kYbuoTIt48EWp7IsRobRhfQwTA+AbNYQE2t/8gWyR
         rGxj2Dxig+oQOpytsQEKIh/UJWdQpufAVdkel1HPVpGuRHK9OwhDA1xOAOkjjRW80ocX
         O892NxCP31rci5mC46pAxdy+/OULIthRyPn94xDwEdk9jtxWhDSHWZ7VEL7mdhebKcsi
         w0S2wuVqtHILe9GiTsqtGrv3qndaKpRlh5myaFhghjKOoFLAqn9J4Vql4E/MZJm0TWQa
         qM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887544; x=1792492344;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ln3w1ZtEGqIVHWsrNbZbcY9fGH5uqhlzYmvQ7c8J00A=;
        b=PWdPoubGw/XQ6ms/GNb26gSyNOOiq/UcYmtLPKkhSc4aZnGkr9LIejSL8phGKmcSA6
         5BZcIerr0N8qzqcHTWfXBQ58Oh0+MDBcgFAvh4IJhxlEzptYEaKWW5I2h5iSLZZ6jj2H
         /+I096I6JadB0+pgbz3yGitmekZIfL5MV/uqVTKw30I9uTN+iHQdyBoP6tjrHiYec/3q
         u96tBUt1zQY66Bzc2MxOvoDRDJIxsuYpj+hfLRc216X8Z/UdVOKGRJd7o0/7OtJKgPRP
         z1J146KguIB84pSAbT8G59msezV9ENFvgSnwfjo2wPLKAxLSnrXtg1yj8v7DpbRjes7q
         SdMA==
X-Forwarded-Encrypted: i=1; AKwUvBwkXi8peZkBy+ziLwbDMobjoEx+nsGs97shFEjhGRdF4HWna5BmD7EfzrYIH3jBujrIyoppwuUmqkg=@lists.infradead.org
X-Gm-Message-State: AFq9FYIc0bp7FdyIrSymHg3NICqVQSE4kyECSW/t56F76Ceo/g06GuTZ
	0RRSq6688kwmhVnoKJhFSQquJv3AuSqKYdZRa77gqq8mL8unG2Z+aEYA
X-Gm-Gg: AYBFou1VX5KsdIM1rk4OUuuy0ZDL9PL8Q8/cQ0l1mxsCDedfhGS228S3Iq2sAIJgTDR
	7Kks6k7cd92dtAGaVdwxcsXhiG6g/PnQkYGdW0qtXOKWthFp7Ut/4MNFzN2TC06aH9cS7By+wdq
	g50kEiF15fAQGM2XycsSd+l+6LGFvG60myPh50NmuGYqXOtQkWJIY+RbltQQmLgId4i1vFIZNku
	VSGpwfWJ1Cjh+152Tz18vq6y7Y8uiJOkHsTdRFdyLgqddsjuDVwVyhP+GoFjhkPhAOJikpHzJ4D
	vacn7V5F69EEq3Id8G6/LSuSags2HP07ejjA8qFnS3YAHnBqYLRrAOYHoE99rKKWQBkiZ41SOnD
	c36uZu/kW1KY3zHupVHeH+tznSVSH5/dlMOTyC+TA4mR8UbEfUOCc6wT3Esor5nmyFcar6MKOGr
	agIUD44XvmxP47p4xY3Kii2PT/4l96CMKe5UzOO+XcdvRMUFXmpb0H1E0EfQWIHQINxtxY1h4H4
	IUGkMbby36e5JfTIlgDHPfrRJU=
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a18e4988ecmr231302395e9.7.1791887543444;
        Tue, 13 Oct 2026 03:32:23 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm392806055e9.0.2026.10.13.03.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:32:22 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 13 Oct 2026 12:32:12 +0200
Subject: [PATCH v2] mtd: parsers: qcom: drop setting of partition's
 mask_flags
MIME-Version: 1.0
Message-Id: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr2K6dkxbAcGV9zDEDGUoEynFlhAN4
 e5WTuDy/eS/t4pIgSmK62EVgRaO7McE+ngQpsfREnCbWGipCyVlAS/jHURHbsIwA9vRBwKH8fn
 oBrQRyos0JkddZa0UyTIF6vi9F+514p7j7MNnDy7qt/7vXhQowKxsq3OVN1o1N+uQh1O6iXrbt
 i/3Cf1MzgAAAA==
X-Change-ID: 20261006-qcom-smempart-ignore-mask_flags-870cc5a294d0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_033225_640867_D076EA63 
X-CRM114-Status: GOOD (  13.97  )
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

The 'attr' member of struct 'smem_flash_pentry' is 8 bits wide,
so it is only usable to mask the lower 8 bits in the MTD flags.
However the MTD layer does not define any maskable flags in
these bits at all. Additionally, the meaning of the bits in the
'attr' field is not documented, so it is not even possible to map
those to the defined MTD flags.

Due to the reasons above, remove the 'mask_flags' assignment code
since it has no effect anyway.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - rebase on tip of mtd/next
  - Link to v1: https://lore.kernel.org/r/20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com
---
 drivers/mtd/parsers/qcomsmempart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 1591aea48b28..355efb2e4e40 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -144,7 +144,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 
 		parts[j].name = name;
 		parts[j].offset = (u64)le32_to_cpu(pentry->offset) * mtd->erasesize;
-		parts[j].mask_flags = pentry->attr;
 		parts[j].size = (u64)le32_to_cpu(pentry->length) * mtd->erasesize;
 		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
 			 i, pentry->name, le32_to_cpu(pentry->offset),

---
base-commit: 2f7fa8d90694d21dce68ceabd8383252b111cfea
change-id: 20261006-qcom-smempart-ignore-mask_flags-870cc5a294d0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
