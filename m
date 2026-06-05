Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03295CD6E6B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p/ib5RWU+NqmEHXa4TeBjQJOP1iq4S8pUOo7C5T1OrM=; b=A6hxJuTYuj71Ad
	/UqcITl8N2m74mjd2RkF+n+cXGt+7K96LZLvpZ4NgdG+RiZ3C+6h/KNloK/djU/KD/fP2PmqjvhJ1
	Mm3ySQ/OrWyDojIV9ItplwDt3IK9fV1NEX1WGZrFJN3xAcFFpmyxZfJJOLzqq6Njehs8VyS/KBdDF
	wckxZ+JwiB5LfVltS5vjMDDJTrnGIfsb/+18He6j2iqKcHXVSsYyJNDpkAlJ6CLBXa9GRHO1rojw2
	Iyy7LiR9GmusawiO0eFxGaqfHjnPnzIw/1yabbrOgSxR5LKwH290Y3hUIZ/n9Dh9Un/JU+UdPhLYh
	bS6hOSdsg3KlkEUoFw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQGW-00000000LId-3Nd3;
	Fri, 05 Jun 2026 08:50:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQGT-00000000LH0-1UtB
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 08:50:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf1cda2b17so12271395ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2026 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780649452; x=1781254252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hwnf/A0XxdhpusoY3ScWn8gJQmptVFR3j+BHQ5Mrdb0=;
        b=F68eyngGrptQmSuACvQRhosoiRDVvy0TiLPeQCLgwbENFZvG+mv0SBcQ10EMpTs2Rp
         JqYNOpyhvol5ulC0J+/Xnunl3q2v4bYpn0k7HPp9NN99h6fPqKq0/3M2a4zPv8eO+BMJ
         TBpYfTZrPTzMBTMazQwNhnH+RrP0zTebaIXSAp6iKT0xZMSZ3jgXRcA+/HTdO/i6QYtM
         Ss1ANDarbviaJGrjnwqLQU7sio8e9xY+8N8kR9iqQftJbnjxKEg6In+BYnGkzfB8P7Ny
         M0wOZiFlQPfo5ARqodPyOB5ZxQBycEOhcFiMXP0Yd/1768yRlKTFIqan/19jrwawkdpe
         GFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649452; x=1781254252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hwnf/A0XxdhpusoY3ScWn8gJQmptVFR3j+BHQ5Mrdb0=;
        b=kbEGwX3/KK3w3vPElOCaC5ukn3EbdltXuc+is5GeH/nuOXruKl6ZSrpa0XWLapyE9a
         /qTcqOoVm3OC0wniyEOUDPMHBzl+O9noiJP1gXDalubzKRvr57ZMA7U/Mq2tLy6+bYQA
         9/9GqvywB+Bny0j4W53yF557l/DrLO+mMjqlZQrwyKHwME2dMZsEGIS79K4rfLOJWR9J
         i4x9rSyBlbf11VXc/yYBn4IJadcbb2k64AJzqoDStxS1a8FjixgtfnRPhhrIXYw0KSgU
         b6WblQaefCoQ0x78IaIZIHHHtVaM+bbRkeWz1Au8rXI1BRfPNvLKtIQ1GkrIkX+D/+nS
         ueeQ==
X-Gm-Message-State: AOJu0Yydz/0hGqeUk7VYxxCSBBkEUSDqCAl3hGLhcG6x3dGC17K1T2vX
	kutol1ywzglxc3ZKM3Uj4opBjqRP5W51UMtOstGSVBpHpUzOtXIjPM8y
X-Gm-Gg: Acq92OETe07U3X1ARyTQ+hzTveCziJsHJtsSnzabFLB8AFrT4FWfwX4Tm5sx3VtRon1
	7CJSuOGJyJKP29eoyJEGqit/2ygRNVHjjrFwAQNftxU/fxqVPVajqQhN70FSp0Tx07IagDNDfgG
	8XhHS7dB/oG73L5WDTChDyiKDWKhi7mWH/Td7Kpiop72F8vyy/SbwCSJkmcZvA4eKKnHiMsKmdx
	6+vMu8J4PCB9QeAcdQvOJIqxEddl5sXRlbKlAxVkhL8jspyg/xQU3bV+zNkhqbQn0zzZTJEU9tk
	QcL/6YuBi1IIEGjnJK5cT+zqPTC4ncZOBzsKOLbFrBqELmqEOiqnpRCscyJ/6fTlrqPUebuhvJH
	KreOjJgC0wFs7MxENp2B//FEEB3mnD0I4lYPD2oiuHUgHF7uzOZMhGKGTGe/rZOqrArVnaBStuV
	WaThPfBO5plOSQHB1hAuj7Y4PQ2bZp/ddeOdcSVTeR5lIGlXm2UnVyQGwv
