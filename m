Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgVLA-0004Sl-Ar
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 10:07:24 +0000
Date: Mon, 28 Sep 2015 12:06:51 +0200
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
Subject: Re: [PATCH 3/9] drivers:mtd:ubi:add metadata struct for UBI bakvol
Message-ID: <20150928120651.5c55317d@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CEE1@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEE1@NTXXIAMBX02.xacn.micron.com>
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

On Mon, 28 Sep 2015 07:02:42 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> Add metadata struct for UBI bakvol.
> Currently , bakvol reserves 20 PEBs for internal log volume.
> Shares wear-leveling operation with ubi.=20
>=20
>=20
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> ---
>  drivers/mtd/ubi/ubi-media.h | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20

[...]

> =20
> @@ -325,6 +339,32 @@ struct ubi_vid_hdr {
>  #define UBI_VTBL_RECORD_SIZE_CRC (UBI_VTBL_RECORD_SIZE - sizeof(__be32))
> =20
>  /**
> + * struct ubi_bkblk_info - the information for one backup block .
> + * @pbn: physical block number
> + * @lbn:  logic block number
> + * @plane: this block belongs to which plane
> + * @pgnum: the page number (lower page) that can be programmed last time
> + */

I'm not sure to understand what those fields are used for, but I guess
I'll understand it while reviewing the following patches.

> +struct ubi_bkblk_info {
> +	__be32  pbn;
> +	__be32  lbn;
> +	__u8    plane;
> +	__be32  pgnum;
> +	struct  list_head node;
> +};

You're mixing runtime and storage representation: node has nothing to
do here.

> +
> +/**
> + * struct ubi_bkblk_tbl - a table for backup blocks.
> + * @volume_built: indicate if backup volume be initted
> + * @bcount_of_plane:  block count that has bee applied for corresponding=
 plane
> + */
> +struct ubi_bkblk_tbl {
> +	__u8    volume_built;
> +	__be32  bcount_of_plane[2];
> +	struct  list_head head;
> +};

Ditto.



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
