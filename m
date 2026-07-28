Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A42C53219
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2026 06:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0CLu8t9teeaXxMtB/tUGJCm6MIBI4VEhDrEjZGa144=; b=35dLFN9r8ijx0i
	xF/5SCxnbKZXlstkMcPRNrQsLZd1NOYp+iSRbodjannjAsLZAkxFe1sUIdgbDPOEo1JlCkgTUwniV
	bTJh8zTcWdoZ0HNjeZBcn1Bmxhw7G23gWO//wWqSvco8Vb3cpvOHQq/3sW18mY4R9CCASRPuYTmuj
	LZz9thjMrZv/iZMJBVy0dEj97nXoMqGt4yiucUCE+jkSoe+jryzdkRi86ZubyarXdpAfJdBP4jt97
	GFMvfhRjudJqY88gJSJMQndX5MpC5ckgFwrr9hk5IPQIak+Tb75JOrBcxWtrzKP81IkpnqEMd3zBa
	gOAbmHduT6igeZ5eIw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobgk-00000004Zhn-1fTx;
	Tue, 28 Jul 2026 06:53:18 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobgg-00000004ZhC-3cp2
	for linux-mtd@lists.infradead.org;
	Tue, 28 Jul 2026 06:53:17 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so3633404a91.3
        for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2026 23:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1785221593; x=1785826393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atM/qdHXAMddQAEzwYXnFMAPFLIQQY6KnMu395pjkLw=;
        b=lwc00pf8ob+C8RhuTdHCyPV3Ks+tK9jb9vMjd6w/AShdbFObLse1Pg3qCSeCajeQpu
         1S3sgWDbtLgC27FVhAev7t9LlNaGyrQFgjViZoAo/fM5dvNhGelmud47J1m23COpMZJE
         i6FttsRNU5K1Kttywytqi2HpNqWjf9rgpi2BHdGyv5lroeyM14xzPid24kCZ/wnYI+ds
         i18k7u7mDsMafTrOPCg0WHXk/Y3OPkgSEnDAqE43KgtHjauarSAurGlPgiMct94+MxeB
         kAUXRGaL1Ljjge35kdyrFKdwZP4savDh6tsoqnvrCfxTNZvLYDld35qH0m1glkyxGfxp
         FFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221593; x=1785826393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=atM/qdHXAMddQAEzwYXnFMAPFLIQQY6KnMu395pjkLw=;
        b=hTCsQZ3/MYBCdFoPDEK4VSLijwMnqL+iqWbuc8e7xnegxcDSr1Nf3i1ZPqs59xPqtm
         QnUX5N8h2FgMUDv5vveNH0hiIZ2RXL5FOwgZBrEHsUYVg+EtNm5oZWbL9yziiiqdZcde
         4VJ4iclYQfA1w15/FIbq8mXI9VFDAjKA+rnZFYOsMOxtUJPLFjbsFpiO9WspefOZAHCE
         PYRnghkRz5Xj4dH+HEdrpb2MqbddyWBwsOwXon+JdFwLw56UkTmxKhyQiEhBLKzy2AZx
         MmoXoqVu2MisO8DkopWAlfYg/DsTl4S2Osmhs3QyIdpN2ZnG6Mt5mWeOoCFJEQPgjuQR
         r0Ag==
X-Forwarded-Encrypted: i=1; AHgh+Rp7s5tKt4A8haQ/QBIVeg3oY4n5Tk3Ialo20BwZGRaUZ2lz8nSIvfTHdk/x/fQkSxbGFCv9EEgwCY4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVWeLHcJokI246yNSPysdmB5IoXhB3yGX/hATVxkxY4oRx6pjv
	HNlG6e4/7TjwbFmvBfN17oy2VcazybY/Rj/3VISli51AtVLvSUKwtkNjFix/510sXQc=
