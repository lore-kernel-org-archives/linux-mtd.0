Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923D4C27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O6ZgFC2egq1Vniw6Xr/da+LoTmNDqhAoGewN3EO3LEU=; b=CcsLM1iYR+cwM5
	P2gb4ORXnRo5e3G7q6sqC2I11zY+7h3dVel9AnhDNI/61BxtwvuXDLLBLcmr/Fn0s2ShuFqN4X4qG
	3mnJXRx+1wYX7qCvLN8Lma2r4JrRROEmz5RHtGsA7WrgvFt4+hdKItMt1Q2X3eGz2vNeNBcBMqTEh
	hmn1PlAOOITrcnZo67sVZ6AJTFLa1yB2WJPT0jLOQ+nd6l4oAuZCMvERk00Z6DiQHytyzYXU4mm0n
	7haNMwKI9R/9waw1+gHjGWkB7liYbUIqQY8JfKerQnb17DD9kwxeks91QqWoQv2RSMRTg0LHhojnJ
	J5U/v2g0+KRQvMrZSZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKasT-006Ko1-SW; Wed, 25 Jan 2023 08:11:29 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKas5-006Kg3-CD; Wed, 25 Jan 2023 08:11:09 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30P8AmuV100093;
	Wed, 25 Jan 2023 02:10:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674634248;
	bh=Tb+iqFBTvqZqoyhy2A3PM/WejlRKwtgdqUn0IBG8Ctw=;
	h=From:To:CC:Subject:Date;
	b=i+kjACr1XHu5b7k36IEYsRa4NfLjG3qpeBItIliQDjSteu7TXi7tEWzODaAcodK8B
	 flGrlvkJE4BaP4fFkcJMaYY/7KH2ljSpPDeKzvJDIclxJJwUxoIPJTpCblXhL0GXNi
	 CMAxrS580Hb7HIKXJSjMnWfEc1i97yRRfVBHxY60=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30P8AmiE024679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 02:10:48 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 02:10:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 02:10:48 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30P8Alto075430;
	Wed, 25 Jan 2023 02:10:47 -0600
From: Dhruva Gole <d-gole@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>, Dhruva
 Gole <d-gole@ti.com>,
        <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Takahiro.Kuwano@infineon.com>,
        Pratyush Yadav <ptyadav@amazon.de>,
        Pratyush Yadav <pratyush@kernel.org>
Subject: [PATCH v2 0/4] STIG Mode Fixes for spi-cadence-qspi driver
Date: Wed, 25 Jan 2023 13:40:19 +0530
Message-ID: <20230125081023.1573712-1-d-gole@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001105_528191_A4128A84 
X-CRM114-Status: GOOD (  12.87  )
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

* Reset the CMD_CTRL Register, without which read/writes in STIG mode
were failing in some cases. The issue came to light while using STIG
Mode for small reads.
* Also add a flag that can allow us to do direct reads but distinguish
direct writes, thus enabling us to disable writes in DAC mode in some
cases that require it. (Like to write to some connected Flash registers)
* Fix register reads in STIG mode and also use STIG mode while reading flash
registers.
Currently if you try to read a register while in STIG mode there is no
support for ADDR and thus naturally a register never gets read from the
flash.

This patch series has been tested on a TI AM625-SK-EVM with both a quad
spi nor flash (s25hs) and OSPI NOR Flash (s28hs).

Output of ltp-ddt test, "DD_RW_ERASESIZE_UBIFS" run with s25hs512t flash:
...
[    2.334068] spi-nor spi0.0: s25hs512t (65536 Kbytes)
[    2.339185] 7 fixed-partitions partitions found on MTD device
fc40000.spi.0
[    2.346158] Creating 7 MTD partitions on "fc40000.spi.0":
[    2.351555] 0x000000000000-0x000000080000 : "ospi.tiboot3"
[    2.358344] 0x000000080000-0x000000280000 : "ospi.tispl"
[    2.364788] 0x000000280000-0x000000680000 : "ospi.u-boot"
[    2.371311] 0x000000680000-0x0000006c0000 : "ospi.env"
[    2.377519] 0x0000006c0000-0x000000700000 : "ospi.env.backup"
[    2.384419] 0x000000800000-0x000003fc0000 : "ospi.rootfs"
[    2.390890] 0x000003fc0000-0x000004000000 : "ospi.phypattern"
..snip..
Test Start Time: Wed Jan 11 21:14:31 2023
-----------------------------------------
Testcase                                           Result     Exit Value
--------                                           ------     ----------
OSPI_S_FUNC_DD_RW_ERASESIZE_UBIFS                  PASS       0

-----------------------------------------------
Total Tests: 1
Total Skipped Tests: 0
Total Failures: 0
Kernel Version: 6.2.0-rc1-00040-g700d796a94e0-dirty
Machine Architecture: aarch64
Hostname: am62xx-evm
...

Previous version link:
https://lore.kernel.org/linux-spi/20230104062604.1556763-1-d-gole@ti.com/

Changelog:

* This version addresses concerns from Vaishnav where he was seeing issues
while testing on different platforms.
* Also has additional patches that fix the issues that came to light
while using STIG Mode.

To: Mark Brown <broonie@kernel.org>
Cc: Vaishnav Achath <vaishnav.a@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>

Dhruva Gole (4):
  spi: cadence-quadspi: Reset CMD_CTRL Reg on cmd r/w completion
  spi: cadence-quadspi: Add flag for direct mode writes
  spi: cadence-quadspi: setup ADDR Bits in cmd reads
  spi: cadence-quadspi: use STIG mode for small reads

 drivers/spi/spi-cadence-quadspi.c | 42 ++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
