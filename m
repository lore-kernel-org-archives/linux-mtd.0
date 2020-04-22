Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC0BC38A30
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 06:48:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 914AB206D9
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 06:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTkUUbDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 914AB206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fU8IfGH7X4fW9/mczM552FnLSbuh9wIQYBbL5LEjpA=; b=PTkUUbDgGlOz9H
	jyAdIeTUs/DRv4FSKQZhh2fzR52ZTcJos47rvr4YKOZAqOcr4NdG6GgkZb9JDwxJyzJOGq4Sf/q8J
	fac4esMwO3LgrCiE9XT9jkqpSLEjUpqmCDEFVKrV5ISo6I3MQaR3Kn7/M45uJ+n+VZgcJnBp3+gGM
	V6rDlHZfYYTIGeCLLYfEq9DcZn7bFWosc05Z+RvgNxJLMq8v4U1rQq0mZQe9Kim6+3XCmzp7f3VYF
	MN0IL1AzcV/Js73gxUjp1ferrcHU/PPulYO4dGUG8g4lKBAnJ9wiYUpOdFOmakZ3m0vm/P5dprL6H
	c9SYlx8ITBEdafnD6ojw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR9Aq-000869-Cc; Wed, 22 Apr 2020 06:47:56 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9Ao-00085Q-5z
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 06:47:55 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 956382A1914;
 Wed, 22 Apr 2020 07:47:52 +0100 (BST)
Date: Wed, 22 Apr 2020 08:47:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/8] mtd: rawnand: timings: Fix default tR_max and
 tCCS_min timings
Message-ID: <20200422084748.5876ff87@collabora.com>
In-Reply-To: <20200421164637.8086-3-miquel.raynal@bootlin.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
 <20200421164637.8086-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_234754_350893_7818FECA 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 18:46:31 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> These values are hardcoded, there was no need to try to convert them
> in picoseconds, better write the right values in picoseconds directly.

Hm I had a hard time understanding what was wrong and whether this fix
was correct or not. Maybe you should just say that tR and tCCS are
currently wrongly expressed in femto seconds and this is restoring it
to pico seconds.

Other than that, this diff looks good.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Fixes: 6a943386ee36 mtd: rawnand: add default values for dynamic timings
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_timings.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index 0061cbaf931d..36d21be3dfe5 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -320,10 +320,9 @@ int onfi_fill_data_interface(struct nand_chip *chip,
>  		/* microseconds -> picoseconds */
>  		timings->tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX;
>  		timings->tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX;
> -		timings->tR_max = 1000000ULL * 200000000ULL;
>  
> -		/* nanoseconds -> picoseconds */
> -		timings->tCCS_min = 1000UL * 500000;
> +		timings->tR_max = 200000000;
> +		timings->tCCS_min = 500000;
>  	}
>  
>  	return 0;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
