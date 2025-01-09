Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894BBE7719A
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 20:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTCGu+f0w+qgSSb6g/Fs9IutQgVe7WS3MwwJ/YW/Qe0=; b=2mhECkc3LmjeO7
	+ionumh4341BULIN0GuguxfJnmdNdTDm4jmNwCThans7ZU3QvDiRxOfJ8kNOanAtCWW+Nt4eSboWp
	TqRvL6Q6kWyRstxc8Wnx0YwfGHFcG20LgXvKyVnDcifkon91C7J+QUoMPx/oIoKLUe1Oi1GS8e+6N
	tx+aBBeGA7xlyPsMR3fVKbZp8aVbKC9GNNzHloPfUtWVjJOmnkpCPndRV+Wiw8dxhhJs8zPfvz49O
	VkSZ7dzOrhUDPuYwfWnnEkMthC31KwerPsfUxH1tMNozASuARjv0r6wsvIk0VXlOtwQNGHVFey7KB
	SJTILLKC/YipSaJPFt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyyb-0000000DCu1-1Nkj;
	Thu, 09 Jan 2025 20:17:57 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyyW-0000000DCsH-38fh
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 20:17:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AB5B6000A;
	Thu,  9 Jan 2025 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736453870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CehoOF6hW64bjE5+JEwZUVzVE68OkxXhgMwuCeOKYo=;
	b=Eg6hUiJID3Q12wGvJIGmGQkPidclYCfh9W9/RYk4pKHqk8na70IdzWmBfuxOf4Tq3veU9O
	Eky86Og/zcs9pNS1r6pZ7HlibbNSlwWuvNSUB35llxlSvDL9HC2+F7kkO439DyjwOWS/ub
	1I1ipcxyGpEce7AXpKXPx1h6oBjxlhNc8znaH/zOdsrv7Fm3AObD8wo4IRcYfVEs/zRv2Q
	Js5XcrASutC/Yb2F5O8xvO0fUt3RnVBlI4D+TbwCbogKrDNXBJOagSW54PWYtP6IpPphHU
	qJcQdhIvswKHJRt1aH9Ow6z72ehDLivNRpldSS0mMTBIvk2OprlRlJp6VHSqqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 09 Jan 2025 21:17:25 +0100
Subject: [PATCH v2 2/2] mtd: spi-nor: winbond: Add support for w25q02jv
MIME-Version: 1.0
Message-Id: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-2-e8cd0812fe4e@bootlin.com>
References: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com>
In-Reply-To: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20250109_121753_085746_437B1B54 
X-CRM114-Status: GOOD (  10.36  )
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
index a4c0d99dde4fcd2b123eb7ded4f7822110c6a4ae..d82962e0bf7d8e00b305fd838274a58c34dd6c4e 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -305,6 +305,10 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
+	}, {
+		.id = SNOR_ID(0xef, 0x70, 0x22),
+		/* W25Q02JV */
+		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),
 		.name = "w25m512jv",

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
