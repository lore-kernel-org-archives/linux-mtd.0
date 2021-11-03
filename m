Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EDAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:21:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A7E761053
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A7E761053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hZScFP8Dl1Kn0HCfqVur6hZ3F14jfbQ31raFaTCfqQ=; b=fD5r+RJXiZYqYz
	Q8zWIcUkeKofkqXKYFSavGKg+oACbyiYg1DhMqFyjToHkQZqDYfMORPRY/Uppa76ZBI3NXlu6jSMk
	pwlTEMA6rr2OYnJ29vD+7qpk2CIV8d2ZCRt/TWn/hypfGnanrk1ViJhPk2uupplanTTLc8klxZhAN
	0VxIDBYcwuk1arYP/pTEeBXQt0S5HF2zX7hkdeC4wR83Pt8qUV3h23K212JiKmQW50t0q65AYLMCH
	6lwCXMRvdFrW8p24jU5uX4YMQqx3SoDy2PXKy0eluo2omZIwqBK+xnJ85PUIxr+t61M/JgmmauWsk
	lKxOgIouvxaFsYYevObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKs3-006AxT-LS; Wed, 03 Nov 2021 18:20:23 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKrz-006Avh-8E
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 18:20:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1D09F68AA6; Wed,  3 Nov 2021 19:20:17 +0100 (CET)
Date: Wed, 3 Nov 2021 19:20:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com, efremov@linux.com,
 song@kernel.org, martin.petersen@oracle.com, hare@suse.de,
 jack@suse.cz, ming.lei@redhat.com, tj@kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ataflop: address add_disk() error handling on probe
Message-ID: <20211103182016.GB7745@lst.de>
References: <20211103181258.1462704-1-mcgrof@kernel.org>
 <20211103181258.1462704-3-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103181258.1462704-3-mcgrof@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_112019_488509_7FB3BEEB 
X-CRM114-Status: GOOD (  20.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 03, 2021 at 11:12:56AM -0700, Luis Chamberlain wrote:
> We need to cleanup resources on the probe() callback registered
> with __register_blkdev(), now that add_disk() error handling is
> supported. Address this.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/block/ataflop.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
> index 170dd193cef6..e981b351f37e 100644
> --- a/drivers/block/ataflop.c
> +++ b/drivers/block/ataflop.c
> @@ -2012,6 +2012,7 @@ static void ataflop_probe(dev_t dev)
>  {
>  	int drive = MINOR(dev) & 3;
>  	int type  = MINOR(dev) >> 2;
> +	int err = 0;
>  
>  	if (type)
>  		type--;
> @@ -2019,11 +2020,20 @@ static void ataflop_probe(dev_t dev)
>  	if (drive >= FD_MAX_UNITS || type >= NUM_DISK_MINORS)
>  		return;
>  	if (!unit[drive].disk[type]) {
> +		err = ataflop_alloc_disk(drive, type);
> +		if (err == 0) {
> +			err = add_disk(unit[drive].disk[type]);
> +			if (err)
> +				goto err_out;
> +			else
> +				unit[drive].registered[type] = true;

This looks weird.  Why not:

 	if (unit[drive].disk[type])
		return;

	if (ataflop_alloc_disk(drive, type))
		return;
	if (add_disk(unit[drive].disk[type]))
		goto cleanup_disk;
	unit[drive].registered[type] = true;
	return;

cleanup_disk:
	blk_cleanup_disk(unit[drive].disk[type]);
	unit[drive].disk[type] = NULL;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
