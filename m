Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CAEC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 15:02:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D056D20863
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 15:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lG1KDH/A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdG8nuAs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D056D20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMX4Ww7GhnzKUGdV6FUK8j0I7O1QCI5Iatr5pL7quuM=; b=lG1KDH/AAniLOn
	jIIRA1Gqqj9WGIe+mzWowt46Qi5AiiaijooAuxMGQk68PV3ZobCJ3DW1T/tsmMEOqjHSlwtNB1aZb
	ryuM0lx6O6iAUpgb2NoN+O2r+ZSwKFRegqfen+44qDu3ZgV7izVocXXKmAkuCkNpkxfvRbrs51fXv
	avSGxKkPA1iMH+RU9Y33aBirxiL0/f1hvTIaDWD2wGdfIsHuH8ZtgL8vcCl6QNEjBvVXqK/ylURMa
	2BGjR80EWLzhtK7I7I2RDiJXOz/FJ0kWThQcqpS/tzbll+GJzFRdCH5I7x17lFDLzwxdjBHVSCrqx
	Gd/CLUSSX+WCYGHmNLxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs7fj-0005kS-SQ; Fri, 08 Feb 2019 15:02:31 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs7fb-0005je-JO
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 15:02:30 +0000
Received: by mail-pg1-x544.google.com with SMTP id g189so1687920pgc.5
 for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2019 07:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=hl9ktiyvc1ENr8K02r+Swhtcq4AMQdumuNiKDXxZ4P4=;
 b=sdG8nuAssPysQ7qM522IR68jrkB8kHILpIIEgU3pvuwCpZ+yowRh8JKYg56oOgKPm3
 yMtXDYV2uhs0k2tcvwlZV/zoRg4kwOgq/7L2/EJ2c6ZTNYSseulwnJbA8/O7WR6Epjzd
 vLqYyqk+0H6a/3USsw0Q8tkNuD0Jk0P0zKd9uHyNegDhZsLoS014ZXHRCyssSBEcAwUp
 XHao/orq/LnCMauUsHddbbzhGUCvMqDzziTFdVwDhgTArYyltz3pZObaqld+df9nuzbI
 dhKSkmz3u68C9d1WB8Hw1c6zqrDatJOMQAu73svGmSBsGqw/4WM1ovtsd4LYQk476r/n
 YoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=hl9ktiyvc1ENr8K02r+Swhtcq4AMQdumuNiKDXxZ4P4=;
 b=Z3SbLZcrE4xNyZfz8psqIJgSHxJty/FLCFAbTI8/m7eoGqkHDat1otV/i1DEIVsLQN
 gpfDLfFAcDwTve9mhIs8ljodgnD8Ez2w/9MJrSgevGCtQAOBa0oxReDqUDvIfS9RYJ/e
 Jr0gNIHKJPqDke+bD1Ls+QVQK9vlfzGBMtSbTWEWvY4I1bfWlE6Ez7SZLf9NsIni93sw
 WHlsWBIUdWGd7H3V63ibIPDwkj6LevFpYDrPl4RVVcpO2gwHdNQqbrs2pW3EJj+6G4an
 qb7BCLFdyE2TPmxTVx8CvPgg372jH7J7UzU2AfGTEwIm92iTXACzZ3PoJ3UTQs2T5hDT
 Fe/g==
X-Gm-Message-State: AHQUAubR4GyKxSVl6yLAtNAGk8UCHSQbyQIrS5d8xAX07h1B9Zzlb1fC
 9JGQFJHH2BYnnzhHGvQ3/X+6nvKValI=
X-Google-Smtp-Source: AHgI3Ib/XSV/tcyzwHZxeDLO+eHBC0Y+60StM1VmHgtgivSbScQ7OO3hRpGJYwO91OBNztOxcK9Ung==
X-Received: by 2002:a63:5e43:: with SMTP id s64mr20878299pgb.101.1549638142811; 
 Fri, 08 Feb 2019 07:02:22 -0800 (PST)
