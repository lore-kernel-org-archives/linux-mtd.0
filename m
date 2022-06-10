Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A662CCA47E
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jun 2022 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0wjNm9MN+LIV3CgviWf/fpAwTiDOHe5W7YBBQAkiizA=; b=RSJrVMvybUhbE9
	GW6kJTfN28l/aDO4iliF/iVi8PrJEqUQ2Nx5B7NQ9y0/CRLlpoWn6pEqqa0kt9mlYeQ8U8Op8wltS
	rfMju67rcMtjGSR0caITTyFJrAkTnrSWPuJbO4lMxmQ1kpNU5kkhRWnweW5eSketjTH6aAZPgoME8
	0/Bmqo9JYRVbzRBjEiqC/zg4uNqHxOME8Y+XyYkhjsdkrObN9E+RvIexnFVucnhbT8RUXpEimAetQ
	U8Rw/bo+PuOLStp0ZQN0gLus1iECqbW2qldXVoL84IqlRtwhaNaIFu1xx3G3NuhnWFpAVRu4ll1jW
	U3/1jaKGUUwxswL8DH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbYZ-007Ta4-Jg; Fri, 10 Jun 2022 10:07:55 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbSz-007Qdn-22
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2022 10:02:16 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:6907:80d7:a5b:48f8])
	by laurent.telenet-ops.be with bizsmtp
	id hN262700a35NJNs01N27Xl; Fri, 10 Jun 2022 12:02:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nzbSw-003RJy-GI; Fri, 10 Jun 2022 12:02:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nzbSw-00BJfo-0t; Fri, 10 Jun 2022 12:02:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] arm64: defconfig: Enable HyperBus support
Date: Fri, 10 Jun 2022 12:02:02 +0200
Message-Id: <ebc73cabe3dbfc517883c605cad2178b00d010dc.1654855135.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_030209_389049_5E40CBFC 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

Enable modular support for HyperBus, which is used on R-Car Gen3 and
Gen4 platforms.

Note that the actual Renesas RPC-IF HyperBus driver (RPCIF_HYPERBUS) is
not enabled, as it depends on MTD_CFI_BE_BYTE_SWAP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I think we cannot just enable MTD_CFI_BE_BYTE_SWAP in a generic kernel,
as that may break other platforms.  Is that correct?

To be queued in renesas-devel for v5.20, after the above has been
resolved.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c8cbb98ea6bc4d21..afda8325ca9b675a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -270,6 +270,7 @@ CONFIG_MTD_NAND_MARVELL=y
 CONFIG_MTD_NAND_FSL_IFC=y
 CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_HYPERBUS=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
