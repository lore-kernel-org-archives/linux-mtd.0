Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A19C2BBD1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:53:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7ED721D43
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCu4GjbO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Qg83LLQi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7ED721D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jCqwmvZpFSzUz8nsP1cNNoiZnhMDPcbUgrZOXHd6lW4=; b=RCu4GjbO0+T0S4nPB+d7MEPTKC
	17PlzCwpbEfsqL4z9p9P4hlyr4qOVrpAqHYijDKKXD/s8VYLCOstBBF5c/KSMV7fjgntQxDPLVWrG
	oKRmj9/+NzVPu/bVO7x7vREIJBMEJQNZfHrD64Yd5RXsOKRi1JUvAW81GuoaZzY8uVyhChY6sCn4L
	T/BRCJkdJAyn+BN+q4R8dqasJxYV1vsGPcJGn9JF6+sFEhh/VpH6MFCy1afeaSWJU216l69y2rn0E
	3AiXaLvHAytOsHatBT2j3g3lu+g9xBbHnk/6b9Di6ng+EUncENRDoEzFs+4GvgjiKQYCoKSiuNZZ3
	JC31NfzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoib-0002Li-HK; Thu, 17 Sep 2020 07:52:37 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoiX-0002JT-UA
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1600329155; x=1631865155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=soGW+pknjaksN08RJ7LPk0ndAYp4pwodv9WM2rL7awQ=;
 b=Qg83LLQi1YsZu7GecJAjrXCLIcmYoSqmV75s9g7kd1tjMUNyG0mHNPpT
 Ff7Kwk4Jz20csQH4LGrUaOnT3bUGZXgrahbPEyxAHNBRb5TpGLz9hy6l4
 p2swA7IulawZgIMQhX8oTZOd1UfibDuq4yk7Tk8dbHgotl+ww//9EZBAA
 IPM0JHIz9R/mXTgBxA9MUxMYEh6kCVYmcdE8rjqOn0UXNnehoMJILpD8M
 BZ9EZSAEAk9A6qltLoB91bHPRt6kTFwVtxEjYyJ9gT/bcd+gmZlh3SEui
 KJMhWdR9EeZISQxql5Xptwc1Lm1ADnrpI5eUcB2ZTZoMEOGMXG+78XJ4o A==;
IronPort-SDR: aQjr5gh0DdIuLQSBqrioZhf/IlVjfM2bc7tzY7wh5eIXW/WLU3XtGnxxUedOv4W8W8AR6/Lycm
 v4dbgfEldFXsybFqTNPSRj/XZC1Ie2LRirq3d1Dc5f1O5NQoSaLyXVrLddLeXHNDVSmZ0vZ6WO
 uyOkaGqkGCl0/9eteH/aw6VT111LLcO4d6hCMGIOwuZIBbzzjc7tovBfIOUBSTt9jpCrTOralY
 Ytn/4KdEFMwWkXhMOkgx7/XmFCHC73hs7SxqTXk4O1QK117/ZZ3PCb0EFYcqd0jBgqk1NEG8da
 wFc=
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="91346697"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Sep 2020 00:52:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 00:51:56 -0700
Received: from atudor-ThinkPad-T470p.local (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 17 Sep 2020 00:51:54 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH 0/3] mtd: rawnand: Fix HW ECC handling
Date: Thu, 17 Sep 2020 10:52:10 +0300
Message-ID: <20200917075213.532161-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_035234_209782_6A4DB5B4 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix a wrongful fallthrough NAND_ECC_SOFT when a valid HW ECC is
available. Follow with two patches to make the code more readable.

