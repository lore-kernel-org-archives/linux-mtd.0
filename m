Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B3C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYT1Au5Cs7e9NDL1kZU7YBIchl8TOsEyixpSWdPmVc8=; b=GXR+9XfkhWtQN5
	3MCMG9LKjhQuOeoX/9KUthsJCjsmVtxAwRveTZRsT+ytNZr4PXI1Cmd8auC22ulqVHIxMs/e0Oz1Z
	N+Lm0ExVJjBU0DRIJWU7/0aFMEeqSf5ARjPl4gtTJuRDRbANHkE8nPWSroX9F4z+dlEK3YHc6Zz/J
	p9J5fJBjGObnejmwGp8MkXUZzMFAnPZlDEVYiHWObC1oXHSol3tRM73d1NraNnBpwIdmEymbCfA/i
	lpHQuDiPZAoOsHohlwDzStIRMDV55HLh5yCJcxwcl90Sjz2kgai1+3F1vPc0FZDohdNvPxqeC/slj
	T7DJEciQHPDO1RddMP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvEUT-0000000GnXu-25zo;
	Fri, 12 Apr 2024 10:50:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvEUP-0000000GnVX-2jDs
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 10:50:39 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so944748e87.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712919035; x=1713523835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk4BMWMVvQupqS79Z5nZKAbQw55+VEr9ka9ICZUphJI=;
        b=QqTgl4NqLtTTiTRCh9oE/LUxBEka7bq6qqU1Rav79MzhZOnahKtwasuoYURdrZH8PK
         b+h5ux+t75DTy/rsxbgC33Ip3bGzf+riyEEEu+augmXxLeoC4Ds2Y25QJwe3KJuK5WLo
         tbVFiXovUawX521ZxuUc8KRMYSCNRjvtSoX/OpuRKItd5O5jFxnTTY9tA6PoyoVx4lNz
         slWNa4zdvMiaMgNhhbKof9OhcA2Lhv5th05STDLSaakxb7Cd8nb4iJ80+tLD4ruzpaZY
         J1CHpeVYu/vVGIVWzWkW2iDwrdM5SbepJSU9SJoAroGe30jwO7ADW0ZDcfbkYJxdmHve
         g/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712919035; x=1713523835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk4BMWMVvQupqS79Z5nZKAbQw55+VEr9ka9ICZUphJI=;
        b=nbCDmcfS+PUyPChZWOvXmki7cN8FsLPKmmDFBoGvYHn4Mh3dwEY3WlVdgvlOIUmaU0
         MTFpy7/C8d2FKnjC0YjKLZdESvF/wzomnbxrhj3u/lo8cVXlh9EJIGyLxfKDmVP0/qhc
         uVJGIQY5oz1/zVUCzP4GfK49MtWRGKA6k2URfhglm5T4X7SErTB1fWtHadzc1lWba/bP
         PDmK9ZJcP4KBbx2T82eX6V1E/GG+wmHZa0PdzitGF4NZsDVL/ExyGN4x5+H66WS/V5aU
         9Ait2O3BknJ9dAIs0Cte+mBk5WzswwNMcJlmbasfs+nlQU2SVl4405btccZIvTDEpNg6
         6YUA==
X-Forwarded-Encrypted: i=1; AJvYcCWnnlW+W4qMFuvmuzbMBs8XSIdifmvbCNMM2mp0GFKkKydBGt/Rh2L7Bp2RP0U+4V5q7OhBvNNwrZy9nVMwKNTi+9oMurC2aQHYbkzjsA==
X-Gm-Message-State: AOJu0YyLvR7Ml8LW0t2tcqgJkckrJ7cW/abM1vPh64SZLEf/PyfKF0Dh
	JI/8CXU55GGPxPWTFZTDO0SK4dZBNmy12IBoTXZuqGVl1wjJCFIj
X-Google-Smtp-Source: AGHT+IEzG+QBAfudom+xCyCipcpGNwEniBQkhv1ZUiT8+WjEhSRZsAFlyIsgm6AF9vCKCveZaS4kfg==
X-Received: by 2002:ac2:4c12:0:b0:515:d0e6:a141 with SMTP id t18-20020ac24c12000000b00515d0e6a141mr1298818lfq.40.1712919034712;
        Fri, 12 Apr 2024 03:50:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id gw7-20020a05600c850700b004146e58cc35sm8595853wmb.46.2024.04.12.03.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 03:50:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] mtd: limit OTP NVMEM cell parse to non-NAND devices
Date: Fri, 12 Apr 2024 12:50:26 +0200
Message-ID: <20240412105030.1598-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_035037_829521_4C9E98A9 
X-CRM114-Status: GOOD (  16.09  )
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

MTD OTP logic is very fragile on parsing NVMEM cell and can be
problematic with some specific kind of devices.

The problem was discovered by e87161321a40 ("mtd: rawnand: macronix:
OTP access for MX30LFxG18AC") where OTP support was added to a NAND
device. With the case of NAND devices, it does require a node where ECC
info are declared and all the fixed partitions, and this cause the OTP
codepath to parse this node as OTP NVMEM cells, making probe fail and
the NAND device registration fail.

MTD OTP parsing should have been limited to always using compatible to
prevent this error by using node with compatible "otp-user" or
"otp-factory".

NVMEM across the years had various iteration on how cells could be
declared in DT, in some old implementation, no_of_node should have been
enabled but now add_legacy_fixed_of_cells should be used to disable
NVMEM to parse child node as NVMEM cell.

To fix this and limit any regression with other MTD that makes use of
declaring OTP as direct child of the dev node, disable
add_legacy_fixed_of_cells if we detect the MTD type is Nand.

With the following logic, the OTP NVMEM entry is correctly created with
no cells and the MTD Nand is correctly probed and partitions are
correctly exposed.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Cc: <stable@vger.kernel.org> # v6.7+
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
To backport this to v6.6 and previous,

config.no_of_node = mtd_type_is_nand(mtd);

should be used as it does pose the same usage of
add_legacy_fixed_of_cells.

Changes v5:
- Lower case of cell and use non-NAND 
Changes v4:
- Add info on how to backport this to previous kernel
- Fix Fixes tag
- Reformat commit description as it was unprecise and
  had false statement
Changes v3:
- Fix commit description
Changes v2:
- Use mtd_type_is_nand instead of node name check

 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5887feb347a4..0de87bc63840 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -900,7 +900,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
 	config.owner = THIS_MODULE;
-	config.add_legacy_fixed_of_cells = true;
+	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
 	config.ignore_wp = true;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
