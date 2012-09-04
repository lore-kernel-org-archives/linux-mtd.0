Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8oHc-00084A-Dr
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:14:52 +0000
Message-ID: <1346746785.12610.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 3/3] mtd: cmdlinepart: check the partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 04 Sep 2012 11:19:45 +0300
In-Reply-To: <1346744628-13840-3-git-send-email-b32955@freescale.com>
References: <1346744628-13840-1-git-send-email-b32955@freescale.com>
 <1346744628-13840-3-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RxlxOdpWAZzodsYpwqXa"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RxlxOdpWAZzodsYpwqXa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-04 at 15:43 +0800, Huang Shijie wrote:
> +enum partition_check_result {
> +	PARTITION_GOOD,
> +	PARTITION_OVERLAPPED,
> +	PARTITION_HOLE,
> +	PARTITION_TOO_MUCH_CONT,
> +};

Could you please kill these constants, they are not really needed I
think.

> +/* The partitions have been sorted well by the @offset. */
> +static inline int check_partitions(struct mtd_partition *parts, int num_=
parts)
> +{
> +	int i;
> +	uint64_t offset =3D 0;
> +	int offset_continuous_cnt =3D 0;
> +
> +	for (i =3D 0; i < num_parts; i++) {
> +		if (parts[i].offset =3D=3D OFFSET_CONTINUOUS) {
> +			offset_continuous_cnt++;
> +			continue;
> +		}
> +
> +		/* find a hole. */
> +		if (parts[i].offset > offset)
> +			return PARTITION_HOLE;

Just print the error messages in this function and return -EINVAL.


> @@ -285,13 +333,37 @@ static int mtdpart_setup_real(char *s)
>  		/* sort the partitions */
>  		sort_partitons(parts, num_parts);
> =20
> -		/* link into chain */
> -		this_mtd->next =3D partitions;
> -		partitions =3D this_mtd;
> +		/* check the partitions */
> +		ret =3D check_partitions(parts, num_parts);

Just do

if (ret)
	return ret;


and kill the huge 'switch' that you added.

--=20
Best Regards,
Artem Bityutskiy

--=-RxlxOdpWAZzodsYpwqXa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRbmhAAoJECmIfjd9wqK0BUQQALE3IGQiQXPJ/UtQGcJubh3m
NLJQdneRDbtL5XuJrx+gbdjsVkqXdNMBCGETWM594kvsEsnO/GoJUt3pRibJoWVT
l2cYZKwPfntwn7+dPxVpfB1BHz/cDMcUi+B7IKOBQK9PbsgeyoGWD1sSS/2mV4R0
5kLaJ5RKZbL6vIBKRrctdD9MnfZ6xGQLLMp/ysHGh/8D3pm8E3z+BEuVX/U55N1I
0tCBVEIrsPO+0ZYMVV8ESuHpXxRbZSH22KkP/Yy1pSyU+7EA7PlGpDQOLV2LCePn
g78oJdJV3Dn94qva097wrzPQDATcQKMxe5wZqR0dNHXxEH3TYr5HxppZNPiJywfM
TQcc75AAp2a5FztHJBVhERefAw3k4F0/j1aL40a2kYHA5Dw9KFYinwLx7Ko2mcXE
DnwlvCHH8eCuTGDjGZ+r7ndn3UQbYHGbYG+T/bwxfHGRQwspJvFH3hVCqDXzcFR8
nJcTu+OIXi1BneBvQcP2XsYxg4B5JUu0GfBMsd25Tr0XeQk7kRtEtP1G7vnZjy4Z
Wff67dgH+Ni/8XPCmi99MzVAYYn60xo0dffzVszzt0tkYb6hpmvLzevyLm2wk3SV
3XZfjuhx+Pp5D3L899/HpfItX3mscniRVRnPtpiupohiPpldkJ6Uejc7WheWlVp8
eS7WHcNp5MlRNXWlSz3m
=49a0
-----END PGP SIGNATURE-----

--=-RxlxOdpWAZzodsYpwqXa--
