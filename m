Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BB0C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:58:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF2920870
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMXHouO9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1eZfY0+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF2920870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23ifTO2oh/Y3Q3qFrTcuOcKaqxz/Ls5sgosEih81UJg=; b=SMXHouO9NT13wo
	tP0rx9ncIJ+DN568WlhYv8emOqbqM0VcyjHH3VNNItNauLgrtobJQFyJF/DBanhTGTi7ndY3w/jL0
	4KKYYnFV3bcPB366DClUzNjntfwRd42JTzemIZqdxti2uee+InQF1wldIz8qx0tDADTIR43Y+cdqD
	aKzhCQScTggRk4Yk1PH2rPCQtEVrD5AJA3qgjDAh8CBNW97wcZqnPhcrb/lsBIxsFqbLPhBmbeXIM
	hDcftiKinaAWzqLVEwS/daKA+evEapwyoJ7citjUvxwCfKQ0T5qIzo5xrmcckVF9xIN92Q81PiaYj
	cCZqQmKURqgStzfQiG6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glzNp-0004RN-PX; Tue, 22 Jan 2019 16:58:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glzNd-0004FU-61
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 16:58:30 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84BAE20870;
 Tue, 22 Jan 2019 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548176308;
 bh=iYtfkjAHeczYKdek7s+5J/6FnlxBbJYGDQnM3biZwVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1eZfY0+fI6vpyNW9pxKVddkjJP3jzLzxoCeQzaJHrZl5pCTC/olJMzSAvASF+w4Hs
 kkUTk1P4g95Ix6JERvgReD2a347ls8fGKDLtDMCqaIk0uj4ikOJ3ljsXnb/xI9/q5r
 kbo8Jmi1cY0ruvxiLbfTnOQMLh8dKZo4xixsl1ro=
Date: Tue, 22 Jan 2019 17:58:22 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190122175808.59e698c3@bbrezillon>
In-Reply-To: <20190122145632.17547-1-sr@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_085829_237682_339AAD6E 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jan 2019 15:56:32 +0100
Stefan Roese <sr@denx.de> wrote:

> Add support for GigaDevice GD5F1GQ4UC SPI NAND chip.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Frankly, I'm a bit unsure, if these new ooblayout_foo functions are 
> needed for this device. I was unable to find a datasheet for the
> already supported devices (GD5F1G/2G/4GQ4xA), so I couldn't compare
> the OOB area values here with the ones for my SPI NAND chip.
> 
> I'm also not 100% sure, if I should use NAND_ECCREQ(8, 2048) or
> NAND_ECCREQ(8, 512) for this device.
> 
> So comments welcome.
> 
> Thanks,
> Stefan
> 
>  drivers/mtd/nand/spi/gigadevice.c | 39 +++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index e4141c20947a..a9d256fa2577 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -57,6 +57,31 @@ static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
>  	return 0;
>  }
>  
> +static int gd5f1gq4u_ooblayout_ecc(struct mtd_info *mtd, int section,

We should probably prefix all funcs/objs with gd5fxgq4xc: the datasheet
I have is named GD5FxGQ4xC which means it should apply to other
variants of the GD5F1GQ4UC part.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