X-Received: by 2002:a17:903:2985:b0:2bf:22ac:a7d8 with SMTP id d9443c01a7336-2c1ec3f40d3mr17323985ad.5.1780649452362;
        Fri, 05 Jun 2026 01:50:52 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c01asm86760605ad.74.2026.06.05.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 01:50:51 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id AA35F4163B71;
	Fri,  5 Jun 2026 16:50:49 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 0/2] mtd: spi-nor: macronix: Add support for MX25L12833F and MX25L12845G
Date: Fri,  5 Jun 2026 16:48:35 +0800
Message-Id: <20260605084837.1875896-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_015053_403878_0A9196DC 
X-CRM114-Status: GOOD (  17.02  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This is v3 of the patch series adding support for Macronix MX25L12833F
and MX25L12845G, and restoring fallback parameters for MX25L12805D.

I would like to sincerely apologize for the build errors in v2 reported by
the kernel test robot. I had made further modifications and fixed the
issues during my local testing, but I accidentally submitted an older,
incorrect version of the patches.

In this v3, I have corrected the mistake and changed the fixup hook to use
`post_sfdp` instead of `post_bfpt`.

Changes in v3:
- Changed the fixup hook from `post_bfpt` to `post_sfdp` for MX25L12805D.
- Fixed the build error caused by the incompatible pointer type in v2.

Changes in v2:
- Patch 1: Changed the fixup hook from late_init to post_bfpt. Since
  the legacy MX25L12805D lacks SFDP, it will not execute post_bfpt.
  This safely isolates the newer MX25L12833F/45G (which support SFDP)
  and enables 4PP for them without breaking the legacy part.
- Patch 1: Added detailed comments inside the fixup function explaining
  the ID collision and the rationale behind the hook choice, as
  suggested by reviewers.
- Patch 2 (New): Added a separate patch to restore the missing .size
  and .no_sfdp_flags fallback parameters for the legacy MX25L12805D.
  This fixes a probe failure caused by a previous commit and includes
  the appropriate Fixes and Cc: stable tags.

Below are the test results after applying the patch provided by Michael:
- mx25l12833f
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities 
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
 4S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
 1S-4S-4S
  opcode        0x38

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params 
name            (null)
id              c2 20 18 c2 20 18
size            16.0 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_LOCK | HAS_4BIT_BP | SOFT_RESET

opcodes
 read           0xeb
  dummy cycles  6
 erase          0xd8
 program        0x38
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-00ffffff |     [   3] | no

zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.083756 seconds, 23.9MB/s

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> hexdump /tmp/spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

zynq> sha256sum /tmp/spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read

zynq> mtd_debug write /dev/mtd0 0 2097152 /tmp/spi_test 
Copied 2097152 bytes from /tmp/spi_test to address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
07bc3ccaac03ebf2b46c78f0be620bb22ce431ed39044d89af9e57481dcdea82  /tmp/spi_read
07bc3ccaac03ebf2b46c78f0be620bb22ce431ed39044d89af9e57481dcdea82  /tmp/spi_test

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
07bc3ccaac03ebf2b46c78f0be620bb22ce431ed39044d89af9e57481dcdea82  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

-mx25l12845g
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities 
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
 4S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
 1S-4S-4S
  opcode        0x38

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params 
name            (null)
id              c2 20 18 c2 20 18
size            16.0 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_LOCK | HAS_4BIT_BP | SOFT_RESET

opcodes
 read           0xeb
  dummy cycles  6
 erase          0xd8
 program        0x38
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-00ffffff |     [   3] | no

zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.084527 seconds, 23.7MB/s

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> hexdump /tmp/spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

zynq> sha256sum /tmp/spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read

zynq> mtd_debug write /dev/mtd0 0 2097152 /tmp/spi_test 
Copied 2097152 bytes from /tmp/spi_test to address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
926c0e33670888d2c0d9d602a502ccc0aacb52afe58b9d430ebcb88137a8e3bf  /tmp/spi_read
926c0e33670888d2c0d9d602a502ccc0aacb52afe58b9d430ebcb88137a8e3bf  /tmp/spi_test

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
926c0e33670888d2c0d9d602a502ccc0aacb52afe58b9d430ebcb88137a8e3bf  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

Cheng Ming Lin (2):
  mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
  mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D

 drivers/mtd/spi-nor/macronix.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
