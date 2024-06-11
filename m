Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FE7C41513
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2024 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2827Vi9WX+N8/d08A1I2RNX4i5evRjQLLqdBK+Eb5s=; b=0FLrCfhmlPtfsg
	mMUyV95qtpuWUEJIQQjusYOgpgzCHUfSA1s7M7S9Ti1bjIJR93d1Fh2hxiI/aeenPAFp2doixGOfK
	qSVKHVbYDbRWEL031n5gf3IeMr/8Mk0qEoMpHV0dgeXGYzTsq6XfKP2cbS/cdiick7s6ewLeyfjnp
	qlsi+NMjaaLOELkrWjej0NJ+AGiOFCo3AV5oM8VmX7RmjZ9ZeSWOUG/stMafb84HX1dvLyTOTo+kG
	/QAcUECIrpA/4/OJ9DTXhLUYc4vHz/hLmwmOF2tNpJNxy3DxDnFAC/vjP6BElhTyfyP4iHozw3Axc
	9wThwkqmmBfm+mSU5UCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGvvW-00000007qSe-0Kk4;
	Tue, 11 Jun 2024 07:28:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGvvS-00000007qRy-1Zvr;
	Tue, 11 Jun 2024 07:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C7491CE19E8;
	Tue, 11 Jun 2024 07:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C86C2BD10;
	Tue, 11 Jun 2024 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718090891;
	bh=PzNpxodKMaXzOrbrQbgP0Usp5K8OR/0f+y46RXYG5GI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LTBp4slDow5NcmeSUO+en/N5x+IvZpqfr4dZ5xfX2JzmBZDcu3dZh1tN6fO3CqfN5
	 fC9Rl/OM4T8uVQSZE7K0T1VbSc5kGVEloD8CTTVrPkbvI0U3LUhjHwjw0gYgT6m0wL
	 fsRPyDZqXTT6dQCkbhnlW45jwonhukSCr4JLmJKisZxNZLowwOQwk30YR8lK0/xTNh
	 Ya4myshjfW/7uX8nEJDGL/WMaUQq8CNmicSbttSzKnr2l9hJq0Cmz3iSLAwvK+uere
	 9vcVlwnm7Ycw2p4k6Qg21I4xZXBRD9ik7edbDXJpFSNi3bC1udvNreNPZ0wJBOp6Lf
	 6blq/N52Sp8VQ==
Message-ID: <d1bff26d-0059-4122-8179-75a1b72f3cfc@kernel.org>
Date: Tue, 11 Jun 2024 16:28:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/26] nbd: move setting the cache control flags to
 __nbd_set_size
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-10-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-10-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_002815_095179_1F267289 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move setting the cache control flags in nbd in preparation for moving
> these flags into the queue_limits structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