Following error was seen in case of a valid HW ECC:
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/nand_base.c:5148 nand_scan_with_ids+0x12b8/0x1674
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.9.0-rc5-next-20200914 #2
Hardware name: Atmel SAMA5
[<c010c1e0>] (unwind_backtrace) from [<c0109aac>] (show_stack+0x10/0x14)
[<c0109aac>] (show_stack) from [<c07e9380>] (__warn+0xb8/0xd0)
[<c07e9380>] (__warn) from [<c07e93f8>] (warn_slowpath_fmt+0x60/0xbc)
[<c07e93f8>] (warn_slowpath_fmt) from [<c04cbc84>] (nand_scan_with_ids+0x12b8/0x1674)
[<c04cbc84>] (nand_scan_with_ids) from [<c04d32e0>] (atmel_nand_controller_add_nand+0x54/0x100)
[<c04d32e0>] (atmel_nand_controller_add_nand) from [<c04d36a8>] (atmel_nand_controller_add_nands+0x31c/0x60c)
[<c04d36a8>] (atmel_nand_controller_add_nands) from [<c04d55c0>] (atmel_hsmc_nand_controller_probe+0x188/0x284)
[<c04d55c0>] (atmel_hsmc_nand_controller_probe) from [<c04d40ec>] (atmel_nand_controller_probe+0x54/0x134)
[<c04d40ec>] (atmel_nand_controller_probe) from [<c047ef2c>] (platform_drv_probe+0x48/0x98)
[<c047ef2c>] (platform_drv_probe) from [<c047cfd0>] (really_probe+0x1e0/0x3b8)
[<c047cfd0>] (really_probe) from [<c047d310>] (driver_probe_device+0x5c/0xb4)
[<c047d310>] (driver_probe_device) from [<c047b3c0>] (bus_for_each_drv+0x80/0xc4)
[<c047b3c0>] (bus_for_each_drv) from [<c047cd7c>] (__device_attach+0xe0/0x14c)
[<c047cd7c>] (__device_attach) from [<c047c064>] (bus_probe_device+0x84/0x8c)
[<c047c064>] (bus_probe_device) from [<c04790bc>] (device_add+0x408/0x774)
[<c04790bc>] (device_add) from [<c05d742c>] (of_platform_device_create_pdata+0x98/0xd4)
[<c05d742c>] (of_platform_device_create_pdata) from [<c05d7604>] (of_platform_bus_create+0x190/0x220)
[<c05d7604>] (of_platform_bus_create) from [<c05d77c8>] (of_platform_populate+0x60/0xc0)
[<c05d77c8>] (of_platform_populate) from [<c05dd6e4>] (atmel_ebi_probe+0x358/0x530)
[<c05dd6e4>] (atmel_ebi_probe) from [<c047ef2c>] (platform_drv_probe+0x48/0x98)
[<c047ef2c>] (platform_drv_probe) from [<c047cfd0>] (really_probe+0x1e0/0x3b8)
[<c047cfd0>] (really_probe) from [<c047d310>] (driver_probe_device+0x5c/0xb4)
[<c047d310>] (driver_probe_device) from [<c047d508>] (device_driver_attach+0x58/0x60)
[<c047d508>] (device_driver_attach) from [<c047d568>] (__driver_attach+0x58/0xcc)
[<c047d568>] (__driver_attach) from [<c047b2ec>] (bus_for_each_dev+0x74/0xb4)
[<c047b2ec>] (bus_for_each_dev) from [<c047c258>] (bus_add_driver+0xf4/0x1d8)
[<c047c258>] (bus_add_driver) from [<c047dd88>] (driver_register+0x74/0x108)
[<c047dd88>] (driver_register) from [<c047f33c>] (__platform_driver_probe+0x68/0xc8)
[<c047f33c>] (__platform_driver_probe) from [<c01016d0>] (do_one_initcall+0x7c/0x1cc)
[<c01016d0>] (do_one_initcall) from [<c0b00f78>] (kernel_init_freeable+0x15c/0x1c0)
[<c0b00f78>] (kernel_init_freeable) from [<c07f23a4>] (kernel_init+0x8/0x114)
[<c07f23a4>] (kernel_init) from [<c0100148>] (ret_from_fork+0x14/0x2c)
Exception stack(0xcf427fb0 to 0xcf427ff8)
7fa0:                                     00000000 00000000 00000000 00000000
7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
---[ end trace 7fad321bf58a54e1 ]---
atmel-nand-controller 10000000.ebi:nand-controller: NAND scan failed: -22
atmel-nand-controller: probe of 10000000.ebi:nand-controller failed with error -22

Tudor Ambarus (3):
  mtd: rawnand: Fix wrongful fallthrough NAND_ECC_SOFT
  mtd: rawnand: Introduce nand_set_ecc_on_host_ops()
  mtd: rawnand: Don't overwrite the error code from
    nand_set_ecc_soft_ops()

 drivers/mtd/nand/raw/nand_base.c | 134 ++++++++++++++++---------------
 1 file changed, 70 insertions(+), 64 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
