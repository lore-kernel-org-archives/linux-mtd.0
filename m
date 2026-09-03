Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEA1C624A4
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cQDmUeK0ucj4oSI4CeRe4fwrgoiKcsbEytFNOH0moHg=; b=jmYZtv2Jx+kLW4
	O96jeM0fxO1DglgY50KYMDtyPCT34+qFy5ASJE+xYEPVo1sklyAcr4H1wwysxL1Tk9ZB+angoW68U
	oTbmn84Lf2DVYeP+CunDtteOHlVnokJhxOv/E7RDTgVIQfDSOeoF4+aONEnwGWIk7dxQYmc+axHil
	hkFDtTc772mzQtQ0wrPyuQNrYRXgiAnSefDyCVZcGO3CyvBkpHvikuaKPQ2gKFXSFenW80B83yiVj
	uM3UzVPumoKfZapWT9LatZNOpqgRM96JKju2k8dD2qeD+X6Qf1IWNXM25yWhIF6HWGXanNMsoJaB7
	1SLzL+CxMmcC9G1zUjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yq-0000000HC3C-42cr;
	Thu, 03 Sep 2026 11:24:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yp-0000000HC2s-1ZiM;
	Thu, 03 Sep 2026 11:24:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D53D43810;
	Thu,  3 Sep 2026 11:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EB71F000E9;
	Thu,  3 Sep 2026 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434690;
	bh=BP8fVbG5Ak6U2OEWE+JDGyj84FBkgh3GWou1LXrk2UE=;
	h=From:To:Cc:Subject:Date;
	b=Gy2rBH76iaSMXwWq+E+vlERjDGq4ih8uiKIEj7+y/WCtjNsosBcY8vNayBPmxuncX
	 RyROw4qBnPDlYYUY+gAEK+iT4YQ80xqNLcALsB6QeoNzhvtvwartiglMLyRMJneBQM
	 t8ow48Ud0OLmbj/NgWBYKha0Bc2ItKwjX8NMgOTw9ZtF55SxTxNu5qzum0SmTUevDQ
	 QLYrny/EMIJQMTi6bvSGjgfmx3jGIXo34brdCkoSMKCJcwjOMX6yiGNntYOWWGeJQW
	 akZbkZK/GtOR63yJZsruPqjel5/JsViQMptfKFPzWIfTOcmDkST1gtt6AQO0dCd7Bh
	 cAUvX8zVA5Qiw==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data support from drivers
Date: Thu,  3 Sep 2026 14:24:22 +0300
Message-ID: <20260903112425.1904748-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Since NXP LPC32xx SoC support in the Linux kernel strictly depends on
device tree support, the unused platform data support can be removed
from the LPC32xx NAND MLC and SLC drivers.

Vladimir Zapolskiy (2):
  mtd: rawnand: lpc32xx_slc: Remove platform data support
  mtd: rawnand: lpc32xx_mlc: Remove platform data support

 drivers/mtd/nand/raw/lpc32xx_mlc.c | 21 ++-------------------
 drivers/mtd/nand/raw/lpc32xx_slc.c | 21 ++-------------------
 include/linux/mtd/lpc32xx_mlc.h    | 17 -----------------
 include/linux/mtd/lpc32xx_slc.h    | 17 -----------------
 4 files changed, 4 insertions(+), 72 deletions(-)
 delete mode 100644 include/linux/mtd/lpc32xx_mlc.h
 delete mode 100644 include/linux/mtd/lpc32xx_slc.h

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
