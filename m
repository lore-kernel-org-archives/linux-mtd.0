Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB74FF99C73
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2026 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BQT+hIs6A6yyycG+CykeAthFTugwXCqnrmC0XbH7je4=; b=tBhWJrSLBgAQAd
	0Rt9iBkgA0KdfdFTFhqVviuJXpqZyZhXfhzyu2esqewmjEaES4x2cEDXvmeW/tv78Ki4j1caDfEOC
	sDvBLXJUej45AoAgKILQ00CgCh1XFW+KyP+YWHT5PjFZpJaejBj61eCShsXwfs+3oeylL1ql1SDST
	1DCq5V1Fg78ELAyffqqmxxrCOVfZk2xMk3u7VGtKQBNVWMxuiFx3C5Iuq/I9Kgz4ir7DaR9ZxzXgR
	YflLLJXtwQ5wfDIKiu3hh58B//rzeojVm689A/EzKGD/K+BXAHN5o5n107rEGruT7PxCg3dGqsywP
	9kVrTNcZO+Xx5A0An5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE1Hd-00000004r2k-1JLJ;
	Sat, 18 Apr 2026 08:44:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE1Ha-00000004r2I-06XW
	for linux-mtd@lists.infradead.org;
	Sat, 18 Apr 2026 08:44:07 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82f8893bff3so682913b3a.2
        for <linux-mtd@lists.infradead.org>; Sat, 18 Apr 2026 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1776501844; x=1777106644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nscS9BHJy2eTE6J3kZaftNuX9Mkx56H/Qvm/tuSyKIY=;
        b=sJ+dYHWGXnQrVco0UNYj8spbARFQ5PcMRmcSL5fItWhfBmV1QHnoTTwG51HyB3SPhn
         K/meNAgDje6kUKL5E5uuQ7osfAAPGvtQoZFjrmNcMGgIhdPrC6BLGJyClIFUQnCHfalx
         B0V989QRG6m3YbdqiHW+PBA/55qwkJzFgVyqKo+OdJ/vMUWWLlMCoHVxMKRDIMw6mFBj
         D/ByOkJtNP8dtnhD1X898TMlnOJx8KuO4PoYm2hEiK7tAy0RP9tZkEDKChW7kW7jcwzX
         V/5Gf76QSmGatfS52dZnP51gXcqe39tR5lCRy4hasnrFEbn48/mssXkHWtjkr3lopbtR
         jpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776501844; x=1777106644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nscS9BHJy2eTE6J3kZaftNuX9Mkx56H/Qvm/tuSyKIY=;
        b=QiywUWJMeGilvV2AMW581XSIt/OVZi/W7HRDMOJ4a08Schi/sRpI9TewhYo5eJzQoy
         b6hrrF/wfxbcF21qsEJpsAZMlwfRQh7UOskYd+H3JCBDxP13fDnUTFsTOa+smVwjOsRB
         ndK3krULBg0mdBtuSJEzKO4JYE3Fmqgx65DuMqyp7Jj6+ykHAR1gCtOR2SB5qq/y+K+z
         4wOsIhizyW3PZtop7Xohnj3+h5jQBg3jPZe8py8rE58iQ09j91Rr/+k9OdvJyv0/k5Qn
         w7CjEO4fYSmL0i2tovbagtiRVoFjvRdOEnPx9n4z44MFzCa5421P7LoL7bjKFxYabdCz
         aZDA==
X-Forwarded-Encrypted: i=1; AFNElJ+in2GxPWaagP1ux9Fpqvb1vUfhy+l9sfGxQl2eUbo9uhmOLXD+Ysrq0JkBtdtB6m5mvFWbLioJ5Ks=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLN27Q4JgP1Ljz8fCY4rBbqCWwCu3gxOUJlqyj9HtWTSGld+3j
	w03hj1UmknH9Sz8rDXq5OtHrNUz2NPzF/FOSAyiX0ltah7CVWVk8AaTLeZ1gCyJ1SfQ=
X-Gm-Gg: AeBDieu+6y4ef2xd5n9I+Qfx2eBCP4kIJE23Y2RUBQLJUYgplJskWsznQKZ2+qADkjE
	BXdQM1X+uE1WFJPzH/m/+6Ol88XAet2BlROa1+Ij1eWlgo4oBUXtyswtvRmssO1NOOgK/YDWqqn
	dK0HUYaewwwDlUr52PylyA961/8XqO1X4DZYfw5rT1+X43xyiE96P1EMDr3tpeUYcl+dA8yZIrg
	9wUaU5gMUcBeE/TGa+d+6igepWOGZ6y19sdqgtKvqcybi4lTzByWx+o8ri5nfJPnQs2nA3Z2kRs
	217kF2EtD0PFYH/U1Of57LTRb61KHVWQMv7aBUWz61VvNn5G9vn5p2fRhcyWx34e1TJse8+5eKE
	Iwr2ojyISD786a/ditirFbkwEoAZy8RRHcR5e48AfeAs8k/APSfALCJj5nztZDPjASlexk7yHD5
	eL5cckEoi2wgEPTKizx5BSLH691OTsMXTi5IqBXvLMNdYR94iHF2FrabpRCMCtWHDabuTA4AQMO
	FXvPjMPBfw=
X-Received: by 2002:a05:6a00:1905:b0:829:8c23:f70e with SMTP id d2e1a72fcca58-82f8c984142mr6891560b3a.45.1776501844525;
        Sat, 18 Apr 2026 01:44:04 -0700 (PDT)
Received: from ubuntu2404.huaqin.com ([101.78.151.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f932dac13sm3355896b3a.35.2026.04.18.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 01:44:02 -0700 (PDT)
From: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
To: takahiro.kuwano@infineon.com
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
Subject: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for GD25LQ255E
Date: Sat, 18 Apr 2026 16:42:53 +0800
Message-ID: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_014406_324844_43694A05 
X-CRM114-Status: GOOD (  16.02  )
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

Add support for the GigaDevice GD25LQ255E (JEDEC ID c8 60 19),
a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.

The chip supports 4K sector erase, dual read, and quad read modes.

Link: https://download.gigadevice.com/Datasheet/DS-00562-GD25LQ255E-Rev1.2.pdf

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

Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>

---
Changes in v3:
- Add SPI_NOR_4BIT_BP and SPI_NOR_TB_SR_BIT6 flag bits.
- Add /* gd25lb256 */ comment.
- Link to v2: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260313133806.2390946-1-wuweimin@huaqin.corp-partner.google.com/
- Link to v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260213144133.1778932-1-wuweimin@huaqin.corp-partner.google.com/

Refer to the following documents:
https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements

1. Specify the controller that you used to test the flash and specify the frequency at which the flash was operated:

This flash memory has been successfully tested at 100Mhz frequency on a Chromebook device running the Intel Patherlake platform, which is currently under development.

2. Dump the sysfs entries and print the md5/sha1/sha256 SFDP checksum:
root:/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
cat: /sys/bus/spi/devices/spi0.0/spi-nor/partname: No such file or directory

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
 drivers/mtd/spi-nor/gigadevice.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0ad..22a430798 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -82,6 +82,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		/* gd25lb256 */
+		.id = SNOR_ID(0xc8, 0x60, 0x19),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
 	},
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
