Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C943DC38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:12:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962D82075E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CL2DQfHt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 962D82075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwVsZeY7ud5SHcX4nvFqDthDCHF2TeDQ1uRddSni7k4=; b=CL2DQfHtBiCkOO
	T42K9ddhpfvm3klrkj4w6vVqg/7rBBdYeVYQE/opDrk/HcG2BHhBKthDOp0hleYfx1u8eYZnQ3Qqc
	gECFTe1C92zUFA3IRF/6zbECTU3Yg8rziHeBzR0tQymn5I5Hn8stvC6OVOOx30cEcwfcg5xjuo3aR
	j2zQE3NkC0msILaMn5rNVFYpwRWau/GAz9NfUKjaAeX79xqOU/0/NxZ5WXVTtMxF5n9tMfYEzn2p8
	RiMEWpqJTBoBAWgDsXKiOAHUteaRoeRs93RMRoFUOGhLlm6M91KOJH5WCyYDctMb9hBg1bhmBAcYu
	pldhCrdSeHcWpnWE+m1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWfO6-0000xe-0t; Thu, 07 May 2020 12:12:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWfO3-0000wM-28
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 12:12:24 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C06772A0342;
 Thu,  7 May 2020 13:12:21 +0100 (BST)
Date: Thu, 7 May 2020 14:12:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 07/13] mtd: rawnand: Add a helper to check supported
 operations
Message-ID: <20200507141218.17184a80@collabora.com>
In-Reply-To: <20200507105241.14299-8-miquel.raynal@bootlin.com>
References: <20200507105241.14299-1-miquel.raynal@bootlin.com>
 <20200507105241.14299-8-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_051223_230546_B9753048 
X-CRM114-Status: GOOD (  16.01  )
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

On Thu,  7 May 2020 12:52:35 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Let's use a helper to clearly check if an operation is supported or not.
> 
> Return -ENOTSUPP when ->exec_op() is not implemented as we cannot know.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/internals.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 9d0caadf940e..f571a226574d 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -106,6 +106,15 @@ static inline bool nand_has_exec_op(struct nand_chip *chip)
>  	return true;
>  }
>  
> +static inline int nand_check_op(struct nand_chip *chip,
> +				const struct nand_operation *op)
> +{
> +	if (!nand_has_exec_op(chip))
> +		return 0;
> +
> +	return chip->controller->ops->exec_op(chip, op, true);
> +}
> +
>  static inline int nand_exec_op(struct nand_chip *chip,
>  			       const struct nand_operation *op)
>  {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
