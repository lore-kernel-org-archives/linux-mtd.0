Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5F8C34022
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 18:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25FE5222D9
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 18:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sxe0AN6e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="us5GQ2cp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25FE5222D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRT2DjNj7ajlfq1LNxGCJhFwVhP8eJFa2A39d8qJ0po=; b=sxe0AN6ex1tBjE
	1Vh/e28K5YMVOe+YQEd1aayFiyAb3l7hgpCY9/iKwnkwgUm1uZWBc+F6QxpgFPHbRoilw0adiL0Je
	0kogHAQXDsLSlhAG7eclXvA3U+NcLk4Mv67dkS3s3H9IpcD9CZO24pSAleoWr8fJpd2WLJK/ejkMn
	kc1LH+XGtRH2Unjyv43/6BEoBoZDeOntPhxsuuUASwhWsI1pP6ZxjOqYdPbZuDmVAnJ3QvlQLW/i4
	TQhqM1NFn/V0PkBFeXKHnDuEWJlj5AwLQytaOBd/9lf9WdnVD7Sakd7XcShrlMPhCDNxjKbexOtji
	dwcjnxyLd7jWTYY7nuWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3lNC-0003IA-JR; Mon, 17 Feb 2020 18:44:02 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3lN9-0003He-E9
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 18:44:00 +0000
Received: by mail-lf1-x144.google.com with SMTP id y19so12589887lfl.9
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 10:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GgC1mK7doMkTRNTPdd2Oxo5JBrHvDplk3qXl1sKQMYE=;
 b=us5GQ2cptAYaFCqMHBdKFlADJ++C/oBU+St+NyNjPNojfR+j22wtALh8zLizwz0O6w
 ZKrCEaxnKyHHWUhmbeuZzg/TTP+aA2hMtaPghm/8OVcPOgDIxmX7PBZRfKNNZNta3Zqt
 HQ8C4Wi401VjQ3ZqeHsS8H+vW9SzBy82PaVh4kHgsifYVkhJJqjp1n++yXn0dOAbq0Ms
 yC/spg/I0IE6L5vrpMppJaPIb1d0KwAS1L3AExj9/JbB6XZRc4j1W17CJdpqOfVtcr8W
 II34xBJ0eq30h0OIUbftmwk7wZqFCUqKQd7cr3CLXqfLOCn8jvmjVwW95j2JwPBMaJ0E
 +v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GgC1mK7doMkTRNTPdd2Oxo5JBrHvDplk3qXl1sKQMYE=;
 b=jA/L9q29rjq1zSvzU97gl59HqNlVGGDr9a9W4HdAOrbnovELx24g/evtNWYsTOpUW9
 YYXMcwYDl9cMchUKR39XleNIjwxUHJb4Q6FG3OsAbrgtMw77ppLXwI35pPkS5kjxdOYF
 2irkGEmRRBbmPp7TruFV9i2bF9uH4eqfGpyJaGsvRuWKUzGk/PcMv56FJabm3MWjVYWB
 CYVeAljSeOmzt+tQZzUMnNoPS48Ic1jerTN8nuMfW7HZMbNYjNHIDB1RAmA00OEmPMJm
 KXGENfb8iN4miABxzc6aso+FRU/3oQG1i9dMfn8dCEczoKeJEARLTzUTKOvY179/nzQr
 QRsA==
X-Gm-Message-State: APjAAAWuw3Xrqzs+GjBoM6OZrtV9W6d/SlijqUkSpGIuYpNwJ4BWrriM
 CDYnUdUNKx1TDoIDy0tS/Lx4gZLKRzc=
X-Google-Smtp-Source: APXvYqwyXtioKcYpJ2SvcRuCoha1Sz5cP80gl77mEMwx6OLvo08qgAbCyk92PLf/Dm0VLbXr55CNYg==
X-Received: by 2002:a19:c205:: with SMTP id l5mr8540219lfc.159.1581965037150; 
 Mon, 17 Feb 2020 10:43:57 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4657:d575:d9d1:b468:29b3:bdc4])
 by smtp.gmail.com with ESMTPSA id f21sm923607ljc.30.2020.02.17.10.43.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:43:55 -0800 (PST)
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: use spi-mem dirmap API
To: Tudor.Ambarus@microchip.com
References: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
 <13ff717c-a85c-8532-b86e-1dc04af0c9dd@cogentembedded.com>
 <317446312.Rl8damQZns@192.168.1.3>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <7c732662-ab1e-acfd-8424-a895505c48ac@cogentembedded.com>
