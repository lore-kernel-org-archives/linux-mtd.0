Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BD0C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 09:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D60EC20854
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 09:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eB/uytil";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjivZAfd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D60EC20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88235R4luvLCis0ntu3FfHt+vHAoTzURp6tlR4+M/8Q=; b=eB/uytil4MURPb
	Jw+4txJsdlMLiSYW8xz+qZmZWzKzTGAongZHKrSksTrnlStnAinbOS4AGL/vsMEZPP5lrNHwBhqdq
	DFWarP0Noie3xIMSRMp8RGhnbEeP4B++5+SBTxDUZHSBuRAv6eXkvVUydjAGrmsSjmF/ZcaAd8hpn
	6y+30s6z2TKnBVVxPwukFSLyIDZX0TnEF7tg6fltoOtSPiLp04DmRteSQy65uAjjeECC9yD4ntt1/
	Tj2M0eYHFdh9r1VHX5nOH96Aef8yPE12MPJ2VqCO3iGQm19FG/JxWkZEWpwmPccLoh23FqK71bWTJ
	YKvv21NdY4f+POcH2Xow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmawX-0004Qs-Hd; Thu, 24 Jan 2019 09:05:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmawV-0004Q8-29
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 09:05:00 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB27920854;
 Thu, 24 Jan 2019 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548320698;
 bh=KL+TaVYEpq/+VzosX5WxiMm+GX9nRi23JQ144G9t6ro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MjivZAfdHYHYCGzQM7egoWG+zsvHEU7YeFiw/ZXVIYpM6bwC9T2iK0ehnHSIlwnb+
 NJ7ZRGnhmLpMLxqqUPnWoT5s9737G3qqvV7UBlQHyq7a/rrc6jJmCvijW5O4mHHzit
 iayqEtAyhlYVgPxjYXb4NQcmIvCiS4mz7+Sap8uo=
Date: Thu, 24 Jan 2019 10:04:48 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190124100448.39197d63@bbrezillon>
In-Reply-To: <6dadd565-aa59-82ba-757f-db0a1c03656d@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
 <20190123103512.722095cd@bbrezillon>
 <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
 <20190123122514.0db87887@bbrezillon>
 <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
 <20190123132249.2e7f65a2@bbrezillon>
 <358c78d9-6507-3998-a065-ddd18809d02b@denx.de>
 <20190123134050.7efe59a6@bbrezillon>
 <20190123135735.358fc9a6@bbrezillon>
 <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
 <20190124085018.2ad33dab@bbrezillon>
 <39d6edd9-14ad-8110-b618-6454f6840b28@denx.de>
 <20190124091459.11cb2912@bbrezillon>
 <6dadd565-aa59-82ba-757f-db0a1c03656d@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_010459_143225_4EF2A05E 
X-CRM114-Status: GOOD (  23.05  )
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
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Jan 2019 09:52:28 +0100
Stefan Roese <sr@denx.de> wrote:

> On 24.01.19 09:14, Boris Brezillon wrote:
> > On Thu, 24 Jan 2019 09:00:43 +0100
> > Stefan Roese <sr@denx.de> wrote:
> >   
> >> On 24.01.19 08:50, Boris Brezillon wrote:  
> >>> On Thu, 24 Jan 2019 08:35:32 +0100
> >>> Stefan Roese <sr@denx.de> wrote:
> >>>      
> >>>> On 23.01.19 13:57, Boris Brezillon wrote:  
> >>>>> On Wed, 23 Jan 2019 13:40:50 +0100
> >>>>> Boris Brezillon <bbrezillon@kernel.org> wrote:
> >>>>>         
> >>>>>>> This definitely does look better. I assume that we are we on the
> >>>>>>> right track now?  
> >>>>>>
> >>>>>> Yep, and it confirms the ECC caps => 8bits/512bytes. Will send a proper
> >>>>>> commit for the fix I did and Cc you so you can add your
> >>>>>> Tested-by/Reviewed-by.  
> >>>>>
> >>>>> Oh, looks like a side-effect of migrating to the dirmap approach
> >>>>> (merged in nand/next [1]) is that this bug does not exist. Can you test
> >>>>> the nand/next branch and let me know if it still works?
> >>>>>
> >>>>> [1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next  
> >>>>
> >>>> Unfortunately this does not seem to work. I was unable to boot my
> >>>> platform from this branch directly so I rebased all MTD/NAND related
> >>>> patches on top of the latest kernel.org tree for this.  
> >>>
> >>> You mean linux-next?  
> >>
> >> No. I can try linux-next as well if necessary.  
> > 
> > So which branch/tag is it based on?  
> 
> Linus's tree "master" (5.0.0-rc3) with some mostly platform
> patches applied on top.
> 
>  From your other mail:
> 
> > Can you find out which layer (spinand, spi-mem or the spi driver) is
> > returning this -EIO?  
> 
> Sure. With this small debug patch applied:
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 52f17fc42daa..80fa234ecbdd 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -298,9 +298,11 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
>          while (nbytes) {
>                  ret = spi_mem_dirmap_read(wdesc, column, nbytes,

					^write(

>                                            spinand->databuf + column);


> +               printk("%s (%d): ret=%d nbytes=%d\n", __func__, __LINE__, ret, nbytes); // test-only
>                  if (!ret || ret > nbytes)

Looks like this comparison between signed and unsigned int is broken,
because you start with -EINVAL...

>                          ret = -EIO;
>   
> +               printk("%s (%d): ret=%d nbytes=%d\n", __func__, __LINE__, ret, nbytes); // test-only

and end up with -EIO here.

>                  if (ret < 0)
>                          return ret;
>   
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 5217a5628be2..964ba3dc4e64 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -573,8 +573,10 @@ ssize_t spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
>          struct spi_controller *ctlr = desc->mem->spi->controller;
>          ssize_t ret;
>   
> +       printk("%s (%d)\n", __func__, __LINE__); // test-only
>          if (desc->info.op_tmpl.data.dir != SPI_MEM_DATA_IN)
>                  return -EINVAL;
> +       printk("%s (%d)\n", __func__, __LINE__); // test-only
>   
>          if (!len)
>                  return 0;
> 
> 
> I get this output:
> 
> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> incremental bite[   66.598843] spi_mem_dirmap_read (576)
> rrors test
> [   66.603779] spinand_write_to_cache_op (301): ret=-22 nbytes=2176
> [   66.610912] spinand_write_to_cache_op (305): ret=-5 nbytes=2176
> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
>          error 5 (Input/output error)
> Failed to write page 0 in block 0
> ERROR: 1 | root@mt7688:~# dmesg -c
> [   66.598843] spi_mem_dirmap_read (576)
> [   66.603779] spinand_write_to_cache_op (301): ret=-22 nbytes=2176
> [   66.610912] spinand_write_to_cache_op (305): ret=-5 nbytes=2176
> 
> So spi_mem_dirmap_read() returns -EINVAL to spinand_write_to_cache_op()
> which then returns -EIO.
> 
> Thanks,
> Stefan


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
