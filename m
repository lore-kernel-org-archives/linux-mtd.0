Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1470C27C7B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 06:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xO5TNZEXZupgCPtmj3MU7Bhe30wFcxRz4B1YHIvmZfY=; b=2qT5+NQAS/ayKL
	qrrGIMvADs7l03LYNYTEsZPNxr31XmsXFvV6ioBguaFqiBVStWRsRY002olH1uAlkxxxu626KQNvn
	gux3oMeazqDpfe33FxTRN0qHU3rMrn0gVhl9Vxoe/P2y8K7R4/GgZpAuEA0ZHNsWB4QQnIKQG0jcM
	sgTvk+7+QCh5852Sb25qZX1J5WbKb9I7R34/tQ7ydxFPWg6LP2bQcoyhKJSW5BF4lH9Vlpz6Lr4m2
	L/nzglrtIHpOBEXQrTxGQmmTcliN398jVaCIJYSg3TnK3CF1DApnT1DDejOGAU8AXslySHJ4dQTl/
	9rhGiEvRhk7u1R79+qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5dO-00000009OIA-2UHh;
	Mon, 17 Jun 2024 06:14:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5dL-00000009OGd-3NL6;
	Mon, 17 Jun 2024 06:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E064A61127;
	Mon, 17 Jun 2024 06:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD93C2BD10;
	Mon, 17 Jun 2024 06:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718604866;
	bh=0lJUnETFqPY6tW6TrXFvmKZbVynd6dSdhAW9BC6m+kE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KOFdmVOJ7h8N9C7m0i5IH5j0T08893gjt00viGEXx0ITrjnEVSc7/n9x0PQNWhoCT
	 R0G81HXchAoQj63QO9zRTuNrWvr+9t+JPXFgDrlIxVtX306FULncwLvEYKw7dkrJFz
	 S6g5cy4QX7ofX49F8f+GhBjuuHoOe+F7NO0rxdIU4Xo0KJqwPt8S0uxmuFJz89cUcE
	 b/qPpB1pTQXoj1rhBApU3rTIJGnWH/qdRZJ9WOKQ+vU7PAj3CbnFFbcYvIj/VggV6B
	 QjSaWBl2euqvrvUDeNk514rvS2oC47UJWpHbvgG7uFw1q8j7/c3YYf4Afd7F+Ekvnv
	 W3vwVHRQv5iRw==
Message-ID: <d7b45e0b-68a9-4612-861a-7f192fbe6f84@kernel.org>
Date: Mon, 17 Jun 2024 15:14:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] loop: also use the default block size from an
 underlying block device
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
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, Bart Van Assche <bvanassche@acm.org>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-8-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-8-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_231427_943647_9440166D 
X-CRM114-Status: GOOD (  10.04  )
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

On 6/17/24 15:04, Christoph Hellwig wrote:
> Fix the code in loop_reconfigure_limits to pick a default block size for
> O_DIRECT file descriptors to also work when the loop device sits on top
> of a block device and not just on a regular file on a block device based
> file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
