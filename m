Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E98C63777
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:38:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD06206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CcMwhZFr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ttWPoi7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD06206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iVnsL35HceetPdxlT/QB05QxLrR5k48H0MAJvtDyOhw=; b=CcMwhZFrvmjAJHEJzHO4un+MH
	QX1Z8VpdkIAoHPuwVr+KGihXZvg9R9oaUup+6dw75OYb3Ard7DOgNk3Z3ARvscGaXhcyHsIQG/klw
	BrHBNd9ITqC0X99wFmmTd/QKfK0E1B7lT8mc2myKkK0F2EOY1O1xLG6XYpG7loTXGUU6Np4g+reRn
	zLye9SphRtYo67ZMPYQXgGlN32vIETFZz0bhf1te5RKJXRwrYNlBClNQgT343u3dIOrAXYS/+u3Wt
	oFQAtYdfWiAbyKNa7HyF0WsKT42sV3pCIply1IT2DOCPH5MbYNcducPW7qqJINBYo+WBb5bM9XpMZ
	aoowYfiSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcG1-00036t-6U; Tue, 24 Nov 2020 17:37:37 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcFy-000362-Mk
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:37:35 +0000
Received: by mail-qv1-xf43.google.com with SMTP id u23so11010011qvf.1
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NMx3wGtNfY3eeaXC4utlwl41yJ4qPilA6BGetqYUorY=;
 b=ttWPoi7SbGNczr/1HSKQP13JwOnnq6d51NvgAXrXOVbFUHDENikis8wgWQ/ICO4vWD
 QXvXHNRrjPvcjtbRUNuU5kihbWk0IwxLYcoiLDd6H0sLjKI3e2qbtU5af/N7pFoOqAgC
 h3xBKCRJvq/QDtB6ihgsX92WTCe21la5HoXVw91eRC04tEZopSMLMnfWKE1wWDcnWaYf
 S2KXfW3yg0N/7LpsJ40fmTrf9EG2F6mG56V6rpZ8GyEnO0Ym+iYS/n4CBM7mxtRyxGrg
 uQLw/J+qnYSYcVKcO0TGKVFY752sD2m6oYXQvW4fux2BOd14a3jTxvr52rzBLO0HCBoZ
 teng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=NMx3wGtNfY3eeaXC4utlwl41yJ4qPilA6BGetqYUorY=;
 b=lusQTguprohu9XSjypuveECB8QwkYSJG2Q+y8Dertx5PfUhOEz53W3w2/2CwOJjlqy
 X1MmPpcJ7Kv/na5iYPrgATIMRua5jFN/wVg9qZrKpqwajq9yHGgTM4+5BUUEOcO+p21X
 6mrh6g6BdbOnjXgcsbHpxZaQUVij17cWWwoGCfPpi2zd5b3L4bnE4kFNV0U2ZMgc8iS8
 dnhivmjQdkhPrfMRCCdTCFZi6MFORBqbK7Kui3aQhGtQnCGCf4SQQ+aoR/Nq3Uyyikmp
 Llj256LxwzrfF6bBLWpX4pb7OA98vtiBTzgc+tqTBkNFd9Z2XtOmMHY2Swqey+vGQF3r
 vlwA==
X-Gm-Message-State: AOAM531Q7mJqHy6vX7YU5VA7IINYZIPBlUF6Vm4IO7Kh+tYG3bpPCaZG
 qrVnpqK+K/EdFaHDfaKaCu8=
X-Google-Smtp-Source: ABdhPJzX+Vh2Egxjq814YfOpUGajTbbALAhbpqH5gqFyQRlGy9nqyUOsvItkj0Gt+6yRJDRCbrF4QA==
X-Received: by 2002:a05:6214:4e5:: with SMTP id
 cl5mr5723077qvb.42.1606239452550; 
 Tue, 24 Nov 2020 09:37:32 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id k70sm13834520qke.46.2020.11.24.09.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:37:31 -0800 (PST)
Date: Tue, 24 Nov 2020 12:37:09 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/45] block: remove a superflous check in blkpg_do_ioctl
Message-ID: <X71ExfXNm5IC7xMq@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-13-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123734_786701_0FCD33BE 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:18PM +0100, Christoph Hellwig wrote:
> sector_t is now always a u64, so this check is not needed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
