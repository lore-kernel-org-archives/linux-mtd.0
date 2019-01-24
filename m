Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6D2C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 12:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0966521872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 12:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+QUXcu5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbUOTOsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0966521872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIsksHesDiyaHFUXWLqSsy//wCUP9C0zCKQG6iyGFt8=; b=T+QUXcu5c2vl1F
	6otT02+TwrGQw6al9exydMjxXCb6CLOlbsrG5DoQRGRwNBIVrCssolcfzvrPqE+BO2xueAedswzXV
	/PmYKxQnROw+2cBfXdBtUDs0fWX3zcK29+4s0oNPH21BhuD0A/vYwyU4eXIczvpuqZGzBq8Z6haZx
	zHB/3m23DFGMniXGYkhqxNKrGSJ6g7z0j8PllQWdk2lKcj39bN+5Gx6HFVr+1k2fMNC+MTvKwGZ5h
	XrvHLDdzDqa2f79MZLcadYfbmIDUofp9b4xazHex4XSU14A/THPlY4zmzocoLKVl7n/A54TAH98Fm
	LJWzmLEyeh4xpbvM0Q1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmdxf-0004Tn-3c; Thu, 24 Jan 2019 12:18:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmdxb-0004TP-Ol
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 12:18:21 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A065521872;
 Thu, 24 Jan 2019 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548332299;
 bh=EhQscJs2W2T78f6r9A69ptSXMfffYpAgXico5EQfbSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nbUOTOsEd4WBEYsf3+t1oSXwRTZit1mgBMfGSOdqRLIHDFpBsu2FQyWJFvFt8iP29
 LD2md3zm80HgW8FTx72wmJCUoN1T/n8tOTIK2DjTHzjWOAbwHvjUf+w9kXTWYc+naI
 HacnbxqmvXixveS52dz6gdtKeBZt3o6tOZ3zfdBI=
Date: Thu, 24 Jan 2019 13:18:08 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190124131808.11165b42@bbrezillon>
In-Reply-To: <d504c576-d2f8-c325-528e-e4ba71ab1361@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
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
 <20190124101901.7b44c5c5@bbrezillon>
 <29f49243-6b52-5c98-29a6-81f9a32697b9@denx.de>
 <20190124121435.4ed6069d@bbrezillon>
 <d504c576-d2f8-c325-528e-e4ba71ab1361@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_041819_843521_585B7C10 
X-CRM114-Status: GOOD (  33.10  )
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

On Thu, 24 Jan 2019 12:59:56 +0100
Stefan Roese <sr@denx.de> wrote:

