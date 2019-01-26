Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B515C282C7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 10:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC8DB217D7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 10:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5Tir042";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2nZEvRXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC8DB217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDHkcoG7H8Mtw5994794WDry38N3v7TECG14VsU7wjM=; b=c5Tir042KNtAD/
	x7VLBJY4G/cMtzuIyCrG4brv/qqYVr60UmPjh0vmv0k/pTSWEy0vGTGxswv8QWQn6anzcDq1pe8yO
	v/jnVRvM4H85IJYEfl4Nq8ZnFO8KPFsf+Nw93uINZ3Wku6okbmRl/7lLk/kPni8TzLHod+oRCFwJx
	ODt9k26Jqr1XPpgA11gF8esLuZ6q8y9EGCLxovtF87F6Rgey98BSPyMn+mn6jCHjUvnFdeFZnqPdv
	XDqhgIcoH6NiX/lGyAXUMNtBMaXGHZKy5hYmouMbBK9IcjXXJr9o000FXiN31n2IBaUfI6Gl5PpMD
	tOhtKjH3BWLcZLTdVgPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnKrd-0006TG-BI; Sat, 26 Jan 2019 10:07:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnKra-0006Sv-SU
 for linux-mtd@lists.infradead.org; Sat, 26 Jan 2019 10:07:00 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EB66217D7;
 Sat, 26 Jan 2019 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548497218;
 bh=I2UcX859a4p55FonVWiR9JFyMZvsSmLxRbyEao2efyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2nZEvRXnhu32abNeMUHz2YKMqp39/ftDImfo5vijGKKyYIfehnR6l3KTxIUZAvxn4
 nIXKOpC56RcbCaOPCVMP7vhnADwX6/777YICLbQzN0s4Dg8yqEC2OxBJg9F+ZTgaF1
 r2i8ZTkeT1Af1mIxqRzX36yKyUa9XLjcmeMTnqHs=
Date: Sat, 26 Jan 2019 11:06:48 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/2] eeprom: at25: Use
 spi_message_init_with_transfers() instead of open coding
Message-ID: <20190126110639.4717ec0e@bbrezillon>
In-Reply-To: <20190118140525.29189-3-geert+renesas@glider.be>
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118140525.29189-3-geert+renesas@glider.be>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190126_020658_933819_BF19650D 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, 18 Jan 2019 15:05:25 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Reduce code duplication in at25_ee_read() by using the
> spi_message_init_with_transfers() helper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
> v2:
>   - Add Acked-by.
> ---
>  drivers/misc/eeprom/at25.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
> index 2d8e5388e574710d..18a093e14517ab45 100644
> --- a/drivers/misc/eeprom/at25.c
> +++ b/drivers/misc/eeprom/at25.c
> @@ -103,16 +103,15 @@ static int at25_ee_read(void *priv, unsigned int offset,
>  		*cp++ = offset >> 0;
>  	}
>  
> -	spi_message_init(&m);
>  	memset(t, 0, sizeof(t));
>  
>  	t[0].tx_buf = command;
>  	t[0].len = at25->addrlen + 1;
> -	spi_message_add_tail(&t[0], &m);
>  
>  	t[1].rx_buf = buf;
>  	t[1].len = count;
> -	spi_message_add_tail(&t[1], &m);
> +
> +	spi_message_init_with_transfers(&m, t, ARRAY_SIZE(t));
>  
>  	mutex_lock(&at25->lock);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
