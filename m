Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43320CA9EAF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166DF2083E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/6couev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 166DF2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y614HGq3Xr/FT7qTK7QBNQs08T6uBUQNwfDmvmenzzY=; b=R/6couevkFBppc
	ws+c+bG0Ir7vUyH5ha5vXGpeSR0/AI4e+Gam5S4nQLJNzyzvOnAArjE/qOtMl0pBw0RQnJPj0J8iE
	APtnOg9WV0YtlVOF17FMkFFKNJV8Ynjmt1b6hMc9iZU+hTiRk+faSMhTOLBxFcHOKX7l73uBFEe09
	Hj0KNMC/INMTe8YPjGfzTdGRT0UrZGSWUp8jVV8envJGNnCRD8Ov1q7yUHFCPDTOOYEnId1Wn/Q/r
	fo9GAyzTVbQGqDgxTmiQCbolhkLWoUcgzHR6SBexJfnkDW5AZvLwbHnLGrc6hflrnxqhIwyn0KJLH
	AkOySldd4pOTVvc5TBew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPjGy-0002NA-Fd; Wed, 30 Oct 2019 08:24:08 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPjGv-0002DR-2e
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 08:24:06 +0000
X-Originating-IP: 81.185.173.67
Received: from localhost.localdomain (67.173.185.81.rev.sfr.net
 [81.185.173.67]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0F82320007;
 Wed, 30 Oct 2019 08:23:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mtd: rawnand: remove unecessary checking if dmac is NULL
Date: Wed, 30 Oct 2019 09:23:41 +0100
Message-Id: <20191030082341.11751-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030074509.15664-1-piotrs@cadence.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 777260a5c99226cfa58325b6a7c2f39bb46f5aaf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_012405_259655_3B1AD145 
X-CRM114-Status: UNSURE (   6.41  )
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
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-10-30 at 07:45:09 UTC, Piotr Sroka wrote:
> Remove unecessary checking if dmac is NULL.
> 
> If Cadence nand controller driver uses DMA engine then cdns_ctrl->dmac
> cannot be NULL. It is verified during driver initialization. 
> If Cadence nand controller driver does not use DMA engine then 
> CPU IO read/write are executed instead of slave DMA transfer. 
> In that case cdns_ctrl->dmac is not used at all.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com> 
> Signed-off-by: Piotr Sroka <piotrs@cadence.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
