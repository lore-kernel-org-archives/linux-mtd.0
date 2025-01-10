Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2599E77188
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eus3JTwkwHqQMr8r9bNQ4neFSWNXosxCbmwUw+cYJ6U=; b=OYLzK92DKFx0a/
	uUJxV62wlUkZEagcIuYbqBCDCw44GAXUJXOTTkuKy2k2X6g3ihJY27wKlgRA1Q6urdECaapnBOka5
	AYdgjyvtGcVKnvJo+tYUWG8pxsUl8WWhkBQe4NvL2/tlaWrL30jRjPNRShZqv6MN9WguoLV2C+4h0
	eDw/L/os394wvX60OtOApohmblQPNhvuXajYN/oOflm7Ir56XDVmIR0tBoTmCJwF1kQKqCclpLcOu
	6N7kz0yyNqzJbOjYSVPcPjapUtsgNr4rmNPfwxZf7bS7rP5WRX/D+TJXBeXH9H4rDen9q0N6dMLPy
	vQwVOlJEHX3DO/ge0iVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGoD-0000000FsQ9-3QF8;
	Fri, 10 Jan 2025 15:20:25 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGKO-0000000FhwL-44f6
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jan 2025 14:49:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C92BDFF812;
	Fri, 10 Jan 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmbL/x83wXuvuhygKjPTmmAlsFIHT9J0+TcXtokeiR8=;
	b=XiCTR3JZOJwu38OYr1t+v5s6fS7Jb74Rs1enVjcdw/3Ifp6L1h1xl5jVkCxawDXnHVlWoQ
	k8MRGahNNyPoVkr/6XtLFv6dsRqcPWhOwXn0CWW3rswv+HsGdYdz/JHXAb4rxzHM60AER1
	daAeMfGxjZzZaez8mcxlit/CsjEF34RGaDHOzsyR6ZztP9aU09owsDzMxVC5jVTxxqEUoP
	6FBWMHsLyQTqw5o3LjtkkQ7lDPmma+nE8REXxSvp+AzySwng+2lVb/lv1uhJHIZFadDr/u
	7vFb45ZUF9i4VBRoGHAjllyBC1XIDptkPN8ZZIJiALxVComZQdBcLbVPDoIxjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:49:31 +0100
Subject: [PATCH v3 2/2] mtd: spi-nor: winbond: Add support for w25q02jv
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-2-735363f8cc7d@bootlin.com>
References: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
In-Reply-To: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064937_326577_4B2254CA 
X-CRM114-Status: GOOD (  10.88  )
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

Add support for Winbond w25q02jv spi-nor chip which shares most of
w25q01jv's specificities as, this time, the chip is made of 4 different
dies.

Link: https://www.winbond.com/resource-files/W25Q02JV_DTR%20RevD%2007092024%20Plus.pdf
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Here is the basic test procedure output:

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef7022
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ff03000102f000
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff7f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff
$ md5suum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
3e7da68579120c32a12517d2b6634c3c  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
$ dd if=/dev/urandom of=./qspi_test bs=1M count=1
1+0 records in
1+0 records out
$ mtd_debug write /dev/mtd0 0 1048576 qspi_test
Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug erase /dev/mtd0 0 1048576
Erased 1048576 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 1048576 qspi_read
Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
$ hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0100000
$ mtd_debug write /dev/mtd0 0 1048576 qspi_test
Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 1048576 qspi_read
Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
$ sha1sum qspi_test qspi_read
c662ae4e6b1268e23d5a5e930995213d2e4044cc  qspi_test
c662ae4e6b1268e23d5a5e930995213d2e4044cc  qspi_read
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index a4c0d99dde4fcd2b123eb7ded4f7822110c6a4ae..63a93c9eb9174b073e19c41eeada33b23a99b184 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -305,6 +305,10 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
+	}, {
+		/* W25Q02JV */
+		.id = SNOR_ID(0xef, 0x70, 0x22),
+		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),
 		.name = "w25m512jv",

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
