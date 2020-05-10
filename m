Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DEBC38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:13:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4EC320725
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSPFMhZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4EC320725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOakgEm4rXDVmaTDSQVZlPsvqT7G6t0b7PnUGMw/z5w=; b=kSPFMhZ+XdXlk8
	i9607vF7ovH3uNhzkMC6xVqYHhKsUyEzW8bjOVZDQz1a0123P6PI8FhrqSd6bwWwG/XC0jPDofwc7
	kgzCPATgsfwHYw3HthvkSWNztM+1TllMBtECBMhkNFAse/TS1UiDJ4qSthntUIfIfPEVRQ50lCPAn
	9YcbBNPZ4ZAAeP1C7nbJzNMYC6qWuWUvoAS031p6r+BdCHnQKL/GNDk8Php/d1cBjtDj4gteqkZjm
	ym+tFTU/Ec46fpMjgdSc7CsWbhs7nXoVVCLEdSPMxuO2OBy/5jp6P/76eSUqB41Py0g9DnIOyQz3N
	1sRS32YsOaYfuhYZ3gng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsJv-0001xq-Tf; Sun, 10 May 2020 20:13:07 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsDA-0001ed-Fx
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:06:10 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 014ADC0003;
 Sun, 10 May 2020 20:06:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/6] mtd: rawnand: marvell: Fix the condition on a
 return code
Date: Sun, 10 May 2020 22:06:05 +0200
Message-Id: <20200510200605.2650-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424164501.26719-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 8c84b3ccb901796008fc850ef0e976c14b4bb8fb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_130608_778061_0F9A986A 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-04-24 at 16:44:56 UTC, Miquel Raynal wrote:
> In a previous fix, I changed the condition on which the timeout of an
> IRQ is reached from:
> 
>     if (!ret)
> 
> into:
> 
>     if (ret && !pending)
> 
> While having a non-zero return code is usual in the Linux kernel, here
> ret comes from a wait_for_completion_timeout() which returns 0 when
> the waiting period is too long.
> 
> Hence, the revised condition should be:
> 
>     if (!ret && !pending)
> 
> The faulty patch did not produce any error because of the !pending
> condition so this change is finally purely cosmetic and does not
> change the actual driver behavior.
> 
> Fixes: cafb56dd741e ("mtd: rawnand: marvell: prevent timeouts on a loaded machine")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
