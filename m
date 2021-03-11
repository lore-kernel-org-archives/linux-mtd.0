Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732A7C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:41:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE62064FC9
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE62064FC9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aBDgmH7KiacPiZ9S9JXT3j+9YQX1NDVF6l4RQmvFm1k=; b=WLJpyvIhyBNklH5eioqvH37l4
	+hU4y2UeN0kX3cqdCmhhOgMsdCfT6PKgCCEszVKTkCmTm4XxlikVPfOtZFfdLTgxtbMNrGVxnAwTK
	QgAgZqRqFwwM1zVdzI++NxF0Po0/9RlSPPbSfI/eYtPL40T8eYBwyjXyPhSYNUA7MhXyvhZUw05+F
	BJ7qCbnzzPf9FUGRURxaR8Ie5Ke1xunvNCMtjkpixsAI91HcMWEyraMc4RLmQrbLGhIHVhbx64SzH
	/JayWcCLdEeBXSl9zMtjkJKXaRMqZfALFDRjMCe0/mFEdXCTHY+YrDaM/o9Ez/Fp0XaOQDbrisKUZ
	zdEm6RhCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJgE-008xYv-Gs; Thu, 11 Mar 2021 11:40:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJen-008x83-U4
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 11:39:12 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1770760005;
 Thu, 11 Mar 2021 11:39:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, chris.packham@alliedtelesis.co.nz,
 Sergey.Semin@baikalelectronics.ru
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: fix error return code of physmap_flash_remove()
Date: Thu, 11 Mar 2021 12:39:05 +0100
Message-Id: <20210311113905.305884-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308034446.3052-1-baijiaju1990@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'620b90d30c08684dc6ebee07c72755d997f9d1f6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_113910_684711_C810CAF3 
X-CRM114-Status: UNSURE (   6.80  )
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

On Mon, 2021-03-08 at 03:44:46 UTC, Jia-Ju Bai wrote:
> When platform_get_drvdata() returns NULL to info, no error return code
> of physmap_flash_remove() is assigned.
> To fix this bug, err is assigned with -EINVAL in this case
> 
> Fixes: 73566edf9b91 ("[MTD] Convert physmap to platform driver")
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
