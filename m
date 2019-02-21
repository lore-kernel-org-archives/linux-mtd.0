Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB8AC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D6042084F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D/lot5QG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYyPw0aG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6042084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mApPlGDSnyD7uIFGTGVaTVHd0xCIPV8ErY4WXhV2ZdA=; b=D/lot5QGOPTCzU
	rIg5siBHaDXi06JXopppYi/7ndXWbq1qDk3fgQMZtd5NTMkTHX1/W7QChNU6UtJp16VHCyGkCvaMU
	I/4koaQGE9W3vbk2hOi0MyByQjn5Z5P7jc9CAO4fOTbSJfkXdjJqgRFY00woEZOcEudhfbv6qdmal
	nTzvk9uKoAiXDxC2JU9eiPIa0G0ED38qMBV32bP0agpNE7PRiavqAyuhsvqXo5rKu8+xXCoOR7WDm
	WQOhoabMFtephkAZMVw2VvuDRucPgHiUfrayrEUovy9e4NTEIg3k1E1g4KcmO7EiQm5qQs6R9TtTL
	PF2YNlBHZumCWUELeDTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwmNo-0005SF-9E; Thu, 21 Feb 2019 11:19:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmNf-0005KG-9N; Thu, 21 Feb 2019 11:19:08 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7DA32084F;
 Thu, 21 Feb 2019 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550747947;
 bh=OFWRmPdHR9MMBor0LEiYPxs3cWI8jGhrxy11w5VI+4M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sYyPw0aGHSr5e4wIEFbPHuD3OsbdxtrBqd7kH8zyGrTeEAI4wuX97gRU794pC+cvk
 KjSPsKkb2NlGSKVHlDJKs4bnZ6sD2SKFDzmKvle0LIytCADcGML3iaj0UatLBDSEoH
 0jCpmPMpC/E3owbQ35ftRzBpmmtYB/4icXTbJJnE=
Date: Thu, 21 Feb 2019 12:19:00 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 05/27] mtd: nand: Move standard OOB layouts to the
 NAND core
Message-ID: <20190221121900.19d28477@kernel.org>
In-Reply-To: <20190221100216.25255-6-miquel.raynal@bootlin.com>
References: <20190221100216.25255-1-miquel.raynal@bootlin.com>
 <20190221100216.25255-6-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_031907_344457_4CBB3D72 
X-CRM114-Status: GOOD (  11.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 11:01:54 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> These OOB layouts are generic to all NAND chips, the should not be
> restricted to be used only by raw NAND controller drivers. They might
> later be used by generic ECC engines and SPI-NAND devices as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/core.c             | 161 ++++++++++++++++++++++++++++

Can we place those definitions in ecc.c instead of core.c

>  drivers/mtd/nand/raw/nand_base.c    | 161 +---------------------------
>  drivers/mtd/nand/raw/nand_toshiba.c |   2 +
>  include/linux/mtd/nand.h            |   4 +
>  include/linux/mtd/rawnand.h         |   3 -
>  5 files changed, 168 insertions(+), 163 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
