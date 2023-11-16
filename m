Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E95C2BB3F
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Nov 2023 02:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFvFf1W2WtgNYhinQLAOkG0a6gjGnr7mnyA9y73pcOY=; b=xsmpGmWNbrHag/
	MKckZ4MQZ2la2LDg9oAunfuvObX2rYOu5XjYe4CIEqHNva2wJR4iIrtssFoRlwMF3a4omg22+T0qJ
	CabaVNgn103h49hZA+czW/007Rn3T/ikq6468bWvKr8eKB+8gBxepA9e2QjhRm2j7jH+tDDwv1iBs
	ox98ColeHuAwE//gqIE8bIB4SPpU3Njq3fi6lzdxyxNMJ/1Iu+6fy0MOpcZNr3X1Q8WgpkRFH/45s
	aBFiqc9qfMm0RoaYWPlLoTAI1l/ddlDnvtmclOyBhsDRZZ90BOe4ijtgOuDqYLpbwXib0CAr32QoK
	ocIXkgqD8axJOxXgmQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SM8-002GCM-2h;
	Thu, 16 Nov 2023 02:43:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SM5-002GAg-1L
	for linux-mtd@lists.infradead.org;
	Thu, 16 Nov 2023 02:43:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc68c1fac2so3471355ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 15 Nov 2023 18:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700102624; x=1700707424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6qfrVn0277bDMh3KhTRXLaLEzam5I22VMt+zO4G1cM=;
        b=IUeG47LeSEQpRrkutbU0mHQiMzZYaRLXzNdS1Wi7SZozLcY73K3wCmLcJEzLtelN1Q
         Zkt3eyNLNy4U46Q/hkGGQ7olJiSZGycxnvktgG30R+5/neh+tdIGkGtdyiBrhxDsgMPn
         MN6YOnqWUM742xwDD9ahGr1YTZV1qM0rRMXBfvu87586IPRXvImAtR7CZ3W/g6mPAoIS
         CJoG742DK7foUiMhb7vo9AtQn+nbn3yJ/nQdDtN3yxt7ogzyeH2OxHWr0J1W2Ar+ttke
         8mYz0Oc4PzvPu/o+V7aDv0xQyC/MNdcAhQGKvt8qKXh31o9QaPVavopuarZv13hMYi7I
         JoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700102624; x=1700707424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i6qfrVn0277bDMh3KhTRXLaLEzam5I22VMt+zO4G1cM=;
        b=ZsqltMX6tFgfc9c6tk4wHKgXAssbGKVVXtZC8WMLObMj4QJAP55Lh9uV+oI3JoXMCx
         eqSU3wYshLkk7IVqjqeAHiBx34aMFjZrcB0phUvfhHbS9bwqYPfii5bskjSU3F7w/EMZ
         zlbTi/Y0Eg6ZdQRnDT/C3GpK/dtszYMIpQQ7WtPX0NHOKq9fWIncOcQ4krbe90bX/4wB
         2Jef88Ttv1XgUmNc8rnM4zOM5zjqbFdCLkFHDd2p6rBkiQlttMtCUhcdBWtQccu42xin
         uGoziawX0ccPeagAHUWmmpgiMxRPP1huL4w7d96aoxmQJBQorzB3ib3NiYJsMBZ2nr4Z
         jOeg==
X-Gm-Message-State: AOJu0YylfTskJtkI7zesF9PAmzACovUBs7dCmhgx9GOU7WpDGz0OB30D
	KgbGhmbQFz30wxJx+BlcmWs=
X-Google-Smtp-Source: AGHT+IG2GkCzFqshPEQzqo2Np/ULMdeZyvTsdASC3HcD+LCRU2bZ7D2D6cFw0I99XSk2bP4lPmfNVg==
X-Received: by 2002:a17:90b:4ac4:b0:280:729d:98ec with SMTP id mh4-20020a17090b4ac400b00280729d98ecmr16831708pjb.47.1700102623916;
        Wed, 15 Nov 2023 18:43:43 -0800 (PST)
Received: from localhost (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 2-20020a17090a0a8200b002810810cc80sm589666pjw.37.2023.11.15.18.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 18:43:43 -0800 (PST)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Mario Kicherer <dev@kicherer.org>,
	Chuanhong Guo <gch981213@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] mtd: spi-nor: Stop reporting warning message when soft reset is not suported
Date: Thu, 16 Nov 2023 10:43:38 +0800
Message-Id: <20231116024338.337304-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116024338.337304-1-acelan.kao@canonical.com>
References: <20231116024338.337304-1-acelan.kao@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_184345_456025_320E89DD 
X-CRM114-Status: GOOD (  11.72  )
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

When the software reset command isn't supported, we now stop reporting
the warning message to avoid unnecessary warnings and potential confusion.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

---
v2. only lower the priority for the not supported failure
v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
v4. move the version information below the '---' line
v5. remove dev_warn if soft reset operation is not supported
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 87cb2047df80..96a207751cf2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3237,7 +3237,8 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		if (ret != -EOPNOTSUPP)
+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