Received: from ikegamiPC (M106072039032.v4.enabler.ne.jp. [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id 125sm4142845pfx.159.2019.02.08.07.02.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Feb 2019 07:02:21 -0800 (PST)
From: "Tokunori Ikegami" <ikegami.t@gmail.com>
To: "'Przemyslaw Sobon'" <psobon@amazon.com>, <bbrezillon@kernel.org>,
 <Joakim.Tjernlund@infinera.com>, <linux-mtd@lists.infradead.org>,
 <chris.packham@alliedtelesis.co.nz>, <fbettoni@gmail.com>,
 <liujian56@huawei.com>
References: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
In-Reply-To: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
Subject: RE: [PATCH] mtd: cfi: Fixed endless loop problem in CFI when value
 was written but corrupted.
Date: Sat, 9 Feb 2019 00:01:53 +0900
Message-ID: <149301d4bfbf$48c4c1e0$da4e45a0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJeWmda6DUkX+lv07W4kMdS1MinT6TCwXJw
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_070223_647996_A140178C 
X-CRM114-Status: GOOD (  24.53  )
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
Cc: ikegami_to@yahoo.co.jp
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Przemek-san,

I think that for the error case it should be done to retry at first.
It can be implemented separately but it is possible to be not enough.

Since the flash write error causes the user data corruption I think.
File systems and applications do not execute any recovery usually.
In the past I saw a similar write error actually and fixed as below.

  dfeae1073583d ("mtd: cfi_cmdset_0002: Change write buffer to check correct
value")

I am also seeing a similar flash write error for the word write case.
In the case the retry with the reset recovery does not work fully.
After the repeated retry with the reset the flash is not able to work.
There is a possibility for the buffer write also but sorry not sure.
Since there is a difference to execute the recovery command.

As Jocke-san mentioned I also think the chip_ready() does not work.
It is followed correctly basically the flash chip specification.
But actually it does not check the chip state correctly I think.
So for the flash write error cases I saw the chip_good() is necessary.

Regards,
Ikegami

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Przemyslaw Sobon
> Sent: Friday, February 8, 2019 8:58 AM
> To: bbrezillon@kernel.org; Joakim.Tjernlund@infinera.com;
> linux-mtd@lists.infradead.org; chris.packham@alliedtelesis.co.nz;
> fbettoni@gmail.com; ikegami@allied-telesis.co.jp; liujian56@huawei.com
> Cc: psobon@amazon.com
> Subject: [PATCH] mtd: cfi: Fixed endless loop problem in CFI when value
> was written but corrupted.
> 
> Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to
>        check correct value)
> 
> There was an endless loop in CFI Flash driver when a value was written
> incorrectly. In such case chip_ready returns true but chip_good returns
> false and we never get out of the loop.
> 
> The solution was to break the loop in 2 cases, either device is ready or
> device is not ready and timeout elapsed. The correctness of the write is
> checked after the loop ended. That way we ensure the loop always ends.
> 
> Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6bfc47..6cc31d2057e9 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1879,15 +1879,18 @@ static int __xipram do_write_buffer(struct
map_info
> *map, struct flchip *chip,
>  		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
>  			break;
> 
> -		if (chip_good(map, adr, datum)) {
> -			xip_enable(map, chip, adr);
> -			goto op_done;
> -		}
> +		if (chip_ready(map, adr))
> +			break;
> 
>  		/* Latency issues. Drop the lock, wait a while and retry
> */
>  		UDELAY(map, chip, adr, 1);
>  	}
> 
> +	if (chip_good(map, adr, datum)) {
> +		xip_enable(map, chip, adr);
> +		goto op_done;
> +	}
> +
>  	/*
>  	 * Recovery from write-buffer programming failures requires
>  	 * the write-to-buffer-reset sequence.  Since the last part
> --
> 2.16.5
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
