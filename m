Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3515EC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:59:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A41C221E9
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:59:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uDmmwnQ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A41C221E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MShqP6EZaz9kjz5UwaOajwuSXul81U3DuP5h/pY5K0c=; b=uDmmwnQ6LWCF64wuIvFOBxfj+
	j8xAqRNKv+/PhGPrlykR+jzHS1mZndkc1Fw+uFFk6blZs0K6PwMQ7/XvSmb8klyjlAdDdImsh/lU+
	tHi4znvAp/8fVZFNrdqHd6ZBBlw+pQMahqhjaTOX0KMM2GCVb8f+tVDL51ximRRkSJ+SfxQCFkjCS
	dHCNlb61OJS457FVO2er4E7W/EVKLvPHM3btJH/FWdbCEa/LVet/377dExYjqSUUVfDyeUE/WEGMU
	mNC0jqY/A1sYqtE91ZE98nKJUdm2bX1nxRpe3tNp1RSTFJsB+m+m38N5jkMxo7SHyN5VTDpiXhPm7
	gLq5zH8oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJIL-00058e-4o; Wed, 18 Nov 2020 08:58:29 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJI5-0004zL-UG
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 08:58:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E406367357; Wed, 18 Nov 2020 09:58:04 +0100 (CET)
Date: Wed, 18 Nov 2020 09:58:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <20201118085804.GA20384@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_035814_195622_C3FCD0B1 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: linux-bcache@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
> since this isn't the first series from you recently spamming
> xen-devel, may I ask that you don't Cc entire series to lists
> which are involved with perhaps just one out of the many patches?
> IMO Cc lists should be compiled on a per-patch basis; the cover
> letter may of course be sent to the union of all of them.

No way.  Individual CCs are completely broken as they don't provide
the reviewer a context.  If you don't want xen-blkfront patches to
go to xen-devel remove it from MAINTAINERS.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
