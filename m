Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33059C56201
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 20:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA7F7206F7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 20:21:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CmYaXqF5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJS9gum5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA7F7206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G/r+0OSVqQ8nRgghK3X8jovp/Ij1PL+FE2wWnnJY4xM=; b=CmYaXqF5xG6tBF3BDmFCuiitk
	pUWiRZhPqkEpNum83NQbyDS54T4HrUZf+X+XChNuyLg8ez9a1URdPp5Y9bZCcgNra/HMV9cObLdrh
	4DFX8kcW34yTEK2uS8W7YShuRlbciAAvIXKlxCaMrboeWL6mZRJCBlsFkufx2GfOmqWn68bxn2VzQ
	4XQ6cokWe1PDr2hAc1lDIUAiqGQnN2GFk+7rBnWhdd/XzfDfRfH1CPv1e3BFrVBrbkoCoYWXYWhRz
	ZfDg877HGvFKcWhjicna6af9pazlG6NNsC/F9egm6CTSapscDiwm9/N/bXw1+8BlxbIsHDKhLbJyG
	z2cPl18IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki1HX-0004Hu-8Z; Wed, 25 Nov 2020 20:20:51 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki1HU-0004H2-Uw
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 20:20:49 +0000
Received: by mail-qv1-xf44.google.com with SMTP id k3so1556565qvz.4
 for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2020 12:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WSMpmf065AQQA16C6I8/f4Nb2MRTg2VCPV1Y+4Omok0=;
 b=aJS9gum5t6FoUnqNb5tw+YGyXQwCcI0whcaK5FVUTCKP/Za8Nic1QhStF8Oo0uQqh3
 L0EDWq8ANbf//uV8OcD8fNbj84N8b+UQW4VBsfkFxUd2wm2oiv8y2r+1szMOd2mKe/Fb
 jB/Rs1PwcZGahhDQ4EgDOj2cTvwscYJwDpscmIsBSgDUECsxq7ybIy99pl7t6EZACtmJ
 OQNz/R2bfBUvVHHvYpCiFswvCFs5ojv+6B+BefCSzh9yvMi9oo4QZXO9E+nIcmmPD3xg
 TfQqkbB+/KLVpkZTEMiMjSIt1e2srUeyrPlr4iowCq3gB3eKpa4DgFQSorpcJb38qFDX
 0fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=WSMpmf065AQQA16C6I8/f4Nb2MRTg2VCPV1Y+4Omok0=;
 b=R+URHW2QT79dNIdpmWkF9CIm8OiauhCWqlYROpxK522d4Iw0VV56S6iuC7fOFgxqj2
 MObOcQnxgAt46fj/7kd8kvn5OlNjP0uYut7v8ffPFbEBl8gVraL3q7d9p5Pv9Ia8rYDQ
 bS641KzFzoMsEtk6/g3cSGNS0CBZDzf0oHHDRKQrNjq1xtM9s458bGINpu6APHErZZNu
 JDaqGkT6CaxXpDEd9e/tISiAzSU825fUX8KLJA6Q07l8CExb5jwF0VZkUb6ADganb8GJ
 2pPXSoR7VpeVovJYdoapOIO96Y3G66pMTmjRIsGNzc6Xd1ox77bUqLVcfH831hPCJOhU
 YScw==
X-Gm-Message-State: AOAM530fYLvzO+b2lXgCqsV286h2bSL99VUIep54bzCT1xZry8Yyk5nn
 NzVLRdjZBInWM893fMORDLU=
X-Google-Smtp-Source: ABdhPJxGb7WJXeWnQukVsz1bsvc4/cmOCaTprUECQMhH8XohgWi8umM00Y/Xc9aCwh7r/SWLyDpYFQ==
X-Received: by 2002:a0c:b505:: with SMTP id d5mr4999671qve.59.1606335647135;
 Wed, 25 Nov 2020 12:20:47 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id y44sm486168qtb.50.2020.11.25.12.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:20:46 -0800 (PST)
Date: Wed, 25 Nov 2020 15:20:23 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 25/45] block: reference struct block_device from struct
 hd_struct
Message-ID: <X768hzEnD/ySog5b@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-26-hch@lst.de>
 <X714udEyPuGarVYp@mtj.duckdns.org> <20201125164515.GB1975@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125164515.GB1975@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_152049_067213_C54B4BEF 
X-CRM114-Status: GOOD (  22.47  )
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

Hello,

On Wed, Nov 25, 2020 at 05:45:15PM +0100, Christoph Hellwig wrote:
> On Tue, Nov 24, 2020 at 04:18:49PM -0500, Tejun Heo wrote:
> > Hello,
> > 
> > Please see lkml.kernel.org/r/X708BTJ5njtbC2z1@mtj.duckdns.org for a few nits
> > on the previous version.
> 
> Thanks, I've addressed the mapping_set_gfp mask nit and updated the
> commit log.  As Jan pointed also pointed out I think we do need the
> remove_inode_hash.

Agreed. It'd be nice to replace the stale comment.

> > Also, would it make sense to separate out lookup_sem removal? I *think* it's
> > there to ensure that the same bdev doesn't get associated with old and new
> > gendisks at the same time but can't wrap my head around how it works
> > exactly. I can see that this may not be needed once the lifetimes of gendisk
> > and block_devices are tied together but that may warrant a bit more
> > explanation.
> 
> Jan added lookup_sem in commit 56c0908c855afbb to prevent a three way
> race between del_gendisk and blkdev_open due to the weird bdev vs
> gendisk lifetime rules.  None of that can happen with the new lookup
> scheme.

Understood. I think it'd be worthwhile to note that in the commit log.

Thanks.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
