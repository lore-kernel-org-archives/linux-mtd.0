Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9zzR-0006ow-N2
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 10:38:54 +0000
Subject: Re: [PATCH] [UBI] 1/4 UBI volume notifications - UBI changes
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@gmail.com
In-Reply-To: <1228759160.7622.28.camel@hp.diimka.lan>
References: <1228759160.7622.28.camel@hp.diimka.lan>
Content-Type: text/plain; charset=utf-8
Date: Tue, 09 Dec 2008 12:36:29 +0200
Message-Id: <1228818989.13686.172.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

On Mon, 2008-12-08 at 20:59 +0300, dmitry pervushin wrote:
<snip>
>  /**
> + * ubi_enum_volumes - enumerate all existing volumes
> + */
> +int ubi_enum_volumes(void *context,
> +	void (*enumerator)(void *context, int ubi, const char *volume_name))
> +{
> +	int ubi_num, i, count =3D 0;
> +	struct ubi_device *ubi;
> +
> +	spin_lock(&ubi_devices_lock);
> +	for (ubi_num =3D 0; ubi_num < UBI_MAX_DEVICES; ubi_num++) {
> +		ubi =3D ubi_devices[ubi_num];
> +		if (!ubi)
> +			continue;
> +		spin_lock(&ubi->volumes_lock);
> +		for (i =3D 0; i < ubi->vtbl_slots; i++) {
> +			if (!ubi->volumes[i])
> +				continue;
> +			enumerator(context, ubi_num, ubi->volumes[i]->name);
> +			count++;
> +		}
> +		spin_unlock(&ubi->volumes_lock);
> +	}
> +	spin_unlock(&ubi_devices_lock);
> +	return count;
> +}

Could you please initialize 'struct ubi_volume_notification' straight in
this function, instead of having 'enumerator' call-back? I think this
would be much more readable. I do not see the reason for this
complexity.

<snip>
> +/**
>   * ubi_get_device - get UBI device.
>   * @ubi_num: UBI device number
>   *
> @@ -842,6 +870,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_=
num, int vid_hdr_offset)
>  			goto out_detach;
>  	}
> =20
> +	/* when processing uif_init, we already might want to open the volume *=
/
> +	ubi_devices[ubi_num] =3D ubi;
>  	err =3D uif_init(ubi);
>  	if (err)
>  		goto out_nofree;

I do not understand this change. The point is to prevent anyone from
opening the volume before it is completely initialized. What you do -
you allow the volume to be opened while it is in the middle of
initialization, which is wrong. E.g., what if the initialization fails
at some point?

And this change does not seem to be relevant to this patch.

<snip>
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -395,7 +395,7 @@ static ssize_t vol_cdev_write(struct file *file, cons=
t char __user *buf,
>  			vol->corrupted =3D 1;
>  		}
>  		vol->checked =3D 1;
> -		ubi_gluebi_updated(vol);
> +		ubi_volume_notify(UBI_VOLUME_CHANGED, ubi->ubi_num, vol->name);
>  		revoke_exclusive(desc, UBI_READWRITE);
>  	}

Could you please remove gluebi as a separate patch?

> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
<snip>
> +
> +static void do_notify_added(void *context, int ubi, const char *name)
> +{
> +	struct notifier_block *nb =3D context;
> +	struct ubi_volume_notification nt;
> +
> +	nt.ubi_device =3D ubi;
> +	nt.volume_name =3D name;
> +	nb->notifier_call(context, UBI_VOLUME_ADDED, &nt);
> +}

As I said above, this call-back function does not seem to be reasonable.

> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
<snip>
> -#ifdef CONFIG_MTD_UBI_GLUEBI
> -	/*
> -	 * Gluebi-related stuff may be compiled out.
> -	 * Note: this should not be built into UBI but should be a separate
> -	 * ubimtd driver which works on top of UBI and emulates MTD devices.
> -	 */
> -	struct ubi_volume_desc *gluebi_desc;
> -	int gluebi_refcount;
> -	struct mtd_info gluebi_mtd;
> -#endif
>  };

Similar. May this stuff be removed in a separate patch please? It'll
make things easier to review.

<snip>
> +int ubi_register_volume_notifier(struct notifier_block *nb,
> +		int ignore_existing);
> +int ubi_unregister_volume_notifier(struct notifier_block *nb);
> +
> +struct ubi_volume_notification {
> +	int ubi_device;
> +	const char *volume_name;
> +};

This should have volume ID instead of name. Indeed, the ID is unique and
never changes, while name may change, so ID is better for volume
identification purposes.

<snip>
> +enum ubi_volume_notification_type {
> +	UBI_VOLUME_ADDED,
> +	UBI_VOLUME_DELETED,
> +	UBI_VOLUME_CHANGED,
> +	UBI_VOLUME_RENAMING,
> +	UBI_VOLUME_RENAMED,
> +};

I do not see a reason for 2 rename notifications. Why? For me it looks
like one is enough.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
