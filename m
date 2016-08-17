Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZwXh-0001hg-TF
 for linux-mtd@lists.infradead.org; Wed, 17 Aug 2016 08:49:46 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u7H8ZV0Z047623
 for <linux-mtd@lists.infradead.org>; Wed, 17 Aug 2016 04:49:24 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24va4wdhj3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 17 Aug 2016 04:49:23 -0400
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cornelia.huck@de.ibm.com>;
 Wed, 17 Aug 2016 09:49:22 +0100
Date: Wed, 17 Aug 2016 10:49:14 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Fam Zheng <famz@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Sergey Senozhatsky
 <sergey.senozhatsky.work@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org,
 linux-nvme@lists.infradead.org, "Ed L. Cashin" <ed.cashin@acm.org>,
 Keith Busch <keith.busch@intel.com>, Minchan Kim <minchan@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>, Nitin
 Gupta <ngupta@vflare.org>
Subject: Re: [PATCH 06/15] genhd: Add return code to device_add_disk
In-Reply-To: <1471418115-3654-7-git-send-email-famz@redhat.com>
References: <1471418115-3654-1-git-send-email-famz@redhat.com>
 <1471418115-3654-7-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-Id: <20160817104914.37087cb3.cornelia.huck@de.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 Aug 2016 15:15:06 +0800
Fam Zheng <famz@redhat.com> wrote:

> @@ -613,10 +614,8 @@ void device_add_disk(struct device *parent, struct gendisk *disk)
>  	disk->flags |= GENHD_FL_UP;
> 
>  	retval = blk_alloc_devt(&disk->part0, &devt);
> -	if (retval) {
> -		WARN_ON(1);
> -		return;
> -	}
> +	if (retval)
> +		goto fail;
>  	disk_to_dev(disk)->devt = devt;
> 
>  	/* ->major and ->first_minor aren't supposed to be
> @@ -625,16 +624,26 @@ void device_add_disk(struct device *parent, struct gendisk *disk)
>  	disk->major = MAJOR(devt);
>  	disk->first_minor = MINOR(devt);
> 
> -	disk_alloc_events(disk);
> +	retval = disk_alloc_events(disk);
> +	if (retval)
> +		goto fail;
> 
>  	/* Register BDI before referencing it from bdev */
>  	bdi = &disk->queue->backing_dev_info;
> -	bdi_register_owner(bdi, disk_to_dev(disk));
> +	retval = bdi_register_owner(bdi, disk_to_dev(disk));
> +	if (retval)
> +		goto fail;
> 
> -	blk_register_region(disk_devt(disk), disk->minors, NULL,
> -			    exact_match, exact_lock, disk);
> -	register_disk(parent, disk);
> -	blk_register_queue(disk);
> +	retval = blk_register_region(disk_devt(disk), disk->minors, NULL,
> +				     exact_match, exact_lock, disk);
> +	if (retval)
> +		goto fail;
> +	retval = register_disk(parent, disk);
> +	if (retval)
> +		goto fail;
> +	retval = blk_register_queue(disk);
> +	if (retval)
> +		goto fail;
> 
>  	/*
>  	 * Take an extra ref on queue which will be put on disk_release()
> @@ -644,10 +653,20 @@ void device_add_disk(struct device *parent, struct gendisk *disk)
> 
>  	retval = sysfs_create_link(&disk_to_dev(disk)->kobj, &bdi->dev->kobj,
>  				   "bdi");
> +	if (retval)
> +		goto fail;
> +
> +	retval = disk_add_events(disk);
> +	if (retval)
> +		goto fail;
> +
> +	retval = blk_integrity_add(disk);
> +	if (retval)
> +		goto fail;
> +	return 0;
> +fail:
>  	WARN_ON(retval);
> -
> -	disk_add_events(disk);
> -	blk_integrity_add(disk);
> +	return retval;
>  }

Noticed this when trying to figure out whether the error handling in
virtio_blk was correct:

Shouldn't you try to cleanup/rewind so that any structures are in a
sane state after failure? The caller doesn't know where device_add_disk
failed, and calling del_gendisk unconditionally like virtio_blk does is
probably not the right thing to do (at the very least, I don't think
unregistering a device that has not been registered is likely to work).
