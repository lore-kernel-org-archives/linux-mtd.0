Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA1EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fW73IF3Ie8MlDlw6CC7MTbbzTzPzAEYuOFzDIJf9Z/s=; b=denyMWu6HAWHsq
	cDSDORA9pZsOKMXFd3jFxVgsk6dsC17L66rMO9kBfCXlpDbjWhusoXNE1UzFXPF/SXD18u2A+eGie
	h3CX1UViUoEQLiOkrbXjY0+94r0OBP9NgKqb9IooYaCN4uGScEv0pxVB1JOZkdBnMGgl6i8YbXOlt
	3ez4icJNQJVWCgZ1CdWFTq/GdkusmFpsw/mmDNpUdVaFQzVcjwEsnuzI9AhMnD6m8/W/o/Oq3Bty2
	aumBVLp93wJ+1Intvt8uVAtn61KYn7mLrsEYqS2KUwH7lCt0V9HgO/3lqGXCQw4bcu806j3lgtBDp
	He8+s2Xc/WqXoLJbdIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0oc-005ofC-16;
	Wed, 19 Jul 2023 06:37:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0oa-005odK-2T
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=oRKIOUpFqHN91Ar5wcA4OkAo3bcs3Z398gafNkSZn8s=; b=VpkybvVYvTHEOnsmODzMvqVDnV
	2iLjF60fJys7K8Nk4j9cHKE5NA0xRNVzD5iJlzBwYJ3WnAGXvXXHm/WHEz0KO5tZVTCt4Hcfr8qpS
	DT00AMQ4gYyPgseKNJ3A0qC9F9M8ABK9i9aM7ahoKjpXlNytlrJlly7JQzjNI5yQATVnmuWXwYA8M
	dqmelU8Q0I4snN5pShPMWZg4XhwrGVQx9chxOuNuxxWtKSiuWhY4BZ4CwxJ2Ufv9N38/AxTOwk9He
	4bYlbdxaxfcyv85JSWUMtxeZdlHgSwoFt8ddcKO6oQcz0Q1Ea6vB2j65yU6V+SlKr3GNTKZC5RUIE
	OMtVVRew==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjKY-00BUlS-2B
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 11:57:29 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fd32e611e0so4842560e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689681372; x=1690286172;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRKIOUpFqHN91Ar5wcA4OkAo3bcs3Z398gafNkSZn8s=;
        b=j/MU0UXt41CYH0gnbYYl/tkTjDedMm2CgVYronCMGHRv6UUU/iNedJRkb2Pctbazwl
         itjSzmH9YoBouc16ZlJ08MV/qrTttrnXrBb357I59MaD54vVKJySlouGde1sBL/qciAl
         D8inDDuNU2Knef24FF86PEJPgqaxENsVDUhsmQoIeAl4rW9HSX8cKgvEIsm5EUw07m1L
         i1W30uTPPfxiQ3zXcMJEeZtU3RzOxlpdU6CJ8KVxEoQj0DL1mfaJItm591EoXCYzLUuE
         zQxZxbAvKdYc2PTa2pgL8mtZUZDR3/U27Ki/MFe+r1H2muMtMia/L6dasfDpt42Aw29k
         i7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689681372; x=1690286172;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRKIOUpFqHN91Ar5wcA4OkAo3bcs3Z398gafNkSZn8s=;
        b=ICBh7Y/nKQaVJ/5vJnT1Cx+8/Em2T0WjAOAVk4ph6E8SdjbqLxca+awzqs9QuPd0hN
         qy3Oycv0ICxrS3AzoH1N+PIJyWPLl0NC0d2a3HYkFxZwPqHEVTsHx8KERGi8PCg9lYWV
         tf8XFT337VS0FVJWixVzLI8dAxQ5sG+SRCAfMeBD8n2qz5Ssw2BWv/8L2I7bXE4U+3f9
         ePN9XmJljzDUUVGbOxY0eGTJDbGKI0ivLjNWBHI6H+Pz/589RlFCjhq0C1n+OuAFajMd
         54P1hWJqx91AcIiP4F3E4hgd+SRsRA3JxgdHUOsujd1J3TtHtVVc+7epVhoZbB4XfOdj
         tP5g==
X-Gm-Message-State: ABy/qLZTxa016Za5QPg8qcaLjEjVLTXCykizwhOIrkRw2/HQYF0gdlJF
	hHcHJQIM69LWQDZUym53b3OQNw==
