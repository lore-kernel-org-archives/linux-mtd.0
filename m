Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C2C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 06:19:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385502086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 06:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taH8A1ZH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL7oGQKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385502086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPdirmcp/yrOeEJQrspAAfj9oSWUKc+gVRlrLHVvteM=; b=taH8A1ZH13w/HW
	1kWvr1b93V6pv9E4xE56IrT8/b6d7qFW1nT7KGjZVH3Zzv2X0JsBZiLSPpQDovdTx9M1kP6GGofQa
	b8jYRNTMIyZvYoq1L2eCUeG259wLbW8fC5pgBOct4IH2vq3LSigYM/OtJ9pQPNqlhf4BR32tJPFJ2
	AF9mY0DQ22K8t2xUY5N7OArowBZqq9thGbNnqlzQOlK7LzaRUm6VMKFgSUbvfXSpNP1LMikogKD0W
	6dlFZ46Oioi5VPtkYrqJ8QbreWpTYZIVuZ8hxeNQP9hbh40HP2mCyMZ1yt78MGPz3vbrKLVt0MwqV
	X9HE6S/tuwuMCVEvDJeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkNV7-0007RW-AK; Fri, 18 Jan 2019 06:19:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkNV3-0007R6-Oe
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 06:19:31 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBA9E2086D;
 Fri, 18 Jan 2019 06:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547792368;
 bh=L0hcXLWboVxbebYY+QO8RZp3MMEjZK7FjCy6m/7Z25Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HL7oGQKljHAmg9xImIo+BF+RQIMRzRK7ClyDNp2sGsWwiYqjuEhiBir67EVacw2tv
 xh3oOo7tjsxTaeYf4D/ld2w61ikDmYIzhr36sKEp3T/69ZvH7LyGGNJLr1B+pzd5eO
 JLgc8T0vTB4rXZ4InJWWlTxn/LnOQ7/SH+rHFe0s=
Date: Fri, 18 Jan 2019 07:19:19 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: denali: get ->setup_data_interface()
 working again
Message-ID: <20190118071919.5c4015f6@bbrezillon>
In-Reply-To: <1547789438-11899-1-git-send-email-yamada.masahiro@socionext.com>
References: <1547789438-11899-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_221929_833960_CCBA3D58 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org,
 "linux-stable # v4 . 20" <stable@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 14:30:38 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Commit 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to
> nand_controller_ops") missed to invert the if-conditonal for denali.
> Since then, the Denali NAND driver cannnot invoke setup_data_interface.
> 
> Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
> Cc: linux-stable <stable@vger.kernel.org> # v4.20

Commit 7a08dbaedd36 was merged in 5.0, I'll drop Cc stable when
applying.

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/raw/denali.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index eebac35..6e8edc9 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1322,7 +1322,7 @@ int denali_init(struct denali_nand_info *denali)
>  	}
>  
>  	/* clk rate info is needed for setup_data_interface */
> -	if (denali->clk_rate && denali->clk_x_rate)
> +	if (!denali->clk_rate || !denali->clk_x_rate)
>  		chip->options |= NAND_KEEP_TIMINGS;
>  
>  	chip->legacy.dummy_controller.ops = &denali_controller_ops;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