Date: Mon, 17 Feb 2020 21:43:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <317446312.Rl8damQZns@192.168.1.3>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_104359_477223_0E2CD7FD 
X-CRM114-Status: GOOD (  19.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/17/2020 02:03 AM, Tudor.Ambarus@microchip.com wrote:

> Looks good. Few nits below that I can fix when applying. Let me know if 
> you're ok with the changes.
> 
> On Monday, January 27, 2020 10:29:06 PM EET Sergei Shtylyov wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>> content is safe
>>
>> Make use of the spi-mem direct mapping API to let advanced controllers
>> optimize read/write operations when they support direct mapping.
>>
>> Based on the original patch by Boris Brezillon
>> <boris.brezillon@bootlin.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> ---
>> Changes in version 4:
>> - moved the spi_mem_dirmap_{read|write}() calls closer to the ending of
>>   spi_nor_{read|write}(), adapting to the chnages caused by the new patch
>>   splitting spi_nor_spimem_xfer_data()...
>>
>> Changes in version 3:
>> - simplified the way spi_mem_dirmap_{read|write}() are called;
>> - added Boris' tag.
>>
>> Changes in version 2:
>> - moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}()
>> to spi_nor_spimem_{read|write}_data().
>>
>>  drivers/mtd/spi-nor/spi-nor.c |   97
>> ++++++++++++++++++++++++++++++++++++++---- include/linux/mtd/spi-nor.h   | 
>>   5 ++
>>  2 files changed, 93 insertions(+), 9 deletions(-)
>>
>> Index: linux/drivers/mtd/spi-nor/spi-nor.c
>> ===================================================================
>> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
>> +++ linux/drivers/mtd/spi-nor/spi-nor.c
[...]
>> @@ -319,14 +320,23 @@ static ssize_t spi_nor_spimem_read_data(
>>
>>         usebouncebuf = spi_nor_spimem_bounce(nor, &op);
>>
>> -       error = spi_nor_spimem_exec_op(nor, &op);
>> -       if (error)
>> -               return error;
>> +       if (nor->dirmap.rdesc) {
>> +               nbytes = spi_mem_dirmap_read(nor->dirmap.rdesc, op.addr.val,
> 
> op.data.nbytes = spi_mem_dirmap_read() ?

   op.data.nbytes is *unsigned int*, spi_mem_dirmap_read() returns ssize_t.

> This way we can get rid of the local variable nbytes.

   op.data.nbytes can't carry the error codes, not even supposed to be of a signed
type...

[...]
>> @@ -379,11 +390,19 @@ static ssize_t spi_nor_spimem_write_data
>>         if (usebouncebuf)
>>                 memcpy(nor->bouncebuf, buf, op.data.nbytes);
>>
>> -       error = spi_nor_spimem_exec_op(nor, &op);
>> -       if (error)
>> -               return error;
>> +       if (nor->dirmap.wdesc) {
>> +               nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc,
>> op.addr.val, +                                          op.data.nbytes,

> I'll align this to "("

   Sorry about missing that. Copy&paste from the read function played its role here...

> op.data.nbytes = spi_mem_dirmap_write() ?

   Same comments as in the read function...

> This way we can get rid of the local variable nbytes.
> 
>> op.data.buf.out); +               if (nbytes < 0)
>> +                       return nbytes;
> 
> you already return nbytes below, we can drop this check.

   Yeah, sorry about that! We've already copied from the bounce buffer

>> +       } else {
>> +               error = spi_nor_spimem_exec_op(nor, &op);
>> +               if (error)
>> +                       return error;
>> +               nbytes = op.data.nbytes;
>> +       }
>>
>> -       return op.data.nbytes;
>> +       return nbytes;
>>  }
> 
> Cheers,
> ta

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
