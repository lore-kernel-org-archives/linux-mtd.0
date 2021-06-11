Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24C2C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BBB61285
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4BBB61285
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFBhn+SeQBJk6AupIosxQfjIkTf+f8H/HoaPWCptXEk=; b=KWJTO8M/wuLDHu
	J712mDT66sXcjkVgnjCVRdXLl4fRvkHXTHQtxjR8zAu8kKkmjclfDwrsnNm78ujFcAdxR5DC77BYR
	Zy1DRbpBvZcktedqJExcNh7/dDrqHhc9DupxoTmlwmRmzkoMbanjyp688viCNphu4QHOCGudvAt0w
	IER87fsmNp8/1sIrb/4BOBSCBZaJAOpjGcurDhw3KykyzZWWSqe+4Hde0DdgC9pMSG7bEMBXASchH
	b9THaH+3Ku7lT5xw6Kml/LEcmHBbvoEXhwDtuch8R467wSo1gYzJN4fzGa5Q2jKdzGmOQCiWdcaSZ
	SMSR0rUPQX4hBLCuMqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrn9I-006jKd-Hv; Fri, 11 Jun 2021 19:49:00 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmQA-006YgZ-Ew
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:02:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BE1A940003;
 Fri, 11 Jun 2021 19:02:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>, miquel.raynal@bootlin.com,
 mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH V4] mtd: rawnand: qcom: avoid writing to obsolete register
Date: Fri, 11 Jun 2021 21:02:19 +0200
Message-Id: <20210611190219.226202-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1623134916-562-1-git-send-email-mdalam@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bfab74c029c6f1c0c63d89ed0a6cc8e3e30522d7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120222_689243_9F580D07 
X-CRM114-Status: UNSURE (   5.04  )
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

On Tue, 2021-06-08 at 06:48:36 UTC, Md Sadre Alam wrote:
> QPIC_EBI2_ECC_BUF_CFG register got obsolete from QPIC V2.0 onwards.
> Avoid writing this register if QPIC version is V2.0 or newer.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
