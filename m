Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB35EDF170
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jX54VAF/kkE+7i191hI/3RvSCffwdQxUekgaDsv4YaI=; b=CsiH0wek1pBBuE
	J0amJ+dDEpxLWzoyqQa+lNDRWwi3i5o/4xGbO8RnQsnUGVEMtrAj+Hx30c7A1F+NV3cd004a3SROr
	CJBJjfW2zQBKO2rcGuyRsByoFExZUqL8/5nXEuQt/PMGj3yj9GQBuqmtqO4y7n7mIRLO7TrcPo9ba
	8rirf2YBaadHHTkPKAF27pql88DXyd8ScII7StST46UDms0lovaja/iuI+ZjYUfkc/WuU/62g40Wz
	9SGYuHI6qXDOqjt6rbUP2ag8QbvxHUCKixyn6cxiJ/IuZ6iZVhDLp40mOCwhtD7TPeI/oUPXBL0kj
	7jyDE6Y7gs2f6NscJzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquNi-00000003ZgP-1VII;
	Fri, 13 Feb 2026 14:42:54 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquNe-00000003Zg6-3lRj
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 14:42:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8230d228372so621251b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Feb 2026 06:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1770993769; x=1771598569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4TERTZEfw2ao4mNycWjP5pqv35fCyvygFnss7HI/Yk=;
        b=wRISpDHhZI3zDDfPalutXfKqutU6FWN6Wu3/WW1kBbQivSqAKG/92sV5WZ6dJbPUd8
         /6uMJUHESKZz7RUvg2nxnbdn7ggI6Jsw+8FUHezprcSbKhu/+MmRxWmQj+e9KPfHkF7J
         C90ZgCJm9ogil49nad2lmB3SD0q5CtnJ8bEMU7XVjcbTW+EN0LQ490ZpWvIh6/jfFXYp
         WXbTDlWSS5suBH6r9v6BuAU4fTDtLTSEqGO8ie9k+8wqDcgS2rF5TPgRyNMBsrxZ25Mr
         X2bDWCJ7XZOQdyKOwKtV9pZvBDRz27qGj89AQOfGCs7IMiQM3yMUk/Ljf+LxWjUIB9lH
         0ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993769; x=1771598569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4TERTZEfw2ao4mNycWjP5pqv35fCyvygFnss7HI/Yk=;
        b=NzeDBhcVV8jjQq2rGtd8toRYtZZltCtE+SQRMr1apkrzWztAxn86GM5RgSCLixXSg/
         ZPcZWPaFsZhfNG7qBx4JdC3tQ4Txva/kQnJE9nHQGeSUhcBSDcxZUKHUfdwGulE1IC5s
         +QjDaBp12W383azkWN1+Ic1oplbnRH4FpQPiDA7nt/KCX8SdXcG098IcMOici26OADDG
         goQVppvKyTugYsCNqbFDq7Q8jnYnHGy4oHnKH0R0ecyLTiyLSMAjNkhFjVgup0lqIH+7
         JP7eIFBKC6XU0e13VA0vonosuWqh8vJOEFxVKHlZ3ADZpuaNQadKneP/M1k5S+ya/eJs
         bsmw==
X-Forwarded-Encrypted: i=1; AJvYcCWMVnFExG+L+PNDVLUgsuH3VBtb4OxGrj3EO9DJGYCYZFJ2cX+m9hh97uVF55SdpdPX+moU0ij2bSo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSF8tgorfgKbLXrO8vgzCovPIhvP2UNzpe740tux2wuFahYRDA
	r3xZrV38ADc7GXe5ep9e/DNPKTAnFUKhRiyNptLbI91hWuSqaVkk7Q8QE7slKpyC/Ghp2EMhLxY
	Q17nhz2KH9Q==
X-Gm-Gg: AZuq6aLwD9gfcXdfUX+aiKUbYRQ6IYKWlfqk68Jhrh+Qru7YweIvTi7hNimqF4EhPiT
	F/++Dp+vZnu7mx9y1nvclXHQtQlRyiZOH0oAPmMYU+ZLom20ZMLCLeq0X9fIhm8AZX3v1jb9V/F
	q5vtun68+KMjl+zY+HuroLVU6rUqY4DU5lj+CrfdAosBh06jaPtyDtF5PAzLbsgzEB8NrBQspa1
	V+F4T5Fx029L4Vq3xTexnHooTCnboayodT0wtM//ILn3yiLaudPXxCExhseTZHQLFc5LEVWFT/2
	jtY2G0zBYbNhK2+N+UrJ+pmAhWUpGdissYOyXC/IdWw6MkrH5OZ9JndoOfedUDrPa3mIKGR4SMA
	+IdsJd/eG8PjRyOsMxSBwCs3ardZTTCUjz/JnqeFA+iWVFeGp/ln/Lc4JasidJhxGKC6JsYXmTw
	khGI7NEzWERS5D9qBohxoFWJ/3QNrH47rkMX5mMPdsyeQDLVxWCKA0Mmfcu7aeJmo=
X-Received: by 2002:a05:6a21:1fc8:b0:366:14ac:e20f with SMTP id adf61e73a8af0-3946c9726camr1908662637.77.1770993769034;
        Fri, 13 Feb 2026 06:42:49 -0800 (PST)
Received: from ubuntu2404.huaqin.com ([103.117.77.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d93c0sm7912513a12.17.2026.02.13.06.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:42:48 -0800 (PST)
From: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
To: tudor.ambarus@linaro.org
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
Subject: [PATCH] mtd: spi-nor: gigadevice: add support for GD25LQ255E
Date: Fri, 13 Feb 2026 22:41:33 +0800
Message-ID: <20260213144133.1778932-1-wuweimin@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_064251_104478_37A11D7E 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

gd25lq255e is similar with gd25lq256d, has 32MB of total capacity.
It support Quad Page Program which mean programming the memory using
four pins: IO0, IO1, IO2, and IO3.

Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>

---
/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd25lq256d

/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice

/ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c86019

/ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc8000103900000ff84000102c000
00ffffffffffffffffffffffffffffffffffe520f3ffffffff0f44eb086b
083b42bbfeffffffffff00ffffff44eb0c200f5210d800ffd439a5fe82e4
1452ec6216337a757a7504bdd55c2906140008500001ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff002050169df9
77648fdbffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff0effff215cdcff

/ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
9f56d460181f7c0b6cc16a69554e3b587948b5f65323e976d0a4f1dbbcb93d94  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

/ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
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
  mode cycles	2
  dummy cycles	2
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
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34

/ # cat /sys/kernel/debug/spi-nor/spi0.0/params
name		gd25lq256d
id		c8 60 19 c8 60 19
size		32.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET

opcodes
 read		0x0c
  dummy cycles	8
 erase		0xdc
 program	0x12
 8D extension	none

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
---
 drivers/mtd/spi-nor/gigadevice.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0ad..356a3f196 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -82,6 +82,12 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x19),
+		.name = "gd25lq256d",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_QUAD_PP,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
