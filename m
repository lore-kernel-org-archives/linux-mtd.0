Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5734EC8300A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 13:17:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1055B20656
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 13:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/tEZ1mV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o56zb6Gl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1055B20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ribalda.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XdJCKI12VGse9wArdRr2TiAF21VnSVFhHwqxYdMhWqA=; b=o/tEZ1mV7WplVi
	vTC7dt53sIxaDA1jyqElFtiWGGvPV4cbsoM3UdoKOKyjk7EnXvDXVgvwbc933b37jyyrpcBmZeur6
	8Cp3+BDF9cU+3m27RIKaPSZWS+HDRNN5xNceaBF0jekNPPAlrAeeT5+Wp8QWS+ZfJb/M0OlCkXz9d
	tkN3OEEby+m++tiXshhmikZ8zjXq0veGsKA0UuxBus1wHzyBbx1TPqyz6OwErawdJPsyrl/Itua2X
	bzKUyGUrw+e7g05YGSK0EuFJ/T1Wm0N9u8q86Pt/togRkrFlCEt9sQPJg9s3R5VAduKu6CH5E4nPt
	g5WlbJ7p2CUI3D6zCyxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU94E-0007Sc-OF; Thu, 30 Apr 2020 13:17:30 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU94A-0007MI-K8
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 13:17:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id u15so6467562ljd.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2020 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V+fhiGMWXvrFT59CT1ihId3ZiqpjXsQYR8v/4F83/q8=;
 b=o56zb6GlbouKCLbb5m0nGOJ3cqQru384VPYgr8/VyrCkbAhWnLv7zr5bAVVJNEkr4e
 ESbokYk5Tg2ubsW6RYgRNLUy0/qKAi3TGzTzq+JzRO98OPBkjvMOCPVNOVzr+dQeAkLi
 htAPQCRn8VQ/pGVyh445PNB+62hgkOj4S2PKi7p0dEaBF80aRQD/6uzWeqLjCRn/Nmf3
 gJSlKBDDlFSJfhUm2NZYqweBH6lKnT2n27iC9sTfO6f8eTWKlS7R6QGYtU8VJqfsxAim
 xb/rbbbdGtAJQp3f18CDd+dcJiZX2urrLKBcx58Xw17ZdJGlaYu9fNP/9wM8RWmeAYVV
 k2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=V+fhiGMWXvrFT59CT1ihId3ZiqpjXsQYR8v/4F83/q8=;
 b=Tkl1ngCMFeWbcp/FC79rVpaIH9z8rJz08K9vQ+bBNGhm+5uJxIoHxcqx4gh2iFsOJd
 qe+zhvJhvhZWolQe/1G0i6RAu8b7/P5XknTo5cXZUV4kDViQkxXNeuJQE+6Dx8LJv64v
 HQxwf1W7feJRQhq2WKwXEZU1NAkRKNPmlcUj7uKEXPNxXZ51v15CJ8tdC7At81gWDTiP
 KD5G66Qu8x9xXaIqbU9Ed7mY1lQwUMGA/Mp+jWchDQ/DL6YrGf38NSQc9fkrlyT324Me
 ueqkPY3EDxTzrI0KWAcISLQvFPop2EQusyYxmVlFnsAiPYzQ1zq7I82VWhqSnPfJn+UZ
 2ftw==
X-Gm-Message-State: AGi0PuYWXtsoqQBX93cCg/+EVmqU9Ue7k2GNKC4HcueKrwz9d2CN9EDL
 pKTeKVlT+wLG2vF4s3U/55w=
X-Google-Smtp-Source: APiQypKA/qrPlrZLglJd7F4eO2uj+xhCOewn903PevHnYFKc9s7h1LzTk6l8wCp7XjJ1PHQ6KCqWkA==
X-Received: by 2002:a2e:b17a:: with SMTP id a26mr2083581ljm.215.1588252644295; 
 Thu, 30 Apr 2020 06:17:24 -0700 (PDT)
Received: from neopili.qtec.com
 (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
 by smtp.gmail.com with ESMTPSA id l9sm4286771lje.57.2020.04.30.06.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 06:17:23 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alban Bedel <albeu@free.fr>
Subject: [PATCH] mtd: Fix mtd not registered due to nvmem name collision
Date: Thu, 30 Apr 2020 15:17:21 +0200
Message-Id: <20200430131721.360064-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_061726_672510_16F834BF 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ricardo Ribalda Delgado <ribalda@kernel.org>

When the nvmem framework is enabled, a nvmem device is created per mtd
device/partition.

It is not uncommon that a device can have multiple mtd devices with
partitions that have the same name. Eg, when there DT overlay is allowed
and the same device with mtd is attached twice.

Under that circumstances, the mtd fails to register due to a name
duplication on the nvmem framework.

With this patch we use the mtdX name instead of the partition name,
which is unique.

[    8.948991] sysfs: cannot create duplicate filename '/bus/nvmem/devices/Production Data'
[    8.948992] CPU: 7 PID: 246 Comm: systemd-udevd Not tainted 5.5.0-qtec-standard #13
[    8.948993] Hardware name: AMD Dibbler/Dibbler, BIOS 05.22.04.0019 10/26/2019
[    8.948994] Call Trace:
[    8.948996]  dump_stack+0x50/0x70
[    8.948998]  sysfs_warn_dup.cold+0x17/0x2d
[    8.949000]  sysfs_do_create_link_sd.isra.0+0xc2/0xd0
[    8.949002]  bus_add_device+0x74/0x140
[    8.949004]  device_add+0x34b/0x850
[    8.949006]  nvmem_register.part.0+0x1bf/0x640
...
[    8.948926] mtd mtd8: Failed to register NVMEM device

Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2916674208b3..29d41003d6e0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -555,7 +555,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 
 	config.id = -1;
 	config.dev = &mtd->dev;
-	config.name = mtd->name;
+	config.name = dev_name(&mtd->dev);
 	config.owner = THIS_MODULE;
 	config.reg_read = mtd_nvmem_reg_read;
 	config.size = mtd->size;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
