Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34BDCAC58E
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Sep 2025 22:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f5jhrIUPJ+VkJ0+hv9uL1Egcq6SdF9wgh/rPxMYAeXE=; b=HDC3LE7xHXuWK5
	6A7EgMjsQCIJgp1wb5SYpie0lQhs6AQFEZTYt3NVVCHXcMnHTlPf4X9MgvKY9tQiylldKZtLgxSjt
	2+yzpogYzl1F+fGTwhFpaj2gvgrFCQxKHZ2tJR4xqX40Oh4SUQ6BxLEMb5vdhQROKsQTWUh/PMuQK
	LtJYkRU/iL9Toaav4jTb/Tz1IBfW7uNKCLn16N62J5r6B39A3PROhuAjCRmx/XGERLkfL1G/m5Z/4
	MfrrIzSO8uztYcpJqhKMhLaa4oROegRgjgIwrVcnK6Sct/N5CHkC78EJQw1j4izZm3EePhK1DhAAF
	9FU+yUt17ba08F0j9q2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYqQ-0000000GXb4-1XF5;
	Sat, 13 Sep 2025 22:35:46 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYqN-0000000GXZa-3xKk
	for linux-mtd@lists.infradead.org;
	Sat, 13 Sep 2025 22:35:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-57171d58ebfso1351246e87.0
        for <linux-mtd@lists.infradead.org>; Sat, 13 Sep 2025 15:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757802941; x=1758407741; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPeYvUoQ1NKFCYRNefeIpOFBJ+jeYICQ3irzWivgov0=;
        b=oLyKNgtM38VOD6hTFv1t4iiSY6lWci3BYRUkyq7q1niU3kyTLd3M+lTLSEp0t/+OJc
         HozVRK4ptxh2OvUuaWUDGLYwJJ6Ay7zWOO4FBlodkGFT5uoaXC4IOA5/dzQqWTSsVfF8
         pmOMYl+n/1xYZvCGBO96+zg63lQdYtOp+k96UTh0FJ+1vFT9DPLEppqqB9YHEXHDAlXR
         AIMWxfjPEuQ0X1de84chOWM60ywPqDHbbCXGJvx4TjGMJyBn2mhNVOYfbdZXm0YXC1/z
         tpMguknCMoDnVaQJK2iSPL4KQfGUqcAURbcNrCfUE+UMN50DrhHjXX1srW2SY0+LTdYF
         ypeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757802941; x=1758407741;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPeYvUoQ1NKFCYRNefeIpOFBJ+jeYICQ3irzWivgov0=;
        b=Ldz6J+kgRp/qr7FrPQy4zd/tADqFMD0/4eVSRxJXSZxKGnixTSTtbtFibwXueN58y2
         uxr1m7/bWZq0e/KWfUjAlzt1k3ueaDPyK6VTMDni5mhGO6iWWOXdNfHuavq3dSARGa8U
         98WODTyALrc247h8QtPvCETRGIP5EvbJ4Lef90Mkir/RXLnv20KfNWjQbnWVyrtdyPcr
         pC70mPNltAYrovsHxP0rJf+312Zn7h3uupwdZAyq3dx/GvLcNXW/JiNaP58gpqX+59OR
         m3xXjouia6urLZwAJBzjZaa1mUH78vGrUto4LEWxehg2tza8wzzlnxrcrfvsIuG+/LC+
         992w==
X-Gm-Message-State: AOJu0Yxa5uCWLmG0AooeKX2W7+BZudwZF7fvrBucVCQAyDGFSfWL9Mr1
	JVz72thmXo+ZDrrFPNtSFtnf2t+4HJf0cC4g+rTVjDuaVXwm4khQakkv+zrCem6y+Qk=
X-Gm-Gg: ASbGncsTvlu79jIpUJougG0NQiuKQsjh72VZflJxS64QVnd72ZdwSx9uC9ESWJlZeL2
	zL3mwRYz1+EtSlA7lxPGABzuv/VRAiqsC7YEdDAQehOjDOcy0iCQD9hOJNDq7CRX3oUuyBm2V4C
	2HZLUxv/Alxz/UR2VBDzqid7l6r24ODL8LJHkFBX/thhIu/RK4GJMpNjC8yKEJJlc9kU8FKtq5v
	Z+ix27LLKF2tPzR9ilz3NBFpLHU/zR2p2EsNJSuccifzFBVCKLnjnPMp8lpDhpFtiFxwBXhVBvS
	moYX8EOYRjwPwhc4Xtd07PVB4dRwnaRq6Y8XcS+nbizqI573PqifcY3NkMHbQWUjusfkh/XlSnm
	hx3yE8LsX8lpGhq1+MrJeGufibIiU3Tm+dzcnneNR0WIbBAfX6OeFgH6tYxuQZF0EQQ==
X-Google-Smtp-Source: AGHT+IEC7QVwutEBVn3PNNKxOZQMmGKOLggaNtpBBMBtCsBA3oalYyv7QE4vI2wtXu/RuCfEjabwcg==
X-Received: by 2002:a05:6512:3f20:b0:570:4a6c:902e with SMTP id 2adb3069b0e04-57062589811mr1999144e87.26.1757802940364;
        Sat, 13 Sep 2025 15:35:40 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63c87sm2324559e87.69.2025.09.13.15.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 15:35:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 14 Sep 2025 00:35:37 +0200
Subject: [PATCH] mtd: rawnand: fsmc: Default to autodetect buswidth
MIME-Version: 1.0
Message-Id: <20250914-fsmc-v1-1-6d86d8b48552@linaro.org>
X-B4-Tracking: v=1; b=H4sIALjxxWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0MT3bTi3GTdpBRDi1TDRAtDQ7M0JaDSgqLUtMwKsDHRsbW1ALgXGbx
 WAAAA
X-Change-ID: 20250914-fsmc-bd18e1a8116f
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_153544_024123_07C58FD4 
X-CRM114-Status: GOOD (  12.92  )
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

If you don't specify buswidth 2 (16 bits) in the device
tree, FSMC doesn't even probe anymore:

fsmc-nand 10100000.flash: FSMC device partno 090,
  manufacturer 80, revision 00, config 00
nand: device found, Manufacturer ID: 0x20, Chip ID: 0xb1
nand: ST Micro 10100000.flash
nand: bus width 8 instead of 16 bits
nand: No NAND device found
fsmc-nand 10100000.flash: probe with driver fsmc-nand failed
  with error -22

With this patch to use autodetection unless buswidth is
specified, the device is properly detected again:

fsmc-nand 10100000.flash: FSMC device partno 090,
  manufacturer 80, revision 00, config 00
nand: device found, Manufacturer ID: 0x20, Chip ID: 0xb1
nand: ST Micro NAND 128MiB 1,8V 16-bit
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
fsmc-nand 10100000.flash: Using 1-bit HW ECC scheme
Scanning device for bad blocks

I don't know where or how this happened, I think some change
in the nand core.

Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index df61db8ce466593d533e617c141a8d2498b3a180..154fd9bea3016b2fa7fa720a41ef9eeed6063fd5 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -879,7 +879,9 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 		} else if (val != 1) {
 			dev_err(&pdev->dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
-		}
+		};
+	} else {
+		nand->options |= NAND_BUSWIDTH_AUTO;
 	}
 
 	if (of_property_read_bool(np, "nand-skip-bbtscan"))

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250914-fsmc-bd18e1a8116f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
