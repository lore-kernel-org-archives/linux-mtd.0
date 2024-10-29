Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0693CD2AB23
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+EcXP1JSibcjf0KIudeHJFADvNn9zFo9NoqQkyryWDk=; b=IYqD9rk7gZGTN3
	wYfF2YsYfPh8rvgIOOVpg8vaYi1H/ycWRRrnOWZXqn/+zk0ShjcD8/3K9ywqO6L/5Ao+58ZWYFb6D
	AEH+PhfUvWB8FjpeYP3XTfeA/JRTdidj55HcqSrUZhw6RlphEJ+6NtXP5ni1DWvMw3LnwwdrAEwIa
	grLZj9G+bS09KNpEzv8uiexj5M1s2Tg6rk/Oi3K5dvye3z1ZkypMRNXYkBooxEwvbgisFDYev3ybk
	MZB2RfhK6Eu+MC2c8UsuWSkXL8Vc1OoT7KQCXILU8Gd0iAEx307hA0Wwfi4gvyosT02Ad5q4Zz9yO
	mbzIPzpjisHIAGGoV2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5khQ-0000000EHdU-1tNY;
	Tue, 29 Oct 2024 11:47:48 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kKS-0000000EE6Q-0REU;
	Tue, 29 Oct 2024 11:24:05 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb5743074bso43586101fa.1;
        Tue, 29 Oct 2024 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730201042; x=1730805842; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RlZ1TnHpvCKbzlvSM/hs6o2BD2pnpvAtKzCAXeYDfw=;
        b=IZJYtmVF1fuj0rTJ702t+9XnPkespKcLqw+eOQtQr5FMfa9URB2bJUSAmC47G7nLwO
         Hmd/RKhU3G+mdW3MjWwyNv0MC0BwiZAhrhqqyGGFHg7QMUfh052VJ96WRPQOz+EGnzvX
         YsREqTVIeSJiaP9Vc15Lr+9z3Co6kem+s5TVVm0osswfLqhRCfV0HByQ1AATkWtAbFQq
         JodNNFMnJoZ45NflPeZisOfTQQDUH00683qLO5WuZgQQglEH9ma2u46A/bOSm//oIDS/
         hGHjReRt1sIHF0uNSgYqdoF2V7av52IFKqtxvv5DYWvo40sCyDgbJO07oNoO7yfbkkeb
         xgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730201042; x=1730805842;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RlZ1TnHpvCKbzlvSM/hs6o2BD2pnpvAtKzCAXeYDfw=;
        b=uR7z54FD7RHpSXYAsCXH+T1tAMTCCzjLWBwxp0bv5650Q2Z9Epti7bdJ9WK0Y6vzvL
         p8ygT7ExJSSPu99DOO0GQ3SEzZIhBusNWPZMht3feDN4uEKSeYV+L5tQf79TGqeP2xWh
         Q1xqtZicrA+okvc/wPwmu+Pls0dtYep9Rav6SlkKQHuW8ZoQD7U81jDi1VrC4tcO/rT/
         rNdTppZxYHiYYJFVaPScJbRMrmNUDLdH7aqZZCTkOynZEKI3DjFL3jBkpYeW6RuxanRA
         qLuz8E1wJTT6U/a7eAYlNUOTjDRtm0Bpel2aLnPeKPFiikfar6fqbIaL+/UZe+Bz/NMW
         QUpA==
X-Forwarded-Encrypted: i=1; AJvYcCWXrgDlWXuPStG5jM9XVI5ExOsXuKlDA7Grfrc3EkwkODH5Z+jXX9XGz7WZWLF4Hu3KJ1+UrbKqkIdUjDi+C4XQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yww6YwR8BwjTyDT4J+4EidrbL//SGPnJpUAA0oj/5vMp8gyVEwI
	F47gR/iNxHk0XY2rqwB3zJ1co+Sw1yX2c5URTtdMJb0sAiEyybWX
X-Google-Smtp-Source: AGHT+IEHQFQWslu58ODNcgJ0kA7mcOUn92YiGRqwT9IXE64HXJya3wT0vI60FTSmoh816Nm6CnQPvA==
X-Received: by 2002:a2e:be09:0:b0:2fb:50e9:34cc with SMTP id 38308e7fff4ca-2fcdc7f6a51mr5886061fa.17.1730201042130;
        Tue, 29 Oct 2024 04:24:02 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb45d20dfsm14691601fa.80.2024.10.29.04.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 04:24:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 29 Oct 2024 12:23:30 +0100
