Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBsvb-0007zm-Cm
	for linux-mtd@lists.infradead.org; Tue, 30 Jan 2007 08:21:41 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200701291736.01006.alexs@linux.vnet.ibm.com>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<200701291147.10111.alexs@linux.vnet.ibm.com>
	<1170075745.9477.73.camel@sauron>
	<200701291736.01006.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Jan 2007 15:01:16 +0200
Message-Id: <1170162076.9477.123.camel@sauron>
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

Alexander,

thank you for the patch, please, find my mostly minor comments below.

On Mon, 2007-01-29 at 17:36 +0100, Alexander Schmidt wrote:
> - * Also, in this UBI implementation we make use of so called update mark=
er when
> - * updating volumes. The update marker is global. This may cause quite
> - * unpleasant UBI usability problems. What we could do is to implement
> - * many-updates-at-a-time support by adding a per-volume "corrupted" fla=
g to the
> - * volume table. This flag would be set before update and cleared after =
update.
> + * The volume table record also contains a so called update marker, whic=
h
> + * indicates whether a volume is under update or not. The update marker =
is
> + * set and stored on flash on the beginning of an update and deleted aft=
erwards.
> + * This makes UBI recognize aborted updates, which may happen because of
> + * power-offs during updates. Read operations on volumes with pending up=
date
> + * markers get rejected.
>   */
[minor] it may also happen if the updating process was killed

>  /*
> + * Volume updating constants used in volume table records.
> + *
> + * @UBI_VOL_NOUPD: volume is not being updated
> + * @UBI_VOL_UPD: volume is being updated
> + */

[minor] I would better say "volume update started" instead of "volume is
being updated" becaus the marker may be there if the volume is not
really being updated, the update was just interrupted.

> +static ssize_t vol_updating_show(struct class_device *dev, char *buf);

[minor] As we started using "update marker", lets be consistent and name
this, say, 'vol_upd_marker_show()'

>  /*
>   * Class device attributes corresponding to files in
> @@ -224,6 +225,8 @@ static struct class_device_attribute vol
>  	__ATTR(usable_eb_size, S_IRUGO, vol_usable_eb_size_show, NULL);
>  static struct class_device_attribute vol_data_bytes =3D
>  	__ATTR(data_bytes, S_IRUGO, vol_data_bytes_show, NULL);
> +static struct class_device_attribute vol_updating =3D
> +	__ATTR(updating, S_IRUGO, vol_updating_show, NULL);

The sysfs file will be named "updating". Probably it is less confusing
and more strict to expose the "update marker" term to the outer world
too.

I'd propose

static struct class_device_attribute vol_upd_marker =3D
	__ATTR(upd_marker, S_IRUGO, vol_upd_marker_show, NULL);

instead.
=20
> 			dbg_upd("volume %d is being updated, update marker "
> +	if (upd->updating && upd->vol_id !=3D vol_id) {
> +		dbg_upd("volume %d is being updated, update marker "
>  				"busy", upd->vol_id);

[minor] Just to make coding style consistent:

dbg_upd("volume %d is being updated, update marker "
	"busy", upd->vol_id);

(aligned) or better

dbg_upd("volume %d is being updated, update marker busy", upd->vol_id);

as there are less then 80 characters per line.

> +
> +	mutex_lock(&vtbl->mutex);
> +	vtr->corrupted =3D 0;
> +	mutex_unlock(&vtbl->mutex);

vtbl->mutex is a private field and only vtbl unit can touch it. Please,
do ot use it outside of vtbl unit.

See 'struct ubi_vtbl_info' definition - each field is commented as
private/public.

Please, just do not touch the 'corrupted' flag, and do not call
'ubi_vtbl_set_corrupted()' in 'ubi_upd_start()'.

The 'corrupted' flag seems to be half-working, I will fix this after we
commit your patch.

> +
>  	upd->vol_id =3D -1;
>  	return 0;
>  }
> --- ubi-2.6.orig/drivers/mtd/ubi/vtbl.c
> +++ ubi-2.6/drivers/mtd/ubi/vtbl.c
> @@ -160,6 +160,44 @@ int ubi_vtbl_set_data_len(const struct u
>  	return 0;
>  }
> =20
> +int ubi_vtbl_updvol(const struct ubi_info *ubi, int vol_id, int upd_mark=
er)
> +{
> +	int err;
> +	struct ubi_vtbl_vtr tmp_vtr;
> +	struct ubi_vtbl_vtr *vtr;
> +	struct ubi_vtbl_info *vtbl =3D ubi->vtbl;
> +
> +	ubi_assert(vol_id >=3D 0 && vol_id < vtbl->vt_slots);
> +	ubi_assert(upd_marker =3D=3D UBI_VOL_NOUPD || upd_marker =3D=3D UBI_VOL=
_UPD);
> +	ubi_assert(!ubi_is_ivol(vol_id));
> +
> +	dbg_vtbl("set update marker for volume %d to %d", vol_id, upd_marker);
> +
> +	/* Ensure that this volume exists */
> +	vtr =3D ubi_vtbl_get_vtr(ubi, vol_id);
> +	if (IS_ERR(vtr)) {
> +		return PTR_ERR(vtr);
> +	}

[minor] No need to do this. We just stand that the volume must exist and
it is the job of the caller to make sure of this. Just add debugging
check

ubi_assert(ubi->vtbl->vt[vol_id].reserved_pebs =3D=3D 0);

as other similar functions of the vtbl unit do.
=20
> -		vtr->corrupted =3D 0;
> +		if (vtr->upd_marker) {
> +			ubi_warn("volume %d update was interrupted", i);
> +			vtr->corrupted =3D 1;
> +		}
> +		else
> +			vtr->corrupted =3D 0;

Please, remove these changes. I (or we) will correct the corrupted flag.

It makes much more sense to distinguish between "(physically) corrupted"
and "update-interrupted". So we have an update-interrupted volume. We
will prohibit reading from it because it simply makes no sense. Reading
from a corrupted volume will make sense because the user (e.g. FS) could
be able to recover some data. Also, "corrupted" will only applicable to
static volumes because we do not care about dynamic volumes' contents.

Makes sense?

> -	int i, reserved_pebs, alignment, data_pad, vol_type, name_len;
> +	int i, reserved_pebs, alignment, data_pad, vol_type, name_len,
> +	    upd_marker;
[minor]

+	int i, reserved_pebs, alignment, data_pad, vol_type, name_len;
+	int upd_marker;
=20
> +	if (unlikely(vtr->updating !=3D UBI_VOL_NOUPD &&
> +		     vtr->updating !=3D UBI_VOL_UPD)) {
> +		ubi_err("bad update marker");
> +		goto bad;
> +	}

We renamed this field. I'd suggest you to test your code with paranoid
checks enabled - this may help to catch bugs you do not even think
about.

Side note: hmm, anyway, 'this paranoid_check_vtr()' function should not
exist in vmt unit - it's not vmt's business. Will need to remove it -
but thats a distinct patch, do not bother please.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
