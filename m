Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D3C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA32C60FF2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA32C60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CVhMhAUFzarYkk9OWLLuOrmNGuYPasoBif7mxcJfbI=; b=UmZCE3VbloHTzk
	zO0VcEXCr1L43Bd6OShQxqs2hv3iiUwGCYJwfR0Ndtb7k6L8NcuRa9exxr72KAkZncq2dcgbFB/EY
	lMUBeh9RPFNBfcKACdlte04sPWDf8b3XGgqF/Vr9UDOZ8a+r8O56LGj1Rt4tnwcTRfp2qK1FL/QmE
	9YltcamYw/VVnht8lI7eFpmCNmHS8A5KOUcyPctetYQIWh0RbXqzSz4aNGqrGoIfbt/o9QO0W+k3Q
	1fDm9iTXXIBqvZYcY5jGzIZPDxi7ynOo+9cOtryEmCRiChFtlSv20HQr3M1/VJv5dEgCFJ+lfc6BM
	6GFPCU8Fr2urEG4uGi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKVz-006Ux2-8N; Fri, 15 Oct 2021 10:32:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKV6-006UZb-J6
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:31:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8504920009;
 Fri, 15 Oct 2021 10:31:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: rawnand: arasan: Prevent an unsupported
 configuration
Date: Fri, 15 Oct 2021 12:31:40 +0200
Message-Id: <20211015103140.949192-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211008163640.1753821-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fc9e18f9e987ad46722dad53adab1c12148c213c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033144_784883_F7D9D3BF 
X-CRM114-Status: UNSURE (   9.46  )
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

On Fri, 2021-10-08 at 16:36:40 UTC, Miquel Raynal wrote:
> Under the following conditions:
> * after rounding up by 4 the number of bytes to transfer (this is
>   related to the controller's internal constraints),
> * if this (rounded) amount of data is situated beyond the end of the
>   device,
> * and only in NV-DDR mode,
> the Arasan NAND controller timeouts.
> 
> This currently can happen in a particular helper used when picking
> software ECC algorithms. Let's prevent this situation by refusing to use
> the NV-DDR interface with software engines.
> 
> Fixes: 4edde6031458 ("mtd: rawnand: arasan: Support NV-DDR interface")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
