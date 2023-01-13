Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB8C3DA78
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAFYLn0/TwDGOumK9qb++06YAD2/JHDf5mFPg1qmFaw=; b=NHvW914HH5IvDs
	GzsWDNnHw0dSgATPfxKOPDCaNX4e+vRntcaXqMykwMtnv4MhH5Dz1ljuxceIasN1HmfTR1OPh8vd6
	xlK4JnJOcxXEO1XogBCaxX5xISIuebPn4EUMDNluAdjK+o+5ZdnL6d9QyoHJv6sM/7ubj1Y213Iis
	trv74anjOXGr1LFb5gUnhpJAxAMvmdWBgEgcoh3Xs/557wR5AI59homS2aaUajBPBMiWpcecOAq+k
	FpfckctwTt27z9JWRR5dI5ujP6ltJ1srd9vbt6JalRlQHGkWCfaDVSh4X7dhAuSuu4N8TCOlubEnq
	Uh3/w1jjT69he5jrah6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPCx-00496v-1Y; Fri, 13 Jan 2023 18:55:19 +0000
Received: from smtp-out-06.comm2000.it ([212.97.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPCt-004952-87
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 18:55:17 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id 4F7A9561C78;
	Fri, 13 Jan 2023 19:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1673635551;
	bh=+wVor8fJ5eWrUVNORhiNSESi0FLTaSirCd1H47iKeBU=;
	h=From:To:Cc:Subject:Date;
	b=kUsm1P03NHT5itadLZf1/3pvGkuaVkOcyHanO3HHi41u9d4wCO7rxwSNhlzzUBxLj
	 Gr4LhCQCZ777ylCIY5ojiIK11tOhn2t8UhiWwSGCBqhv7OMDuGnnB100yeJ0s1xWfD
	 IQSXUS7tj9D3vo3tG5FszfeX2VbPU0tyJtLn6ricwNb5wBfM7woVFbYnqpjG4n469a
	 HB9ZccJVA1TLIwPyUIfeeN/PRTHNkwsT7zsW0gf0nM3AN0WjiWE3tJMEVA+bFXhNfg
	 aJeCGRim3v3tAWdmsv5bI58BK1OSYwrMrDI/ZeHVlFpzXoVwmaALoTGkWX9Nu1pjFU
	 teqR90btpyUnQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Marek Vasut <marex@denx.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v1 0/3] fdt: Fix mtparts fixup
Date: Fri, 13 Jan 2023 19:45:44 +0100
Message-Id: <20230113184547.487322-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_105515_465016_E822CD53 
X-CRM114-Status: GOOD (  14.35  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Recently we had a boot regression on colibri-imx7 because of a cleanup change
on Linux imx7.dtsi setting nand controller node #size-cells from 1 to 0.

Because of that Linux partition parser was no longer able to properly
parse the OF partitions leading to a boot failure, the above change was
reverted in the meantime as an immediate workaround, but some improvement
is required on both Linux and U-Boot.

This change improve the U-Boot part of it, #size-cell is set to 1 when
it has an invalid value. This has the limitation to work only with devices
smaller than 4GiB. In general the suggestion from the Linux MTD maintainer would
be to just deprecate using this U-Boot function and pass the MTD partitions
from the command line, unless they are statically defined in the DTS file
in the first place.

This series therefore convert colibri-imx6ull and colibri-imx7 to pass the
partition list from the command line instead of fixing up the DT.

Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/

Francesco Dolcini (3):
  fdt: validate/fix cells count on mtdpart fixup
  colibri-imx7: specify MTD partitions on command line
  colibri-imx6ull: specify MTD partitions on command line

 common/fdt_support.c              | 45 ++++++++++++++++++++++++-------
 configs/colibri-imx6ull_defconfig |  1 -
 configs/colibri_imx7_defconfig    |  1 -
 include/configs/colibri-imx6ull.h |  2 +-
 include/configs/colibri_imx7.h    |  2 +-
 5 files changed, 37 insertions(+), 14 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
