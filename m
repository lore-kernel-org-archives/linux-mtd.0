Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75CDC4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:04:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE8B2311B
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NrRhIcpk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eP3Z9KmG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FE8B2311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zr2WYmx04CD8DRTkiPTdu7p2JnSXw6Hls3USWvLcF7U=; b=NrRhIcpkvfhwlrM7ky5L9lD+1
	Mjy/TgrIVdigEeTPjNdH4pRuuNZT1+HMcrWjMoPh+QdW1whl09t3dOn1za4WXlxdIN7E7Y7qOXHFF
	EcBewOYA80QztLjcosc3iQF60xINiEMBWpoTCkR7inJTPexDZzH3LTYStmJAyUVROaFiuorJfoAez
	aBGSZZVQWCnvPZT0LcQMcslzlaLy4ltew5OtiG2Noq1hjBAUZ2ijrVtvoZpA0FPR99mZesYu7TpbL
	HodWdqCOkZShu864QS/yguJrUdb9/SM0ueVc1drWg8PG5sjAtIaEpClAcg9KVw62elNCiXCCtPjCw
	UMimerpIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLSmU-0000Wj-KS; Thu, 24 Sep 2020 15:03:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLSmS-0000Vb-48
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 15:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600959811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CuPbzvXQosIYzpsTmyDB+PWCFgx3pRZznwdDq166LWs=;
 b=eP3Z9KmGOgHKsdc2egcKFmMEqUWOPS/355h58xDpBE45HyaDSMZNhofIlD/t/Uqhd633Tw
 Pjk8AQdt4Oup7qKiLogc4TKnNXLGKMfNDE7+5XQUc0Y0VMu3WPO2TldBeaOgBtsvqaBpDA
 c0C4sIuAmGj8+IGxQpULtmDqlUTAmQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-iUJ3YX6mN1eUqjWHfNMFxw-1; Thu, 24 Sep 2020 11:03:27 -0400
X-MC-Unique: iUJ3YX6mN1eUqjWHfNMFxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C924802B75;
 Thu, 24 Sep 2020 15:03:24 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92FD35C1D7;
 Thu, 24 Sep 2020 15:03:19 +0000 (UTC)
Date: Thu, 24 Sep 2020 11:03:19 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/13] block: lift setting the readahead size into the
 block layer
Message-ID: <20200924150318.GE13849@redhat.com>
References: <20200924065140.726436-1-hch@lst.de>
 <20200924065140.726436-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924065140.726436-8-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_110332_211112_17B176C1 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Justin Sanders <justin@coraid.com>, Hans de Goede <hdegoede@redhat.com>,
 Song Liu <song@kernel.org>, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, drbd-dev@tron.linbit.com,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24 2020 at  2:51am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Drivers shouldn't really mess with the readahead size, as that is a VM
> concept.  Instead set it based on the optimal I/O size by lifting the
> algorithm from the md driver when registering the disk.  Also set
> bdi->io_pages there as well by applying the same scheme based on
> max_sectors.  To ensure the limits work well for stacking drivers a
> new helper is added to update the readahead limits from the block
> limits, which is also called from disk_stack_limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Coly Li <colyli@suse.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Thanks for adding blk_queue_update_readahead()

Reviewed-by: Mike Snitzer <snitzer@redhat.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
