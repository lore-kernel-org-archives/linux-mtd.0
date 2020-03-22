Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAACC4332B
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:14:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E1120637
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxpxCxHJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d7DJJwA+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E1120637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Za40YeDXkauICqEVEaSyYtepteRBEq0x3kPA2T4dUM=; b=dxpxCxHJ854Sdj
	EOFCjTIzJgQEvEXikBPvlZVO++YieEbYmXKpzcvKGpDg7JBf40dO46i+urRmTUZZQEdlbJb53Zqwo
	bk+lnnm28figk6HheUOEHaMCO7ALJ0YyIdOotA/+RAMvrMZwvQjhm8GP0n490VsuWviav64aKKWrv
	4uVYXlUJ0a6wndy8dhSyXSxYTqOs+nqkNH8nX+viubqwteGLkYyYo+7EJXHbX2lUJsGhNqCsSyZrD
	Z2vAhZCK2mVAUg5rfnAz40t0V70/DkRcIzf58N0VUrRb9ddHvjAq1L7ZxdmUKoWy4WZQQA0v6SBQW
	Y8ERsSZq6mX1mlXdm+CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG2Ii-0006IT-4d; Sun, 22 Mar 2020 15:14:08 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG2Ie-0006Hu-Qs
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 15:14:06 +0000
Received: by mail-pj1-x1043.google.com with SMTP id l36so4903119pjb.3
 for <linux-mtd@lists.infradead.org>; Sun, 22 Mar 2020 08:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jU1tZN9SvriQuTPAY9v52hKU3vRtjkoA4roKYV/o0ys=;
 b=d7DJJwA+X2FK84QrpDwYCttb8rdd2e4lT8+Q5t70Gv2OgQB48UzwilKy9HxnqIx0u6
 Pw5Oc4gmv7sKIZukyv/OadTHJirAPW4rkMqZHFbHOgACPEw7NSmh3qZcMhkhuTUlmksz
 H9RtOhwhEi0o2YorU6S02Z6fTWGneSV7k9tLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jU1tZN9SvriQuTPAY9v52hKU3vRtjkoA4roKYV/o0ys=;
 b=gpNS6qeSYBXalhwAPjqxFxTsQ576nnCeUHRhxojAEGrfBRBmEgVWcGIb1w8d9lIvAS
 0YZAWrlrCBTUO+64BUeq9+Pt5h+VChQNuHy9uVIa+5/L8CYK9RSAlshvn9UUjjVyQBpc
 Rp4WABokyEk8bfZU15QmZSSAMV+DlwGpH95lWelHQF0WDfLXh+dyQwlz616zp4L0iUUU
 /FVdIIrTuE6/nXIUN6AZmUEGCEORNQdIN1TigWYbSN5yHhedl9jQCqTuvtzj+t9bX477
 nUwxzwd8zmiPU8w8B3TojRHq0+W7WInktKM9RkFEOU77GjhBsfLcnOL126C5ZJU9kRA0
 EvIQ==
X-Gm-Message-State: ANhLgQ2Tbgo9ZajtoH2YBaczsPq3f5DKV6VDTyh9P0oPk+X8uFe3MUm/
 i15AgT+kS9nZPLf4uBoz7zQ1fw==
X-Google-Smtp-Source: ADFU+vtbmF3l7sn6QV7hQukMIYQEHoGaYcXFfhI82JP1bexvWQg3p2JE0n4ekAuPsSplVisGoCrg4A==
X-Received: by 2002:a17:90a:3589:: with SMTP id
 r9mr20229184pjb.196.1584890042470; 
 Sun, 22 Mar 2020 08:14:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i2sm10807108pfr.151.2020.03.22.08.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 08:14:00 -0700 (PDT)
Date: Sun, 22 Mar 2020 08:13:59 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 11/11] mtd: new support oops logger based on pstore/blk
Message-ID: <202003220812.5728216E0@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-12-git-send-email-liaoweixiong@allwinnertech.com>
 <202003181149.90B22E24@keescook>
 <69b0133c-dfa3-2680-2a2e-473033750703@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69b0133c-dfa3-2680-2a2e-473033750703@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_081404_894751_BCF70674 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Mar 22, 2020 at 09:51:19PM +0800, WeiXiong Liao wrote:
> The physical features of MTD device require that the user configurations
> must meet some requirements. For example the record size must be
> multiples of page size of MTD flash. It's really different to block device.
> If we make this device driver "invisible", we should have other way to
> limit user configurations. The dmesg pstore front-end is the most easiest
> one to fix to. There are still much work to do to support other front-ends.

I finally understand this now -- I was still thinking of things like
nvme which ultimately expose a block layer. MTD appear to genuinely be a
"non-block" device. But it is still considered a "storage" device, yes?

So perhaps "block storage device" and "non-block storage device"?

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
