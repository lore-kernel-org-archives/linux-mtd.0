Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B447C56202
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 20:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0AE207BB
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 20:21:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+/1tuLU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhUspYM1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C0AE207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SrRkzeEz/FYn9BURTJZhdZIQ1YN8ZwmzgQJlaDjcC6g=; b=g+/1tuLUp9DTIICSWEjoSUeKZ
	xT9wu0IAKjLRAxdsxAnfxkkrg4wiFZ/ohRtcy/BXvmGEAy/PZJw4GAbyTCvcPOwXV1A8ecQkHL7n5
	6xKiHzWeS7UD7+0+RXbcclz/Vn0EubysIN4alfyKqfDY6d1+wyROcF9CIxOXoXT+c+M4ZmP4qwDLj
	lP5t+kO4jsigH9hVGYcuUcOsiXWZxT2svGL18Geu39Rp5E76gVmIfPYclrHCU9i9uYugNKQEZ/qKv
	wsaahcqFho3I+XjxwAd3Jy5zXHgtksn3st4Ifj8776BszhhNZGiMx+Sq7eiolgqwDzTCRaLnwanGz
	gY3l2J7Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki1GM-0004A0-SB; Wed, 25 Nov 2020 20:19:38 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki1GK-00049E-4J
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 20:19:37 +0000
Received: by mail-qk1-x742.google.com with SMTP id q22so5959531qkq.6
 for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2020 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wTpG1f7I5Mn7omq14ZEE1b1D1RGafIOA8Nh3enwy9Pw=;
 b=dhUspYM1wMwx4g0p349xFh+cvmkFpUHO1fMAZy5dL/oqd7kSU1ym0YtWGCwe2K5BNw
 aVwhhCckrBdx67CbATI/FFwUOrbyBQxEavleHAqEAzxG3D9N0conr/HIspxr9fzB6SfX
 i43+lRwnKCGUgJA9cRAA9Ia9ro51DDhqCV8/s5EXlHTEJAjPYAn71BuXgNVEaOWGHhM5
 mSZeoeXij9s0EAWe8DhLGkPD+d8qJ0w9uk4zhr+1KpPzvTLi317obMTNtjWvqw22AAjn
 KI0qVXs/lejTVRHvWB2yfTW87bz2pPoM76U/jKdBe6vlpVASMEZRlI5rvHT10TKYbrfB
 7MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=wTpG1f7I5Mn7omq14ZEE1b1D1RGafIOA8Nh3enwy9Pw=;
 b=rtHnfnuCXk4ih4ja5ST4ju/DSFce4DK/4FhvIuYTBPKZ5RL3JI7lrD12KSvaWhP1lI
 qSELAmh5pN9Fwd213JvRFMma2TGyYFFR5cuk0rLDGDAuXcL5M6nchNIXKg/IM0AyC1P7
 W9xPg6w8qvEWPpntA1Mk1jc9GZVF81w/J2uPyQjLW9ifrpCQW+hK12JhP6cp87YNsQFd
 x0BV5IbPyH9XJRjSqZGNz3EjPr2+3WVgnelXggTpslFxBBg53CpOIrVUQxiGDb8V1eTN
 nYQ3INS+R8hWrO2GaH8389FpfB+tMtNIc+Hufc9VitVw26bG/ZTnKgEn09JDCuPa539R
 uxIA==
X-Gm-Message-State: AOAM5305cBau6KIlzoBc/KHCX/RmE6ABPNmElYcblqVQUZQ5TF9qxy1E
 IZ7Cwj5B7vBWi7EyjMFGf08=
X-Google-Smtp-Source: ABdhPJzv1jmYfISttH52Qv7X3ML12jiaN/y3FPvYZps3l/Q0JJ9ycbQ/3m35eYW3aCrzEXDwhiCBYw==
X-Received: by 2002:a37:4796:: with SMTP id u144mr656941qka.235.1606335573858; 
 Wed, 25 Nov 2020 12:19:33 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id w54sm446145qtb.0.2020.11.25.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:19:33 -0800 (PST)
Date: Wed, 25 Nov 2020 15:19:10 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 23/45] block: remove i_bdev
Message-ID: <X768PnFhrPtJk4U5@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-24-hch@lst.de>
 <X71g4Tm+3RiRg4Gf@mtj.duckdns.org> <20201125162926.GA1024@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125162926.GA1024@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_151936_237277_153D212D 
X-CRM114-Status: GOOD (  17.42  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On Wed, Nov 25, 2020 at 05:29:26PM +0100, Christoph Hellwig wrote:
> > I was wondering whether losing the stale bdev flushing in bd_acquire() would
> > cause user-visible behavior changes but can't see how it would given that
> > userland has no way of holding onto a specific instance of block inode.
> > Maybe it's something worth mentioning in the commit message?
> 
> With stale bdev flushing do you mean the call to bd_forget if
> i_bdev exists but is unhashed?  It doesn't actually flush anything but

Yeah.

> just detaches the old bdev from the inode so that the new one can be
> attached.  That problem goes away by definition if we don't attach
> the bdev to the inode.

Yeah, I think so. Was just wondering whether the problem actually goes away.

Thanks.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
