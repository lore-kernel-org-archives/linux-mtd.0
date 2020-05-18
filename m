Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B6C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE45F20674
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p1+jR+eI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE45F20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nqKePce+pGZX2n1/hBZbif8TpUYNfTlNZg8cMB6+Sl0=; b=p1+jR+eIsFD0rK
	U7IzAzzzu9AVqUE410N8FTHrDJ8+T67u609xKa3plWnDFmIrXj39QGjUCuhee6hq6XXFZBUhzX5P8
	4U5cKFtaBUSviYyxlIBhIgehQroz1PDzforuMfLyDlaS39KmWR8qmqQB97mxPAZblHjxnY26di7Ys
	s75QfKaxRwuX6YhLuYiN9Z9w4XnUGDyKhGtCGDMvFScsX1aLLopHUG758udXhRlzgYrx0663yeAxn
	HTxJIhR+SuC1PQzn4+6iJxb+GDUDbRZHQ1k/kJxWlH4A/cHmoHQJIMZDYZ9cwcPardi1XpsZAiZnK
	/MZDU/UT2aRG7+vZEq4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaiSo-0006pp-Bu; Mon, 18 May 2020 16:18:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaiSm-0006oP-6Z
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:18:01 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B318B2A0A49;
 Mon, 18 May 2020 17:17:58 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v3 0/6] mtd: rawnand: atmel: Convert the driver to exec_op()
Date: Mon, 18 May 2020 18:17:48 +0200
Message-Id: <20200518161754.302415-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_091800_370158_CEEFEE0F 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This v3 addresses a few problems reported by Tudor (one of the fix has
been sent separately [1]). There's still a perf regression on sama5
(200KB/s drop in the write path), but it seems to be related to a core
change (when switching to exec_op(), the page_prog_end() does a
read_status() which was not present in cmdfunc()) and the fact that
the NFC is bad at handling simple commands.

What's probably more worrisome is the difference between the NFC and
the !NFC case (not introduced by this series). I suspect it was to do
with HSMC specific timings, or maybe the NFC simply behaves poorly
compared to direct bus accesses. In any case, this issue is orthogonal
to the exec_op() conversion, and can, IMHO, be addressed separately.

Regards,

Boris

[1]https://patchwork.ozlabs.org/project/linux-mtd/patch/20200518155237.297549-1-boris.brezillon@collabora.com/

Boris Brezillon (6):
  mtd: rawnand: atmel: Enable the NFC controller at probe time
  mtd: rawnand: atmel: Drop redundant nand_read_page_op()
  mtd: rawnand: atmel: Use nand_{write,read}_data_op()
  mtd: rawnand: atmel: Use nand_prog_page_end_op()
  mtd: rawnand: atmel: Convert the driver to exec_op()
  mtd: rawnand: atmel: Get rid of the legacy interface implementation

 drivers/mtd/nand/raw/atmel/nand-controller.c | 470 +++++++++++--------
 1 file changed, 264 insertions(+), 206 deletions(-)

-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