> On 24.01.19 12:14, Boris Brezillon wrote:
> > On Thu, 24 Jan 2019 11:57:33 +0100
> > Stefan Roese <sr@denx.de> wrote:
> >   
> >> On 24.01.19 10:19, Boris Brezillon wrote:
> >>
> >> <snip>
> >>  
> >>>> So spi_mem_dirmap_read() returns -EINVAL to spinand_write_to_cache_op()
> >>>> which then returns -EIO.  
> >>>
> >>> Can you try with the following diff applied?  
> >>> --->8---  
> >>> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> >>> index 52f17fc42daa..67c568f0c47f 100644
> >>> --- a/drivers/mtd/nand/spi/core.c
> >>> +++ b/drivers/mtd/nand/spi/core.c
> >>> @@ -238,7 +238,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
> >>>    
> >>>           while (nbytes) {
> >>>                   ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
> >>> -               if (!ret || ret > nbytes)
> >>> +               if (!ret || (ret > 0 && ret > nbytes))
> >>>                           ret = -EIO;
> >>>    
> >>>                   if (ret < 0)
> >>> @@ -296,9 +296,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
> >>>           wdesc = spinand->dirmaps[req->pos.plane].wdesc;
> >>>    
> >>>           while (nbytes) {
> >>> -               ret = spi_mem_dirmap_read(wdesc, column, nbytes,
> >>> -                                         spinand->databuf + column);
> >>> -               if (!ret || ret > nbytes)
> >>> +               ret = spi_mem_dirmap_write(wdesc, column, nbytes,
> >>> +                                          spinand->databuf + column);
> >>> +               if (!ret || (ret > 0 && ret > nbytes))
> >>>                           ret = -EIO;
> >>>    
> >>>                   if (ret < 0)
> >>> @@ -761,21 +761,6 @@ static void spinand_destroy_dirmaps(struct spinand_device *spinand)
> >>>                   spinand_destroy_dirmap(spinand, i);
> >>>    }
> >>>    
> >>> -const struct spi_mem_op *
> >>> -spinand_find_supported_op(struct spinand_device *spinand,
> >>> -                         const struct spi_mem_op *ops,
> >>> -                         unsigned int nops)
> >>> -{
> >>> -       unsigned int i;
> >>> -
> >>> -       for (i = 0; i < nops; i++) {
> >>> -               if (spi_mem_supports_op(spinand->spimem, &ops[i]))
> >>> -                       return &ops[i];
> >>> -       }
> >>> -
> >>> -       return NULL;
> >>> -}
> >>> -
> >>>    static const struct nand_ops spinand_ops = {
> >>>           .erase = spinand_erase,
> >>>           .markbad = spinand_markbad,
> >>>      
> >>
> >> Sure. Here some logs:
> >>
> >> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> >> incremental biterrors test
> >> ECC failure, invalid data despite read success  
> > 
> > Okay, so now we're back to a problem in the read path. Looks like the
> > buf pointer passed to spi_mem_dirmap_read() is only valid for the first
> > iteration of the "while (nbytes)" loop.
> > 
> > Can you try with this diff (and sorry for asking you to debug/test that,
> > but I no longer have access to a device with a SPI NAND)?
> >   
> > --->8---  
> > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > index 52f17fc42daa..90da21b52bb5 100644
> > --- a/drivers/mtd/nand/spi/core.c
> > +++ b/drivers/mtd/nand/spi/core.c
> > @@ -237,13 +237,14 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
> >          rdesc = spinand->dirmaps[req->pos.plane].rdesc;
> >   
> >          while (nbytes) {
> > -               ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
> > -               if (!ret || ret > nbytes)
> > -                       ret = -EIO;
> > -
> > +               ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf + column);
> >                  if (ret < 0)
> >                          return ret;
> >   
> > +               if (!ret || ret > nbytes)
> > +                       return -EIO;
> > +
> > +
> >                  nbytes -= ret;
> >                  column += ret;
> >          }
> > @@ -296,14 +297,14 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
> >          wdesc = spinand->dirmaps[req->pos.plane].wdesc;
> >   
> >          while (nbytes) {
> > -               ret = spi_mem_dirmap_read(wdesc, column, nbytes,
> > -                                         spinand->databuf + column);
> > -               if (!ret || ret > nbytes)
> > -                       ret = -EIO;
> > -
> > +               ret = spi_mem_dirmap_write(wdesc, column, nbytes,
> > +                                          spinand->databuf + column);
> >                  if (ret < 0)
> >                          return ret;
> >   
> > +               if (!ret || ret > nbytes)
> > +                       return -EIO;
> > +
> >                  nbytes -= ret;
> >                  column += ret;
> >          }
> > @@ -761,21 +762,6 @@ static void spinand_destroy_dirmaps(struct spinand_device *spinand)
> >                  spinand_destroy_dirmap(spinand, i);
> >   }
> >   
> > -const struct spi_mem_op *
> > -spinand_find_supported_op(struct spinand_device *spinand,
> > -                         const struct spi_mem_op *ops,
> > -                         unsigned int nops)
> > -{
> > -       unsigned int i;
> > -
> > -       for (i = 0; i < nops; i++) {
> > -               if (spi_mem_supports_op(spinand->spimem, &ops[i]))
> > -                       return &ops[i];
> > -       }
> > -
> > -       return NULL;
> > -}
> > -
> >   static const struct nand_ops spinand_ops = {
> >          .erase = spinand_erase,
> >          .markbad = spinand_markbad,
> >   
> 
> Not good at all, I'm afraid:
> 
> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> [  161.408159] nand: attempt to erase a bad/reserved block @0
> libmtd: error!: MEMERASE64 ioctl failed for eraseblock 0 (mtd5)
>          error 5 (Input/output error)
> Cannot erase block 0
> 
> root@mt7688:~# cat /sys/class/mtd/mtd5/bad_blocks
> 992
> 
> Without this last patch, I only have 2 bad blocks:
> 
> root@mt7688:~# cat /sys/class/mtd/mtd5/bad_blocks
> 2
> 
> As it seems, adding "column" to the buffer address is not a good
> idea. Here a short log with some debugging:

Oh, you're right, buf points to the OOB portion in case of OOB-only
accesses.

> 
> [   27.721104] spinand_read_from_cache_op (241): ret=32 nbytes=128 column=2048
> 
> This small patch below of your last one, seems to fix this issue
> for me:
> 
> root@mt7688:~# cat /sys/class/mtd/mtd5/bad_blocks
> 2
> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> incremental biterrors test
> Successfully corrected 0 bit errors per subpage
> Inserted biterror @ 1/7
> Read reported 4 corrected bit errors
> Successfully corrected 1 bit errors per subpage
> Inserted biterror @ 3/7
> Read reported 4 corrected bit errors
> Successfully corrected 2 bit errors per subpage
> Inserted biterror @ 5/7
> Read reported 4 corrected bit errors
> Successfully corrected 3 bit errors per subpage
> Inserted biterror @ 7/7
> Read reported 4 corrected bit errors
> Successfully corrected 4 bit errors per subpage
> Inserted biterror @ 8/7
> Read reported 5 corrected bit errors
> Successfully corrected 5 bit errors per subpage
> Inserted biterror @ 10/7
> Read reported 6 corrected bit errors
> Successfully corrected 6 bit errors per subpage
> Inserted biterror @ 12/7
> Read reported 7 corrected bit errors
> Successfully corrected 7 bit errors per subpage
> Inserted biterror @ 14/7
> Read reported 8 corrected bit errors
> Successfully corrected 8 bit errors per subpage
> Inserted biterror @ 17/7
> Failed to recover 1 bitflips
> Read error after 9 bit errors per page
> 
> What do you think? Could you fold it into your patch if its
> acceptable?

Actually, I asked Miquel to drop/revert the initial patch, so I'll
squash whatever makes it work for you in the original commit and send a
new version.

> 
> Thanks,
> Stefan
> 
> --->8---  
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 659a0e716ee0..a5ccd4adc30f 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -218,6 +218,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
>          unsigned int nbytes = 0;
>          void *buf = NULL;
>          u16 column = 0;
> +       int offs = 0;
>          ssize_t ret;
>   
>          if (req->datalen) {
> @@ -237,7 +238,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
>          rdesc = spinand->dirmaps[req->pos.plane].rdesc;
>   
>          while (nbytes) {
> -               ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf + column);
> +               ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf + offs);
>                  if (ret < 0)
>                          return ret;
>   
> @@ -246,6 +247,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
>   
>                  nbytes -= ret;
>                  column += ret;
> +               offs += ret;

How about incrementing buf directly?

		buf += ret;

>          }
>   
>          if (req->datalen)
> @@ -273,6 +275,7 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
>          struct mtd_info *mtd = nanddev_to_mtd(nand);
>          struct spi_mem_dirmap_desc *wdesc;
>          unsigned int nbytes, column = 0;
> +       int offs = 0;
>          ssize_t ret;
>   
>          nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
> @@ -297,7 +300,7 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
>   
>          while (nbytes) {
>                  ret = spi_mem_dirmap_write(wdesc, column, nbytes,
> -                                          spinand->databuf + column);
> +                                          spinand->databuf + offs);

