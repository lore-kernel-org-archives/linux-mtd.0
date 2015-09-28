Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgV3A-0008Jt-F1
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 09:48:49 +0000
Date: Mon, 28 Sep 2015 11:48:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com"
 <guz.fnst@cn.fujitsu.com>, "gsi@denx.de" <gsi@denx.de>, "richard@nod.at"
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Frank Liu
 =?UTF-8?B?5YiY576k?= (frankliu)" <frankliu@micron.com>, Andrea Scian
 <rnd4@dave-tech.it>, "Peter Pan =?UTF-8?B?5r2Y5p+P5a6P?= (peterpan)"
 <peterpan@micron.com>, "Karl Zhang =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)"
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] drivers:mtd:ubi:add definition for UBI bakvol
 operation
Message-ID: <20150928114815.698d9f2a@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CEDA@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEDA@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 28 Sep 2015 07:02:40 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> Add macro definition for UBI bakvol operation.
>=20
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> ---
>  drivers/mtd/ubi/ubi.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 2974b67..746dfbe 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -438,6 +438,7 @@ struct ubi_debug_info {
>   * @vtbl_slots: how many slots are available in the volume table
>   * @vtbl_size: size of the volume table in bytes
>   * @vtbl: in-RAM volume table copy
> + * @bkblk_tbl: backup block table
>   * @device_mutex: protects on-flash volume table and serializes volume
>   *                creation, deletion, update, re-size, re-name and set
>   *                property
> @@ -547,6 +548,7 @@ struct ubi_device {
>  	int vtbl_slots;
>  	int vtbl_size;
>  	struct ubi_vtbl_record *vtbl;
> +	struct ubi_bkblk_tbl *bkblk_tbl;

Where is struct ubi_bkblk_tbl defined (actually I found it in patch
2).

>  	struct mutex device_mutex;
> =20
>  	int max_ec;
> @@ -797,6 +799,20 @@ int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
>  			    struct list_head *rename_list);
>  int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info=
 *ai);
> =20
> +/* bakvol.c*/
> +int ubi_check_backup_volume(struct ubi_device *ubi);
> +int ubi_backup_data_to_backup_volume(struct ubi_device *ubi, loff_t addr,
> +		size_t len, size_t *retlen, const void *buf);
> +int ubi_backup_volume_init(struct ubi_device *ubi);
> +int ubi_backup_volume_scan(struct ubi_device *ubi,
> +			struct ubi_vid_hdr *vidh, int pnum);
> +int ubi_backup_volume_init_tail(struct ubi_device *ubi,
> +				struct ubi_attach_info *si);
> +int ubi_bad_data_recovery(struct ubi_device *ubi);
> +int is_backup_need(struct ubi_device *ubi, loff_t addr);
> +void init_bakvol(struct ubi_volume_desc *desc, uint8_t choice);
> +void clear_bakvol(struct ubi_device *ubi);
> +
>  /* vmt.c */
>  int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req);
>  int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl);
> @@ -846,6 +862,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi=
_attach_info *ai_fastmap,
> =20
>  /* wl.c */
>  int ubi_wl_get_peb(struct ubi_device *ubi);
> +int ubi_wl_get_plane_peb(struct ubi_device *ubi, int plane);

The same goes for those functions. You only define their protypes here,
and implement them in patch 4.

Please split your changes in a consistent way.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
