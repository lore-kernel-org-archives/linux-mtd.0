Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D9AC5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D0F2225B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YZ5yNepV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D0F2225B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qIvLPC784F9elwp0slsN8LpsgrGEI2Wm2mThFM2Llgo=; b=YZ5yNepVUA3WHAioiwGdMI38d
	IvTDmspOOg4mMA3tJLovgCoMY4WfTSWJzM4xOhxu7LWnXt2F4wfx2IeGXPRlyuszbkgFbvrfmLdfy
	ss28da+SguRNRfiWXqg0VtyHnd1dzn9hEcBgIHF3cWSxwRLEsO4bWd39cDClhuT5F6gBxRLd0gMEG
	WGmLGXgrJuMqIF2BGi17xTPSYy6CQg2+qwLvddwyNXnnWc9/h74rN+1OtitrjRqKfuGcf8Uzh9KD0
	y/lLOIFBkr0e1oKUyt20yx1s9nER84S3yXekJed9VE+OoZbMZr+8bwNYGb8Xy703lN+dy4/v4s+HB
	BBtH5fDcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2DY-0002tW-Mc; Fri, 20 Nov 2020 08:56:32 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2DW-0002sf-5e
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 08:56:30 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 134F468B05; Fri, 20 Nov 2020 09:56:27 +0100 (CET)
Date: Fri, 20 Nov 2020 09:56:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <20201120085626.GB21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de> <20201119094157.GT1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119094157.GT1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_035630_352290_0935426A 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 10:41:57AM +0100, Jan Kara wrote:
> >  	rcu_assign_pointer(ptbl->part[0], &disk->part0);
> > @@ -1772,8 +1626,10 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
> >  	 * converted to make use of bd_mutex and sequence counters.
> >  	 */
> >  	hd_sects_seq_init(&disk->part0);
> > -	if (hd_ref_init(&disk->part0))
> > -		goto out_free_part0;
> > +	if (hd_ref_init(&disk->part0)) {
> > +		hd_free_part(&disk->part0);
> 
> Aren't you missing kfree(disk) here?

This should actually jump to out_free_bdstats, I've fixed it up.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
