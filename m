Return-Path: <SRS0=xf6T=PX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC4AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 13:49:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D39C6112D
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 13:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D39C6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AgHkZUQvprUtitmRujC9z6H7Lrs/CM1daQORqcltg5I=; b=mC0RHnwuGNx0SR
	Qezzt+guDiDHKoIiILIEgkSxuisikRECDKHOAu+Vh5D9O60FFepDg1xWknhc2w2jDQ3RGQNffzUOT
	ZZII3nwAs56pYt56h71P5u0Es6Ric2xIFbL5FmOPtQ1wMkmfyksGBxjF8Evj2EDG4PPbeOhKK1Jc/
	MS0m3MooJqzYb57jeOnlCS5k4g53Qc6mTloWIDC3910XnpARmt2TReK0E2h+fwvCLJq+qtYJprncD
	6xVXvJGKPVpMxMAnN3ry9Ydu7OmMMFu4XWLUSOAjRxFbEgmW0Tx7c6E921AVWreaFH/YWE1pVJz/5
	mbydnLEsajlx1Bn3dXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mid6y-0092u4-4x; Thu, 04 Nov 2021 13:49:00 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mid6u-0092t9-Tq
 for linux-mtd@lists.infradead.org; Thu, 04 Nov 2021 13:48:58 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4BC0C22221;
 Thu,  4 Nov 2021 14:48:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636033729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hzn7IpexuRy/8kkxG32qAgyZ+pY82Q0NyVwXVe3onQk=;
 b=lQaeVNL3uDl1TL6fU5DXj+vyUA7hGIo4S1NzHbOKWOPC0AI8u8P7nydtrkLZWpAYEgXApI
 35xq/DpHgQ/lfWexcu/y6RtxfVdrH8U1Vz5EHpM3u6U1CuGgaYdSk3wLIsJb2iFA1DWYvp
 S9TcPC3W01amoupb/ePK/DG0bSTfpOY=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: core: provide unique name for nvmem device
Date: Thu,  4 Nov 2021 14:48:43 +0100
Message-Id: <20211104134843.2642800-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_064857_168866_146ADC4F 
X-CRM114-Status: GOOD (  14.58  )
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

If there is more than one mtd device which supports OTP, there will
be a kernel warning about duplicated sysfs entries and the probing will
fail. This is because the nvmem device name is not unique. Make it
unique by prepending the name of the mtd. E.g. before the name was
"user-otp", now it will be "mtd0-user-otp".

For reference the kernel splash is:
[    4.665531] sysfs: cannot create duplicate filename '/bus/nvmem/devices/user-otp'
[    4.673056] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-next-20211101+ #1296
[    4.680565] Hardware name: Kontron SMARC-sAL28 (Single PHY) on SMARC Eval 2.0 carrier (DT)
[    4.688856] Call trace:
[    4.691303]  dump_backtrace+0x0/0x1bc
[    4.694984]  show_stack+0x24/0x30
[    4.698306]  dump_stack_lvl+0x68/0x84
[    4.701980]  dump_stack+0x18/0x34
[    4.705302]  sysfs_warn_dup+0x70/0x90
[    4.708973]  sysfs_do_create_link_sd+0x144/0x150
[    4.713603]  sysfs_create_link+0x2c/0x50
[    4.717535]  bus_add_device+0x74/0x120
[    4.721293]  device_add+0x330/0x890
[    4.724791]  device_register+0x2c/0x40
[    4.728550]  nvmem_register+0x240/0x9f0
[    4.732398]  mtd_otp_nvmem_register+0xb0/0x10c
[    4.736854]  mtd_device_parse_register+0x28c/0x2b4
[    4.741659]  spi_nor_probe+0x20c/0x2e0
[    4.745418]  spi_mem_probe+0x78/0xbc
[    4.749001]  spi_probe+0x90/0xf0
[    4.752237]  really_probe.part.0+0xa4/0x320
..
[    4.873936] mtd mtd1: Failed to register OTP NVMEM device
[    4.894468] spi-nor: probe of spi0.0 failed with error -17

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/mtdcore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9186268d361b..fc0bed14bfb1 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -825,8 +825,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 
 	/* OTP nvmem will be registered on the physical device */
 	config.dev = mtd->dev.parent;
-	/* just reuse the compatible as name */
-	config.name = compatible;
+	config.name = kasprintf(GFP_KERNEL, "%s-%s", dev_name(&mtd->dev), compatible);
 	config.id = NVMEM_DEVID_NONE;
 	config.owner = THIS_MODULE;
 	config.type = NVMEM_TYPE_OTP;
@@ -842,6 +841,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 		nvmem = NULL;
 
 	of_node_put(np);
+	kfree(config.name);
 
 	return nvmem;
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
