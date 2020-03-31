Return-Path: <SRS0=nWl7=5Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C80BC43331
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 10:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526CB20772
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 10:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ET+V4v/N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsPfFunQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 526CB20772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPhO8Y3B+1hZExVu5kr76WBw7A32XDsmAi94jXVe4Fc=; b=ET+V4v/Ng5nLb/
	nE1TlcfPGgATM/tF0IuQUu8pzIN0iQ/dWEgjAHaVaoNx8tRgk2jObS4mtu2wtVp9Qm9N5gJ+pEMlV
	ybZOVEbAIOU9NpRoNTBb5sOhBRGYSTEUcv4q9tSILWZBUUeHO+94/8+igE1e9tKbAAfKVajjFIQ/C
	6SUs6qSr7KBQ2N3c2NEkETlkjmloykFtsJDO7ryYAbwdT6FfvkzwnQDIHBGW5oQBoW+BFoBhRrWQb
	G1A+rLRaK0RRWi4zZEG42ACu16f0LtHxh1uf/63hdqPGrwCgQJinn+EVu08EQw1gMZ4ASUHdzIB6J
	wREf7gW61yxy3NxUr1qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJELV-00064H-Ck; Tue, 31 Mar 2020 10:42:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJELT-00062l-B2
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2020 10:42:12 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B671208E0;
 Tue, 31 Mar 2020 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585651329;
 bh=qXYGan3lC779UiSGNbkx/irqz1ZRbNY3U4gPt+oVvNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hsPfFunQ02BmTHKKFtir9ut35F9P9YjKaPlHLZW9hFH9J/xnm+jUJq5Mgs8bZQLtM
 WUSwDyTNB+Re535zwl1y9zC6ChhQW98qrQhHuxvSQ0SQ3U/v7f0kqXtA4HBZRlHKXy
 sWIj8NjtWv48J2xvfQtItUUZjY0dfuLRM03uOYz0=
Date: Tue, 31 Mar 2020 12:05:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH v4] mtd: clear cache_state to avoid writing to bad blocks
 repeatedly
Message-ID: <20200331100526.GC1204199@kroah.com>
References: <1585618319-119741-1-git-send-email-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585618319-119741-1-git-send-email-nixiaoming@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_034211_399037_2A5C6BA7 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: wangle6@huawei.com, vigneshr@ti.com, richard@nod.at, houtao1@huawei.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 zhangweimin12@huawei.com, miquel.raynal@bootlin.com, yebin10@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 31, 2020 at 09:31:59AM +0800, Xiaoming Ni wrote:
> The function call process is as follows:
> 	mtd_blktrans_work()
> 	  while (1)
> 	    do_blktrans_request()
> 	      mtdblock_writesect()
> 	        do_cached_write()
> 	          write_cached_data() /*if cache_state is STATE_DIRTY*/
> 	            erase_write()
> 
> write_cached_data() returns failure without modifying cache_state
> and cache_offset. So when do_cached_write() is called again,
> write_cached_data() will be called again to perform erase_write()
> on the same cache_offset.
> 
> But if this cache_offset points to a bad block, erase_write() will
> always return -EIO. Writing to this mtdblk is equivalent to losing
> the current data, and repeatedly writing to the bad block.
> 
> Repeatedly writing a bad block has no real benefits,
> but brings some negative effects:
> 1 Lost subsequent data
> 2 Loss of flash device life
> 3 erase_write() bad blocks are very time-consuming. For example:
> 	the function do_erase_oneblock() in chips/cfi_cmdset_0020.c or
> 	chips/cfi_cmdset_0002.c may take more than 20 seconds to return
> 
> Therefore, when erase_write() returns -EIO in write_cached_data(),
> clear cache_state to avoid writing to bad blocks repeatedly.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/mtdblock.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

$ ./scripts/get_maintainer.pl --file drivers/mtd/mtdblock.c
Miquel Raynal <miquel.raynal@bootlin.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
Richard Weinberger <richard@nod.at> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
Vignesh Raghavendra <vigneshr@ti.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD))
linux-kernel@vger.kernel.org (open list)


No where on there is my name/email, so why am I getting these?

confused,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
