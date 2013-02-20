Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U7z0T-0006ET-50
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 02:02:03 +0000
Message-ID: <51242E9A.3080901@freescale.com>
Date: Wed, 20 Feb 2013 10:02:02 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH] mtd: ofpart: support partitions of 4 GB and larger
References: <3a708bb0-af78-4d31-b61f-8cff1612be8d@zimbra>
In-Reply-To: <3a708bb0-af78-4d31-b61f-8cff1612be8d@zimbra>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Joe Schaack <jschaack@xes-inc.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8820=E6=97=A5 06:23, Aaron Sierra =E5=86=99=
=E9=81=93:
> Author: Joe Schaack<jschaack@xes-inc.com>
>
> Previously, partitions were limited to less than 4 GB in size because
> the address and size were read as 32-bit values. Add support for 64-bit
> values to support devices of 4 GB and larger.
>
> Signed-off-by: Joe Schaack<jschaack@xes-inc.com>
> Signed-off-by: Nate Case<ncase@xes-inc.com>
> Signed-off-by: Aaron Sierra<asierra@xes-inc.com>
> ---
>   drivers/mtd/ofpart.c |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 30bd907..553d6d6 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -55,6 +55,7 @@ static int parse_ofpart_partitions(struct mtd_info *m=
aster,
>   	while ((pp =3D of_get_next_child(node, pp))) {
>   		const __be32 *reg;
>   		int len;
> +		int a_cells, s_cells;
>
>   		reg =3D of_get_property(pp, "reg",&len);
>   		if (!reg) {
> @@ -62,8 +63,10 @@ static int parse_ofpart_partitions(struct mtd_info *=
master,
>   			continue;
>   		}
>
> -		(*pparts)[i].offset =3D be32_to_cpu(reg[0]);
> -		(*pparts)[i].size =3D be32_to_cpu(reg[1]);
> +		a_cells =3D of_n_addr_cells(pp);
> +		s_cells =3D of_n_size_cells(pp);
> +		(*pparts)[i].offset =3D of_read_number(reg, a_cells);
> +		(*pparts)[i].size =3D of_read_number(reg + a_cells, s_cells);
>
>   		partname =3D of_get_property(pp, "label",&len);
>   		if (!partname)
I think it's better to update the=20
Documentation/devicetree/bindings/mtd/partition.txt too. for example,=20
add a example for the
partition larger then 4G.

thanks
Huang Shijie
