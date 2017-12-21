Received: from mail-eopbgr20053.outbound.protection.outlook.com ([40.107.2.53]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRt10-0003nM-DQ
 for linux-mtd@lists.infradead.org; Thu, 21 Dec 2017 05:03:33 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "dedekind1@gmail.com" <dedekind1@gmail.com>, "oss@buserror.net"
 <oss@buserror.net>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, Jagdish Gediya <jagdish.gediya@nxp.com>
Subject: RE: [PATCH][v2] driver: mtd: update struct map_info's swap as per map
 requirement.
Date: Thu, 21 Dec 2017 05:03:11 +0000
Message-ID: <HE1PR04MB12411FD6374970400B42696F970D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1511954812-8533-1-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1511954812-8533-1-git-send-email-prabhakar.kushwaha@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


> -----Original Message-----
> From: Prabhakar Kushwaha [mailto:prabhakar.kushwaha@nxp.com]
> Sent: Wednesday, November 29, 2017 4:57 PM
> To: linux-mtd@lists.infradead.org
> Cc: dedekind1@gmail.com; oss@buserror.net; computersforpeace@gmail.com;
> Jagdish Gediya <jagdish.gediya@nxp.com>; Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com>
> Subject: [PATCH][v2] driver: mtd: update struct map_info's swap as per ma=
p
> requirement.
>=20
> From: Jagdish Gediya <jagdish.gediya@nxp.com>
>=20
> It is not necessary for all device's maps to be CFI_HOST_ENDIAN.
> Maps device can be Big endian or little endian.
>=20
> Currently it is being taken care using CONFIG_MTD_CFI_LE_BYTE_SWAP or
> CONFIG_MTD_CFI_BE_BYTE_SWAP i.e. compile time.
>=20
> Now update struct map_info's swap field based on device characteristics
> defined in device tree.
>=20
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> ---
> Changes for v2: Incorporated review comments from Boris Brezillon
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fpatch=
w
> ork.ozlabs.org%2Fpatch%2F758381%2F&data=3D02%7C01%7Cprabhakar.kushwah
> a%40nxp.com%7C9050b00591c44afe1fcd08d5371c445a%7C686ea1d3bc2b4c6f
> a92cd99c5c301635%7C0%7C0%7C636475516901200278&sdata=3Dl6iFa15%2FxgO
> fnmzmRgwFUbrwhY26ROw7rO1REh342mc%3D&reserved=3D0
>=20
>  drivers/mtd/maps/physmap_of_core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/mtd/maps/physmap_of_core.c
> b/drivers/mtd/maps/physmap_of_core.c
> index b1bd4fa..27f44a0 100644
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ b/drivers/mtd/maps/physmap_of_core.c
> @@ -20,6 +20,7 @@
>  #include <linux/mtd/map.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/concat.h>
> +#include <linux/mtd/cfi_endian.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> @@ -233,6 +234,13 @@ static int of_flash_probe(struct platform_device *de=
v)
>  		info->list[i].map.bankwidth =3D be32_to_cpup(width);
>  		info->list[i].map.device_node =3D dp;
>=20
> +		if (of_property_read_bool(dp->parent, "big-endian"))
> +			info->list[i].map.swap =3D CFI_BIG_ENDIAN;
> +		else if (of_property_read_bool(dp->parent, "little-endian"))
> +			info->list[i].map.swap =3D CFI_LITTLE_ENDIAN;
> +		else if (of_property_read_bool(dp->parent, "host-endian"))
> +			info->list[i].map.swap =3D CFI_HOST_ENDIAN;
> +
>  		err =3D of_flash_probe_gemini(dev, dp, &info->list[i].map);
>  		if (err)
>  			goto err_out;
> --

As per the patchwork status, its state is "Change Requested"

http://patchwork.ozlabs.org/patch/842542/

I am not seeing any review comments on this patch.=20
What kind of change is required.=20

--pk
