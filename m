Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C46DC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 08:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=komCe1Y/iomUAtA/O6xYRS2ANskmhzIW7o18nq5+hhc=; b=AE7L/xQD/aBgdj
	JOUGe5mIbyvSsoQTNXdamTjTiUR56CQrGqte+HKMMOiz05PMLTNv21BpG1X4sAyCFbHTzcHDDGtl9
	xDUg1M1OwoFXyOlx0O+OgjnNfrqy4RTih8NtQYcJ5EeRB1K4ME/C6j9PeAXltPFZn2K2Bfxg74DeM
	k0nSgTgIG63es8JGkKwp9gC6e50rWbQpvq3AkMZSkzv+KLmxBooZ6A1vF2OfEzMsRzis1KvF4dLKu
	omU+wSr3X0W7McUiCdm/imEwbF3qaBcFHxeGF6eB5PnRGEPcUQDhLHAaCm61ATwpbwTnIR6bQt/ej
	Ybc+s+zbx62l7ZWG5Djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Wrj-00000004E1x-2etd;
	Thu, 16 May 2024 08:53:31 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Wrg-00000004E0j-2TyP
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 08:53:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83BBC1C0010;
	Thu, 16 May 2024 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715849603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zfWDlUecbmh8eIQS/atV4TCZuuwvvmmSKvVhXbPTOnY=;
	b=CaLLX2DmjI0Gy+RN/rupsO2h/FS8eE0SLCiFwRSuLXNxO0/DYqs+PQkLpu0unAmGt8rsz6
	Cyo/RcsJwoQRi8692TntHJ5vo/ADvEp6yg1cos68NWpEd0moEAWXrJPR6c4twN2OFhB6P7
	esKQxCCdf/EuPcB/3jz7qjNx1MDHGPX0iaRolVWFnSicW9B5EF2b6tb83Ekf5C8oJTvgFy
	ImyVvJ84QYY6n4TzJRJjGMAgEk5ZPCLu73mgUOrxnXV6wgjaAUvsATjweke3s+k/l4ewik
	qo49Utg9OyiNSInCesqTxyOPC85KLq9RxCAOK21q7ymvqimkhyxVtNhDfGNt2A==
Date: Thu, 16 May 2024 10:53:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: [GIT PULL] mtd: nand: Changes for 6.10
Message-ID: <20240516105321.7f9a4c3a@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_015328_940648_40FAFE37 
X-CRM114-Status: UNSURE (   8.31  )
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

Hello,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/nand/for-6.10

for you to fetch changes up to 6819db94e1cd3ce24a432f3616cd563ed0c4eaba:

  mtd: rawnand: hynix: fixed typo (2024-03-25 11:20:37 +0100)

----------------------------------------------------------------
Raw NAND:

Two small fixes, one in the Hynix vendor code for properly returning an
error which might have been ignored and another in the Davinci driver to
properly synchronize the controller with the gpio domain.

----------------------------------------------------------------
Bastien Curutchet (1):
      mtd: rawnand: davinci: Add dummy read after sending command

Maxim Korotkov (1):
      mtd: rawnand: hynix: fixed typo

 drivers/mtd/nand/raw/davinci_nand.c | 5 ++++-
 drivers/mtd/nand/raw/nand_hynix.c   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
