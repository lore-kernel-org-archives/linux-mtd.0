Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0FDD68BE8
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Nov 2024 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y1OMRt/FGoOwt9+wZVHbi5pNJHqVq9h9fH2UyeqxkSM=; b=wuvzrRoQ2U9EL/
	j24VNk1ecz/qqVMqiY52XQqnKpxs20FIyGgdm0SpFtwmOLgt3nwqMU2C1GnlkBDL6qDWJ5O+pkdYJ
	2NXfeHnHA+SC7EdsPk+g/DxtW/P3qktb1qQrUbAlh149h1CzvFPyDnmQDxUzMVDmFS1ux196Js2JD
	qZPG99S88use7wuJPA5ELzvvoZEzeDhSB4Fb8fDwyIp11FUmuOf/w4z8G0qb1SIgM4hl5uC0cHvKp
	9llQssxfdAYDCIoOqzkRXz2I9FivJh562bKi7/NY2irGoDYYybz2NMDBlndFy5uj09C5smvCyCrWE
	CtJ3FoIxWZff2IWZgJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCGUP-00000005RjK-3az2;
	Sat, 16 Nov 2024 10:57:17 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCGTP-00000005Rcj-2jqD;
	Sat, 16 Nov 2024 10:56:20 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so27673371fa.0;
        Sat, 16 Nov 2024 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731754573; x=1732359373; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsK2HSjEed8EMz5ILwoIkeMUbKZSPGTUjsgD49Z7xGA=;
        b=FoWdeLp8eq2SFkTO38/lu/tFGJqpdrR17EXsQ7fZqdL9nzhsgqrmJonMfFwKnILFYu
         etzwV7/xMexomtn66BXFVn3pd4y9s8izxhWXICcJEwlIZpnFxFK1aTSssUE1mEsu/bD9
         /XM0fCf+q5FzdIxd/yDEUST/fMf3UiSC2g3kX1cK5V/Y0mnsTXlQlViYX2ZpmSuo3gvH
         VEBoeKhVFILsilME0qxO5K1OQKhDi+qr5sCIas9WTTnUteNNn3MngCDyRlHWcwz+R1f/
         zw+B38mfG3cuFamQ59PQ4Jcbuhdz+DJmfPGLKG5bRohE7XNXNBUG4yY6lv9v2kilN7if
         L6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731754573; x=1732359373;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsK2HSjEed8EMz5ILwoIkeMUbKZSPGTUjsgD49Z7xGA=;
        b=PbDuSha6speja/avzpqGYU4w9O55zB495Uv/px8+RTbg1EjSzrgsaiFDdGb0xIFAln
         PsJOWjNW5pGJ6ZpZ1aM7cikEAqglJNku5Yy4gFbSsjlspR+xbJnVkT3QNzCDtkX5vDoV
         YMRFQrshRl0xzNuW4xXqj0pZVPB3K8SIOKEK0OGVNpRKkwq/ttfnm+Fb3oJtAOiGQqKm
         047cxKGjW82jTSk22D5/DbgbxRLcmxtAHaSQYIZxriJoWgKytu60ZodaQ0FQqn9KU+HV
         fDXXyv/Fkn/2WtrsfbO7inZgQWrxMePqvE1PQNJqiYRN2bTFB9gICppYjcT/UYT/fEDh
         gT7w==
X-Forwarded-Encrypted: i=1; AJvYcCXgAEE/rVByQmBs31mQMkswAZCzgIzjLcrJ/NBfTsybqqMdNYEb5ZlvQu3RNuO/gA9DhVvAeADjDWw5RWDcjp0H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2G7q1WrKxee0AoiPLXohl1/JCU/0CvEgb5cC1sbWQe2aCxlzQ
	LXS7VhtMERcoDkmWjKgapLOJ9YYiHcWDr2lOL0S9oEmEAvmKLyne
X-Google-Smtp-Source: AGHT+IEK8/b0zHZVkVOqjdtIvar+DEHmvQ9/RvK13Xl0AsBy6sPbYs/kgVQgfmYz7Sp5NJTIFX8hsA==
X-Received: by 2002:a2e:be25:0:b0:2fb:5e64:327e with SMTP id 38308e7fff4ca-2ff609c654cmr35086611fa.33.1731754572865;
        Sat, 16 Nov 2024 02:56:12 -0800 (PST)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69b158fdsm2289301fa.102.2024.11.16.02.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 02:56:10 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 16 Nov 2024 11:55:55 +0100
