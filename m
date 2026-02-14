Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C12BEF99EA
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Feb 2026 01:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jX54VAF/kkE+7i191hI/3RvSCffwdQxUekgaDsv4YaI=; b=cQmITQts6y8nYv
	30ShpXWBq/HljRPEcLlXzLGsMB59omF/4iiHcPfQBq1969aRVqLeRuTKJcNvKNs4djFB7b/dE7oob
	8kmz51fC1BOdRUEq3yJmKoKk+o/aC1RWAubaU7U/Wqitt78TjjD5Wu24EklVyb+bwzK5mipBgX2t7
	oIGr85ak7woNnl2uvWCFID5QuhUi+5VPeE0qhgrj97ObbDH7LXOSB53lTKLJuTMrG+4wnWYKp9VaH
	6ku8X4x8/6CBoTuC4o0p2ZThxmvUEjiiQhNkEqt7Ul6ykPvbMcPnqpDjHUdDv1sYe3yB6M5Fni59Q
	XsqXWiXEkJJxYG2CuhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr473-000000046kW-239Y;
	Sat, 14 Feb 2026 01:06:21 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr470-000000046jf-1QJ4
	for linux-mtd@lists.infradead.org;
	Sat, 14 Feb 2026 01:06:19 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8220bd582ddso797226b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Feb 2026 17:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1771031177; x=1771635977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4TERTZEfw2ao4mNycWjP5pqv35fCyvygFnss7HI/Yk=;
        b=emf0qWA7GUHXC4luUhulbCPgQaEo34lAsSWAu5D0JyXdC0gY+4YHqoj6aK9EjJu/lS
         jkZybXDIjxnlvHIFykOyC7SMlq5m446wrw3w91jpSwinV4UJpgWhPEgvAaTVCDNczHZb
         u3/yeG1hzWByCEZv15WoVY1LQmPd9UrribnXh9/VICWtpq+YS4kqVo7+tEsyhpI8RrKe
         32RcSr7QWIkxmFtjTvPRh7Z7H/REs34UIxaO0a2auY8YN5o1LJrQ3RebSLI809WZDuWV
         XXU+N517pbr+lKFS/LOoifMUp49PrnEfaqqRoykbCiCkGCiEM3qx4q6hlRFf65SAxR3X
         13sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771031177; x=1771635977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4TERTZEfw2ao4mNycWjP5pqv35fCyvygFnss7HI/Yk=;
        b=sk1p0ooWTraH7CS6Iyu/vAmfCOo7gNy6F8Z5kCJ2hbJZJfaJl1NwwnY+4ZredLaAmy
         ILkBoADx4ysdJ+yEA/27qCgH+a7b557sUiWLy5E39Ozp/lAtfpfdfSqtKIGwRmIwK1wt
         NrrNrGZ5+Uh5Gaz7/ze77/HcytuSfC+ASro+l7XT5OKa0Fx2tY9R0ok0aaNT2qsiwkWa
         xR6XM57JjVU08z69fnBds7SrUm6eCvQ5nA6C+oIA/O9Z7zYJ1dudXXY3CngLXOlKOfMu
         nXs3jpO+tqZlQJWksHFO0Rxo+E4UZrhXg4dM8hIMN0q1vp3oUJOL1xbfHYnIbZj8y7HT
         SHhA==
X-Forwarded-Encrypted: i=1; AJvYcCVxg8AUnqOU1ns4hRCW+bNCiDbQYi8XnzRW0Ezd+ox7vCxWWB8GQcihl/XKFkw46ysElMWcX3kLspE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx75WtLoe3j7urpWirBPFvN+6+SaV5rlxoVVxHFbKPLOq4rzy2b
	bDyuVVk+stumitaGx0XPelxmNUiooIzCXbntdEcAIVbaHsS4dzhwZCu2B1K0ZquWLvDMVEo1YJa
	NJokypJiwZg==
X-Gm-Gg: AZuq6aLmBSJpiz5yI8ccF4zM7ERhVz9Db8dqNa5GFtJkQWWnf9dPwiBCUGp4gXXiCvE
	81+W78g33WE7NzYe6AmZx5pKzKj8kGud56HeG8dQQ+3f0xehbTpw3k+mPQvXVq6mTVYpsUobpZi
	eCbxnmpvRJpEH2D0BlzyegWw6U9QF+KZ4N7YFGzECJUWPG4GYi3s3chaLKBqEj6RZtg8GyaiYsX
	hjsIOA6EjUmdj/xiPwMHEyrTG+WR7FXSQosch6cAwWdVDiskocffbmvJg1g7J9geY8ZjscnOZ0W
	45NKE2Gipgm1hnlu8XcwnIJzpPIzambSa8XgcyFj+ByQnDkHffxqTXLBqTJ0S79Mz91ZIpCDuuV
	pKgJ22ITKHUrEtEUcFhVKp4VTkeyC1KZzz4D1DspPkKE6iiW4nENh1OysNQFbBhybf6+WQwe/Rq
	Ysm89BdGnPKNg54WQktTzEhE8MrB1nn0S4y9xyjr2J2ORvB44tT15y+KT/ElTBJ8Y=
X-Received: by 2002:a05:6a00:3d48:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-824c94e7cfcmr3398022b3a.14.1771031177288;
        Fri, 13 Feb 2026 17:06:17 -0800 (PST)
Received: from ubuntu2404.huaqin.com ([103.117.77.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb55adsm3757843b3a.62.2026.02.13.17.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 17:06:16 -0800 (PST)
From: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
To: takahiro.kuwano@infineon.com
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
Subject: [PATCH RESEND] mtd: spi-nor: gigadevice: add support for GD25LQ255E
Date: Sat, 14 Feb 2026 09:06:08 +0800
Message-ID: <20260214010608.116226-1-wuweimin@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_170618_622988_A1513A58 
X-CRM114-Status: UNSURE (   9.28  )
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
