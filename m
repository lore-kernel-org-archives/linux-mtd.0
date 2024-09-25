Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F9C369AB
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDoUsNzbxnT5IUff2A669O7tvXBD5a21AqrnyAwi/fg=; b=4pftBpYxl6BA5L
	qU7G47m1/eiukvGUK5RTLM2SbBZFP6jhzxfX1DQK/orIK61cRIpGGuAvXXB/35Mr3NeQ6O/WkyUc6
	4LI1G6XKsp/0BZ3tdD5I5qj1lcCQJaSpxqB0+6wAkz2wOUioEEqtQWJ5Fgzao53idQ4+g2HZnQRUQ
	n+sg8o5gUuO5GyXwk0HXJktlNXWXnUOPboLqBYcUoiEidxKOjqxRxKtmz14Gd+PxjKvwSUd5MbSmG
	GnXnO6LEKnfa9chsLkZgHfV20iyIAGyGOVD2KhYQosXy9KWBUwV3aGUsXhbsvq7P6BEZtd28Ta/0F
	KsC2Z3R5JnL+0E1DVIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMof-00000004OrF-4BRO;
	Wed, 25 Sep 2024 07:52:06 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMmF-00000004OFL-43Se
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 07:49:37 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4XD85568QfzMR9w;
	Wed, 25 Sep 2024 07:49:29 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH 2/2] mtd: spi-nor: macronix: add manufacturer flags
Date: Wed, 25 Sep 2024 09:49:03 +0200
Message-Id: <20240925074903.1983601-3-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240925074903.1983601-1-erezgeva@nwtime.org>
References: <20240925074903.1983601-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_004936_071719_549A6AD8 
X-CRM114-Status: GOOD (  12.48  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Add flag for always trying reading SFDP.
All new chips from Macronix support SFDP.
All old chips in the IDs table were reused by new chips.
There is no reason the skip SFDP
when using now chips that reuse old JEDEC IDs.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---

Notes:
    * Testing with MX25L3233F using BeagleBone Black.
    
    * After adding the new patch of always reading the SFDP
    
    $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
    c22016
    $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
    macronix
    $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
    mx25l3205d
    $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
    53464450000101ff00000109300000ffc2000104600000ffffffffffffff
    ffffffffffffffffffffffffffffffffffffe520f1ffffffff0144eb086b
    083b04bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
    ffffffffffff003650269ef97764fecfffffffffffff
    $ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
    22d5d34af77c3628300056a0fc4bfbeafa027f544998852cf27f7cebf7881196  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
    
    $ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
    Supported read modes by the flash
     1S-1S-1S
      opcode        0x03
      mode cycles   0
      dummy cycles  0
     1S-1S-2S
      opcode        0x3b
      mode cycles   0
      dummy cycles  8
     1S-2S-2S
      opcode        0xbb
      mode cycles   0
      dummy cycles  4
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
    
    $ cat /sys/kernel/debug/spi-nor/spi0.0/params
    name            mx25l3205d
    id              c2 20 16 c2 20 16
    size            4.00 MiB
    write size      1
    page size       256
    address nbytes  3
    flags           HAS_16BIT_SR
    
    opcodes
     read           0x03
      dummy cycles  0
     erase          0x20
     program        0x02
     8D extension   none
    
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
    
    # mtd_debug info /dev/mtd0
    mtd.type = MTD_NORFLASH
    mtd.flags = MTD_CAP_NORFLASH
    mtd.size = 4194304 (4M)
    mtd.erasesize = 4096 (4K)
    mtd.writesize = 1
    mtd.oobsize = 0
    regions = 0
    
    * Test that mimic old Macronix chip lack SFDP.
    * In order to check how will the driver cope with an old Macronix chip.
    * As we do not posses such an old chip, we will change RDSFDP to an unused opcode.
    
    $ git diff -U0
    diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
    index 4ebc527aadc1..784cba9b2d0d 100644
    --- a/include/linux/mtd/spi-nor.h
    +++ b/include/linux/mtd/spi-nor.h
    @@ -47 +47 @@
    -#define SPINOR_OP_RDSFDP       0x5a    /* Read SFDP */
    +#define SPINOR_OP_RDSFDP       0x57    /* Read SFDP */
    
    # dmesg | grep spi
    [   42.436974] spi-nor spi0.0: mx25l3205d (4096 Kbytes)
    
    * No error in kernel log!
    
    # ls /sys/bus/spi/devices/spi0.0/spi-nor/
    jedec_id  manufacturer  partname
    
    * No SFDP, as expected!
    
    $ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
    Supported read modes by the flash
     1S-1S-1S
      opcode        0x03
      mode cycles   0
      dummy cycles  0
    
    Supported page program modes by the flash
     1S-1S-1S
      opcode        0x02
    
    $ cat /sys/kernel/debug/spi-nor/spi0.0/params
    name            mx25l3205d
    id              c2 20 16 c2 20 16
    size            4.00 MiB
    write size      1
    page size       256
    address nbytes  3
    flags           HAS_16BIT_SR
    
    opcodes
     read           0x03
      dummy cycles  0
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

 drivers/mtd/spi-nor/macronix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..292a149c37d8 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -208,4 +208,5 @@ const struct spi_nor_manufacturer spi_nor_macronix = {
 	.parts = macronix_nor_parts,
 	.nparts = ARRAY_SIZE(macronix_nor_parts),
 	.fixups = &macronix_nor_fixups,
+	.flags = SPI_NOR_MANUFACT_TRY_SFDP,
 };
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
