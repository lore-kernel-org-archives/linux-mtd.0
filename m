Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1360CC7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gx9uYiHuDLJowS2kZaXIwwq+9CVC5VMFHMK/jG5WAu8=; b=P5r4OQpLrvo84h
	2zOywnuJMqcSRaoNW23GmX7uDZYKjATyouKYQle/7PB7PtlPdktLsDIP4ga+XZRUHns6KVDjEeVG/
	IQAFNT1c+bOBXcDXMfgVTwDq/w1t+eYVW9pGSVyokV8Xd6/aD449VvBZOE7U9Gbrfc1Z5lDZxKsIz
	q4cS+9C7JHCBCAvurrvOckqj7QMwkl8Lv3vsqHLrHjEdyRYkRmdXPMwSzEcQyrGLKQr3G1C0zbnsQ
	NEQabh81rfrwGXQbxkLjqE1MIbK8RNLLbSHtV0wZhjFhWtXPUhCzelz6Y9d/XQ/wKcINKiPCe0ad1
	G5HXesQwXHp+ybnDeVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeq-0000000Df0a-3gFw;
	Thu, 19 Jun 2025 17:02:36 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFoR-0000000DFF2-1mYw
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 14:00:21 +0000
Received: from localhost.localdomain (unknown [116.25.95.207])
	by smtp.qiye.163.com (Hmail) with ESMTP id 194321c20;
	Thu, 19 Jun 2025 22:00:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: vigneshr@ti.com
Cc: amadeus@jmu.edu.cn,
	gch981213@gmail.com,
	linchengming884@gmail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] mtd: spi-nand: macronix: disable continuous read for MX35LFxGE4AD
Date: Thu, 19 Jun 2025 22:00:03 +0800
Message-Id: <20250619140003.103637-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5c7ad4dc-a80b-488a-87aa-ecd6389e86c8@ti.com>
References: <5c7ad4dc-a80b-488a-87aa-ecd6389e86c8@ti.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0sdVkgdGk1KGhhKQx5NSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSUtMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a97887d60a903a2kunm761b0416a3612
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRQ6PSo4KzEyAjZJI042EB1D
	CUkKCRdVSlVKTE5LSE9KTUtDT0tKVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCTlVJS0xZV1kIAVlBSU9NTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_070019_644368_FB438A3A 
X-CRM114-Status: GOOD (  12.71  )
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

Hi,

> Please cc linux-mtd@lists.infradead.org for all patches and queries
> related to MTD subsystems.
> Run ./scripts/get_maintainers.pl on the patch for more information.

Sorry, I forgot to add the following mailing list.
Do I need to resend this patch?

> Why? this datasheet says otherwise [1]:
>
> Would it be possible that SPI/QSPI controller of GL.iNet GL-MT3000
> has a limitation?

GL.iNet GL-MT3000 uses MediaTek MT7981 SoC, with SPI controllers
based on IPM design. [1]

I don't know what the difference is between the SPI controllers of
MT7981 and the Zynq used in commit [2].

In my case, ubi_io_read and ecc errors occurred when the openwrt
attach ubi partition (NMBM has been disabled [3]):

[    7.852000] ubi0 warning: ubi_io_read: error -5 while reading 126976 bytes from PEB 517:4096, read only 0 bytes, retry
[    7.865374] ubi0 warning: ubi_io_read: error -5 while reading 126976 bytes from PEB 517:4096, read only 0 bytes, retry
[    7.878742] ubi0 warning: ubi_io_read: error -5 while reading 126976 bytes from PEB 517:4096, read only 0 bytes, retry
[    7.892104] ubi0 error: ubi_io_read: error -5 while reading 126976 bytes from PEB 517:4096, read 0 bytes
[    7.901754] UBIFS error (ubi0:2 pid 687): ubifs_leb_read: reading 126976 bytes from LEB 1:0 failed, error -5

After disabling continuous read, this flash works fine.
So despite the datasheet stating support, I think it would be
better to disable it first to avoid bricking MT7981 devices
with MX35LFxGE4AD flash.

[1] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/mediatek/mt7981b.dtsi#L160
[2] https://github.com/torvalds/linux/commit/631cfdd0520d19b7f4fc13b834fd9c8b46c6dbac
[3] MediaTek-specific solution for transparently handling NAND bad blocks

Thanks,
Chukun

--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
