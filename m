Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D96C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0708217D8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TSEmDqcq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWH1YOi9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0708217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cK3jf359gEIdGVNPTuLoMGg1KEMuFQxbwUNg+kA+49c=; b=TSEmDqcqdG4D6e
	HcKIoJvot5QUgsBdHSN5SgahFj8sh/PucWqSP8THs8LXZkozdwf6s+fL6ZpC8nwLSPIZAQFEpYnko
	H2OB0n2ewUrnAz/5KmhrToI4BMurSDZMa9QrKUZ+e/qC1MeuUsC1a9dpqK8+OsBQ4JMNUNSmnIWEr
	VDRlr3RvNDNOPCv3MA2lK6/Ywp0fM6WCtoD4MhK2iDmreaMXb+JUr2aT9FckV3aQmAlW5kK7iCBCA
	ogZMppW0eYbPAZNxyJnknar/ZEfDWXy24EGuQyHQRx1WSBCbf/ITMgTqMuguXUXZrVX+E9wQfnBQT
	JnxXyVrodid3d8RnRTHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3SR-00047h-9r; Mon, 28 Jan 2019 09:43:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3SF-0003wu-G0
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:43:56 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D80C20989;
 Mon, 28 Jan 2019 09:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548668627;
 bh=jEcDe2UQ46jLm//RqXuIKf3f33l5baUrnMSD5SYJlD4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IWH1YOi9aSNg50TeubHklI0s/Ynbij8EDza7wqKoxeqM5SZp9FSg6u1puZBI7YFV0
 +i5EDMmKKkJvy9J9PtDm21/wzZ7CtstPkhLTbovat71KyFNfW5XlAV/Njyu9RCxXMt
 6OdHgIk3B9xEBnHNtvKhfouxOZnqv+lacKYs2kEQ=
Date: Mon, 28 Jan 2019 10:43:38 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mtd: nand: fix kernel-doc warnings
Message-ID: <20190128104319.7a9effde@bbrezillon>
In-Reply-To: <21d5edd7-1335-2731-6d53-5b15d053462c@infradead.org>
References: <21d5edd7-1335-2731-6d53-5b15d053462c@infradead.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_014350_016383_BACE48F0 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 27 Jan 2019 18:21:42 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix kernel-doc warnings in drivers/mtd/nand/raw:
> 
> ../drivers/mtd/nand/raw/nand_base.c:420: warning: Function parameter or member 'chip' not described in 'nand_fill_oob'
> ../drivers/mtd/nand/raw/nand_bbt.c:173: warning: Function parameter or member 'this' not described in 'read_bbt'
> ../drivers/mtd/nand/raw/nand_bbt.c:173: warning: Excess function parameter 'chip' description in 'read_bbt'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: linux-mtd@lists.infradead.org
> ---
> Do you want Fixes: tags for these:
> 
> Fixes: 0813621ba898a ("mtd: rawnand: Stop passing mtd_info objects to internal functions")

Will add this one.

> Fixes: 99f3351a6d6e0 ("mtd: rawnand: Reorganize code to avoid forward declarations")

Well, I don't think that one is responsible for the new warnings since
all I did was moving code around.

Thanks,

Boris

> 
>  drivers/mtd/nand/raw/nand_base.c |    1 +
>  drivers/mtd/nand/raw/nand_bbt.c  |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> --- lnx-50-rc4.orig/drivers/mtd/nand/raw/nand_base.c
> +++ lnx-50-rc4/drivers/mtd/nand/raw/nand_base.c
> @@ -410,6 +410,7 @@ static int nand_check_wp(struct nand_chi
>  
>  /**
>   * nand_fill_oob - [INTERN] Transfer client buffer to oob
> + * @chip: NAND chip object
>   * @oob: oob data buffer
>   * @len: oob data write length
>   * @ops: oob ops structure
> --- lnx-50-rc4.orig/drivers/mtd/nand/raw/nand_bbt.c
> +++ lnx-50-rc4/drivers/mtd/nand/raw/nand_bbt.c
> @@ -158,7 +158,7 @@ static u32 add_marker_len(struct nand_bb
>  
>  /**
>   * read_bbt - [GENERIC] Read the bad block table starting from page
> - * @chip: NAND chip object
> + * @this: NAND chip object
>   * @buf: temporary buffer
>   * @page: the starting page
>   * @num: the number of bbt descriptors to read
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
