Return-Path: <SRS0=Otrq=PG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2853C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Oct 2021 20:32:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8097E60EE2
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Oct 2021 20:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8097E60EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phYxrSsK+2Vzv6w1z94g/EKsPyiMt43OdO2EdHiLV8E=; b=zgJOuD/ZNS3dX5
	8zKPnSWXD4CnoV2YgUEndKNh3BXV6sO/YAJqm+e+FGqYLMLWUqoHmZKvPt/jh16CBzvSQ9PTCu2m0
	3qjOsgQ4D/triQ7fzp/uvx+Uka5abbrGmIs+cIgp4epgH8/FqmySEuD7MXGvn0Ab8072zMgvNx6Vg
	GsOi+25dVHC8HqvIOO8rjddi7bMsivF7ut+mlcIJWyQ+JlYLA5uC08yhKBKxxqd/LlO89RZ5YyuEU
	w507Rx9K//Wp5CPsqaVifGmCQj/IsEAXkWqgBqCK3AX6JJa6zsVOv/id25xsgLOHLoVcByvM7hM3D
	6N9aOCHKPe8E6qcEXFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcZIf-00HDlj-4M; Mon, 18 Oct 2021 20:32:01 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mcZIX-00HDlV-C4; Mon, 18 Oct 2021 20:31:53 +0000
Date: Mon, 18 Oct 2021 13:31:53 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, axboe@kernel.dk
Cc: jejb@linux.ibm.com, agk@redhat.com, snitzer@redhat.com, colyli@suse.de,
 kent.overstreet@gmail.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, roger.pau@citrix.com,
 geert@linux-m68k.org, ulf.hansson@linaro.org, tj@kernel.org,
 hare@suse.de, jdike@addtoit.com, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
 krisman@collabora.com, chris.obbard@collabora.com,
 thehajime@gmail.com, zhuyifei1999@gmail.com, haris.iqbal@ionos.com,
 jinpu.wang@ionos.com, miquel.raynal@bootlin.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 dm-devel@redhat.com, linux-bcache@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-m68k@lists.linux-m68k.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] scsi/sd: add error handling support for add_disk()
Message-ID: <YW3ZuQv1qpIXkd5b@bombadil.infradead.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
 <20211015233028.2167651-2-mcgrof@kernel.org>
 <yq1bl3ofjo5.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq1bl3ofjo5.fsf@ca-mkp.ca.oracle.com>
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

On Sat, Oct 16, 2021 at 10:51:48PM -0400, Martin K. Petersen wrote:
> 
> Luis,
> 
> > We never checked for errors on add_disk() as this function returned
> > void. Now that this is fixed, use the shiny new error handling.
> >
> > As with the error handling for device_add() we follow the same logic
> > and just put the device so that cleanup is done via the
> > scsi_disk_release().
> 
> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

Thanks, would you like Jens to pick this up and the other scsi/sr patch
or are you taking it through your tree?

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