X-Gm-Gg: AR+sD13pw8GAMfIMQUBf4kLyWI44xtMEMz74ySGfmqwHa+IPMEdqL3ZpEGr4CEnXb0y
	ZADZyhGi47S/9+W6Vq4Y6prPseFVQ1oiZWCpSMaQhINkVJXEq5frc2ZReKvTDDB6cizyTeFQ0hM
	AU2QVjql8FReCjHzJ85ZgiCiqYVphP3Z5IFr206qsxSvVLGUHg0N4ec5+B53V7YSCBI6/f/JLwh
	UMw0OQiquOnxMLhbbrmN489StbkMYUSxmz3d0ffLBDO8rn801q/4Z/rKVrRvibBcPbxkbe5lxjZ
	fVPwbXuaJJcQJYkR5WgmRtkOX32HwPAsTMwElNsgNiNKKDLZJEOjY7rWUEzpYtrxBgMCrytoVWh
	JeC+omvMYmedi43yJd+yR/su7KBfe0WaMxIK+sJBkNOg822kFm8sW+lKrPK5lIbjVPASQzZM02e
	bFPKGSktKjsMZKOVxtYvfPf/BR0qvFtnPzG9TiXrpTJHF2ToRZ164=
X-Received: by 2002:a17:90b:2cc7:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38f6a4b6311mr1318508a91.37.1785221593208;
        Mon, 27 Jul 2026 23:53:13 -0700 (PDT)
