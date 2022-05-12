Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD347C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3gdYaHwFC1+ZjSnrHS1lG58QJ1Nu2ns7aaUTio3Kvw=; b=JrLZQ6HhlNxnI1e8Sqnnmc3kx7
	w9aW+Dh1uAlftTbPzjAepbUjYc3MtM+IXT27WPXAgOgvQTO2zKMt8CUpWAkbdSmSAXHLrQjh0oppo
	d4selSlTB/IVtLzGYmMY6ugn6x2nD+zqAGVU2+W2ZpQA6DsL0B/T8KU0ys4nqQd3BKGtvpHRuPp5Z
	ivMRrkzRDK2QewPqzs4Q8CnrM5OMSjERfAUcDpkxOtyXhFeyL3PnCJrf5MZE+5uIr8VCXCC3S+Ef+
	wIgCFg4EB9B8cNCnWDl6DQvx+BNo8c8Lg+H0rDlGTa9KoNZw5IuvMnWy7qY5PlPgwmh9sXpxoWCmc
	szPb27mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np820-00BpcL-VU; Thu, 12 May 2022 12:35:01 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np81y-00Bpa0-2W
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 12:35:00 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9658F2223A;
 Thu, 12 May 2022 14:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652358895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGSqzt2IwevyC1nZjVg1zbzsKwHqQFbjkeSfynQ0Mno=;
 b=IGtFsl6AnRFEwP6qV9E5VAF/zvs8akRinmrkYsNvL1wrySsQ3LNjmmBdXgaxjmvXDlduGH
 +ecsCEx+Bd+LSK0yvafNlFzKm68iWmHy85hNOTydiy8zpn9sjeJdC4n2nyg0fCW+ZRQo3w
 lgTz9ank2l4AzIlgeQfk8JOO67vKwD0=
MIME-Version: 1.0
Date: Thu, 12 May 2022 14:34:54 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix format specifier
In-Reply-To: <20220512123213.fzly4gollonlo27p@ti.com>
References: <20220512112027.3771734-1-michael@walle.cc>
 <20220512123213.fzly4gollonlo27p@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <ea3a10d91129e4948eabc4bed8cf22fe@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_053458_320288_F914C247 
X-CRM114-Status: GOOD (  24.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-05-12 14:32, schrieb Pratyush Yadav:
> Hi Michael,
> 
> On 12/05/22 01:20PM, Michael Walle wrote:
>> The intention was to print the JEDEC ID in the following format:
>>   nn nn nn
>> 
>> In this case format specifier has to be "%*ph". Fix it.
>> 
>> Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via 
>> debugfs")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/debugfs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/debugfs.c 
>> b/drivers/mtd/spi-nor/debugfs.c
>> index bf9fda5d4d0b..4b972bd4b80d 100644
>> --- a/drivers/mtd/spi-nor/debugfs.c
>> +++ b/drivers/mtd/spi-nor/debugfs.c
>> @@ -81,7 +81,7 @@ static int spi_nor_params_show(struct seq_file *s, 
>> void *data)
>>  	int i;
>> 
>>  	seq_printf(s, "name\t\t%s\n", info->name);
>> -	seq_printf(s, "id\t\t%*phn\n", SPI_NOR_MAX_ID_LEN, nor->id);
>> +	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
> 
> Patch does not apply. Are you basing this on some other commits you
> have? This line is different on my tree:
> 
> 	seq_printf(s, "id\t\t%*phn\n", info->id_len, info->id);
> 
> In fact, I do not have a nor->id at all in my tree. BTW, I have applied
> https://lore.kernel.org/r/20220429102018.2361038-2-michael@walle.cc
> 
> I am going to apply the below patch. Please ACK/NACK. I did a quick
> test, the output stays the same before and after this patch.
> 
> -- 8< --
> From c47452194641b5d27c20e557c84a46c85fd7ce37 Mon Sep 17 00:00:00 2001
> From: Michael Walle <michael@walle.cc>
> Date: Thu, 12 May 2022 13:20:27 +0200
> Subject: [PATCH] mtd: spi-nor: debugfs: fix format specifier
> 
> The intention was to print the JEDEC ID in the following format:
>   nn nn nn
> 
> In this case format specifier has to be "%*ph". Fix it.
> 
> Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via 
> debugfs")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Link: 
> https://lore.kernel.org/r/20220512112027.3771734-1-michael@walle.cc
> ---
>  drivers/mtd/spi-nor/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/debugfs.c 
> b/drivers/mtd/spi-nor/debugfs.c
> index 1949905eefea..eaf84f7a0676 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -81,7 +81,7 @@ static int spi_nor_params_show(struct seq_file *s, 
> void *data)
>  	int i;
> 
>  	seq_printf(s, "name\t\t%s\n", info->name);
> -	seq_printf(s, "id\t\t%*phn\n", info->id_len, info->id);
> +	seq_printf(s, "id\t\t%*ph\n", info->id_len, info->id);
>  	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
>  	seq_printf(s, "size\t\t%s\n", buf);
>  	seq_printf(s, "write size\t%u\n", params->writesize);

Ack. Thanks. My bad, there are some missing changes, which I didn't
sent yet.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
