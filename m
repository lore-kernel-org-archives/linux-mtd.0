Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5F1C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 21:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC3B2187F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 21:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbNhL2po"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC3B2187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=JX2HeP40F5PjyGngefFwkB8+n2SE7DkTxIHxx+hzUKU=; b=jbN
	hL2po3OkzqOM6F+G3ynk02cvM5kQ/gX5NxAGZ5/Ii+CSgDuMfw00OFt4X6COGsLEK65EnNQKy5Xz+
	PNdTe57I8aqwPM7gjcSllTK/pYIJUelRHQ6gapn9a9iAzPoVu6AV1dN+zYXuHVmJuNemVKWPLK1m0
	yEi/WQAoQu9vD+rliYbZozM+J7JtNf+RhOOGo7O9LgMgXl+Y2zPo6rx4aZOCGHJwCoDp/OS4yNtAj
	hEeH1TcMCr9PK/FdL8LiswRwONlv0e0rq3DfwM29oVTk4MHEylX/8Tj2poejkbsdd4vO+/u/H7PgF
	WtwZZKmaBUlvyHcEAN5WdpmQDTPfUbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irU3p-000551-RV; Tue, 14 Jan 2020 21:49:17 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irU2x-0004Ir-Vr; Tue, 14 Jan 2020 21:48:27 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EC927200507;
 Tue, 14 Jan 2020 22:48:19 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id ED0012000EA;
 Tue, 14 Jan 2020 22:48:13 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5B31A40285;
 Wed, 15 Jan 2020 05:48:06 +0800 (SGT)
From: Han Xu <han.xu@nxp.com>
To: vkoul@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 esben@geanix.com, boris.brezillon@collabora.com
Subject: [PATCH 0/6] gpmi/mxs-dma runtime pm patch set
Date: Wed, 15 Jan 2020 05:43:57 +0800
Message-Id: <1579038243-28550-1-git-send-email-han.xu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_134824_164235_6E9DB93C 
X-CRM114-Status: UNSURE (   3.85  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-imx@nxp.com, dmaengine@vger.kernel.org, han.xu@nxp.com,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

enable the system pm and runtime pm for mxs-dma and refine the gpmi
runtime pm code

Han Xu (6):
  dmaengine: mxs: change the way to register probe function
  dmaengine: mxs: add the remove function
  dmaengine: mxs: add the power management functions
  dmaengine: mxs: switch from dma_coherent to dma_pool
  mtd: rawnand: gpmi: refine the runtime pm ops
  mtd: rawnand: gpmi: set the pinctrl state for suspend/reusme

 drivers/dma/mxs-dma.c                      | 155 ++++++++++++++++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  60 ++++----
 2 files changed, 167 insertions(+), 48 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