Subject: [PATCH v4] mtd: spi-nor: atmel: add at25sf321 entry
MIME-Version: 1.0
Message-Id: <20241116-spi-nor-v4-1-3de8ac6fd0be@gmail.com>
X-B4-Tracking: v=1; b=H4sIADp6OGcC/2XMTQ6CMBCG4auYrq3ptPzVlfcwLqAdYBKhpDWNh
 nB3CxuILr/JPO/MAnrCwK6nmXmMFMiNaWTnEzN9PXbIyabNpJAZCKh4mIiPznNrpC50ZbEWLUv
 fk8eW3lvp/ki7p/By/rOFI6zX/0YEDtyWMm/aphSA5tYNNT0vxg1sbUR5cFLvTiaHUBRGaSEQ9
 K9TuwPId6eS0wpNXmVQlqY5umVZvjtp4J0OAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4883;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=S9eRxq402eK4I35Xnjw+5DdjS0TnqMYqf/6CHY6wIAM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnOHpEhuDfKZJq5pNn5HGrppcMqMIFW/mvGNTVD
 6wy2OGQw5GJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZzh6RAAKCRCIgE5vWV1S
 Ms4dEACJPrCLNfXlv8LSAo2ITG/27aqRj1Dux1Af4VpYRkhUvt7tAHQ9ZPBbd/IxFZbzbjiXOe2
 67z7quG11la+0eif5vghMRHIQFD9TlBXnwzH8bANPMkLhCTfa9FAsHIWSaJroDVW3fpIPcLbi/O
 ecnaCH40s1oJ0nsJmmVtir90GeVptGAbsNsh5HuG+8fJGO95vDooMZZyoDlKLoC/0UPehbJELo9
 Yev671hIVjlvmvn9InEj8QGXqs3PJOIZ01D23+KCkwttEhOr22KvaSMaaSPeXY7os1SJ/RkCqJf
 lUHsMU8prc+FRvDnIL/HPE8J0uqw2bkxoIONyrfF9oWchX+LS8vvjJACL2YlBLUdVpyJ3hACc3Y
 FPnXy0jLYW+CiOhMcXXlDYFnYlf/GC5tDjXhRl7/l3qhx6TQa8QI/E5J+teoybwCZG2rWW59DjO
 /eREh2oqhXqn5+vr1NT2Go+tU7av3I652UYE3bwO8MzhB2t+Uy1FB1LsNNj+653EdkokOTU0tcz
 E1bgcZHoEKq1jnV+m/54Q2guLBPTfFF5miRTdvnU/ksFaR+ck22xUonbrDKMdKMBMu9JzfO7rS6
 Wte/dEC4HAIiyqxYJu6lcXZtoSlr5mItkXATxUVFXViFVJvCLQnVHkGt6hIxdzBAh+3EULZTcoq
 SwNMGlX1HPU5RJw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_025615_719143_06AFDCB3 
X-CRM114-Status: GOOD (  11.81  )
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

Link: https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801
Reviewed-by: Michael Walle <mwalle@kernel.org>
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
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   4
  dummy cycles  0
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02

root# mtd_debug  info /dev/mtd6
mtd.type = MTD_NORFLASH
mtd.flags = MTD_BIT_WRITEABLE
mtd.size = 65536 (64K)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

SINGLE
======
spi-rx-bus-width = <1>;
spi-tx-bus-width = <1>;

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

DUAL
======
spi-rx-bus-width = <2>;
spi-tx-bus-width = <2>;

root# cat /sys/kernel/debug/spi-nor/spi1.1/params 
name            at25sf321
id              1f 87 01
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0x0b
  dummy cycles  8
 erase          0x20
 program        0x02
 8D extension   repeat

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-003fffff |     [ 123] | 

QUAD
======
spi-rx-bus-width = <4>;
spi-tx-bus-width = <4>;

root# cat /sys/kernel/debug/spi-nor/spi1.1/params
name            at25sf321
id              1f 87 01
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0x0b
  dummy cycles  8
 erase          0x20
 program        0x02
 8D extension   repeat

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-003fffff |     [ 123] |
---
Changes in v4:
- Join line for link in description
- Removed .name as the ID is reused by different chips
- Link to v3: https://lore.kernel.org/r/20241115-spi-nor-v3-1-93ec584177cb@gmail.com

Changes in v3:
- Add SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ flags
- Link to v2: https://lore.kernel.org/r/20241029-spi-nor-v2-1-e166c3900e19@gmail.com

Changes in v2:
- Change from at25sf321b to at25sf321
- Link to v1: https://lore.kernel.org/r/20241018-spi-nor-v1-1-d725bfb701ec@gmail.com
---
 drivers/mtd/spi-nor/atmel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 45d1153a04a07b7c61f46b117311b24ab695038f..82c592f0a1e156e6871785d58b670f76a0c03911 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -238,6 +238,10 @@ static const struct flash_info atmel_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x87, 0x01),
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
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
