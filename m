Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B167CF9C5F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RupEymXHnWtEcCC2UL05FcZ6ku86fAz4ywbVFU9di5s=; b=tMWQxjNya5W8JG
	zKwhkA0/MjXGJSSTuvWYG+jGfFH9Y14FzBenNW5mnHlqrYiOvT22GtQ9rJN7Pq9M/ZnmfTFdl/aCG
	JrdX3amVWtFeYfQbqlqDvSpBzDG+P0plp6YhZucWqQmb5I5w99mOF517lk9Zw1g9jXWUTW8XrdkOl
	Z9F/D1IPSLUqYYuOgyxQ6dlsioscmZ/+64csDOuO08wztI2fEOkt2Aoqs7krClBZuWx/j7JtSAx+L
	a92Biw0QpNxs38ir5m0fxxJbh7OXxVdx22L/N95uy2uwR5Q23fFIwAMS7V6pxjFekiBrPVCr9KHBJ
	xAuMfjgk9vCTjVpe7hIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sriGl-0000000CnPv-0IV5;
	Fri, 20 Sep 2024 18:22:15 +0000
Received: from chessie.fmt1.pfcs.com ([2001:470:1:205::234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sriGf-0000000CnMS-2ZwW
	for linux-mtd@lists.infradead.org;
	Fri, 20 Sep 2024 18:22:11 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4X9L992M2YzMR7w;
	Fri, 20 Sep 2024 18:13:17 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v5 5/5] mtd: spi-nor: macronix: add manufacturer flags
Date: Fri, 20 Sep 2024 20:12:31 +0200
Message-Id: <20240920181231.20542-6-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240920181231.20542-1-erezgeva@nwtime.org>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_112209_712794_EF104A8A 
X-CRM114-Status: GOOD (  12.75  )
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

Add flag for always trying reading SFDP:
All new chips from Macronix support SFDP.
All old chips in the IDs table were reused by new chips.

Add flag for reading OTP parameters from device tree.
As Macronix reuse JEDEC IDs, there is no way to determine OTP parameters.
Allow users to define the OTP parameters in device tree.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---

Notes:
    * My initial Macronix OTP code was tested with MX25l12833F.
    * As I no longer have that hardware.
    
    * I now testing with MX25L3233F connected to my BeagleBone Black
    *  through an 8-PIN SOP (200mil).
    * The BeagleBone Black runs with Debian GNU/Linux 12.
    * And use Kernel 6.6.32-ti-arm32-r5 build with
    *  arm-linux-gnueabihf-gcc gcc version 12.2.0 (Debian 12.2.0-14).
    
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
    
    * The BeagleBone Black SPI is very slow, Tests are slow.
    
    # dd if=/dev/urandom of=./spi_test bs=1M count=2
    2+0 records in
    2+0 records out
    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0682607 s, 30.7 MB/s
    
    # time mtd_debug erase /dev/mtd0 0 2097152
    Erased 2097152 bytes from address 0x00000000 in flash
    
    real    0m12.703s
    user    0m0.000s
    sys     0m12.692s
    
    # time mtd_debug read /dev/mtd0 0 2097152 spi_read
    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
    
    real    0m1.942s
    user    0m0.000s
    sys     0m0.053s
    
    # hexdump spi_read
    0000000 ffff ffff ffff ffff ffff ffff ffff ffff
    *
    0200000
    
    # sha256sum spi_read
    4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
    
    # time mtd_debug write /dev/mtd0 0 2097152 spi_test
    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
    
    real    0m5.883s
    user    0m0.006s
    sys     0m3.970s
    
    # time mtd_debug read /dev/mtd0 0 2097152 spi_read
    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
    
    real    0m2.208s
    user    0m0.003s
    sys     0m0.063s
    
    # sha256sum spi*
    f4f5d1d0a4fef487037cdb3f1be0f9aab68ca32f2dbe8782c927f03adf623ec3  spi_read
    f4f5d1d0a4fef487037cdb3f1be0f9aab68ca32f2dbe8782c927f03adf623ec3  spi_test
    
    # time mtd_debug erase /dev/mtd0 0 2097152
    Erased 2097152 bytes from address 0x00000000 in flash
    
    real    0m12.126s
    user    0m0.001s
    sys     0m12.115s
    
    # time mtd_debug read /dev/mtd0 0 2097152 spi_read
    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
    
    real    0m2.611s
    user    0m0.000s
    sys     0m0.064s
    
    # sha256sum spi*
    4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
    f4f5d1d0a4fef487037cdb3f1be0f9aab68ca32f2dbe8782c927f03adf623ec3  spi_test
    
    * MX25L3233F OTP uses 1 region of size of 4096 bits
    
    $ git diff -U1
    diff --git a/arch/arm/boot/dts/ti/omap/BB-SPINOR-00A0.dtso b/arch/arm/boot/dts/ti/omap/BB-SPINOR-00A0.dtso
    index 333a6b9556ed..adaddfaa8091 100644
    --- a/arch/arm/boot/dts/ti/omap/BB-SPINOR-00A0.dtso
    +++ b/arch/arm/boot/dts/ti/omap/BB-SPINOR-00A0.dtso
    @@ -63,6 +63,8 @@ channel@0 {
                    compatible = "jedec,spi-nor";
    +               otp-len = <512>;
    +               otp-n-regions = <1>;
    
    # flash_otp_info -u /dev/mtd0
    Number of OTP user blocks on /dev/mtd0: 1
    block  0:  offset = 0x0000  size = 512 bytes  [unlocked]
    
    # flash_otp_dump -u /dev/mtd0
    OTP user data for /dev/mtd0
    0x0000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x00a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x00b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x00c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x00d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x00e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x00f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x0190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x01a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x01b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x01c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x01d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x01e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    0x01f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    
    * Macronix OTP does not support erase!
    * flash_otp_erase
    
    # printf '\xde\xad%.0s' {1..256} | flash_otp_write -u /dev/mtd0 0
    Writing OTP user data on /dev/mtd0 at offset 0x0
    Wrote 512 bytes of OTP user data
    
    # flash_otp_dump -u /dev/mtd0
    OTP user data for /dev/mtd0
    0x0000: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0010: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0020: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0030: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0040: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0050: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0060: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0070: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0080: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0090: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00a0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00b0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00c0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00d0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00e0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00f0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0100: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0110: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0120: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0130: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0140: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0150: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0160: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0170: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0180: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0190: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01a0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01b0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01c0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01d0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01e0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01f0: de ad de ad de ad de ad de ad de ad de ad de ad
    
    # flash_otp_info -u /dev/mtd0
    Number of OTP user blocks on /dev/mtd0: 1
    block  0:  offset = 0x0000  size = 512 bytes  [unlocked]
    
    # printf '\xff\xff%.0s' {1..256} | flash_otp_write -u /dev/mtd0 0
    Writing OTP user data on /dev/mtd0 at offset 0x0
    Wrote 512 bytes of OTP user data
    
    # We cannot overwrite '0' with '1'!
    
    # flash_otp_dump -u /dev/mtd0
    OTP user data for /dev/mtd0
    0x0000: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0010: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0020: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0030: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0040: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0050: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0060: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0070: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0080: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0090: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00a0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00b0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00c0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00d0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00e0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00f0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0100: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0110: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0120: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0130: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0140: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0150: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0160: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0170: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0180: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0190: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01a0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01b0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01c0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01d0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01e0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01f0: de ad de ad de ad de ad de ad de ad de ad de ad
    
    # flash_otp_lock -u /dev/mtd0 0 512
    About to lock OTP user data on /dev/mtd0 from 0x0 to 0x200
    flash_otp_lock: Are you sure? (y/N) y
    Done.
    
    # flash_otp_info -u /dev/mtd0
    Number of OTP user blocks on /dev/mtd0: 1
    block  0:  offset = 0x0000  size = 512 bytes  [locked]
    
    # printf '\x00\x00%.0s' {1..256} | flash_otp_write -u /dev/mtd0 0
    Writing OTP user data on /dev/mtd0 at offset 0x0
    write(): Read-only file system
    
    # flash_otp_dump -u /dev/mtd0
    OTP user data for /dev/mtd0
    0x0000: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0010: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0020: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0030: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0040: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0050: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0060: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0070: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0080: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0090: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00a0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00b0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00c0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00d0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00e0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x00f0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0100: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0110: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0120: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0130: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0140: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0150: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0160: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0170: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0180: de ad de ad de ad de ad de ad de ad de ad de ad
    0x0190: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01a0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01b0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01c0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01d0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01e0: de ad de ad de ad de ad de ad de ad de ad de ad
    0x01f0: de ad de ad de ad de ad de ad de ad de ad de ad
    
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
index bee62e9051d6..5a69d5a48033 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -375,4 +375,5 @@ const struct spi_nor_manufacturer spi_nor_macronix = {
 	.parts = macronix_nor_parts,
 	.nparts = ARRAY_SIZE(macronix_nor_parts),
 	.fixups = &macronix_nor_fixups,
+	.flags = SPI_NOR_MANUFACT_TRY_SFDP | SPI_NOR_MANUFACT_DT_OTP,
 };
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
