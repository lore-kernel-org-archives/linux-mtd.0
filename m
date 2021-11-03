Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAA1C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:01:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237C761101
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 237C761101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nEz3BVaP19bessIVSX7wjJmBIDv5VFmhPVe1OvI7oo=; b=UNtagR/vPd67KT
	vc3vSvC4ZwkQrNYnPpny0GIWOb9abH38rfDBMXnSLpyV8hYYCLnMdCHuVoB+352m3hN/phUrm8yj0
	ebCwlqAnUg7T4lG5NJMtsv4aw5o1eoVVAcAfKRCbumsMDf3XAuA2K1HBPNgo76vtV3C/Cg4sKh9Wp
	B/9Oqf7LRRCHByckM3lpxdcRbwuVHPFTfxL71esPI+fjdNvqmuslepWcRA77KyVu5ZhA+BPv55bCc
	KVsWzcBf//QIUR61fqCoGqlQ7BnU+QbYQtbSe15RpZy0/hzG9+8eYHfHJg4wi5UKpR/28VKGFyful
	PZsiC9hmiYGJ6QBSuGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miJd9-005tJR-Tc; Wed, 03 Nov 2021 17:00:55 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miJd7-005tIP-9q
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 17:00:54 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 051C068AA6; Wed,  3 Nov 2021 18:00:50 +0100 (CET)
Date: Wed, 3 Nov 2021 18:00:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, axboe@kernel.dk,
 penguin-kernel@i-love.sakura.ne.jp, dan.j.williams@intel.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, ira.weiny@intel.com,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 efremov@linux.com, song@kernel.org, martin.petersen@oracle.com,
 hare@suse.de, jack@suse.cz, ming.lei@redhat.com, tj@kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/13] block: make __register_blkdev() return an error
Message-ID: <20211103170049.GA4108@lst.de>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
 <20211103122157.1215783-13-mcgrof@kernel.org> <20211103160933.GK31562@lst.de>
 <YYK8hY/giSBFN8YJ@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYK8hY/giSBFN8YJ@bombadil.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_100053_520343_C9B3DA2E 
X-CRM114-Status: GOOD (  13.83  )
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

On Wed, Nov 03, 2021 at 09:44:53AM -0700, Luis Chamberlain wrote:
> Here's the thing, prober call a form of add_disk(), and so do we want
> to always ignore the errors on probe? If so we should document why that
> is sane then. I think this approach is a bit more sane though.

I suspect the right thing is to just kill of ->probe.

The only thing it supports is pre-devtmpfs, pre-udev semantics that
want to magically create disks when their pre-created device node
is accesses.  But if we don't remove it, yes I think not reporting
the error is best.  Just clean up whatever local resources were set
up in the ->probe method and let the open fail without the need of
passing on the actual error.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
