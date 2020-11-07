Return-Path: <SRS0=mw3I=EN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F25CC388F9
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 07:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D9020704
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 07:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vLRohcmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D9020704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=efNdnuPlC+WiL63U2uG2sjrlGk2A6FkNsTesWzHBmtA=; b=vLRohcmXaqlXo0hbTgHXv7qRK
	Zm9v8EDCiMzDY72tR4Ot8lPfihbFKjdYDJ8XF/Q5j9uUeIK5exQc1JP38Z8GeBPFbmRJHXcEQtz3S
	7bGshwerF7uEzCRYorsVuJi614pooqGHS96phIiWqojOdtgWgiv2hTTIip1+0LwPYGmmXf8X2jFg7
	Q0MEpOtuM0OHIIVn+Xrfi8/Ti57TnTl2ChLyh4zfwOdgNW57KVZSuJ2Vn6mtqAHoIS9m5YSBYRnk8
	300h08uzH+tDsCK8STZGQ9xM/zjsj3mYUVCujKED0e39LYx9IfFL9V7XfKDqQ5uGciSsPVNcbhRVD
	wlfoWy/Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbIeJ-00062O-3R; Sat, 07 Nov 2020 07:28:35 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbIeF-00061s-2H
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2020 07:28:32 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 240D3ABA2;
 Sat,  7 Nov 2020 07:28:24 +0000 (UTC)
Subject: Re: [PATCH, RFC 11/10] block: propagate BLKROSET to all partitions
To: Christoph Hellwig <hch@lst.de>
References: <20201106140817.GA23557@lst.de>
From: Coly Li <colyli@suse.de>
Autocrypt: addr=colyli@suse.de; keydata=
 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
Message-ID: <a2add52e-715b-f82a-d6a0-b285f0f5acde@suse.de>
Date: Sat, 7 Nov 2020 15:28:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201106140817.GA23557@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_022831_361465_9A63DBC8 
X-CRM114-Status: GOOD (  19.79  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 martin.petersen@oracle.com, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/11/6 22:08, Christoph Hellwig wrote:
> 
> When setting the whole device read-only (or clearing the read-only
> state), also update the policy for all partitions.  The s390 dasd
> driver has awlways been doing this and it makes a lot of sense.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Coly Li <colyli@suse.de>

Thanks.


Coly Li

> ---
>  block/ioctl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 6b785181344fe1..22f394d118c302 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -354,7 +354,10 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
>  		if (ret)
>  			return ret;
>  	}
> -	bdev->bd_part->policy = n;
> +	if (bdev_is_partition(bdev))
> +		bdev->bd_part->policy = n;
> +	else
> +		set_disk_ro(bdev->bd_disk, n);
>  	return 0;
>  }
>  
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
