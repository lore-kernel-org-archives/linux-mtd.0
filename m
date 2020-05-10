Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B02C38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:03:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC35206CC
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZoRMGXa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC35206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52B48A5/N9rLAD7fS82lVzNdpaXt/qlUZqXFC/y0h8s=; b=nZoRMGXaGnnPlT
	wwCD51/yzhCzLrLvUGmIYIyQ3cgSXfeUlRZw26ihsvWEIY5K56Z8KdZ1XJEES86D3PuwubJfXxCJk
	yl9flVf/FN9uU4tCelk1MkL4EhLkn9CrCVINSTgBeLMM3defwvzHRw/zXUZIiosNa643/kpMBiJ22
	nMLAvyhb9pCw4+iNZLalHF8nCuR/UZd//E+LHMkMk7cXcjeDd5vzMiFUrgubtYtt8vOqVKBjToktT
	cppkpFgZKuUnDDdy18I34q1I6XBTfRbD/u9hR1ifAy0v/s51x9N/ikWn96CWL71yD6xv7STy3F1Uf
	hsHV/dPLu9KuSh4WelWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsAp-0005VL-GQ; Sun, 10 May 2020 20:03:43 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsAE-0004za-Gz
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:03:08 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 57E0F200007;
 Sun, 10 May 2020 20:03:02 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 09/13] mtd: rawnand: onfi: Adapt the parameter page
 read to constraint controllers
Date: Sun, 10 May 2020 22:03:01 +0200
Message-Id: <20200510200301.32496-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507105241.14299-10-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 82edcb53ec038c1b36d8a4d4122ee51b1cb24bd1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_130306_774187_124A1D96 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-07 at 10:52:37 UTC, Miquel Raynal wrote:
> We already know that there are controllers not able to read the three
> copies of the parameter page in one go. The workaround was to first
> request the controller to assert command and address cycles on the
> NAND bus to trigger a parameter page read, and then do a simple read
> operation for each page.
> 
> But there are also controllers which are not able to split the
> parameter page read between the command/address cycles and the actual
> data operation.
> 
> Let's use a regular PARAMETER PAGE READ operation for the first
> iteration and use either a CHANGE READ COLUMN or a simple DATA READ
> operation for the following copies, depending on what the controller
> supports. The default behavior for non-exec-op compliant drivers
> remains the same: DATA READ.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