Received: from ubuntu2404.huaqin.com ([101.78.151.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64111441sm833014a91.1.2026.07.27.23.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 23:53:12 -0700 (PDT)
From: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
To: wuweimin@huaqin.corp-partner.google.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	mwalle@kernel.org,
	pratyush@kernel.org,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org
Subject: [PATCH] [v5] mtd: spi-nor: gigadevice: Add support for GD25LQ255E & GD25LQ256H
Date: Tue, 28 Jul 2026 14:49:54 +0800
Message-ID: <20260728064954.3474270-1-wuweimin@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032823.771616-1-wuweimin@huaqin.corp-partner.google.com>
References: <20260527032823.771616-1-wuweimin@huaqin.corp-partner.google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_235315_172909_A7F5EB47 
X-CRM114-Status: GOOD (  20.92  )
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

Add support for the GD25LQ255E & GD25LQ256H (JEDEC ID c8 60 19),
a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.

GD25LQ256H shares the same JEDEC ID (c8 60 19) with GD25LQ255E.
Since GD25LQ256H supports DTR (Double Transfer Rate) mode while
GD25LQ255E does not, use the post_bfpt hook to detect this capability
via SFDP and dynamically redirect the info pointer. This allows both
chips to be supported correctly without breaking write protection on
GD25LQ255E.

Without this patch, The WP status cannot be obtained using flashrom:
device:/ # flashrom --wp-status
...
linux_mtd_wp_read_cfg:
ioctl: Operation not supported on transport endpoint
Failed to get WP status: failed to read the current WP configuration

and with this patch:
device:/ # flashrom --wp-status
...
Protection range: start=0x00000000 length=0x00000000 (none)
Protection mode: disabled
SUCCESS

Link: https://download.gigadevice.com/Datasheet/DS-00562-GD25LQ255E-Rev1.2.pdf
Link: https://download.gigadevice.com/Datasheet/DS-01085-GD25LQ256H-Rev1.3.pdf

Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>

---
Changes in v5:
- Add a feature to distinguish between GD25LQ256H and GD25LQ255E by detecting whether DTR is supported.
- Link to v4: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260527032823.771616-1-wuweimin@huaqin.corp-partner.google.com/
- Link to v3: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com/
- Link to v2: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260313133806.2390946-1-wuweimin@huaqin.corp-partner.google.com/
- Link to v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260213144133.1778932-1-wuweimin@huaqin.corp-partner.google.com/

Refer to the following documents:
https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements

For GD25LQ256H
1. Specify the controller that you used to test the flash and specify the frequency at which the flash was operated:

This flash memory has been successfully tested at 100Mhz frequency on a Chromebook device running the Intel Patherlake platform, which is currently under development.

2. Dump the sysfs entries and print the md5/sha1/sha256 SFDP checksum:
root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd25lq256h

root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c86019

root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice

root:/ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450070102ff00070114300000ffc8000103900000ff84010102c000
00ffffffffffffffffffffffffffffffffffe520fbffffffff0f44eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ffd4299dfe84d2
14c7ec6316337a757a7507b3d55c190614ff885018010000000000008800
00000000f6f5ffffffffffffffffffffffffffffffffffff002050169ff9
7764fc8bffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff8e00fe215cdcff

root:/ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
09f61fe623df200d86b4ab47c48e3a13718fadbb450fcd430b3cdc49a902b1f6  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

3. Dump debugfs data:
root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0c
  mode cycles	0
  dummy cycles	8
 1S-1S-2S
  opcode	0x3c
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbc
  mode cycles	4
  dummy cycles	0
 1S-1S-4S
  opcode	0x6c
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	2

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34

root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		c8 60 19 c8 60 19
size		32.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET

opcodes
 read		0x0c
  dummy cycles	8
 erase		0xdc
 program	0x12
 8D extension	repeat

protocols
 read		1S-1S-1S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-01ffffff |     [   3] | no

4. Use mtd-utils and verify that erase, read and page program operations work fine:
Because Chromebooks lack the necessary mtd-utils directives, the corresponding data cannot be provided.

For GD25LQ255E
1. Specify the controller that you used to test the flash and specify the frequency at which the flash was operated:

This flash memory has been successfully tested at 100Mhz frequency on a Chromebook device running the Intel Patherlake platform, which is currently under development.

2. Dump the sysfs entries and print the md5/sha1/sha256 SFDP checksum:
root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd25lq255e

root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c86019

root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice

root:/ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450070102ff00070114300000ffc8000103900000ff84010102c000
00ffffffffffffffffffffffffffffffffffe520fbffffffff0f44eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ffd4299dfe84d2
14c7ec6316337a757a7507b3d55c190614ff885018010000000000008800
00000000f6f5ffffffffffffffffffffffffffffffffffff002050169ff9
7764fc8bffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff8e00fe215cdcff

root:/ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
09f61fe623df200d86b4ab47c48e3a13718fadbb450fcd430b3cdc49a902b1f6  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

3. Dump debugfs data:
root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0c
  mode cycles	0
  dummy cycles	8
 1S-1S-2S
  opcode	0x3c
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbc
  mode cycles	4
  dummy cycles	0
 1S-1S-4S
  opcode	0x6c
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	2

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34

root:/ # cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		c8 60 19 c8 60 19
size		32.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET

opcodes
 read		0x0c
  dummy cycles	8
 erase		0xdc
 program	0x12
 8D extension	repeat

protocols
 read		1S-1S-1S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-01ffffff |     [   3] | no
root:/ # cat /sys/bus/spi/devices/spi0.0/
driver/                          mtd/                             statistics/                      uevent
driver_override                  power/                           subsystem/
modalias                         spi-nor/                         supplier:regulator:regulator.0/
root:/ # cat /sys/bus/spi/devices/spi0.0/s
spi-nor/                         statistics/                      subsystem/                       supplier:regulator:regulator.0/
root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/
jedec_id      manufacturer  sfdp
root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/

4. Use mtd-utils and verify that erase, read and page program operations work fine:
Because Chromebooks lack the necessary mtd-utils directives, the corresponding data cannot be provided.
---
---
---
 drivers/mtd/spi-nor/gigadevice.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70..9fc97feb2849 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -33,6 +33,34 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 	.post_bfpt = gd25q256_post_bfpt,
 };
 
+static const struct flash_info gd25lq256h_info = {
+	.name = "gd25lq256h",
+	.id = SNOR_ID(0xc8, 0x60, 0x19),
+	.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+};
+
+static int
+gd25lq255e_post_bfpt(struct spi_nor *nor,
+		     const struct sfdp_parameter_header *bfpt_header,
+		     const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * GD25LQ255E and GD25LQ256H share the same JEDEC ID (c8 60 19).
+	 * We can differentiate them by checking if the chip supports DTR
+	 * (Double Transfer Rate) mode, which is only supported by GD25LQ256H.
+	 *
+	 * SFDP parsing sets the DTR hwcaps if supported.
+	 */
+	if (bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_DTR)
+		nor->info = &gd25lq256h_info;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups gd25lq255e_fixups = {
+	.post_bfpt = gd25lq255e_post_bfpt,
+};
+
 static const struct flash_info gigadevice_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc8, 0x40, 0x15),
@@ -82,6 +110,11 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x19),
+		.name = "gd25lq255e",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.fixups = &gd25lq255e_fixups,
 	},
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
