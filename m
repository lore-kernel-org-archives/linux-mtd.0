Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64609C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:06:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3292D60E05
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3292D60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkXSTs0IzFXKcfy/Pa69AKYkK6abdAgPKlm0qvMn6cE=; b=JorjzEABjq8mAt
	a9Ab52BFnMfzyOt2Q0lxv1Wbs0rKuaXjY65MA/V4inQJjdbDEyb7nONXxwwTYffqF6Zvl8qq4vpW8
	fEUUIUQ5nYd4dnhRAPm+s0XC2Xeke+IWAPo86Iz5+8NWdx4N+V07NvO9GT6B9zvbSDZcqKX+p4ZmV
	a8saFq3MLBVLUmnM2YnY3JHVB6NRiz5A6+XG9OSwCCwJlv0itSxhAw17ZfcwTpKZtc6jQMU7Bo9mD
	yeQvbaszjvdxzYaNYdPRz7SPayGmnZ4LVrOg+TvGOY71pQAUkzWH7NawbaKg5HiuZgYjrShldwdYM
	LKQKGS/3T99So5QSdydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miIls-005e3i-LD; Wed, 03 Nov 2021 16:05:52 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miIlp-005e1l-EU
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 16:05:50 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 67DF268AA6; Wed,  3 Nov 2021 17:05:47 +0100 (CET)
Date: Wed, 3 Nov 2021 17:05:47 +0100
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
Subject: Re: [PATCH v2 04/13] nvdimm/blk: avoid calling del_gendisk() on
 early failures
Message-ID: <20211103160547.GD31562@lst.de>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
 <20211103122157.1215783-5-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103122157.1215783-5-mcgrof@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_090549_664315_458F9B9D 
X-CRM114-Status: GOOD (  14.28  )
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

On Wed, Nov 03, 2021 at 05:21:48AM -0700, Luis Chamberlain wrote:
> If nd_integrity_init() fails we'd get del_gendisk() called,
> but that's not correct as we should only call that if we're
> done with device_add_disk(). Fix this by providing unwinding
> prior to the devm call being registered and moving the devm
> registration to the very end.
> 
> This should fix calling del_gendisk() if nd_integrity_init()
> fails. I only spotted this issue through code inspection. It
> does not fix any real world bug.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

Should this grow a Fixes tag for the commit adding the problem?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