In the write case 'spinand->databuf + column' works because we always
write the page entirely, but making the write path consistent with
the read one is a good thing, so let's add a buf pointer.

>                  if (ret < 0)
>                          return ret;
>   
> @@ -306,6 +309,7 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
>   
>                  nbytes -= ret;
>                  column += ret;
> +               offs += ret;
>          }
>   
>          return 0;

How about the following diff (hopefully the last one :-))?

--->8---
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 52f17fc42daa..98e4ad74df7f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -238,14 +238,16 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 
        while (nbytes) {
        while (nbytes) {
                ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
-               if (!ret || ret > nbytes)
-                       ret = -EIO;
-
                if (ret < 0)
                        return ret;
 
+               if (!ret || ret > nbytes)
+                       return -EIO;
+
+
                nbytes -= ret;
                column += ret;
+               buf += ret;
        }
 
        if (req->datalen)
@@ -273,6 +275,7 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
        struct mtd_info *mtd = nanddev_to_mtd(nand);
        struct spi_mem_dirmap_desc *wdesc;
        unsigned int nbytes, column = 0;
+       void *buf = spinand->databuf;
        ssize_t ret;
 
        nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
@@ -296,16 +299,16 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
        wdesc = spinand->dirmaps[req->pos.plane].wdesc;
 
        while (nbytes) {
-               ret = spi_mem_dirmap_read(wdesc, column, nbytes,
-                                         spinand->databuf + column);
-               if (!ret || ret > nbytes)
-                       ret = -EIO;
-
+               ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
                if (ret < 0)
                        return ret;
 
+               if (!ret || ret > nbytes)
+                       return -EIO;
+
                nbytes -= ret;
                column += ret;
+               buf += ret;
        }
 
        return 0;
@@ -761,21 +764,6 @@ static void spinand_destroy_dirmaps(struct spinand_device *spinand)
                spinand_destroy_dirmap(spinand, i);
 }
 
-const struct spi_mem_op *
-spinand_find_supported_op(struct spinand_device *spinand,
-                         const struct spi_mem_op *ops,
-                         unsigned int nops)
-{
-       unsigned int i;
-
-       for (i = 0; i < nops; i++) {
-               if (spi_mem_supports_op(spinand->spimem, &ops[i]))
-                       return &ops[i];
-       }
-
-       return NULL;
-}
-
 static const struct nand_ops spinand_ops = {
        .erase = spinand_erase,
        .markbad = spinand_markbad,



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
