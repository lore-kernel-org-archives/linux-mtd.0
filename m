Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCE8U-0001Az-7f
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 14:09:27 +0000
Subject: Re: [PATCH] [UBI] 1/5 - UBI notifications, take two
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@gmail.com
In-Reply-To: <1229339635.7900.21.camel@hp.diimka.lan>
References: <1229339635.7900.21.camel@hp.diimka.lan>
Content-Type: text/plain; charset=utf-8
Date: Mon, 15 Dec 2008 16:04:39 +0200
Message-Id: <1229349879.4911.45.camel@sauron>
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

Thanks for the patch, but I have some concerns. Please clarify some
things.

1. If X is subscribed to the notification, you assume that can X open
UBI volumes from within the notification. At least I can see this in
your "simple FTL". But this is recursion, ant it is very tricky. And I
see problems related to this in your code. I may be mistaken, though.
See below.

Could you please document things like this at the kernel-doc comments of
the 'ubi_unregister_volume_notifier()' function? Even if no UBI API
calls are allowed, this should be documented there.

Some of my notes below are very minor and are really nit-picking. I do
not _require_ you to fix them, although would appreciate.

On Mon, 2008-12-15 at 14:13 +0300, dmitry pervushin wrote:
> Index: ubifs-2.6/drivers/mtd/ubi/build.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- ubifs-2.6.orig/drivers/mtd/ubi/build.c
> +++ ubifs-2.6/drivers/mtd/ubi/build.c
> @@ -122,6 +122,51 @@ static struct device_attribute dev_mtd_n
>  	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
> =20
>  /**
> + * ubi_enum_volumes - enumerate all existing volumes and send notificati=
on
Dot at the end please. Glance at other doc-book comments, let's be
consistent.
> + *
Kernel-doc used to issue an error if there is an empty line like this
between the function name and parameters list. Again, glance at other
doc-book comments, let's be consistent.
> + * @t: notification type to send
> + * @ubi: UBI device number
> + * @nb: notifier to be called
> + *
> + * Walk on volume list that are created on device @ubi, or if @ubi < 0, =
on all
> + * available UBI devices. For each volume, send the notification - eithe=
r
> + * system-wide if @nb is NULL, or only to the registered @nb
%NULL, dot.
> + *
> + * Returns number of volumes processed
Dot.
> + */
> +int ubi_enum_volumes(enum ubi_volume_notification_type t, int ubi,
> +		struct notifier_block *nb)
Other UBI code always alling the second line to the start of parameters
description. E.g., glance at 'dev_attribute_show()'.

'ubi' name is used only for 'struct ubi_info' everywhere, please, pick a
different name. I would rename it to 'ubi_num', as the other code has.
> +{
> +	int ubi_num, i, count =3D 0;
And I'd re-name this 'ubi_num' to 'n' or something.
> +	struct ubi_device *ubi_dev;
> +	struct ubi_volume_notification nt;
> +
> +	ubi_num =3D ubi < 0 ? 0 : ubi;
> +	spin_lock(&ubi_devices_lock);
> +	do {
> +		nt.ubi_num =3D ubi_num++;
> +		ubi_dev =3D ubi_devices[nt.ubi_num];
> +		if (!ubi_dev)
> +			continue;
> +		spin_lock(&ubi_dev->volumes_lock);
> +		for (i =3D 0; i < ubi_dev->vtbl_slots; i++) {
> +			if (!ubi_dev->volumes[i])
> +				continue;
> +			nt.vol_id =3D ubi_dev->volumes[i]->vol_id;
> +			if (nb)
> +				nb->notifier_call(nb, t, &nt);
> +			else
> +				blocking_notifier_call_chain(&ubi_notifiers,
> +					t, &nt);
And here the rest of the UBI code would use

		blocking_notifier_call_chain(&ubi_notifiers,
		                             t, &nt);
> +			count++;
> +		}
> +		spin_unlock(&ubi_dev->volumes_lock);
> +	} while (ubi < 0 && ubi_num < UBI_MAX_DEVICES);
> +	spin_unlock(&ubi_devices_lock);
> +	return count;
> +}

So you call notifiers from withing spin-locks. Are they really blocking
notifiers? Note, if you call any UBI kernel API function from the
notifier, you'll deadlock. E.g., if you call 'ubi_get_device_info()',
you'll deadlock on 'ubi_devices_lock'. Did you test your code?

I guess you should prohibit recursion and pass full UBI device/volume
information _inside_ the notifier. And the subsystems which work above
UBI should never _open_ UBI volumes from within notifiers. E.g., the
"simple FTL" stuff should open the UBI volume only when the
corresponding FTL block device is opened, not in the notifier.

Also, this function seems to be over-complicated. I'd have 2 separate
functions instead - one for the purposes of build.c and one for kapi.c.
These "negative or positive @ubi, %NULL or non-%NULL @np" are too
confusing.

Enough, there were more tiny things though.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