Subject: [PATCH v2] mtd: spi-nor: atmel: add at25sf321 entry
MIME-Version: 1.0
Message-Id: <20241029-spi-nor-v2-1-e166c3900e19@gmail.com>
X-B4-Tracking: v=1; b=H4sIALHFIGcC/2XMQQ7CIBCF4as0sxbDELWtq97DdEFhaCex0IAhm
 oa7i926/F9evh0SRaYE92aHSJkTB19DnRowi/YzCba1QUl1QYmdSBsLH6KwRvW3vrOkpYP63iI
 5fh/SY6y9cHqF+DngjL/138goUNhWXSc3tRLJDPOq+Xk2YYWxlPIFZ9O5Hp4AAAA=
X-Change-ID: 20241018-spi-nor-dc29698dea0f
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Bh/pCGhgwpeso/ZlnFF+4oo3hRtxyJ4ukGqD9q6lDhw=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnIMXLk1V2su/q8mCIPTOsrJENpDhv/6uVHZuvj
 k1jAj4sLd2JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZyDFywAKCRCIgE5vWV1S
 MtE6D/0dhDciMdCaBBKUIEVGnm65MDeeHCj5uxDQhy5EdwWO/LIrD/paTeTRKOizfdjddOCX/Yx
 nB1kBZHlvWeoTNkarX3fENeCca2t7fI4BFSG7Jq5MnhQAion0YxLsczQa73jv+WFlD3q3QN0fHo
 asVkPagkJsiIM1YHpbfPuU2mxe3jFujXT2Wg5+5zsqa5eIuH+ybMgGE+rU6nsw2KI+8eFtuOUbM
 GCss0zZqQmrQ+ASg/BwEaa9lKKprmbqzOOL3ykEopy87gXtrQgwoVXulm8qbNm7Ugf6efqRTRAm
 +0hri72DrCgi7Im5IAxGVzfG75FEDQKC7bj2xwEPbm7mG3373qWxpvqx3QNPR+wAi23hR1j+sn0
 CqonFM0Hdr7uH7pNNAf6r3AMCE0XQM+35Z5e2gO8NitmxpFt+Ep5ciHHVJ23W2gKZrbe/+1sT6G
 ZSPnr7dAu5yskxZhzV3yab+fMBrpOVNyd1FpvELpBr74tVQO1EVpNkYALlDTwLQz1Z3GGiw+8WW
 uGQr0ExilGiMuaFf2GWp18S1xOOPZjU+9GlYnfzWlQoAOVR3RY9KYN5tggIogxWv7T3fqvDI3m0
 UB6Fs9CpQCW0ACwziipYqlpbJsueJsCyRKIU7vPvCSu8f8OpzApGkwACBvJaAlcX9zBnSc+nL4A
 6q1AR+CdoauNAtg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_042404_187958_A6FAD634 
X-CRM114-Status: GOOD (  11.86  )
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

Add entry for the at25sf321 32Mbit SPI flash.

This flash is populated on a custom board and was tested at
10MHz frequency using the "ti,da830-spi" SPI controller.

Link:
https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/partname
at25sf321

root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/jedec_id
1f8701

root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/manufacturer
atmel

root# cat /sys/kernel/debug/spi-nor/spi1.1/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0b
  mode cycles   0
  dummy cycles  8

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x0

root# cat /sys/kernel/debug/spi-nor/spi1.1/params
name            at25sf321
id              1f 87 01
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR

opcodes
 read           0x0b
  dummy cycles  8
 erase          0x20
 program        0x02
 8D extension   none

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [0]
 d8 (64.0 KiB) [1]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-003fffff |     [01  ] |
---
Changes in v2:
- Change from at25sf321b to at25sf321
- Link to v1: https://lore.kernel.org/r/20241018-spi-nor-v1-1-d725bfb701ec@gmail.com
---
 drivers/mtd/spi-nor/atmel.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 45d1153a04a07b7c61f46b117311b24ab695038f..8285a16b253d54ae8c4a5302850244d2248aa755 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -238,6 +238,11 @@ static const struct flash_info atmel_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x87, 0x01),
+		.name = "at25sf321",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
 	},
 };
 

---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241018-spi-nor-dc29698dea0f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
