Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21967C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:01:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3242864DF4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3242864DF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cf8uBwgfLkvBz0FVrMf0NI/90QjFayNXCKRpY0v0LDM=; b=ieONmDEZ8FUsrk4nrfHJZL5MV
	GKO01rfHW+Ez1tPhsuEqvorR1jvHCOEEz0aLwIIVX+dHMkinWSJfKZ2j0m/Hg79//ak22fitQV5zr
	bda0J+EogDsnboyEohnE6lFPAW39PNaqYFaXz8HBORUExeoKUx9pVyajuAmkhstJ6Upgcq2+YtJL6
	UTb5uJySenDiJFjgPNv2b004a9R9w/N0veRc7D4HUGXrHyoRynxmhdF2nhqtp2MOCbj3oGHy+rvYn
	cOcBMXIMLg63Pu/Ex2hinfovnS0M8zX/RkUxqxjUTduUxc6DzUJsQ6F9J4Plf1EJNTJ5Hxt0iYmAr
	HBQUFdP2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUr6-005hqx-6Z; Wed, 03 Mar 2021 17:00:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSsG-005Ei3-36
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=g7jGJQudikeyTC28JfM/nQNmIDFIxgjf3qQ5Xa1ts20=; b=gKuCbpsYZ+wKivr3DgF74vTb7u
 TCOWfuDcM23+4XGPekYcfrHGrvh75lYae2zQA5GdSehWBdW0Nre1Mdi2FMYBn4aqa7xtDO4biiGSN
 UgIgoKeCjsFpvN1LFymUZBSJoPXVQNvN5CD4rnzy7fvWpuBQ9fVv5E/crJlnlG7ZIDgzd8e3RI+yb
 gXVIZaJ/gO+7UlRzf3KcvAK/M4NDEqCqnettpb64F1Z9n8FJr3spOf+F/kdFDfMTVHuah21Tpe+gZ
 BgEW0m7N2xaYbnLZUZDL+CzI77JKu5ouD0Adsllc4l8DJXIJVGb5PwMc2PTfdRvwJuVThdalY9PfM
 xysLfjZw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7yC-00HSJ0-15
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:34:02 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 28AF11BF20E;
 Tue,  2 Mar 2021 16:33:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz
Subject: Re: [PATCH v3 5/9] mtd: nand: Add a helper to retrieve the number of
 ECC bytes per step
Date: Tue,  2 Mar 2021 17:33:35 +0100
Message-Id: <20210302163335.23969-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 0c238af656c2398175901b8a28f2a5b7b691594c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163402_678709_AEEB71FF 
X-CRM114-Status: UNSURE (   5.71  )
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

On Wed, 2021-01-27 at 20:30:16 UTC, Miquel Raynal wrote:
> This operation is very common and deserves a helper. It of course only
> works after the ECC engine initialization.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
