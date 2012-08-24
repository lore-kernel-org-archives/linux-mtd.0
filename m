Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4vxi-00010z-BZ
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 15:38:20 +0000
Message-ID: <1345822982.2848.328.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cmdlinepart: fix the wrong partitions number when
 truncating occurs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 24 Aug 2012 18:43:02 +0300
In-Reply-To: <1345308662-24023-1-git-send-email-shijie8@gmail.com>
References: <1345308662-24023-1-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-5fUMPCt6RmJKBADMeKmA"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-5fUMPCt6RmJKBADMeKmA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-08-18 at 12:51 -0400, Huang Shijie wrote:
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index 4558e0f..fc960a3 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -344,7 +344,8 @@ static int parse_cmdline_partitions(struct mtd_info *=
master,
>  					       "%s: partitioning exceeds flash size, truncating\n",
>  					       part->mtd_id);
>  					part->parts[i].size =3D master->size - offset;
> -					part->num_parts =3D i;
> +					part->num_parts =3D i + 1;
> +					break;
>  				}
>  				offset +=3D part->parts[i].size;
>  			}

I do not understand this change. Could you explain some more which
problem you solve and how?

--=20
Best Regards,
Artem Bityutskiy

--=-5fUMPCt6RmJKBADMeKmA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN6EGAAoJECmIfjd9wqK0owQP/jAMRDas6vjQXishCrzbTKBa
iOXmnm6OmJqcwsti4IASts33vVYCU/+g/m+hZLZYYjJvw8OiWPjy+0zWiYDzyP1N
E74bu3Jz3eX76FqwWIMyR7ET7s95eoY3RyzYnPE/HbALF3K/yRkvJZdR2HzDeCGv
49N/CbaYv2lREMSAD+zaS+msONDfvj0Fra78AfYbUraGU4HiYNjeyDJFrE+2kIjz
NW47VjuXUqmNCTYBwPyt3Cu/WAqysD4D3mWbwwRFSXEzU+gty/zxIFy13Cbs9dHf
jOQDnS6m09lXIc9DQBnLP5gjnFZsClsfbEiDtrdRRE1gvR1fjpYCUeKROMjLHcwK
o61loAhrF45GwrtWRpOdsCTA7aJCNEznlwlY5N+lIt1fVuOkv7QK1K777Uvp18h9
9EHaABLaVVve8vhuDh45Rc+qY2rEsTR/CjXB4q1FbriAc5yth/QzyWsGLT9UjXrK
FKzupPcvFDjopVdWnv9zZAv8nGS/h8Y1n68dIgBn2me2dc5Ztkcm6Tb/q9pvZxir
ct/Xj3L8MAtMusXlUEfZajzuY8K9UOJ24HNItz5GQdvZkD+cyYed9M+TGpLXaj8j
7lGWMd4WUGx4FUp3bSJJ7P8KSBan1kAxClaEH98UxXnITaHeOS5fMaiklz5IbjoO
L3Ifz47CLEvqRLmPR3kh
=ILDn
-----END PGP SIGNATURE-----

--=-5fUMPCt6RmJKBADMeKmA--
