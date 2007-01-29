Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBWJ6-0007Ao-8s
	for linux-mtd@lists.infradead.org; Mon, 29 Jan 2007 08:12:28 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200701291147.10111.alexs@linux.vnet.ibm.com>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<1169798664.9477.21.camel@sauron>
	<200701291147.10111.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 29 Jan 2007 15:02:25 +0200
Message-Id: <1170075745.9477.73.camel@sauron>
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

Hi Alexander,

On Mon, 2007-01-29 at 11:47 +0100, Alexander Schmidt wrote:
> here is the second version of the patch, containing updates of the
> documentation in vtbl.h and upd.h. We decided not to integrate handling o=
f
> the old update marker volume, as the scenario of booting a new kernel on =
a
> flash device containing an old update marker is definately rare.

I have several notes.

>   * along with this program; if not, write to the Free Software
>   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 U=
SA
>   *
> - * Author: Artem B. Bityutskiy
> + * Authors: Artem B. Bityutskiy
> + *          Alexander Schmidt

May you please instead add something like

+ * Jan 2006: Alexander Schmidt, implemented per-volume update.

which is what people usually do in these cases.

>  /**
> @@ -230,6 +245,7 @@ void ubi_vtbl_close(const struct ubi_inf
>   * @last_eb_bytes: how many bytes are stored in the last logical erasebl=
ock
>   * @used_bytes: how many bytes of data this volume contains
>   * @corrupted: non-zero if the data is corrupted
> + * @updating: non-zero if volume is under update
>   *
>   * Note, the @usable_leb_size field is not stored on flash, as it is eas=
ily
>   * calculated with help of the @data_pad field. But it is just very hand=
y, so
> @@ -250,6 +266,7 @@ struct ubi_vtbl_vtr {
>  	int last_eb_bytes;
>  	long long used_bytes;
>  	int corrupted;
> +	int updating;
>  };

In the code, in comments you still call this flag update marker. I am
not sure, but may be it makes sense to call this field 'upd_marker'
instead? It looks more coherent to the comments, but on the other hand
it does not look very self-documenting. Hmm... We need ask Andreas, he
is a naming-expert :-)
=20
> --- ubi-2.6.orig/drivers/mtd/ubi/sysfs.c
> +++ ubi-2.6/drivers/mtd/ubi/sysfs.c
> @@ -79,7 +79,6 @@ static ssize_t dev_avail_eraseblocks_sho
>  static ssize_t dev_total_eraseblocks_show(struct class_device *dev, char=
 *buf);
>  static ssize_t dev_volumes_count_show(struct class_device *dev, char *bu=
f);
>  static ssize_t dev_max_ec_show(struct class_device *dev, char *buf);
> -static ssize_t dev_update_show(struct class_device *dev, char *buf);
>  static ssize_t dev_reserved_for_bad_show(struct class_device *dev, char =
*buf);
>  static ssize_t dev_bad_peb_count_show(struct class_device *dev, char *bu=
f);
>  static ssize_t dev_max_vol_count_show(struct class_device *dev, char *bu=
f);
> @@ -98,8 +97,6 @@ static struct class_device_attribute dev
>  	__ATTR(volumes_count, S_IRUGO, dev_volumes_count_show, NULL);
>  static struct class_device_attribute dev_max_ec =3D
>  	__ATTR(max_ec, S_IRUGO, dev_max_ec_show, NULL);
> -static struct class_device_attribute dev_update =3D
> -	__ATTR(update, S_IRUGO, dev_update_show, NULL);

AFAIU, in your implementation only one update at a time is possible, so
I think it is better not to remove this attribute but export the ID of
the volume which is currently being updated.

This allows you to find "all update-interrupted" volumes and to avoid
including a volume which is really being updated now to this list.

>  void ubi_sysfs_vol_close(struct ubi_uif_volume *vol)
>  {
> +	class_device_remove_file(&vol->dev, &vol_updating);

But this new flag is anyway needed.

>  /**
> + * ubi_vmt_updvol - set or remove the update marker for a volume.
> + *
> + * @ubi: the UBI device description object
> + * @vol_id: ID of the volume to re-size
> + * @updating: new value for the update marker
> + *
> + * This function returns zero in case of success, and a negative error c=
ode in
> + * case of failure.
> + */
> +int ubi_vmt_updvol(const struct ubi_info *ubi, int vol_id, int updating)=
;
> +
> +/**

Please, do not utilize vmt unit from upd unit at all. Utilize vtbl unit
directly.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
