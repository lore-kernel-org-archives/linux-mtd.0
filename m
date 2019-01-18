Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D59C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:22:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048EE2087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWBvc6SX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZdgV4ar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048EE2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hfly8CwKelXQZJHHbgl9Rdm/koVi3aQfQXhf0Spjo2w=; b=mWBvc6SXkJ33KD
	s0uUwyLVrUioLLggRv01ALC8r29Mp1C8VR36w7NBKX2/TvQ6jgdEC4IPZ3QvrkBmTPCHk8CuOzbVI
	OLQC0tlMB7C8WA9dilfGvQuIIOzoF3pLk+QYsDh62dXjqjcCGyRzAsGK+akH/iCTqDO7IOXisn2Pm
	JE6PifQ1y3yd2rChljpHsocToc+DXHw1MMfk0X6HQG8vBXK7FK5TVcRNsPTftRkYTu4jnc1PGGI9v
	WrOL9tjuVaKq+/H+3tqX8pjhlNPmsFns4vdYVxcsjkKRvh1GyzxDlYfGbZ5dyi5gVT0VEZ744fbIl
	dRCLTSy5q8boPRi1K9pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPQH-0003SI-Bh; Fri, 18 Jan 2019 08:22:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPQE-0003Rw-69
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:22:39 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E73E920883;
 Fri, 18 Jan 2019 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547799757;
 bh=vY5Lm687NkyEh250tn/+nfIT0119zwGMwYtUt9ENryg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sZdgV4ar3yhJw74YOXlvUaAFyFwqprRsoDmnUQbAQedZPWoCOzjcaMiAICrKyReL1
 S7Tj1Lw+UEOINX62MZTTDnID3KGuo8QOmOF1rTVDzmIR2l7RmyBvVGJReK+q0ME5B+
 bcT6AsWFj27mfDurgsYzsSRgsaIbMh8RtOkOtRdw=
Date: Fri, 18 Jan 2019 09:22:25 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/8] mtd: rawnand: jz4780: Use SPDX license notifiers
Message-ID: <20190118092225.440f0e6a@bbrezillon>
In-Reply-To: <20190118010634.27399-3-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
 <20190118010634.27399-3-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_002238_274857_D38C19C6 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 James Hogan <jhogan@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 22:06:29 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Use SPDX license notifiers instead of GPLv2 license text in the headers.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/mtd/nand/raw/jz4780_bch.c  | 5 +----
>  drivers/mtd/nand/raw/jz4780_bch.h  | 5 +----
>  drivers/mtd/nand/raw/jz4780_nand.c | 5 +----
>  3 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
> index 7201827809e9..7e4e5e627603 100644
> --- a/drivers/mtd/nand/raw/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/jz4780_bch.c
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * JZ4780 BCH controller
>   *
>   * Copyright (c) 2015 Imagination Technologies
>   * Author: Alex Smith <alex.smith@imgtec.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published
> - * by the Free Software Foundation.
>   */
>  
>  #include <linux/bitops.h>
> diff --git a/drivers/mtd/nand/raw/jz4780_bch.h b/drivers/mtd/nand/raw/jz4780_bch.h
> index bf4718088a3a..451e0c770160 100644
> --- a/drivers/mtd/nand/raw/jz4780_bch.h
> +++ b/drivers/mtd/nand/raw/jz4780_bch.h
> @@ -1,12 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * JZ4780 BCH controller
>   *
>   * Copyright (c) 2015 Imagination Technologies
>   * Author: Alex Smith <alex.smith@imgtec.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published
> - * by the Free Software Foundation.
>   */
>  
>  #ifndef __DRIVERS_MTD_NAND_JZ4780_BCH_H__
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
> index 22e58975f0d5..7f55358b860f 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * JZ4780 NAND driver
>   *
>   * Copyright (c) 2015 Imagination Technologies
>   * Author: Alex Smith <alex.smith@imgtec.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published
> - * by the Free Software Foundation.
>   */
>  
>  #include <linux/delay.h>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
