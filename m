Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7577C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/YzaiPCcEMEu04bXy5BRvnpF6p8/lI4L9KszlzTmOw=; b=G0ux04n1/ZC0X1
	nU5BTVzuq+pQX0+tnIHn62kyyZbiy7rr0JW1erCackz3l72WTO2sP0lqadR9K2/rIfZI8t2uo6NPh
	H+Ox9ozWWYb9I29DCspFrXcXC31Jq58WL/kaBdRGI0XcIwNILqqNIBiw60tdevsaRhohUz00HN0bm
	TTN1BCFZOsQ0AhGjIaGpenDtaENRrWBqeb/0TF7DJddf2R6BxI/OfziIipEZcoV/GTYg8MAAywvK/
	qQ6MjhLUzbnSho9CwUZ44iFhe7o3aQIMjo78sreVOFWV4yduJJ+T+CjRUSesCobhKF5fHnIk81t66
	aUrWfGB/uVqiCvPIhlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Vl0-001gId-00;
	Mon, 27 Nov 2023 07:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Vkx-001gHB-2b
	for linux-mtd@bombadil.infradead.org;
	Mon, 27 Nov 2023 07:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XPf2AtiwQ2FQ0ccJ0Z/7TTlcwI3rp+w7qwo94ih5ipc=; b=qgo2A31Jj3KPrahqOrUrG8eGcZ
	uxuUXGRZa5v2mvLklrUtBjdU8uMYRIJjNJ+gC6ktd8yRsWhxM6wgt8SCMfBxNkO80NmOGZDWIqz+O
	6wEInJmw2DYHp33nzP1qjfrK1DQanRWDURxwMKVHJzelIWMYhebV6tus2TaUm97evt3ijPrHwaqUN
	b4MvcW7qwg2ngNbl4UAc/0ige6a8vvoN6yOYhe0smBxtODDdLHsTuX8GAzLr84F7Xg8LTcB/WTSoC
	i2UfSjVLRvZqFzsP69oAdFpAVairT5qknSSwYDPASn1pff0qPRMdNkOZ09WPi32C8uDiKphKzansr
	xs6XIjJw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Vku-00Fyxd-1r
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 07:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF79F60917;
	Mon, 27 Nov 2023 07:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996CFC433C7;
	Mon, 27 Nov 2023 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701068997;
	bh=rnicohsvfFaSTeb42azhK+SpajDI1T+vJboqkZ88aAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VRPuFgHzyDdTKsrT6v2s4trEAs1zQA4cvx634pNpuoQtKkSCdvaCJbelneF1Ip3l4
	 3R2XpX9ULxFTLpvYZKC+OlVq1tQIg76lPle5uK1IXkDVPKpxfksILf6SRdY2YXiVx8
	 +7dKkjw2ixB7N6vQIrVxt9xKL7YlIHvL3xsDc8NMjznTj873bGKZp7GuQibnlnSWQy
	 ysSVDOissl1B8bF0lV/M0VJ7ULdDRCNYUqiH8Y50kpQs3OK75m1qeIPmc8MbFbLlTF
	 UDMB8ntMGz+OWj0fdv08z2PCWBrrlD9/8Y+uzFUqcbmYmX6+lodrokeIPhbDBGbkVC
	 Bn0mDn1QrfPEw==
Message-ID: <d3b87b87-2ca7-43ca-9fb4-ee3696561eb5@kernel.org>
Date: Mon, 27 Nov 2023 16:09:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH block/for-next v2 07/16] bcachefs: use new helper to get
 inode from block_device
To: Yu Kuai <yukuai1@huaweicloud.com>, hch@infradead.org,
 ming.lei@redhat.com, axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, dchinner@redhat.com, linux@weissschuh.net,
 min15.li@samsung.com, yukuai3@huawei.com, willy@infradead.org,
 akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-8-yukuai1@huaweicloud.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231127062116.2355129-8-yukuai1@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_071008_886829_09A8F867 
X-CRM114-Status: GOOD (  12.83  )
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

On 11/27/23 15:21, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Which is more efficiency, and also prepare to remove the field
> 'bd_inode' from block_device.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  fs/bcachefs/util.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/util.h b/fs/bcachefs/util.h
> index 2984b57b2958..fe7ccb3a3517 100644
> --- a/fs/bcachefs/util.h
> +++ b/fs/bcachefs/util.h
> @@ -518,7 +518,7 @@ int bch2_bio_alloc_pages(struct bio *, size_t, gfp_t);
>  
>  static inline sector_t bdev_sectors(struct block_device *bdev)
>  {
> -	return bdev->bd_inode->i_size >> 9;
> +	return bdev_inode(bdev)->i_size >> 9;

shouldn't this use i_size_read() ?

I missed the history with this but why not use bdev_nr_sectors() and delete this
helper ?

>  }
>  
>  #define closure_bio_submit(bio, cl)					\

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
