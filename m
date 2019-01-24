Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AFEC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E9B21872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uy7wpevA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8MN7A2C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E9B21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lH0hXFJ0YFBaB1X3vMXaHjORnHWryN0opiW1u9GiZxA=; b=Uy7wpevABPjiyV
	YAM9dWsbVAIQmGFSOVyKFH40utAxJZ07dR6ieJghYv/N27/aMQnB39c2Mt0Nw6jJg4rKZ6cFRaeQQ
	YIFyDOY7NcsNAl+DQCMiM81SLPm+TMX2KSuOqWUsJ3htFITAaAnS72gc0cFmFMnF2yh5AeBClEf45
	ZcVIEVEF3YiAROGAuC8ElDNf4tPVMYk14b8zV6QK+jQTQo00zkCP2JGAm8VgrP58WMh9ZHvn3XGvY
	dqU5mfsMVE5BKmeu2/slBGBhDDVbHpH8Vm1Wp1IFIpDzAjp0x2YXSjEH/iIAyFqQXVcz7i94WR+yh
	8McQxsesnvYJkFlrR7Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmcy9-0002eN-KN; Thu, 24 Jan 2019 11:14:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmcy5-0002e0-LS
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 11:14:47 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0518821872;
 Thu, 24 Jan 2019 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548328485;
 bh=MbSaXvAL9DCL89m8yB/GD44Ve5oTa6Wm+/wJPan7VOc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A8MN7A2C4rwDJ5glyApfvRnp64nd++vco9XXg2xFPND0B6Y8ifHP/IubVeidqpgoc
 QqR3MHIz/NHmrbhAnNwEWdzDuODYJZSoqMlNuSE/Tlpp0HjP6jv9wP1kywYCP2X1ZO
 GcC8EFVkX4C01lsFMm4NiL+FxHnHMqldSVUZO1hg=
Date: Thu, 24 Jan 2019 12:14:35 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190124121435.4ed6069d@bbrezillon>
In-Reply-To: <29f49243-6b52-5c98-29a6-81f9a32697b9@denx.de>
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
 <20190124101901.7b44c5c5@bbrezillon>
 <29f49243-6b52-5c98-29a6-81f9a32697b9@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_031445_738089_520EA659 
X-CRM114-Status: GOOD (  19.63  )
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

On Thu, 24 Jan 2019 11:57:33 +0100
Stefan Roese <sr@denx.de> wrote:

> On 24.01.19 10:19, Boris Brezillon wrote:
> 
> <snip>
> 
> >> So spi_mem_dirmap_read() returns -EINVAL to spinand_write_to_cache_op()
> >> which then returns -EIO.  
> > 
> > Can you try with the following diff applied?  
> > --->8---  
> > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > index 52f17fc42daa..67c568f0c47f 100644
> > --- a/drivers/mtd/nand/spi/core.c
> > +++ b/drivers/mtd/nand/spi/core.c
> > @@ -238,7 +238,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
> >   
> >          while (nbytes) {
> >                  ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
> > -               if (!ret || ret > nbytes)
> > +               if (!ret || (ret > 0 && ret > nbytes))
> >                          ret = -EIO;
> >   
> >                  if (ret < 0)
> > @@ -296,9 +296,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
> >          wdesc = spinand->dirmaps[req->pos.plane].wdesc;
> >   
> >          while (nbytes) {
> > -               ret = spi_mem_dirmap_read(wdesc, column, nbytes,
> > -                                         spinand->databuf + column);
> > -               if (!ret || ret > nbytes)
> > +               ret = spi_mem_dirmap_write(wdesc, column, nbytes,
> > +                                          spinand->databuf + column);
> > +               if (!ret || (ret > 0 && ret > nbytes))
> >                          ret = -EIO;
> >   
> >                  if (ret < 0)
> > @@ -761,21 +761,6 @@ static void spinand_destroy_dirmaps(struct spinand_device *spinand)
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
> Sure. Here some logs:
> 
> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> incremental biterrors test
> ECC failure, invalid data despite read success

Okay, so now we're back to a problem in the read path. Looks like the
buf pointer passed to spi_mem_dirmap_read() is only valid for the first
iteration of the "while (nbytes)" loop.

Can you try with this diff (and sorry for asking you to debug/test that,
but I no longer have access to a device with a SPI NAND)?

--->8---
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 52f17fc42daa..90da21b52bb5 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -237,13 +237,14 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
        rdesc = spinand->dirmaps[req->pos.plane].rdesc;
 
        while (nbytes) {
-               ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
-               if (!ret || ret > nbytes)
-                       ret = -EIO;
-
+               ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf + column);
                if (ret < 0)
                        return ret;
 
+               if (!ret || ret > nbytes)
+                       return -EIO;
+
+
                nbytes -= ret;
                column += ret;
        }
@@ -296,14 +297,14 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
        wdesc = spinand->dirmaps[req->pos.plane].wdesc;
 
        while (nbytes) {
-               ret = spi_mem_dirmap_read(wdesc, column, nbytes,
-                                         spinand->databuf + column);
-               if (!ret || ret > nbytes)
-                       ret = -EIO;
-
+               ret = spi_mem_dirmap_write(wdesc, column, nbytes,
+                                          spinand->databuf + column);
                if (ret < 0)
                        return ret;
 
+               if (!ret || ret > nbytes)
+                       return -EIO;
+
                nbytes -= ret;
                column += ret;
        }
@@ -761,21 +762,6 @@ static void spinand_destroy_dirmaps(struct spinand_device *spinand)
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
