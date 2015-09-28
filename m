Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgUvb-0005KZ-BG
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 09:41:00 +0000
Date: Mon, 28 Sep 2015 11:40:08 +0200
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
Subject: Re: [PATCH 1/9] drivers:nand:mtd: add support for UBI bakvol in mtd
 layer
Message-ID: <20150928114008.06dcd1cd@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CECC@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CECC@NTXXIAMBX02.xacn.micron.com>
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

Hi Bean,

On Mon, 28 Sep 2015 07:02:37 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> Add support for UBI bakvol in mtd layer.
>=20
> This solution based on MLC NAND dual plane program.
> so add hook in mtd layer.

I know you don't have any other choices to expose "two-plane page
program" to the UBI layer, but I keep thinking that exposing that to
the MTD users is not a good idea (I might be wrong ;-)).

>=20
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> ---
>  include/linux/mtd/mtd.h  | 19 +++++++++++++++++++
>  include/linux/mtd/nand.h |  4 ++++
>  include/linux/mtd/ubi.h  |  9 +++++++++
>  3 files changed, 32 insertions(+)
>=20
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index f17fa75..cfcb3a68 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -204,6 +204,9 @@ struct mtd_info {
>  			  struct mtd_oob_ops *ops);
>  	int (*_write_oob) (struct mtd_info *mtd, loff_t to,
>  			   struct mtd_oob_ops *ops);
> +	int (*_dual_plane_write_oob) (struct mtd_info *mtd, loff_t to_plane0,
> +			struct mtd_oob_ops *ops_plane0, loff_t to_plane1,
> +					struct mtd_oob_ops *ops_plane1);


IMHO, if we were about to allow parallel write operations this should
be exposed as a more generic API, something like:

struct mtd_write_op {
	loff_t to;
	struct mtd_oob_ops ops;
};

struct mtd_multi_write_ops {
	struct list_head writes;
};

int (*_multi_write)(struct mtd_info *mtd,
		    struct mtd_multi_write_ops *ops);

Then the NAND layer could optimize that if the NAND chip supports
"two-plane page program", and if 2 pages in the write list are
fulfilling the requirements.

>  	int (*_get_fact_prot_info) (struct mtd_info *mtd, size_t len,
>  				    size_t *retlen, struct otp_info *buf);
>  	int (*_read_fact_prot_reg) (struct mtd_info *mtd, loff_t from,
> @@ -280,6 +283,22 @@ static inline int mtd_write_oob(struct mtd_info *mtd=
, loff_t to,
>  	return mtd->_write_oob(mtd, to, ops);
>  }
> =20
> +static inline int mtd_write_dual_plane_oob(struct mtd_info *mtd,
> +		loff_t to_plane0, struct mtd_oob_ops *ops0, loff_t to_plane1,
> +						struct mtd_oob_ops *ops1)
> +{
> +	ops0->retlen =3D ops0->oobretlen =3D 0;
> +	ops1->retlen =3D ops1->oobretlen =3D 0;
> +
> +	if (!mtd->_dual_plane_write_oob)
> +		return -EOPNOTSUPP;
> +	if (!(mtd->flags & MTD_WRITEABLE))
> +		return -EROFS;
> +
> +	return mtd->_dual_plane_write_oob(mtd, to_plane0, ops0,
> +						to_plane1, ops1);
> +}
> +
>  int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t *ret=
len,
>  			   struct otp_info *buf);
>  int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 272f429..4c5be01 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -77,6 +77,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs=
, uint64_t len);
>  #define NAND_CMD_READ1		1
>  #define NAND_CMD_RNDOUT		5
>  #define NAND_CMD_PAGEPROG	0x10
> +#define NAND_CMD_MULTI_PAGEPROG	0x11
>  #define NAND_CMD_READOOB	0x50
>  #define NAND_CMD_ERASE1		0x60
>  #define NAND_CMD_STATUS		0x70
> @@ -671,6 +672,9 @@ struct nand_chip {
>  	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
>  			uint32_t offset, int data_len, const uint8_t *buf,
>  			int oob_required, int page, int cached, int raw);
> +	int (*write_plane_page)(struct mtd_info *mtd, struct nand_chip *chip,
> +			uint32_t offset, int data_len, const uint8_t *buf,
> +			int oob_required, int page, int plane, int raw);
>  	int (*onfi_set_features)(struct mtd_info *mtd, struct nand_chip *chip,
>  			int feature_addr, uint8_t *subfeature_para);
>  	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
> index 1e271cb..1da3418 100644
> --- a/include/linux/mtd/ubi.h
> +++ b/include/linux/mtd/ubi.h
> @@ -35,6 +35,15 @@
>   */
>  #define UBI_MAX_SG_COUNT 64
> =20
> +enum {
> +	UBI_BAKVOL_UNONE,
> +	UBI_BAKVOL_INIT_INFO,
> +	UBI_BAKVOL_INIT_INFO_DONE,
> +	UBI_BAKVOL_INIT_VOLUME,
> +	UBI_BAKVOL_INIT_VOLUME_DONE,
> +	UBI_BAKVOL_RUN
> +};
> +

Are those changes related to this patch?

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
