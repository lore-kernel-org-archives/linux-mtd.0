Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1wsn-0007OQ-VZ
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 06:15:09 +0000
Subject: Re: [PATCH] [UBI] [1/3] ubi notifications API
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1241018978.20184.33.camel@hp.diimka.lan>
References: <1241018978.20184.33.camel@hp.diimka.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 May 2009 09:14:47 +0300
Message-Id: <1241676887.27996.12.camel@localhost.localdomain>
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

OK. For this we have ubi_devices_mutex. If you take it,
you prevent UBI devices from being created/removed. So
you do not need the references here, just take the mutex.

Something similar should be done for volume, I'm looking
at this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