X-Google-Smtp-Source: APBJJlEmPvdXYby95fB2yf4R3hT7I+AOsJzeVLKpc9pCxbUt189y94nzaQre+EXzB9SClBl75GlmDA==
X-Received: by 2002:a19:6557:0:b0:4f8:5ede:d453 with SMTP id c23-20020a196557000000b004f85eded453mr3606355lfj.23.1689681372392;
        Tue, 18 Jul 2023 04:56:12 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id j28-20020ac253bc000000b004fba101946dsm407961lfh.187.2023.07.18.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 04:56:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jul 2023 13:56:11 +0200
Subject: [PATCH v5] mtd: spi-nor: Correct flags for Winbond w25q128
MIME-Version: 1.0
Message-Id: <20230718-spi-nor-winbond-w25q128-v5-1-a73653ee46c3@linaro.org>
X-B4-Tracking: v=1; b=H4sIANp9tmQC/43NwWoDIRDG8VcJnmtxRl3XnvoeIYd11WSgaKJhk
 xD23WMChZawsMf/B/ObO6uhUKjsa3NnJUxUKacW+mPDxsOQ9oGTb81QoBQGgNcj8ZQLv1ByOXl
 +QX0C7LlEGDqBIWBnWLs+lhDp+pK3u9YHqudcbq9HEzzXXxMXzQk48Gj6KJ1TOMD4/UNpKPkzl
 z17ohOuhLBBWow2gte9794h+RdSy5BskPMOwWIUxro3SK2EVIN6O2prwEep5D9onucHDmonVpo
 BAAA=
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_125726_900209_21D3EB78 
X-CRM114-Status: GOOD (  17.63  )
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

The Winbond "w25q128" (actual vendor name W25Q128JV) has
exactly the same flags as the sibling device "w25q128jv".
The devices both require unlocking to enable write access.

The actual product naming between devices vs the Linux
strings in winbond.c:

0xef4018: "w25q128"   W25Q128JV-IN/IQ/JQ
0xef7018: "w25q128jv" W25Q128JV-IM/JM

The latter device, "w25q128jv" supports features named DTQ
and QPI, otherwise it is the same.

Not having the right flags has the annoying side effect
that write access does not work.

After this patch I can write to the flash on the Inteno
XG6846 router.

The flash memory also supports dual and quad SPI modes.
This does not currently manifest, but by turning on SFDP
parsing, the right SPI modes are emitted in
/sys/kernel/debug/spi-nor/spi1.0/capabilities
for this chip, so we also turn on this.

Since we now have determined that SFDP parsing works on
the device, we also detect the geometry using SFDP.

After this dmesg and sysfs says:
[    1.062401] spi-nor spi1.0: w25q128 (16384 Kbytes)
cat erasesize
65536
(16384*1024)/65536 = 256 sectors

spi-nor sysfs:
cat jedec_id
ef4018
cat manufacturer
winbond
cat partname
w25q128
hexdump -v -C sfdp
00000000  53 46 44 50 05 01 00 ff  00 05 01 10 80 00 00 ff
00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000040  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000050  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000060  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000080  e5 20 f9 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb
00000090  fe ff ff ff ff ff 00 00  ff ff 40 eb 0c 20 0f 52
000000a0  10 d8 00 00 36 02 a6 00  82 ea 14 c9 e9 63 76 33
000000b0  7a 75 7a 75 f7 a2 d5 5c  19 f7 4d ff e9 30 f8 80

Cc: stable@vger.kernel.org
Suggested-by: Michael Walle <michael@walle.cc>
Reviewed-by: Michael Walle <michael@walle.cc>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v5:
- Detect also geometry from the SFDP table.
- Link to v4: https://lore.kernel.org/r/20230714-spi-nor-winbond-w25q128-v4-1-89c5971df343@linaro.org

Changes in v4:
- Fix up error in commit message.
- Pick up Michael's ACK.
- Link to v3: https://lore.kernel.org/r/20230714-spi-nor-winbond-w25q128-v3-1-bdb2192f079b@linaro.org

Changes in v3:
- Keep NO_SFDP_FLAGS(SECT_4K) around.
- Update commit message
- Link to v2: https://lore.kernel.org/r/20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org

Changes in v2:
- Only add the write access flags.
- Use SFDP parsing to properly detect the various
  available SPI modes.
- Link to v1: https://lore.kernel.org/r/20230712-spi-nor-winbond-w25q128-v1-1-f78f3bb42a1c@linaro.org
---
 drivers/mtd/spi-nor/winbond.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 834d6ba5ce70..63ba8e3a96f5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -120,8 +120,9 @@ static const struct flash_info winbond_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q128", INFO(0xef4018, 0, 0, 0)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &w25q256_fixups },

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230711-spi-nor-winbond-w25q128-321a602ee267

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
