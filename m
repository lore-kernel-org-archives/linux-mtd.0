Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C22C433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 07:06:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5BD206C9
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 07:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3VzigDgk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5BD206C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ki9xGhksnopPS2qDKwfodEsMoqBV9rbAVwnoO1F8MV4=; b=3VzigDgkqxPYILrYfsRoUBNdr
	9ufpBNyMgBblbfprHPDoJ5e9w43YGTYpjBeuChSHOzNJCQJIHfeUxrKuVXwoiDJLP7LxQ58KZHNEM
	dWiZVjWEpjoY59iGAhFI/X8ABj9IM6n3aias6yJUrp7TubLTLMKE6x2gz33sdxYAnsltvI02Nvq+R
	12GmSN6dDQlCl0qV/wwBsiRUbkt+AStVBYmhnnXM4jKh3i79LhKp+WDRHVt4e9YSLKJ9JgWuAwfqF
	Ruh/iSqTsRBr8VsRpkj79Tjm2G75vnttDrucuhyB34QFZk+/DlVwEsm7qjWyKyC+SJj/ufTO4xEHq
	Q6R7kBCkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI51s-0006St-DK; Tue, 15 Sep 2020 07:05:28 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI51p-0006RO-7K
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 07:05:26 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9B14E68AFE; Tue, 15 Sep 2020 09:05:22 +0200 (CEST)
Date: Tue, 15 Sep 2020 09:05:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Subject: Re: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Message-ID: <20200915070522.GA19974@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
 <20200726150333.305527-7-hch@lst.de> <20200826220737.GA25613@redhat.com>
 <20200902151144.GA1738@lst.de> <20200902162007.GB5513@redhat.com>
 <20200910092813.GA27229@lst.de> <20200910171541.GB21919@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910171541.GB21919@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_030525_453489_997AC428 
X-CRM114-Status: GOOD (  14.69  )
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
 martin.petersen@oracle.com, Hans de Goede <hdegoede@redhat.com>,
 Richard Weinberger <richard@nod.at>, Minchan Kim <minchan@kernel.org>,
 drbd-dev@tron.linbit.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 01:15:41PM -0400, Mike Snitzer wrote:
> > I'll move it to blk_register_queue, which should work just fine.
> 
> That'll work for initial DM table load as part of DM device creation
> (dm_setup_md_queue).  But it won't account for DM table reloads that
> might change underlying devices on a live DM device (done using
> __bind).
> 
> Both dm_setup_md_queue() and __bind() call dm_table_set_restrictions()
> to set/update queue_limits.  It feels like __bind() will need to call a
> new block helper to set/update parts of queue_limits (e.g. ra_pages and
> io_pages).
> 
> Any chance you're open to factoring out that block function as an
> exported symbol for use by blk_register_queue() and code like DM's
> __bind()?

I agree with the problem statement.  OTOH adding an exported helper
for two trivial assignments seems a little silly..

For now I'll just keep the open coded ->io_pages assignment in
dm.  Note that dm doesn't currently update the ->ra_pages value
based on the underlying devices, so an incremental patch to do that
might be useful as well.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
