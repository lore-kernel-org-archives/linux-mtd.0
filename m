Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFC7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:15:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310FD64EE4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310FD64EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oNJ4DWnOeyPYgQuNl59Iw/WFuPH9kHtGxETMi1U7sc8=; b=OfMtRqPC0uQgALdLZMNYQSOxj
	oofYonZxYlSWMAG4eA52zjmd9MIMorYvJSoaZsc2oTpIDN63sk+mRXHz7fLus/lzZumHIDW/t95R1
	keuhLguolEjfaXUwSPEeHRdx1uqz+gJaQCFNnwIDYL5mqPQjkdnH/cagUvhzrZ1I8x3v74x61wQnz
	ohxnblAns445cXM7HjrePiFjrQSX5zI4YK+RQupFJSSEVsVQv/XfOneIAxxQgWkxW2KZ9b/YvVZqR
	tqg+oAhzQHexVqXPhdt7vm187TivKTDsyv8B6Viy1NqG8BQ31AlnVR3FcSmK8kVg6ueciacZQeAn1
	HOuXG+j2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHW1J-005yTL-KU; Wed, 03 Mar 2021 18:14:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSzH-005Gfj-7l
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6Y7ONAnghPf53xQzuLO5nHzLI1x4WsOgewty2MDaHnE=; b=TnJFdPhrmV2eBa/ELCDzTb1sNU
 pB/fCHMkPenGaneC5ItyExv8k/mmPX/k2yPyeOOs6HNMtmbEgxlg4Txdm1QPhchG3mESQ+SE3p3/d
 YEZ+FN6tZpuOH5wyJ6P3ofirZ2OoR9BpD0/RyHS0MDLFTCaYGiAPbqw2nMWAP7xP7tMCSjg0DIQoX
 hPJ256qip1Faq9kBOOOW3n7TyZ3BYmHQL7XT36JkI5LkQ0+I6BB3t+ANk5fuzdzNH0UWYzFN5ivwc
 ZHA4otHGuZ3+Zwu5IJXD0V2/kd927kxOVn48AYToNCSuazY+8BvrzjlqjCk5mrjOc5XBzow3ZyF4K
 r7QdGbmg==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xF-00HSDH-IX
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:06 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7E0BA1BF20D;
 Tue,  2 Mar 2021 16:32:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>, miquel.raynal@bootlin.com,
 mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH 1/5] mtd: rawnand: qcom: Convert nandc to chip in
 Read/Write helper
Date: Tue,  2 Mar 2021 17:32:37 +0100
Message-Id: <20210302163237.23331-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614109141-7531-1-git-send-email-mdalam@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 7eff256102bd515a0f9e2c9c2a06b6d8b4ee1125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163306_280947_044F4D02 
X-CRM114-Status: UNSURE (   6.36  )
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

On Tue, 2021-02-23 at 19:38:57 UTC, Md Sadre Alam wrote:
> This change will convert nandc to chip in Read/Write helper, this
> change is needed because if we wnated to access number of steps
> in Read/Write helper then we need to get the chip->ecc.steps,
> currentlly its not possible.After this change we can directly
> acces chip->ecc.steps in Read/Write helper.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
