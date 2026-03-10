Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8456EB1053
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGWMX5LI2arj7FjE1xWEAwg09yjwF1EdLHynJeKhmHM=; b=H8Oa8iIbC8fseV
	ezOjodXcSwNMlkmsr6Jj6wPVEJx/79tZTDRUW5YyqjuV5qOleVYzodjbcmevo5uARF2dT/I+EVaDF
	GXEemUMS4uShDCsJ3lm4bO/alNV8BPdwp9uqR8tNc+qXRwa9uPm56vHNbBSsSyByjqUJcewIXu0LG
	AVbC0i2VUvkF0Sam/zAkILUcV39axNlh6/tsxNJadbh0EW7hzayL1q3LIGQRzfDOM8kg6/bC4lsjq
	YhaIwgRcnv47gnEVi1S1ndLhq45qKWI6TZgchSX9H4PTKJi3CQ8p5hAPwN0tfTKXfcY+EmqH+pNLa
	WtmIBKQkYowowVyST0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvi4-00000009Mrv-14fc;
	Tue, 10 Mar 2026 11:57:12 +0000
Received: from mail.avm.de ([212.42.244.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgb-00000009KXd-45dX;
	Tue, 10 Mar 2026 11:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143728; bh=P8RHvB1pDU6Ba6KZR0cIN2NAbDWAknWQIRz8JMX8gns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pw5J/ZKa7qdOD/KHliFHGAPgoeYPtxmoMsaCQF/FKai+LG5vkmyJowXsEzkD3cPot
	 34kvrGSUxg1JnjFKHY6NsLgrOVug3M9Be4rVveawRMrk6MR1C1BR6jP8hIlA4X3hU4
	 jr1s0kl9i2R1ifgZ0ZoS8j1AZYiWtKMhO7fCyfSs=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006af-e21d-7f0000032729-7f000001bab8-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:28 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:27 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:14 +0100
Subject: [PATCH 48/61] mtd: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-48-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=P8RHvB1pDU6Ba6KZR0cIN2NAbDWAknWQIRz8JMX8gns=;
 b=kA0DAAoBNC0GU9GsrNsByyZiAGmwBnnIluZqwXeZ26oYYynjfBoy02QQTmlYcSsBV5M99kkBR
 okBMwQAAQoAHRYhBDls8G2tYNRwNAKmmDQtBlPRrKzbBQJpsAZ5AAoJEDQtBlPRrKzbhhQIALOH
 7GGUb7lDbOgP/8xq1PNX4SyEuog4C5Kqug0EL27yDZ5DTcHtYtEWvTOVFh3DoBIg9oWZIhltbqf
 zQqvypi0p020OQBz5OD/FKYzR1JLtT/NpVkDjTnrh0FIsLPISsJn9k8DorrTpQE5Fk5zPEGhmlk
 HlvpEuSvvQD0MQibzxJjUYSjgq+Ll386Twc/QQfm3hFYZT/c4I4Yb80f4z0CM2WhT7S3udW5nGM
 BjGFdYImnQ9uAgWz45BEBVAwZb3P7349MoFLUJ9ZHvqc+4UOIWn+5d35lrOEZcvkJpfol2G0RFZ
 WFsYepS2AbdMtsza99K9TLlncKCIQLIaXnPIWJM=
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143728-90660F2F-3D7E05AD/0/0
X-purgate-type: clean
X-purgate-size: 1819
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045542_243201_3C1796BF 
X-CRM114-Status: GOOD (  12.07  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/mtd/nand/raw/gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a448aa6273f3df79f53145784ccc05..86a8b62fb9e8510d36f925b8b468ec17c77e26d8 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -276,9 +276,9 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 
 	/* Enable write protection and disable the chip */
-	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
+	if (!IS_ERR_OR_NULL(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
-	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
+	if (!IS_ERR_OR_NULL(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
 }
 
@@ -358,7 +358,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gpiomtd);
 
 	/* Disable write protection, if wired up */
-	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
+	if (!IS_ERR_OR_NULL(gpiomtd->nwp))
 		gpiod_direction_output(gpiomtd->nwp, 1);
 
 	/*
@@ -381,10 +381,10 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return 0;
 
 err_wp:
-	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
+	if (!IS_ERR_OR_NULL(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 out_ce:
-	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
+	if (!IS_ERR_OR_NULL(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
 
 	return ret;

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
