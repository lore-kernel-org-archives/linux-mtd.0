Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985ADC41513
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gZ0dZIR3uRFT0N+zIw20Slq/eYjwO2ffPJQXL0kUTEI=; b=hMx9ZKnuPjHJol
	NLBoFD6TAJzBv5QK78MD1vGk5+W012jcQOUMTNsfCMU0WkeFEku8PscUpOC3fGSRoEf+WlJKv8seR
	A9x/cpaaAfQIXC09g85+vT5H/I8bHbdRnH5FWnzYoLMy+oe6FN/yesTlnbgufY5WGb/c4ftOSWU5M
	PKSopFB6CRDSykurtI1wdLy5j4zqJVgTUwH1hlla4pTzxpfAq11Vo1kb0foNP72g/i0b8LXG3KLSS
	s9qBxx25LGBoBTrBD/lbMCI88NpbG+JjsJJ1dX5g21+v4GiNlnHgBl0G7+IRxb0cnHoi99NPDyMhE
	rxYUodkThrSdY415Dpbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85g-0086hm-1F;
	Thu, 10 Aug 2023 16:00:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85b-0086dm-2a
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A9ED160ED81F;
	Thu, 10 Aug 2023 18:00:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NOlwUiZruBJ3; Thu, 10 Aug 2023 18:00:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4A1E8635D295;
	Thu, 10 Aug 2023 18:00:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YnW_UZS0Pu1b; Thu, 10 Aug 2023 18:00:36 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id C7225635D290;
	Thu, 10 Aug 2023 18:00:35 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Christoph Hellwig <hch@infradead.org>,
	Stephan Wurm <stephan.wurm@a-eberle.de>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Oliver Neukum <oliver@neukum.org>,
	Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 0/7] Fix UBI Block wrt. highmem
Date: Thu, 10 Aug 2023 18:00:11 +0200
Message-Id: <20230810160019.16977-1-richard@nod.at>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090044_013419_029625EB 
X-CRM114-Status: UNSURE (   8.24  )
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

Patch 1 changes UBIblock to use a copy of scsi_kmap_atomic_sg()
for sg list processing. This patch is meant for backporting to stable.
It makes use of kmap_atomic() and a bounce buffer because MTD/UBI IO
can sleep.

Patches 2 to 7 move scsi_kmap_atomic_sg() into lib/scatterlist.c,
convert it to kmap_local(), convert all users to it and remove the
bounce buffer from UBIblock again.

Richard Weinberger (7):
  ubi: block: Refactor sg list processing for highmem
  scatterlist: Add kmap helpers
  scsi: dc395x: Switch to kmap_sg
  scsi: esp_scsi: Switch to kmap_sg
  scsi: fdomain: Switch to kmap_sg
  ubi: block: Switch to kmap_sg
  scsi: core: Remove scsi_kmap_atomic_sg()

 drivers/mtd/ubi/block.c     | 11 +++----
 drivers/mtd/ubi/eba.c       | 50 +++++++++++++------------------
 drivers/scsi/dc395x.c       | 12 ++++----
 drivers/scsi/esp_scsi.c     |  4 +--
 drivers/scsi/fdomain.c      | 10 +++----
 drivers/scsi/scsi_lib.c     | 60 -------------------------------------
 include/linux/mtd/ubi.h     | 12 ++++----
 include/linux/scatterlist.h |  3 ++
 include/scsi/scsi_cmnd.h    |  4 ---
 lib/scatterlist.c           | 55 ++++++++++++++++++++++++++++++++++
 10 files changed, 100 insertions(+), 121 deletions(-)

-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
