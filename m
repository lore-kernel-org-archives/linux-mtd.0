Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB83C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:08:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD6660F36
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AD6660F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc5MFi6DLSDer2tRZ3w/OW/Xp3IAIeo8FGHyP1x0a1E=; b=zOQ3YDHjpLARA6
	nDUYumyUun+7XUzouU+ez857ksYYIQyRvVVU4BNFF+DpNPCRPQXhGq/M51lTW1eI9ZMk3oHH3Kxol
	Yw7u19WwhatqVcA4IYIs/8rVcCZzz6kVVJLsK9V16kpomwkGxUVQjS8L07lOBN/E4pbJtby47FS+c
	5c7pLGzHthUvmTWukgo/0O7D3gHZeFnAiwwhFJdjgAmSmQmUjt6jpk0+w1m6hJdB3VrOt/Xj20LEB
	aqmwINxLUtsnaaFQS10lK/o15eTvI50l45KuN70Dsf0upD54C7Z1yuD+0eoYIczabajrCj/eHVuX6
	hFCaaIUA2Z9dHtTCqEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miInm-005eus-UG; Wed, 03 Nov 2021 16:07:51 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miIn8-005ecG-9S
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 16:07:11 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4350568AA6; Wed,  3 Nov 2021 17:07:08 +0100 (CET)
Date: Wed, 3 Nov 2021 17:07:07 +0100
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
Subject: Re: [PATCH v2 08/13] z2ram: add error handling support for add_disk()
Message-ID: <20211103160707.GH31562@lst.de>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
 <20211103122157.1215783-9-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103122157.1215783-9-mcgrof@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_090710_516986_15FBE590 
X-CRM114-Status: GOOD (  12.40  )
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

On Wed, Nov 03, 2021 at 05:21:52AM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling. Only the disk is cleaned up inside
> z2ram_register_disk() as the caller deals with the rest.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
