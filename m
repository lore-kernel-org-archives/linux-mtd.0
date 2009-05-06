Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1afZ-0000Id-9z
	for linux-mtd@lists.infradead.org; Wed, 06 May 2009 06:32:00 +0000
Subject: Re: [PATCH] [UBI] [1/3] ubi notifications API
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1241018978.20184.33.camel@hp.diimka.lan>
References: <1241018978.20184.33.camel@hp.diimka.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 May 2009 09:31:42 +0300
Message-Id: <1241591502.3760.44.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-29 at 19:29 +0400, dmitry pervushin wrote:
> UBI volume notifications are intended to create the API to get clients
> notified about volume creation/deletion, renaming and changing(actually,
> resizing). A client can subscribe to these notifications using
> ubi_volume_register and cancel the subscription using
> ubi_volume_unregister. When UBI volume change occurs, the atomic
> notifier will be called. Client also can request "added" event on all
> volumes that existed before client subscribed to the notifications.
> 
> Using notifications instead of calling functions ubi_gluebi_xxx allows
> MTD emulation layer to be more flexible; say, now is it possible to
> build it as a module and load/unload it on demand.
> 
> Thanks Artem Bityutskiy for reviewing the patch and many very valuable
> comments.
> 
> Signed-off-by: Dmitry Pervushin <dpervushin@embeddedalley.com>
> ---
>  drivers/mtd/ubi/build.c |   80 ++++++++++++++++++++++++++++++++++++++++++++++--
>  drivers/mtd/ubi/cdev.c  |    2 +
>  drivers/mtd/ubi/kapi.c  |   46 +++++++++++++++++++++++++++
>  drivers/mtd/ubi/ubi.h   |   24 ++++++++++++++
>  drivers/mtd/ubi/vmt.c   |    7 ++++
>  include/linux/mtd/ubi.h |   35 +++++++++++++++++++++
>  6 files changed, 191 insertions(+), 3 deletions(-)
> 
> Index: linux-2.6-arm/drivers/mtd/ubi/build.c
> ===================================================================
> --- linux-2.6-arm.orig/drivers/mtd/ubi/build.c
> +++ linux-2.6-arm/drivers/mtd/ubi/build.c
> @@ -122,6 +122,76 @@ static struct device_attribute dev_mtd_n
>  	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
>  
>  /**
> + * ubi_enum_volumes - "enumerate" volumes.
> + * @ntype: notification type to send (%UBI_VOLUME_ADDED, etc)
> + * @ubi: UBI device description object
> + * @nb: notifier to be called or %NULL to send to system-wide notification
> + *
> + * This function walks all volumes of UBI device @ubi and sends the
> + * notification specified by @ntype. Returns number of sent notifications.
> + */
> +int ubi_enum_volumes(int ntype, struct ubi_device *ubi,
> +		     struct notifier_block *nb)
> +{
> +	struct ubi_volume_notification nt;
> +	int i, count = 0;
> +
> +	nt.ubi_num = ubi->ubi_num;
> +
> +	spin_lock(&ubi->volumes_lock);
> +	for (i = 0; i < ubi->vtbl_slots; i++) {
> +		if (!ubi->volumes[i])
> +			continue;
> +		nt.vol_id = ubi->volumes[i]->vol_id;
> +		get_device(&ubi->volumes[i]->dev);
> +		ubi->volumes[i]->ref_count += 1;
> +		spin_unlock(&ubi->volumes_lock);
> +		if (nb)
> +			nb->notifier_call(nb, ntype, &nt);
> +		else
> +			blocking_notifier_call_chain(&ubi_notifiers,
> +						     ntype, &nt);
> +		count++;
> +		spin_lock(&ubi->volumes_lock);
> +		ubi->volumes[i]->ref_count -= 1;
> +		put_device(&ubi->volumes[i]->dev);
> +	}
> +	spin_unlock(&ubi->volumes_lock);
> +
> +	return count;
> +}
> +
> +/**
> + * ubi_enum_all_volumes - enumerate all existing volumes and send notification.
> + * @ntype: notification type to send (%UBI_VOLUME_ADDED, etc)
> + * @nb: notifier to be called, or %NULL to send to system-wide notification
> + *
> + * This function walks all UBI devices and all volumes on the device, and sends
> + * the notification specified by @ntype. Returns number of sent notifications.
> + */
> +int ubi_enum_all_volumes(int ntype, struct notifier_block *nb)
> +{
> +	struct ubi_device *ubi;
> +	int i, count = 0;
> +
> +	spin_lock(&ubi_devices_lock);
> +	for (i = 0; i < UBI_MAX_DEVICES; i++) {
> +		ubi = ubi_devices[i];
> +		if (!ubi)
> +			continue;
> +		ubi->ref_count += 1;
> +		get_device(&ubi->dev);
> +		spin_unlock(&ubi_devices_lock);
> +		count += ubi_enum_volumes(ntype, ubi, nb);
> +		spin_lock(&ubi_devices_lock);
> +		put_device(&ubi->dev);
> +		ubi->ref_count -= 1;
> +	}
> +	spin_unlock(&ubi_devices_lock);
> +	return count;
> +}

The locking is still screwed. I do not think the code will work
when enumeration races with volume creation/deletion etc,
or when it races with device detach. And I do not think the
subscribers will get sensible sequence of events in this
case.

The right solution would be to re-work locking, and use mutexes
instead of this (not very sane) "exlusive" flag.

Roughly, I believe there should be 2 mutexes:

1. global "devices mutex" - locked when whole MTD device is
   attached/detached.
2. per-UBI device "device mutex" - locked when volumes belonging
   to this device are created/removed/resized/renamed.

And this "exlusive" open mode should go away.

I'll see what I can do. I'll try to prepare new locking
for you. Will let you know.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
