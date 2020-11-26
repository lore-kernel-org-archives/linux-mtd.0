Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4A0C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:03:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD77207BC
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccvowWIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFD77207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uEUehKt7jsr58tNuGc+deQMAPex6RGTpn9+mEknVRes=; b=ccvowWIcZZtvqR1mtPSP8PMt5
	4WVz9xsq6M/KbfmirwMfuj6ULJ0s2dxbeD+xQpvdfDdfURs9Gnng0IgW2QHuyUewzqo9B4Xg5J4hh
	4Q1RPTgPobIMo1MssYOWIkFmYB/847ZSNRt2HbHekGntnH3p5mEJXOPg0SdK2HaFkUs+DdLJ+k3n/
	F7czpYaKPnaCEauTGS+x+KwNDsB4V5LT3JmQfOajY4TF/3HpUKAyOkewRTKZ0tyDrxUBSzCimKAuS
	HGS69MQK8XT9DCb2SI3ZpEao0Y1QJ3nfKoO6cTtEr+P7BTwlXcTQCyU1/ennjatxGxeGGPbaU9e3a
	4amX1b2Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLbF-0005Pq-4g; Thu, 26 Nov 2020 18:02:33 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLbC-0005Or-Gf
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 18:02:31 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E1E5A68B05; Thu, 26 Nov 2020 19:02:28 +0100 (CET)
Date: Thu, 26 Nov 2020 19:02:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 31/44] block: move the start_sect field to struct
 block_device
Message-ID: <20201126180228.GB25921@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-32-hch@lst.de> <20201126165641.GQ422@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126165641.GQ422@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_130230_736593_4392C3CD 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 26, 2020 at 05:56:41PM +0100, Jan Kara wrote:
> The long long conversion is pointless here, right?

Yes.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
