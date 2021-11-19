Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3EDC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34AAB61A86
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34AAB61A86
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w8V8S9oPxqQA4F/dNE+NcZeFhUjF8P7aynKG5LMMuw=; b=DS/632/Ykv+hC3
	R4jr7/PJwYJJi+kntck7z0ZbBePpmIIFcpJb9Pl2wDP+guM74igNluAJ4E5kudHIVYM+XLkFwMbV0
	m22C443CZvBAZGHrVhDm5AAKHDOtEkf1rZx/zCBXfEzCPM4514MVB8VkI0pxhk6WWfGfJyZYEmkDu
	KiZ0+4zsR314oP4KlZI6RHO09apv7XAi5fTm9sV2iaHAX/awfw7kzQqGQDT/L59qm/dZ21IGXcv5G
	lyLTsTvmW9laI3hcID1bV6U1ZnsLA0G5K96DPAcgGgCGvw/0I5I5Ig8HUsyS6/4ndGKSI2OoJwNUe
	gYxxkXGLd6Zld4uawg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8xM-00BLks-Gm; Fri, 19 Nov 2021 18:49:52 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8mg-00BJMf-Bd
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:38:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1F1A6200005;
 Fri, 19 Nov 2021 18:38:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/4] mtd: rawnand: Fix nand_erase_op delay
Date: Fri, 19 Nov 2021 19:38:47 +0100
Message-Id: <20211119183847.1402893-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211119150316.43080-2-herve.codina@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'869d67b754e6e40ae1bd4452ac3b865237a1caf1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103850_596413_FD7ADA8A 
X-CRM114-Status: UNSURE (   7.12  )
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

On Fri, 2021-11-19 at 15:03:13 UTC, Herve Codina wrote:
> NAND_OP_CMD() expects a delay parameter in nanoseconds.
> The delay value is wrongly given in milliseconds.
> 
> Fix the conversion macro used in order to set this
> delay in nanoseconds.
> 
> Fixes: d7a773e8812b ("mtd: rawnand: Access SDR and NV-DDR timings through a common macro")
> Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
