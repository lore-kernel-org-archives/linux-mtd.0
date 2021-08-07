Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EA9C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BC8360462
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BC8360462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vEk9u7uZMdrkOfTQEmWVR4DXzRmkZzlwD12QYdUJ4hA=; b=MJoAJF+gs0ciTW
	4w40GJxOZaEAEfCqbmhlsKDlzyKMqjgBNrtK8sUe/ekn+obQTZ/nNHd2+godr6nePLddWT4L5Ek7i
	3gcp4N0tmo9jfh0CMXeYARKOt/NPAH9/QHeRAfg8JP+PmghRcfTD7nRUmObnCANZduXAslxoKa4mL
	tGpqD8JpQzPvzk3Zk3onkS6QnEQDcpPsw9Sd5OLAsxJwzmTbsSKAecqTY3XUr4GdQBD9hzx6hL8XD
	olAS174DdJmT9icZ+0SLIIWPYAE70xVqlVNBLLm66IIMRpbtm10MwDeEm8DUFaGkKNkqi1xdG50y1
	363N5yoM6HmI3WSjyxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCU8V-00FBMi-IV; Sat, 07 Aug 2021 21:45:43 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCU8S-00FBL3-Jg
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 21:45:41 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id F38D7C63FB; Sat,  7 Aug 2021 22:45:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628372739; bh=fZY6y5E65oueqpY8BgHGeU71MOive8r1nt71AkyeBMQ=;
 h=From:To:Subject:Date:From;
 b=IafVivrvkIDuF/5ksVHKe59pfuMGFSr9Xgyz4OyeaKfVcaUb0cGeUo6r3KxX9EFj6
 hRRhPCyTV9/s0xRnDA6QBAQMc2dkFsdCNnOgbKcFDoYLBGt/W4f676f+Mibe7FvZXC
 qIrx2gNvHbZm2nY1n3NE5DC66UTlHgURfwXIcat4wg3ADXCTT49tBDIjyrN19g68gm
 Yiewq++vZlJ6ng7aEOcLdZ99YBefo1ueHOWim343s/Fye0li794Et88aOmTwVizjpn
 0IUcqHrr5sMZHgGLGqm+TSsrMy5Kv7MZYyPbeeWnJLlkOIpJ27Hr1XsRwM3c+Mtihg
 zDS5Ob4HgOtTw==
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/5] Fix various issues with RFD and FTLs
Date: Sat,  7 Aug 2021 22:45:33 +0100
Message-Id: <20210807214538.14484-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_144540_829753_5A892BC6 
X-CRM114-Status: UNSURE (   5.85  )
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

Changes since v2:
 - Review by Miquel Raynal
 - Improved commit message for discard and mtdram
 - Split use-after-free commit into two commits; see container-of()

Sean Young (5):
  mtd: rfd_ftl: allow use of MTD_RAM for testing purposes
  mtd: rfd_ftl: add discard support
  mtd: blk_devs: make discard work on FTLs
  mtd: rfd_ftl: fix use-after-free
  mtd: rfd_ftl: use container_of() rather than cast

 drivers/mtd/mtd_blkdevs.c |  1 +
 drivers/mtd/rfd_ftl.c     | 44 ++++++++++++++++++++++++++++++++-------
 2 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
