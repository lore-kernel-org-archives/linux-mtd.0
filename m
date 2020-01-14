Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53FAC33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74AB82465A
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:04:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOWtJ54o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74AB82465A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvMAAZ1c/d0igKtiJP+NXfI5IExnwhIHy6jHDV0GFPc=; b=pOWtJ54oCtIQzB
	N2KmkqwERNP50ljn+welbRAzdzVQNFnb617MHZm7ULLQXlNdBudDLHhXvXzFMVqZD6CxH3LvT2Hs4
	Ge6SRk2kwQo5OtOFyy2QP/Q38Dk0lsh4qHWSK3ZiPGPk/5GL/ml8fxeXk0VeOXueqvsUQtUddPwvK
	utFJF2MCVWpM+aJraC7rPgQ8tOvhRIGMVN9RLJFsoxbVKczFoFGS7fMef0G7CA7hCoo5ah89gSH7n
	91PP1tCf5ms1LJasE7Pm6PygmQXidQ34zGj2K65aS/hYk8L/pMmTYs9Qseok/Iz7HGaeBvSWZbCIc
	4jh+5GWe0kk9LBg4VOOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPbo-00069q-M8; Tue, 14 Jan 2020 17:04:04 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPbj-000635-6j
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:04:03 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9D892E0012;
 Tue, 14 Jan 2020 17:03:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Esben Haabendal <esben@geanix.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: gpmi: Restore nfc timing setup after
 suspend/resume
Date: Tue, 14 Jan 2020 18:03:42 +0100
Message-Id: <20200114170342.841-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102130826.170647-2-esben@geanix.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 61af58cf19a389d64cfa5e516774b1a322040a3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_090359_396233_FDEC1398 
X-CRM114-Status: UNSURE (   6.25  )
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
Cc: martin@geanix.com, sean@geanix.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-02 at 13:08:26 UTC, Esben Haabendal wrote:
> As we reset the GPMI block at resume, the timing parameters setup by a
> previous exec_op is lost.  Rewriting GPMI timing registers on first exec_op
> after resume fixes the problem.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> Acked-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
