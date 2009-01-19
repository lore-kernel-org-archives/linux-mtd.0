Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LOr4o-00010I-9J
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 10:09:53 +0000
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00901190138n1e21a769lb6afc28b02c5fb75@mail.gmail.com>
References: <200901071022.46343.corentincj@iksaif.net>
	<alpine.LFD.2.00.0901181441410.4913@casper.infradead.org>
	<71cd59b00901180924t4b61a22cw325b18789dd953b2@mail.gmail.com>
	<71cd59b00901190138n1e21a769lb6afc28b02c5fb75@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 19 Jan 2009 12:09:29 +0200
Message-Id: <1232359769.22350.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Some obvious things are commented below.

On Mon, 2009-01-19 at 10:38 +0100, Corentin Chary wrote:
> --#ifdef CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
> --
>   /*
>    * This function allows to directly write to dynamic UBI volumes, without
>    * issuing the volume update operation. Available only as a debugging feature.
> @@@ -279,8 -275,7 +273,10 @@@ static ssize_t vol_cdev_direct_write(st
>   	int lnum, off, len, tbuf_size, err = 0;
>   	size_t count_save = count;
>   	char *tbuf;
> +
> ++	if (!vol->direct_ioctl)
> ++	  return -EPERM;
>  +
I suggest calling this vol->direct_writes instead.

>   	dbg_gen("requested: write %zd bytes to offset %lld of volume %u",
>   		count, *offp, vol->vol_id);
> 
> @@@ -347,10 -339,10 +340,6 @@@
>   	return err ? err : count_save - count;
>   }
> 
> --#else
> --#define vol_cdev_direct_write(file, buf, count, offp) (-EPERM)
> --#endif /* CONFIG_MTD_UBI_DEBUG_USERSPACE_IO */
> --
>   static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
>   			      size_t count, loff_t *offp)
>   {
> @@@ -560,8 -551,7 +548,20 @@@ static long vol_cdev_ioctl(struct file
>   		err = ubi_is_mapped(desc, lnum);
>   		break;
>   	}
> - #endif
> +
> ++	case UBI_IOVOLDIRIO:
Please, use a consistent name. All ioctl names start with UBI_IOC =
UBI ioctl.

I used "direct I/O" term in one of my previous mails. Please, do not use
i, because this term is reserved for file-system direct I/O, which
bypasses page cache. So, let's avoid any possible confusion.

Also, I suggest to make this ioctl more generic. You effectively want
to change some volume property. And in future we may want to be able
changing other properties, for example, cleaning or setting the
"corrupted" flag for the volume. Or changing the WL threshold. Or
changing the amount of PEBs reserved for wear-levelling. Etc.

So, let's add UBI_IOCSETPROP ioctl (UBI ioctl set property) instead.
For now, we'll have only one property - direct writes. Let's make this
ioctl accept a pointer to

struct ubi_set_prop_req {
	uint8_t property;
	uint8_t padding[7];
	uint64_t value;
}

and introduce constants

enum {
	UBI_PROP_DIRECT_WRITE = 0,
};

So, to enable direct writes you'll have to set req->property to
UBI_PROP_DIRECT_WRITE and value to 1.

> ++	{
> ++		int32_t directio;
> ++
> ++		err = get_user(directio, (__user int32_t *)argp);
> ++		if (err) {
> ++			err = -EFAULT;
> ++			break;
> ++		}
> ++		err = desc->vol->direct_ioctl = (directio > 0);
> ++		break;

You have to serialize the ioctl. Please, use the volumes_mutex for this:

mutex_lock(&ubi->volumes_mutex);
desc->vol->direct_ioctl = !!req->property;
mutex_unlock(&ubi->volumes_mutex);

Also, do not forget to validate the 'struct ubi_set_prop_req' object.

> ++	}
>  +
>   	default:
>   		err = -ENOTTY;
>   		break;
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 381f0e1..25a77eb 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -206,6 +206,7 @@ struct ubi_volume_desc;
>   * @upd_marker: %1 if the update marker is set for this volume
>   * @updating: %1 if the volume is being updated
>   * @changing_leb: %1 if the atomic LEB change ioctl command is in progress
> + * @direct_ioctl: %1 if direct write operation are enabled for users
> (via ioctl())
>   *
>   * @gluebi_desc: gluebi UBI volume descriptor
>   * @gluebi_refcount: reference count of the gluebi MTD device
> @@ -253,6 +254,7 @@ struct ubi_volume {
>  	unsigned int upd_marker:1;
>  	unsigned int updating:1;
>  	unsigned int changing_leb:1;
> +	unsigned int direct_ioctl:1;

Also, find the comment for the 'volumes_mutex' and add that it protects
this flag to the comment.

> 
>  #ifdef CONFIG_MTD_UBI_GLUEBI
>  	/*
> diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
> index 82113e1..1fa7a28 100644
> --- a/include/mtd/ubi-user.h
> +++ b/include/mtd/ubi-user.h
> @@ -175,6 +175,8 @@
>  #define UBI_IOCEBUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)
>  /* Check if LEB is mapped command */
>  #define UBI_IOCEBISMAP _IOR(UBI_VOL_IOC_MAGIC, 5, int32_t)
> +/* Set direct-io availability */
> +#define UBI_IOVOLDIRIO _IOW(UBI_VOL_IOC_MAGIC, 6, int32_t)

Also, please document this ioctl in the big commentary at the beginning
of ubi-user.h.

Thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
