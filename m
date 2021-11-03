Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F0EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD0161076
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFD0161076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjL7YAB7UbHdCkj9tuNHirgCK6SOa2EuJmXxmHvuyYA=; b=NLyNmqgIhRlpiF
	p/BprQiYpoGeh9Jfdrlf/GRbBFEJ7+Ca5R/J1rnQ3+VF97rO1NaA33NkGbjjdbOnBXbV3vntJECPI
	AzMsw1ha3IpjyWx6KclPXGFPchCUrgD+kRzfd0EgRw+cIF3lW2TgT1KiM691SeBUIYEXi189mhVXj
	JoX2kNJHE31JoFYMIlPIc0MNIcyUE+lhQpmqqo4WtEAPhqlMBenw860WMUoIA+/GzUzah6o0hHPT1
	M25Vcjl8D5z9laO5r2q9Sx8enNTGEfHg95VueNMvDcV6WUDrL8qQmXlhiFdzql1D34WnQlieOCZRg
	1duIe4tUN7DdK9j2L5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miJg0-005trg-Pg; Wed, 03 Nov 2021 17:03:52 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miJfy-005tqu-Dd; Wed, 03 Nov 2021 17:03:50 +0000
Date: Wed, 3 Nov 2021 10:03:50 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: axboe@kernel.dk, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com, efremov@linux.com,
 song@kernel.org, martin.petersen@oracle.com, hare@suse.de,
 jack@suse.cz, ming.lei@redhat.com, tj@kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/13] block: make __register_blkdev() return an error
Message-ID: <YYLA9g0cYBsEFZkm@bombadil.infradead.org>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
 <20211103122157.1215783-13-mcgrof@kernel.org>
 <20211103160933.GK31562@lst.de>
 <YYK8hY/giSBFN8YJ@bombadil.infradead.org>
 <20211103170049.GA4108@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103170049.GA4108@lst.de>
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

On Wed, Nov 03, 2021 at 06:00:49PM +0100, Christoph Hellwig wrote:
> On Wed, Nov 03, 2021 at 09:44:53AM -0700, Luis Chamberlain wrote:
> > Here's the thing, prober call a form of add_disk(), and so do we want
> > to always ignore the errors on probe? If so we should document why that
> > is sane then. I think this approach is a bit more sane though.
> 
> I suspect the right thing is to just kill of ->probe.
> 
> The only thing it supports is pre-devtmpfs, pre-udev semantics that
> want to magically create disks when their pre-created device node
> is accesses.

That sounds like a possible userspace impact? And so not for v5.16 for
sure.

> But if we don't remove it, yes I think not reporting
> the error is best.  Just clean up whatever local resources were set
> up in the ->probe method and let the open fail without the need of
> passing on the actual error.

Alright, I'll do that and send a final v3 for the last 2 patches.

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
