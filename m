Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2189C3601C
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=578cQWy+mLJNz5SZv0UcNvOwSi5Ks8IW4pUjsYQMDz0=; b=vFOYIYRXbq32tV
	tHHjudO4zhwoW0SpkkeiGoHf1fpSWiPpllCbkd6ZgQMMk+mFTSVRCoKQlO5KR7qCGktc4qsBmhH5e
	EkPmrv9+ulpYNQ/yMbc/YVYsmeDXbwR2s+KYR1Twr9y046u6pojXGjzN8dxETwrud09kv7JPRG2mC
	TomzhC2pZuewjIBO+vUAuyfCmKkIdl1e4zSYKVJwby7lbr3vHoC5e+opJGC4c5cX1GrFuIxFE2aXR
	4PkS45nl0v1w61NlJETKJLgZ0vPMo0I51Ifvu6kqRWzL/aHwthVuxXi4P82LHwP0dAOijH+49cm21
	0qgu52ch1gcCpWlVLmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztvC-00000005bPl-1Q57;
	Wed, 02 Apr 2025 08:58:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztuF-00000005bCW-2Eig
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 08:57:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-227b828de00so112919875ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743584227; x=1744189027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L6fD6nlIa393DR0GjOYRfyiTfAg8gVxKRvxkE78qM8=;
        b=b2RIXgEVd3dUjFJsm4m3W+91UAbryI92gWyGgp/QxecyzMCyfZtawBfnuZHT7CeTHj
         Zazhb5q1yAG+k7pcyu8mL1AVE9wYt/sEZxXmzvK0iDDxQOX2MO3Gyq2E/YUSEAaILKRq
         GvgucO57n+89IU0DII1Ab3ZF8oX1iwlTMXHcr0H64CjXHqx9iEkK6fW1No5P7kz2pwj2
         7ShTyJobNwi/c1QKPGHWnvEnf0ajzsAtx4uwDu26iQEgTvR7HrvHpP/bFxIP1bk/kvja
         HxuaSV1QC0aDxUsf52rMP/klUNYAt4mPVGsMxscu+R+7ezPPb/Et5LtvEADbepLg4aa+
         k0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584227; x=1744189027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L6fD6nlIa393DR0GjOYRfyiTfAg8gVxKRvxkE78qM8=;
        b=eyKafejGadwjo/M7BmsOK1exQU3jM2BSXOZGmTyzY2LGgvX1lIwIor/11P56NR4qdk
         m3GKGWSLYqcQhWClxDSHyBQcH329qxwC6fFgPqhV1LSqWfNxZ07oWXUL0pUYSn5/9uBw
         xzzrWxBj4oKiQcnUuj7VWDYE9Hq9JEFIWDokMdtAudSxAKQVLydWiL+DNnZjVbiCQZAt
         OnQJrUWXDIQOjUgzk33kqYy4HnEm7dtFSjeRbY4o52CF6X1YagItWZer3gvmp/vl2q2q
         zDyICL1ZOQyCX6RdEn0soWAFLaWUM59prmEQo9mPksDxUJ+kXoHRah9cZ+YzMT/XQc+Y
         OrWw==
X-Forwarded-Encrypted: i=1; AJvYcCVnG2HtwtWLoGPM+dYRzrTGWyPF2n4jCk6afFFofijC0dQpRuoyFA448u+CNQU/HiJXJLMX9EliqZI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIH7WXRwDEkGzdXSFxQLDEZFKvjDmoxCLks6zXewm9QspG7h0m
	JfRqwygeUsnU6lnsO43SZgAaGNy84iGvpHSIMQIB367Osf+2aive
X-Gm-Gg: ASbGncte6oeyH+PrQko1laKmI9PYycyCl/kE9ewTPihoBAvL0XBd0ay4+665sO3Xxoa
	hRj9uJFjbRxXYQYVLnB/+QM775PVRyztIl/DCahT3RXlzXVgrbRlq/h0aVsLbH6I8Xe0VO3XuHc
	P1WeIHD3khD+oHqNK5U1uFCYcT1mkcSNAzhctAMgjp++dHam9pYTr9wpCD6x7BD0gMkWGexrUAl
	JT37xSPp5BgQarhtyQZy87wxL25Qpg0pOUOrmJaWHd0dcwobZe7UNSee9Hd2QUrMeYIpWg4D4/o
	6U6nYIhk/XUHrZyhhdNdWDw24fCY+AEI38mYQZew67+pEk0a0XNoXQDa8Q88hFAUOggtGrciEp4
	AL4Y=
X-Google-Smtp-Source: AGHT+IGZgi69Abih38Lloz1v9kLCgGQu6o9alyyOKDi5TM595XFdyW5Z+Sc4LA3KYAlvCBtd3nkQfQ==
X-Received: by 2002:a17:902:e549:b0:223:325c:89f6 with SMTP id d9443c01a7336-2296c605374mr25463065ad.10.1743584226867;
        Wed, 02 Apr 2025 01:57:06 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dedb5sm103221535ad.176.2025.04.02.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 0368E80642;
	Wed,  2 Apr 2025 17:06:10 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 3/3] mtd: spi-nor: macronix: Move macronix_nor_default_init logic to macronix_nor_late_init
Date: Wed,  2 Apr 2025 16:51:29 +0800
Message-Id: <20250402085129.1027670-4-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402085129.1027670-1-linchengming884@gmail.com>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_015707_675082_B1102E5A 
X-CRM114-Status: GOOD (  12.20  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Remove macronix_nor_default_init and move its functionality to
macronix_nor_late_init to ensure proper quad_enable initialization.

For MX25L3255E, SFDP follows JESD216, which does not include the Quad
Enable bit Requirements field in its version. When the size field is
removed, manufacturer->fixups->default_init hook is not executed, causing
params->quad_enable not being overwritten with the intended function.
Consequently, it remains as the default spi_nor_sr2_bit1_quad_enable.

By moving quad_enable setup from default_init to late_init, quad_enable
is correctly assigned after spi_nor_init_params, regardless of the size
field removal.

Additionally, according to spi-nor/core.h, quad_enable is more
appropriately placed in late_init, as older SFDP versions did not define
the Quad Enable bit Requirements. This change removes default_init and
moves quad_enable handling to late_init accordingly.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 07e0bd0b70a0..216c02b92bfe 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -282,22 +282,17 @@ static int macronix_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 	return enable ? macronix_nor_octal_dtr_en(nor) : macronix_nor_octal_dtr_dis(nor);
 }
 
-static void macronix_nor_default_init(struct spi_nor *nor)
-{
-	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
-}
-
 static int macronix_nor_late_init(struct spi_nor *nor)
 {
 	if (!nor->params->set_4byte_addr_mode)
 		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 	nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
 
 	return 0;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
-	.default_init = macronix_nor_default_init,
 	.late_init = macronix_nor_late_init,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
