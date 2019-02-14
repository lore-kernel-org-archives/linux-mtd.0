Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCE8C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 09:42:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD5A222A4
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 09:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XDalvJP5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="Kf9cdMzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD5A222A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1IHAlT61scmecoujYgdLuJKaZYvgT/ZUqfRYmEOVJ5Q=; b=XDalvJP5/vXPrg/NKdgxpyKfM
	oTk4I/f+pIB0AUqjSDnhJkLILJdlWJxuot+PJprta1OI1glhsrboepAPuOM7iGfPJiCFbsXtxfv3M
	NwGjGDQhxzlenOhEylfXq0kzGphM3kCUR/Oihu9792gDFvpsAHMWL6/CZAXL/9S71qw6M+VaIqLYR
	3OFI4ofht2RV888aFdAX+QCL7L8g5m3KBGHROXMaydEJ6TxkENy5tEMIkd3xukqg5fdivoYlo/AAD
	2mQXKmB3T7K0N6ykXecohZXc55+cNqiR4D5/BnDO6oU/WCT9Dwkf+IiyG2mHT+2I+0S1Nqvn7/R6G
	Kbhj65PwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guDDX-0007Dm-OR; Thu, 14 Feb 2019 09:22:03 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guDDU-0007DI-17
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 09:22:01 +0000
Received: by mail-lj1-x241.google.com with SMTP id l7-v6so4572587ljg.9
 for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2019 01:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tbFzBsl6nLbhx+TOjcO5ItkrdnuRmcp3LiHIMbdh6C8=;
 b=Kf9cdMzoqCsVlLDngC0Xs8yYE21J2FXvRAgDB6K+IFP4fdgXZHygau/sYEGsxj2igD
 XIOa6Zlwt24LldyEmOvgi916FNUzRGMAFcZmNJH/2Q9Xb+qgEl7wLoei6T+HvNlqXplJ
 GJZiCjgfK9POoNHhTupSiTUiy1RreFRThTA9WHWRyVFtfEmJZv3D6FTLOHe5Mtye0zX5
 giPzyGKSB3Zbpwrc5P9E8Qgj4vBuIbkmLRlJSixrxIedSzUW8XJAfiUB1UYgts4YhPGY
 iWDN74d3SzOvxSuW2j9BSBhECI6q2d0zxRYdKWW+K8eb053W1rTkkvk4hNqen2U6c+Nn
 6/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tbFzBsl6nLbhx+TOjcO5ItkrdnuRmcp3LiHIMbdh6C8=;
 b=hhelhlSErCMApS+zQHccVQ3L5zfq+NfXks87+TR1tx+yfElWAii341eUSHsTWIFBk3
 RywXQrSSmSgywAO2Ot4omzrzrR3Y6wv8OMcygaGm4T/6NXCIlFLm7ccrUb1syhHmfPwi
 xY2tg/3bMbCXFStQLmgv4byzVbkPLf8aIHqXqrKwg644gD7U2NFfX7y3pE7fACgv+y1V
 U0RRQpThI/0JS+4MIogLjc1ecLerBhrbK8quCMz0ExoFU5/81m729dY9Q4wgHZKD/Cf6
 iwpzjtj9tmXeBQgT/B1aqbEa4v3gZq23JLxc6SpWvt/zgxXe1r323M8rtyY5ZXuss315
 Vz2g==
X-Gm-Message-State: AHQUAuanUR4Qimr43FrutKhq00Fe3oZxxZSnOVVMPw6cTlD8x463yyGj
 4SEkqbHcczfTLYkZJac9taOWHpGSzMk=
X-Google-Smtp-Source: AHgI3IbkhIcl73h3M928po4le/F3priDGhBxeYhHNSrsOqUwjL6bDSsZmjV/XhnMZgCWAS8THLmfUA==
X-Received: by 2002:a2e:8585:: with SMTP id b5mr1663789lji.125.1550136116123; 
 Thu, 14 Feb 2019 01:21:56 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id
 a127sm351927lfe.73.2019.02.14.01.21.55
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Feb 2019 01:21:55 -0800 (PST)
Subject: Re: [PATCH v2 0/3] spi-nor block protection
To: linux-mtd@lists.infradead.org
References: <20190129220705.5143-1-jonas@norrbonn.se>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <a46cd605-efa0-7f3a-9887-43f58c646f65@norrbonn.se>
Date: Thu, 14 Feb 2019 10:21:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129220705.5143-1-jonas@norrbonn.se>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_012200_120814_86E25AA2 
X-CRM114-Status: GOOD (  18.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Just a gentle reminder that I'd like some feedback on these patches.

Thanks,
Jonas

On 29/01/2019 23:07, Jonas Bonn wrote:
> Changed in v2:
> * Provide the below cover letter
> * Rebase patches so they apply cleanly on linux-next
> 
> 
> In order to make device that's effectively read-only except to an
> authorized user we need:
> 
> i)  Some way of defaulting block-protection to on when device is first
> powered
> ii)  Some way of controlling the write-protect signal so that the BP
> (block protect) bits can't be changed
> 
> Some SPI flashes support the BPNV configuration register bit:  block
> protect non-volatile.  When this bit is set, the block protection bits
> BP0, BP1, and BP2 default to 1, effectively causing the flash memory to
> becomes read-only at power on.  If we can set this bit, we solve problem
> i) above.
> 
> Controlling the write-protect input is a matter for something external
> to the flash itself.  Unfortunately, the WP# signal is only honoured if
> the status register bit SRWD (status register write disable) is set.  If
> we can have this bit always set, then we solve problem ii) above.
> 
> This short patch series provides the above bits, allowing for the
> creation of a device that's effectively read-only to any actor who isn't
> able to control the WP# signal.
> 
> Jonas Bonn (3):
>    mtd: spi-nor: always respect write-protect input
>    mtd: spi-nor: s25fl512s supports region locking
>    mtd: spi-nor: allow setting the BPNV (default locked) bit
> 
>   drivers/mtd/mtdchar.c         |   6 ++
>   drivers/mtd/mtdcore.c         |   8 +++
>   drivers/mtd/spi-nor/spi-nor.c | 119 ++++++++++++++++++++++------------
>   include/linux/mtd/mtd.h       |   2 +
>   include/linux/mtd/spi-nor.h   |   1 +
>   include/uapi/mtd/mtd-abi.h    |   1 +
>   6 files changed, 97 insertions(+), 40 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
