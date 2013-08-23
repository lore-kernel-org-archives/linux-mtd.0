Received: from mail-db8lp0185.outbound.messaging.microsoft.com
 ([213.199.154.185] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCm0n-0003Gp-R1
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 07:42:30 +0000
Message-ID: <5217127C.3050602@freescale.com>
Date: Fri, 23 Aug 2013 15:42:52 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH -next] mtd: ofpart: use for_each_child_of_node() macro
References: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
In-Reply-To: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, rob.herring@calxeda.com,
 yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 grant.likely@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8823=E6=97=A5 11:04, Wei Yongjun =E5=86=99=
=E9=81=93:
> From: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
>
> Use for_each_child_of_node() macro instead of open coding it.
>
> Signed-off-by: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
> ---
>   drivers/mtd/ofpart.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 7843a44..d64f8c3 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -43,9 +43,8 @@ static int parse_ofpart_partitions(struct mtd_info *m=
aster,
>   		return 0;
>
>   	/* First count the subnodes */
> -	pp =3D NULL;
>   	nr_parts =3D 0;
> -	while ((pp =3D of_get_next_child(node, pp))) {
> +	for_each_child_of_node(node,  pp) {
>   		if (node_has_compatible(pp))
>   			continue;
>
> @@ -59,9 +58,8 @@ static int parse_ofpart_partitions(struct mtd_info *m=
aster,
>   	if (!*pparts)
>   		return -ENOMEM;
>
> -	pp =3D NULL;
>   	i =3D 0;
> -	while ((pp =3D of_get_next_child(node, pp))) {
> +	for_each_child_of_node(node,  pp) {
>   		const __be32 *reg;
>   		int len;
>   		int a_cells, s_cells;
Acked-by: Huang Shijie <b32955@freescale.com>
