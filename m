Return-Path: <SRS0=PxVx=PH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456F3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 16:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1704B60F02
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 16:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1704B60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaoqU0jPSZcBiklBrpN14DmnOpzAp6xFDQAu7kb96XA=; b=DyIW1eWseCKP/9
	+fBz+No84z1+PQblVYaipBg45Ec789KoGsRP9R2oYhLxRFy/Y+A4QTwv0ToFlacn0osvfps4IXiu/
	0JlxqfmHPbptMheMnDJ+vbTtX3zz9wPQfWmb0rwPU1N+Vfi7xURtKxSPu1tStQKIyQd9xFyINQ4Yh
	HJFsnDk4y8u7FIoUlBPlv3LyAlzwGCmwvfmUOFm0wELxUHDEzK3cu579IZcDjRaT4TCstyehubJm/
	2Q7S4osOatnHBVDmOb+g/iKvVHoC38quOMr2G6jJCUJ+3tXW31TLJlzkbZZK08va7eUQER4sYnSRE
	yl505AvaVCmqno51JURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcreG-001q2G-GG; Tue, 19 Oct 2021 16:07:32 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mcrdP-001pUd-Kx; Tue, 19 Oct 2021 16:06:39 +0000
Date: Tue, 19 Oct 2021 09:06:39 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
 senozhatsky@chromium.org, Richard Weinberger <richard@nod.at>,
 miquel.raynal@bootlin.com, vigneshr@ti.com,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 "Weiny, Ira" <ira.weiny@intel.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-mtd@lists.infradead.org, Linux NVDIMM <nvdimm@lists.linux.dev>,
 linux-nvme@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/13] nvdimm/blk: avoid calling del_gendisk() on early
 failures
Message-ID: <YW7tDx/kXvg00T3O@bombadil.infradead.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-7-mcgrof@kernel.org>
 <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
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

On Fri, Oct 15, 2021 at 05:13:48PM -0700, Dan Williams wrote:
> On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > If nd_integrity_init() fails we'd get del_gendisk() called,
> > but that's not correct as we should only call that if we're
> > done with device_add_disk(). Fix this by providing unwinding
> > prior to the devm call being registered and moving the devm
> > registration to the very end.
> >
> > This should fix calling del_gendisk() if nd_integrity_init()
> > fails. I only spotted this issue through code inspection. It
> > does not fix any real world bug.
> >
> 
> Just fyi, I'm preparing patches to delete this driver completely as it
> is unused by any shipping platform. I hope to get that removal into
> v5.16.

I'll remove this from my queue, any chance you can review the changes
for nvdimm/btt?

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
