Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE1DC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 10:57:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C892C218A2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 10:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oURb2y6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C892C218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+4eIWtIQvLokZ96qMZzmZkJa0w95RgeX2FiXoa1RLNw=; b=oURb2y6wWyEzKQfdAfA0uMrvQ
	wAyESs8qymeX/1fx2CpBaz2KvjAyfZJ1Yy+12fEy63aML3OtktcRbuqDydUflCNM2QxMh0RMurNo1
	g1AkGlzp+dt5YqefZcIZ30IA6sQovWKFmx6BrSgKqkBfRKuM1ImaFgvmPSMBQYVdGiArBRFm2K0Ya
	HHHNlAk4xOvyOomtyejq89jZLEG1QHhKnER4j6R+Pmw+kaZ3C/AA+oIynOCzpeFIRmb+iL3j5aqDE
	y0GJHPqm58dqT7pYfg0endsV0iDMtCVmmNS0yF9t5EGsgPDonOHu/wT8YLwaGxQpUBQ2SEk/7ZTf2
	KGfJhBd5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmchb-0005yC-9R; Thu, 24 Jan 2019 10:57:43 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmchX-0005xe-MG
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 10:57:41 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id A530DA1630;
 Thu, 24 Jan 2019 11:57:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id gD6DkIN_6g8p; Thu, 24 Jan 2019 11:57:34 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
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
 <20190123134050.7efe59a6@bbrezillon> <20190123135735.358fc9a6@bbrezillon>
 <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
 <20190124085018.2ad33dab@bbrezillon>
 <39d6edd9-14ad-8110-b618-6454f6840b28@denx.de>
 <20190124091459.11cb2912@bbrezillon>
 <6dadd565-aa59-82ba-757f-db0a1c03656d@denx.de>
 <20190124101901.7b44c5c5@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <29f49243-6b52-5c98-29a6-81f9a32697b9@denx.de>
Date: Thu, 24 Jan 2019 11:57:33 +0100
MIME-Version: 1.0
In-Reply-To: <20190124101901.7b44c5c5@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_025740_034041_227A6543 
X-CRM114-Status: GOOD (  17.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24.01.19 10:19, Boris Brezillon wrote:

<snip>

>> So spi_mem_dirmap_read() returns -EINVAL to spinand_write_to_cache_op()
>> which then returns -EIO.
> 
> Can you try with the following diff applied?
> --->8---
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 52f17fc42daa..67c568f0c47f 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -238,7 +238,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
>   
>          while (nbytes) {
>                  ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
> -               if (!ret || ret > nbytes)
> +               if (!ret || (ret > 0 && ret > nbytes))
>                          ret = -EIO;
>   
>                  if (ret < 0)
> @@ -296,9 +296,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
>          wdesc = spinand->dirmaps[req->pos.plane].wdesc;
>   
>          while (nbytes) {
> -               ret = spi_mem_dirmap_read(wdesc, column, nbytes,
> -                                         spinand->databuf + column);
> -               if (!ret || ret > nbytes)
> +               ret = spi_mem_dirmap_write(wdesc, column, nbytes,
> +                                          spinand->databuf + column);
> +               if (!ret || (ret > 0 && ret > nbytes))
>                          ret = -EIO;
>   
>                  if (ret < 0)
> @@ -761,21 +761,6 @@ static void spinand_destroy_dirmaps(struct spinand_device *spinand)
>                  spinand_destroy_dirmap(spinand, i);
>   }
>   
> -const struct spi_mem_op *
> -spinand_find_supported_op(struct spinand_device *spinand,
> -                         const struct spi_mem_op *ops,
> -                         unsigned int nops)
> -{
> -       unsigned int i;
> -
> -       for (i = 0; i < nops; i++) {
> -               if (spi_mem_supports_op(spinand->spimem, &ops[i]))
> -                       return &ops[i];
> -       }
> -
> -       return NULL;
> -}
> -
>   static const struct nand_ops spinand_ops = {
>          .erase = spinand_erase,
>          .markbad = spinand_markbad,
> 

Sure. Here some logs:

root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
incremental biterrors test
ECC failure, invalid data despite read success
root@mt7688:~# flash_erase /dev/mtd5 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
Writing data to block 0 at offset 0x0
root@mt7688:~# ./nandbiterrs /dev/mtd5 -o
overwrite biterrors test
ECC failure, invalid data despite read success
Bit error histogram (0 operations total):

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
