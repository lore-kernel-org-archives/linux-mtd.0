Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BFBC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 08:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB8D60F58
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 08:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FB8D60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+j2oOtg7q4JCBLOpU4hZlcdZM9Yl0/fLYkLLT8nm4xU=; b=RuhDu8/dbcJ+hf
	NIGW9XVI3wMpEumbyIrmLwR2WImVAPNPXS6YdW2DdaIoXOzx/y7gAOfAtXO6CjKvxQC32v623on0K
	95RnlmFpTm4WIL8p9t4G0Spf0wWrjX64dkbs6AUv1qavP/udGGJ1vB4l9lG5vDPmNy4543J99u8Sn
	5gdF7FYDHSsdEZfR2bc8VSnZnSEEBLAz79hzYflYDPv21X89nYnsUB8/7uUY8ZKzhA2f21mYiCkie
	DXSjUwlp7sN9WIOwFijM1cTZIfqotHtFKB8Jr43Mt5JzI7xDx9D8lgWNNm4v1fuBy5qLSnV8nzC6b
	bZ9xiAOoFV8BIU37kJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPhZI-000qSx-5n; Mon, 13 Sep 2021 08:44:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPhZG-000qSK-FM
 for linux-mtd@bombadil.infradead.org; Mon, 13 Sep 2021 08:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qBEtqyBRKy0FvVPGp0L6p55j5QPlsxKY9JnLfBHA49E=; b=i0ArtbFcISHx/+zkmIgm9gt9eP
 8DqMOV0idSMksIUuIZj/5KqUCMLiYoWJxKpzHTV7pK/VUBLpoZb7ahqlRERcFzwH31HDQaThxVl43
 BZvPQRj5iBZqwL2T/X2KCzYFz0j/3GoScGq0++Eb02HmjkihQ2sBvXKJJXRioffdFXEOLam9/rU9X
 ipcuTGkZWu9Dg+3jT6k5KgkNr4qzz9MPEjbkzDKNHvHZtDrNHhaBhta5KZXk82X8Vyy9+cmZ5g8BI
 IEugeXG4i3WpSD+Vv0rkJlgg7wQBZIDAnAOJSN+yZ7Ch4D58iAdfkcRZbZYqDGE8EyForyC75s6mY
 QB3m2e2A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mPhXw-00DKDH-Aa; Mon, 13 Sep 2021 08:42:46 +0000
Date: Mon, 13 Sep 2021 09:42:36 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan H??ppner <hoeppner@linux.ibm.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
 gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] s390/block/dasd_genhd: add error handling support
 for add_disk()
Message-ID: <YT8O/NL2pEGUjYj9@infradead.org>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-7-mcgrof@kernel.org>
 <d6140e40-a472-e732-9893-99e1839b717e@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6140e40-a472-e732-9893-99e1839b717e@linux.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Mon, Sep 13, 2021 at 10:17:48AM +0200, Jan H??ppner wrote:
> I think, just like with some of the other changes, there is some
> cleanup required before returning. I'll prepare a patch and
> come back to you.

If you are touching the dasd probe path anyway, can you look insto
switching to use blk_mq_alloc_disk as well?  Right now dasd allocates
the request_queue and gendisk separately in different stages of
initialization, but unlike SCSI which needs to probe using just the
request_queue I can't find a good reason for that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
