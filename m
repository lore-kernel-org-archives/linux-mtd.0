Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B51EC6FD1F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2024 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1wy9hhLoAwZK0hF6ySnSGy9vpjr9I7jee0c5OEOcv74=; b=SoxNgCtivSwDi8
	eIFtsdioSIN7AFyBxY7trWOe0mFdTG8Hv5t5uWuY/I5NfcnDp+yzWJTqXgVy2Q64iRowb5Tb1D8WS
	1o2YDCEA8grwktdkVYBpSmZo/n74gN/8lgEixqDD7d2vLQi+PPsKYPwsmm44MwztYHJltN0IYETft
	sp2r2nX9DMT0wXAbUCW3sKnkQMjzqZtdo4k5kNwaYBLzKNfSfSF2E4s1bXB5YsbkX2DAvLyBprnWp
	QJv3Jcsu4jFITuXonmml4BT9Z/xfOVmpcF3+fi2cixcs35hqt5cNnewlyPck7myZ4Z+N7nta3RpbZ
	Yt1soghIKfk/8jqkP16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlib-0000000CsLX-0f8J;
	Tue, 02 Apr 2024 21:30:57 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrliY-0000000CsKy-0h53
	for linux-mtd@lists.infradead.org;
	Tue, 02 Apr 2024 21:30:55 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso74391101fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2024 14:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712093451; x=1712698251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4wUD2z9yRcsRFUV0GZ2KtedkGxq+PRtlFMNXAo0fIc=;
        b=Pq21kFXpkX1kgeDJ4UOadAU3GpttB0h/l5/ET4J05NkzPeuWxQW4c5gubFDCzVGWxF
         hHy3miUE4HTR0bt2Qe6l8AeW4ojFN1rcMxJw8umh3j6Z3KjlZvmvxa+g3Vw/C6j134n1
         5/xiFyIKGZ4fcwctCzUA4otAUWNBKT1rtUowwnvW9/WX3qsSnQiNdt/Er0MarJgRRlOq
         omalVc47tAREElyy2G+eC/gGWABQqvEaPGBNZoJ/bAQU3FOt8N4wkcQZqv+hp0dPI/yV
         VzRC82zYwUT/rn3V3PoBl5dpcguCme6I3S3sTFrOr0Ss/2bA2+4GaBtMx1N2HmQszrqC
         CXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712093451; x=1712698251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4wUD2z9yRcsRFUV0GZ2KtedkGxq+PRtlFMNXAo0fIc=;
        b=n6CuZJE1AqR8C3gy2C00h7pVmgWDizNh3O445n95hfdDvZj/6+E7h7AylPxgIxk66e
         kdl+0LkBL+s2jYmJvXU17b/1H5pOmnlkVGDmWfOfPDfg4oQlOeqlJodlxadojvxGg962
         Vi2u/AjYws9zGNqVzgGG6olX3juEes7z6/jaQJ/IG8TW6790ITgDEtGh9jRvvKaI9OP9
         062RIzpv8+25jgzoPUAMUVjgB9dd1mvSYT8fSy8x3MaZcP49LXVvykthBvSpmDyWoeph
         usb7kGV1cb+QycYtJVNldXPRjK26qQUOr48VcQW7l1A525JVUG4cAJQ1ZAK4AtvOeNKU
         utmg==
X-Forwarded-Encrypted: i=1; AJvYcCWiuffmZJjP1iBLfGMEzCG3NucR8walRRteeXGVwfLQPXxBuW5vRO8aFUxJWYRecDcMNM9GDH2qPrRtxljL+HTg2MBTLFjEPRgJao19MQ==
X-Gm-Message-State: AOJu0Yz83KJHugNoHcEl1uzbA9Omv0a9lkglteZSy1lpVPn208azAK4g
	umuSi5J9zgy4TDv/Ycoz93BfymWd9GIc5iRsOEw6NhFDtvOJKv/L
X-Google-Smtp-Source: AGHT+IGHiDlGzpUaByzv1Mat8TWtJADllDTg3rUOQ7RF+vs2KUWXAyysTRN4kWevr3lyuN9B1n3rEA==
X-Received: by 2002:a2e:96cb:0:b0:2d5:b33c:1f64 with SMTP id d11-20020a2e96cb000000b002d5b33c1f64mr8253135ljj.38.1712093450818;
        Tue, 02 Apr 2024 14:30:50 -0700 (PDT)
Received: from localhost.localdomain (host-79-35-252-101.retail.telecomitalia.it. [79.35.252.101])
        by smtp.googlemail.com with ESMTPSA id g18-20020a05600c4ed200b0041495d17992sm19232476wmq.34.2024.04.02.14.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 14:30:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] mtd: limit OTP NVMEM Cell parse to non Nand devices
Date: Tue,  2 Apr 2024 23:23:19 +0200
Message-ID: <20240402212331.27328-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_143054_232409_2BEBBAE0 
X-CRM114-Status: GOOD (  16.41  )
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

MTD OTP logic is very fragile on parsing NVMEM Cell and can be
problematic with some specific kind of devices.

The problem was discovered by e87161321a40 ("mtd: rawnand: macronix:
OTP access for MX30LFxG18AC") where OTP support was added to a NAND
device. With the case of NAND devices, it does require a node where ECC
info are declared and all the fixed partitions, and this cause the OTP
codepath to parse this node as OTP NVMEM Cells, making probe fail and
the NAND device registration fail.

MTD OTP parsing should have been limited to always using compatible to
prevent this error by using node with compatible "otp-user" or
"otp-factory".

NVMEM across the years had various iteration on how Cells could be
declared in DT, in some old implementation, no_of_node should have been
enabled but now add_legacy_fixed_of_cells should be used to disable
NVMEM to parse child node as NVMEM Cell.

To fix this and limit any regression with other MTD that makes use of
declaring OTP as direct child of the dev node, disable
add_legacy_fixed_of_cells if we detect the MTD type is Nand.

With the following logic, the OTP NVMEM entry is correctly created with
no Cells and the MTD Nand is correctly probed and partitions are
correctly exposed.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Cc: <stable@vger.kernel.org> # v6.7+
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

To backport this to v6.6 and previous,

config.no_of_node = mtd_type_is_nand(mtd);

should be used as it does pose the same usage of
add_legacy_fixed_of_cells.

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
