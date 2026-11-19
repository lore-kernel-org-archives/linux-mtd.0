Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A6606A32A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qwn/i9mf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNmJPseF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XEIF/8A/jT+Zn5NoqMd9zYLTkZiHyxpoc43c28EUToY=; b=Qwn/i9mfR4uSTLMc+k23YOa8L6
	poC2FcTxRQbCey40wXMimiAoYB3EJcaYU8CNhWLLedd7HyTnkQOYK1ey2tsO5+gko0jbamajws8og
	9yBQN13dQOEADh86RNbY5NmySMfayjD/ORcB7sKEcV8NvFkkxF31xCtMKJtl58xIVK7mCONDCWCoV
	YP4ano0bTDnpqzJ2jITktfLygsN9gNkrCYyvx5wc/2O9fhwaEsIVVG7KmdsZiQM6NEE+0e5HFCWfj
	Z5xKBMH9W1EwfZS3pqT/HIkkdHxKXTfqOpSPGOyh2T9T7MgYKngLXcJsUwteeyh5eKaHabi3uBHiD
	Y/TWSE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAbw-0000000DZJL-2P7h;
	Thu, 19 Nov 2026 22:28:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAbt-0000000DZIk-4AZd
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:28:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E83D11A172B;
	Thu, 19 Nov 2026 22:28:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B64906035B;
	Thu, 19 Nov 2026 22:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7330311BC0D8D;
	Thu, 19 Nov 2026 23:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795127283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cExm4v1nnoeFCJIraxxSfsSKgi1zXrIFP4E1G6KpmNI=;
	b=lNmJPseFNU6vULqKZcykGprhLZSVuKKRpBsugkC0YpYF8QuJ+rjxj7KWOSg6gXxzEn0Ozo
	MmXv6ms9UDc7UFH3+FcoqhZoACPBooLFiFFrB+Xkux1arb46lRnNCCJlOg8b8gi+8EVolK
	7bL5+IhD8Ytp2HwWRfwNnPSURkki9miWsmuFokdhwhcpgFsUkvh35b8ILMYyPpE7yWFrbU
	R3tAO01HzsNJ2mKfcqD8OGfiyH/MQkZU+M+fj2ti+TuLbyl9fHoB/lDKLlzxnl9KBdoqWn
	Py+epuw9QflkkM/8l7B1ILc6pHoIwyyF0v2hohkZp/V2MXnP5PQSWExEzJaB+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] mtd: rawnand: cadence: Fix incorrect variable
 dereference
Date: Thu, 19 Nov 2026 23:27:55 +0100
Message-Id: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxA0atI1gYaRYu9SnExOlGzaByS2gri3
 R1cPj78A5xN2OFVHGD8E5dVM6gsYFyCzowSs6F6VC0RdZjYfMUt+dc4fERntPDXoBEn2dlxGp7
 1EJuujTRCviTjO+TJuz/PCxUg4w9xAAAA
X-Change-ID: 20261119-perso-upstreaming-rawnand-fixes-fb73bd596d1c
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_142806_178302_65CC7076 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Small series fixing a report dating from September on the Cadence
controller. Patch 2 uses a newer API for one of the DMA helpers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (2):
      mtd: rawnand: cadence: Fix DMA device dereference when DMA is disabled
      mtd: rawnand: cadence: Switch to dmaengine_get_dma_device()

 drivers/mtd/nand/raw/cadence-nand-controller.c | 27 ++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261119-perso-upstreaming-rawnand-fixes-fb73bd596d1c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
