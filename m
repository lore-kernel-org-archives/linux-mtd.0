Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C073C282C7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 10:06:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD335217D7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 10:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMbgCWAt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAb/O/D0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD335217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWv56/vxM7PULTicnO7ROncbNIDgP8NYFDugV0rtnuI=; b=qMbgCWAt15Zo07
	n/ZDYFnHJsxUTkKqjuuT/Alx4uruG2gozTBBTwlyzZ31vRI2iau20d1AAO+g+yxbSoZ/T2fmJS2vS
	l7XorrRgrcQv3SIBJucrz+RlTJlv0rKYht5vttbvGzbvHVoDtHnak/8IvNJKfF4Dok6QH1Yc4rQAi
	STK463DdW3fL3oaQ0iZsmSq1G3EsaLUusndWiMC3vbXyT6lFcgOJc/YiC0dLLqpInnpUn1Ri8WKSD
	1nGEjd7wEq4gGqIWrVUrwG8uSvU3/5rOT60Yjf4IiHbQU+Jt1ZmElMzvCZ2p6RhLrO2rwJxWkgkow
	nPTtlKDgUevSCxyg2S8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnKqv-0006DI-SX; Sat, 26 Jan 2019 10:06:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnKqs-0006Cv-Gx
 for linux-mtd@lists.infradead.org; Sat, 26 Jan 2019 10:06:15 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D9FF217D7;
 Sat, 26 Jan 2019 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548497173;
 bh=qOVJ0Jo+RKwjH9m0MuM310+kDMy2gAkYgzo5oU6geaw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dAb/O/D0LaSEc3XW+1o/LrX4ko9RXL7vfBhfY/+tJcpDfTzBGPoBtTweyNhhaS+Hs
 iKmtrY8s0MBkKuwYabBMF5NRcVvXkpQVAqPiCx/E0B0OBgX/bUlBZ3pdrxKGoZflfr
 HpEzkzVXMNOT4Uzm1mm03YHeErWTRG6SkkiCNz0w=
Date: Sat, 26 Jan 2019 11:06:05 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/2] eeprom: at25: Merge "off" and "offset" in
 at25_ee_write()
Message-ID: <20190126110546.360190cc@bbrezillon>
In-Reply-To: <20190118140525.29189-2-geert+renesas@glider.be>
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118140525.29189-2-geert+renesas@glider.be>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190126_020614_585689_5A6B8DAF 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Nguyen An Hoan <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 15:05:24 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Since commit 01973a01f9ec34b7 ("eeprom: at25: remove nvmem regmap
> dependency") changed the type of "off" from "loff_t" to "unsigned int",
> "off" and "offset" are now the same type, and can be merged into a
> single variable.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
> v2:
>   - Merge "off" and "offset" into a single variable instead of just
>     killing the cast, as suggested by Arnd.
> ---
>  drivers/misc/eeprom/at25.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
> index 99de6939cd5ac2e3..2d8e5388e574710d 100644
> --- a/drivers/misc/eeprom/at25.c
> +++ b/drivers/misc/eeprom/at25.c
> @@ -130,7 +130,8 @@ static int at25_ee_read(void *priv, unsigned int offset,
>  	return status;
>  }
>  
> -static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
> +static int at25_ee_write(void *priv, unsigned int offset, void *val,
> +			 size_t count)
>  {
>  	struct at25_data *at25 = priv;
>  	const char *buf = val;
> @@ -138,10 +139,10 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
>  	unsigned		buf_size;
>  	u8			*bounce;
>  
> -	if (unlikely(off >= at25->chip.byte_len))
> +	if (unlikely(offset >= at25->chip.byte_len))
>  		return -EFBIG;
> -	if ((off + count) > at25->chip.byte_len)
> -		count = at25->chip.byte_len - off;
> +	if ((offset + count) > at25->chip.byte_len)
> +		count = at25->chip.byte_len - offset;
>  	if (unlikely(!count))
>  		return -EINVAL;
>  
> @@ -160,7 +161,6 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
>  	do {
>  		unsigned long	timeout, retries;
>  		unsigned	segment;
> -		unsigned	offset = (unsigned) off;
>  		u8		*cp = bounce;
>  		int		sr;
>  		u8		instr;
> @@ -234,7 +234,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
>  			break;
>  		}
>  
> -		off += segment;
> +		offset += segment;
>  		buf += segment;
>  		count -= segment;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
