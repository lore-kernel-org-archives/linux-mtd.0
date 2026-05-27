Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ECCCD5BD1
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 03:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mEnBPWLu21FLRFytk5AJ4ONIG7JZQdhm1yOlZgSM84=; b=JiyyZT+kn/jPzT
	68MBe5B/1/FuiKSQh2nbwpEV/7vDroY+rSyX+fvHELrGVMK1rRNiwnbiwfeFkbUTWixYMbsqK+00E
	SONCWxtnFW8p9WinZipu825WNHpJTnaz/Iw4k5npOQvZVjUfs6GWt0M4HNRRmjjZoZw/AEkdXFysf
	mA5+CloRF5SzF0+AwcX6NdBXgwRv2vnGi5k1kn6fg3QKe5kcw1RvRxwpSq/brESCItfz5AnKsB2VR
	mldlzCJJjrB+C4/BYZsw033LYUJ1sZA5pvPQgFzzhKFK8/4MoMlm+s7XLOOwSFiYXWwAs7FZN4rqb
	WTOfun/lK3HhNBgG4xLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xG-00000003EIi-1dW3;
	Wed, 27 May 2026 03:29:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xC-00000003EI5-2HhO
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 03:29:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36a7bbb9698so2671286a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 26 May 2026 20:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1779852549; x=1780457349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EadHXbD47BB2Otw742UEoexqEqx0bBPGGslMs8yT7qA=;
        b=vnoEqVg5n2hihZ0+y4wX1rJ5e3EL0d5hpAzqeZxRkNC/aXRfyHRANJAE4kDwFZiusp
         6vONAJiIGuMq6PHbOZjDWAYJ43+tMsBOHdr0upRJUgtWpBZxQs7wMV2UUAOE52brjsA+
         qb3204a7uL8Q3oIHm4rTyGarjx5zkpHpsuueBtU5FDrqpAggGoX5FZdSbqI3tb1M+Xn0
         MJ5zbTqgiac/5mV3PaPVxvXuKnmlaEMtkLrTbJOsOiXtydS3FGdY4uwAi2EsBFzTKSjQ
         v4nusyzybxLTkBFqLMx2JdfyiItL5Dsp5eRDQ9IbEswKaRPhfhUZSLU50ysEYN3ZTM8t
         udVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852549; x=1780457349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EadHXbD47BB2Otw742UEoexqEqx0bBPGGslMs8yT7qA=;
        b=eF0LqSBpEgbJ53az3fXQLW1OYNl3ci1tur6FMZhdvL4DhRqM5adL+3Mpwzqhyojej6
         nV9kJWJBoI9ETIOe9AsCkmc/wOyHMMRzp0qkTL1dUhf2u3VKHe3zdWpbi2z43STqUCiU
         8Cw59VewmglBVw27+SbZM0jixThjaOVpkqYX63ZcXLuQ4t+6YoXGBmL2jS+BILWIRbQw
         BpSIbgd4eSA9TG7Zz4TsJ6JlAO9nIcSBHMkPoOwSczLeYnMBlQO344oPQ8Jpn2dxSQmE
         zmrbIS2/p5WeTNQNf3G9EK2t9h3mQNwIOcJqdUAmlZfiLCZnGvbT9x5YuGxl6YLgeiEO
         XoVA==
X-Forwarded-Encrypted: i=1; AFNElJ9ir03I9sahyS3OYVOkhKQ4v6MR1/aAfbrRjeA0mof5MaDFLgbujjh3SY2AUcz6jL6iDyFIpTF7O3A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4UbKu1BME9QqcA9YKGUcgyaU/pN3c0L5jT59LYaiaebQ7lTc
	fVaIR3StPAN1vIDwq9PhR3QVBj0kb235cmHxnv83/OTPz3J1jbpZarFP8sLaSYhG+kM=
X-Gm-Gg: Acq92OEwwJIkyWI+SxKcBxFjZJ9jh09n71l9vhq25O9U8/8GwLCeJfSQbHbFya7Qdf8
	RVRdoEvVFLtraA/4KpPwunUuNX8yMj6FcbNICTz5kZ3gmRt1aBGoBwKRlGsm7RwijY42AA7enlx
	Twq0dF5h1ZUreqVwJEcsG1U5hRNVzVgE0zGZn80Wxh7WxmZzLcmdHUoNDlg0uX6IdvJ3AoUyTnR
	ncdO0PnlpX9D7JHmNPvFJS6wbqHVKa08bPRSB1tNeqIee9wpPpdlXYo/8A9kgKeBqGKLE1JVY3V
	P8uSDfiVTx8kJrUHz85OjdJr2/8dk74ZqrJXVtezyXVjBfEtcNCPaJ4vIAQvK9z2AqR56nfrNdv
	RZQ2Iavqa1ASspUCHgtivXCUwvaac8zK3vnIUG0eFY5arjNCJ2E1bScbs8pFaeuulmYn6LjJbhl
	YPnxrqB7FyAtAsX4Tz1dw8xYLguareK50xkauWLLxBr/Hm/+gyj9TbibRcigLtHNWmoZj/4cJZ
X-Received: by 2002:a17:90b:5845:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-36a6765a7b1mr20000860a91.16.1779852549387;
        Tue, 26 May 2026 20:29:09 -0700 (PDT)
Received: from ubuntu2404.huaqin.com ([101.78.151.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cf56sm13230448a91.12.2026.05.26.20.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:09 -0700 (PDT)
From: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
To: wuweimin@huaqin.corp-partner.google.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	mwalle@kernel.org,
	pratyush@kernel.org,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org
Subject: [PATCH] [v4] mtd: spi-nor: gigadevice: Add support for GD25LQ256H
Date: Wed, 27 May 2026 11:28:23 +0800
Message-ID: <20260527032823.771616-1-wuweimin@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_202910_838289_B828ECB1 
X-CRM114-Status: GOOD (  17.58  )
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

Add support for the GigaDevice GD25LQ256H (JEDEC ID c8 60 19),
a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.

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

Link: https://download.gigadevice.com/Datasheet/DS-01085-GD25LQ256H-Rev1.3.pdf

Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>

---
Changes in v4:
- Change title from GD25LQ255E to GD25LQ256H, and change datasheet link.
- Delete /* gd25lb256 */ comment.
- Link to v3: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com/
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

4. Use mtd-utils and verify that erase, read and page program operations work fine:
Because Chromebooks lack the necessary mtd-utils directives, the corresponding data cannot be provided.
---
---
 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70..63087d3de255 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -82,6 +82,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x19),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
 	},
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
