Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABFAC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 20:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5UGoRhfnRycSX3j2w1WGMrynn9CFPjlkPWJk3LMfA9c=; b=3ol76CEMdx0qu1
	girqxM5R01Tpa6X34G+/Lw6RHTd92qjeR4KjNSlM2nmVacyIwwrL0uHz4fjK5NNBqGcxAYmTfQmAg
	nRWBhDoSbWCw0Tz2KYVzLDutANQTJqUNF7+IMWOCWtrNuNVvcAD8kogSNkTzw3bdftg2hluaM8F0E
	Ft8sHUb0dQNEiJsDTcVa2FWNKwG2yXaJn4zdExSmKGYzv4noJ5uE4Cb9/TAH8hjQW3tq+7fZ3LGkP
	/FnE8H1p5A53ajcy9oMEG0iiHCBgXaKhAWIR8s23sL/MR0GY52ZE0XhDEbVN3OoKHjqT6O6Q3Jbd8
	XO83ycSBbBrVeIvlNduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIGH4-004sfY-TN; Thu, 10 Feb 2022 20:42:42 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIGH1-004scM-EI
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 20:42:41 +0000
X-IronPort-AV: E=Sophos;i="5.88,359,1635199200"; 
   d="scan'208";a="5603081"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 21:42:32 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-crypto@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alsa-devel@alsa-project.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 0/9] use GFP_KERNEL
Date: Thu, 10 Feb 2022 21:42:14 +0100
Message-Id: <20220210204223.104181-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_124239_807949_211C94D5 
X-CRM114-Status: UNSURE (   6.10  )
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

Platform_driver and pci_driver probe functions aren't called with
locks held and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.

All changes have been compile-tested.

---

 drivers/ata/pata_mpc52xx.c               |    2 +-
 drivers/crypto/ux500/cryp/cryp_core.c    |    2 +-
 drivers/crypto/ux500/hash/hash_core.c    |    2 +-
 drivers/media/pci/cx18/cx18-driver.c     |    2 +-
 drivers/media/platform/fsl-viu.c         |    2 +-
 drivers/message/fusion/mptspi.c          |    2 +-
 drivers/mfd/sta2x11-mfd.c                |    2 +-
 drivers/mtd/devices/spear_smi.c          |    2 +-
 drivers/net/ethernet/moxa/moxart_ether.c |    4 ++--
 sound/soc/intel/boards/bytcr_wm5102.c    |    2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
