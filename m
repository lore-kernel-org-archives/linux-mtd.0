Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC888C001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bq1NPwUeacIfhnMrMHlLPgOLAj7dEk5AW3/GNstzexU=; b=RkH1tD81YY8UBU
	a1byjsWxOqy04nwv6fttdLyjAvTYA5gGXm6dHgzVCLqrKrjHJK9CH+/8HZrP4XtqJT6Xio5OehUFy
	GfYmFXdboYCLEWfT+nBM/R87h8g2iarmXDSARWdOkXJ0H8CBqMgBDbSFB4qy4NvxG04DC/J5kblVi
	A4TuySJfee7h3VueIj3yy2wCEmXN/vvjRVah43PLmunCwHMkT/DSN83ri/kWDH+XhZHdZ2p2QpeD7
	GTeOvmEQY9+tBSYGT100Zur4dC5ZNjP78ngvCYPliB8xxf064fRqaDalb84gytIf33P5AP9gdxewx
	rGiXYlxNfZb2O+SOfQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtw8j-002yqL-1T;
	Fri, 20 Oct 2023 20:30:37 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtw8g-002ype-1H
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 20:30:35 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507d7b73b74so1759232e87.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Oct 2023 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697833830; x=1698438630; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6GPuaggtGD10El9ZGrri8KfDDHuU0PlPpw0GJi5kP2w=;
        b=dd9uE0wo/JQ+cbEYmWkW2uXRyy9aozD2ZMG7ivMbXAJy8QR8SNUAT0zNH5k2qYvu0Y
         aaPZGDYNrT9VzY5PubdHjSxVxV3wpkYJ05oT22tDOYukLFOhLSGoLm7UO0htAvh3UtwP
         VVBarPHK+ceROPbk8lybumLx9jmsm2Amjt/pbZqOQOAdC/mW2HMqUc9aHlUjDE34QfbQ
         HMgFe2K1RbNgrbAxzwQ1+i2xZAYdPsfIzCbd7NCAUWmMvFRpOXPJY6TdzB3Q5KlInwLT
         o0uumxgDXHj8IkGIaHnfxMhzKDx5qm9zqb8VjDZb7CU8aZ6FrMcRP0ixwxAh9Jqu4AOI
         evMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697833830; x=1698438630;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GPuaggtGD10El9ZGrri8KfDDHuU0PlPpw0GJi5kP2w=;
        b=sQ7SLSLQ34Z/A4DFbNyZzSv51Zca1TV5SukN4FSMlYoCLU5UXnodjIL5Fpbcsr6b76
         nSEqi09yJGpOIsM7IA2GR7e6CvI3zhpXRFJKpzOLwmSAjOqJxJoJG70Aoq30ZlbJ3Hkc
         YQJ3TFNnRiMbxF3dCG9lrjaxfCEfmV8G9Y9D+LPdv8ORTA/qAsOOC7ayx615eVWL9iz0
         kaYt6d+2DYGOrKT/6wDWBI93zBdzEIVhV1g+91Y2zqoPBBDaUh+XdiK1hZNFCVR51Mbk
         Pqgqu72NA7ELN29+8Nq0YVpuK2UlQhijGQnk76GzPW63w5epsa17IKthb0Tylg6etEyp
         QDJA==
X-Gm-Message-State: AOJu0YzUIcTxrf4sNv4aGb4L6FGHBNlJ9ExtExtQrRbPNlbdAjJJco+3
	R1VFWueIVUFKCOSOOQt9fS0x3A==
X-Google-Smtp-Source: AGHT+IE/jJITtXMCaFHxTcQC1SW8/hIF6htW3PSk3OTrvWF55xGx5GVpzQ947QxHb14qRj1YWfcCIQ==
X-Received: by 2002:a19:711c:0:b0:500:aa41:9d67 with SMTP id m28-20020a19711c000000b00500aa419d67mr1843149lfc.8.1697833830125;
        Fri, 20 Oct 2023 13:30:30 -0700 (PDT)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id a24-20020a056512201800b004ff6fa3f038sm509345lfb.144.2023.10.20.13.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 13:30:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2023 22:30:29 +0200
Subject: [PATCH v4] mtd: cfi_cmdset_0001: Byte swap OTP info
MIME-Version: 1.0
Message-Id: <20231020-mtd-otp-byteswap-v4-1-0d132c06aa9d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGTjMmUC/x3MTQqAIBBA4avErBswjYSuEi00p5pFJSr9EN49a
 fkt3nshUmCK0FcvBDo58rEXtHUF02r2hZBdMUghVSOkwC05PJJH+ySKl/GorWm1ajpyWkHJfKC
 Z7385jDl/ifdQzWIAAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_133034_481120_A39A758F 
X-CRM114-Status: GOOD (  17.45  )
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

Currently the offset into the device when looking for OTP
bits can go outside of the address of the MTD NOR devices,
and if that memory isn't readable, bad things happen
on the IXP4xx (added prints that illustrate the problem before
the crash):

cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x00000100
ixp4xx_copy_from copy from 0x00000100 to 0xc880dd78
cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x12000000
ixp4xx_copy_from copy from 0x12000000 to 0xc880dd78
8<--- cut here ---
Unable to handle kernel paging request at virtual address db000000
[db000000] *pgd=00000000
(...)

This happens in this case because the IXP4xx is big endian and
the 32- and 16-bit fields in the struct cfi_intelext_otpinfo are not
properly byteswapped. Compare to how the code in read_pri_intelext()
byteswaps the fields in struct cfi_pri_intelext.

Adding a small byte swapping loop for the OTP in read_pri_intelext()
and the crash goes away.

The problem went unnoticed for many years until I enabled
CONFIG_MTD_OTP on the IXP4xx as well, triggering the bug.

Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Collected Nico's ACK.
- Stalled since june! Has this been missed?
ChangeLog v2->v3:
- Link to v3:
  https://lore.kernel.org/linux-mtd/20230602204359.3493320-1-linus.walleij@linaro.org/
- Move the byte swapping to a small loop in read_pri_intelext()
  so all bytes are swapped as we reach cfi_intelext_otp_walk().
ChangeLog v1->v2:
- Drill deeper and discover a big endian compatibility issue.
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 11b06fefaa0e..c10693ba265b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -422,9 +422,25 @@ read_pri_intelext(struct map_info *map, __u16 adr)
 		extra_size = 0;
 
 		/* Protection Register info */
-		if (extp->NumProtectionFields)
+		if (extp->NumProtectionFields) {
+			struct cfi_intelext_otpinfo *otp =
+				(struct cfi_intelext_otpinfo *)&extp->extra[0];
+
 			extra_size += (extp->NumProtectionFields - 1) *
-				      sizeof(struct cfi_intelext_otpinfo);
+				sizeof(struct cfi_intelext_otpinfo);
+
+			if (extp_size >= sizeof(*extp) + extra_size) {
+				int i;
+
+				/* Do some byteswapping if necessary */
+				for (i = 0; i < extp->NumProtectionFields - 1; i++) {
+					otp->ProtRegAddr = le32_to_cpu(otp->ProtRegAddr);
+					otp->FactGroups = le16_to_cpu(otp->FactGroups);
+					otp->UserGroups = le16_to_cpu(otp->UserGroups);
+					otp++;
+				}
+			}
+		}
 	}
 
 	if (extp->MinorVersion >= '1') {

---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231020-mtd-otp-byteswap-7ba47316ed73

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
