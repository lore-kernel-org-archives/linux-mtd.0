Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3uE5-00019u-8y
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 19:34:57 +0000
Received: by mail-bk0-f49.google.com with SMTP id ji2so56457bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 12:34:56 -0700 (PDT)
Message-ID: <1345577694.1886.11.camel@kyv>
Subject: Re: [PATCH v3 5/6] UBI: add ioctl for max_beb_per1024
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 21 Aug 2012 22:34:54 +0300
In-Reply-To: <1345478416-23900-6-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-6-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-sCHHU0qUjbQSQCx+CTzh"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-sCHHU0qUjbQSQCx+CTzh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 18:00 +0200, Richard Genoud wrote:
> This patch provides the possibility to adjust the "maximum expected numbe=
r of
> bad blocks per 1024 blocks" (max_beb_per1024) for each mtd device from
> UBI_IOCATT ioctl.

Thanks, pushed to linux-ubi.git with minor amendments.

>  struct ubi_attach_req {
>  	__s32 ubi_num;
>  	__s32 mtd_num;
>  	__s32 vid_hdr_offset;
> -	__s8 padding[12];
> +	__u16 max_beb_per1024;
> +	__s8 padding[10];
>  };

I've made that to be _s16, for consistency. AFAIR, the reasons I used
signed types all over the place (unless the really needed an unsigned
type) are:

1. Easy to write functions with return a positive resulting value of
something (e.g., pnum) in case of success and a negative error code in
case of failure.
2. Easy to check for sane value by just comparing to 0.

But these are not very strong arguments, and I read somewhere that some
CPUs handle unsigned integers a bit faster, not sure what architectures
was that about.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-sCHHU0qUjbQSQCx+CTzh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM+LeAAoJECmIfjd9wqK0vUcP/A7EVYBQiLsqErbmLCN5prMA
Rq698gckWSGD1FuMGTs4K3gsbl5iYGcrBLaFQnnJ9GnwggyqDMe+noCzak71VCZB
7uLEtbHQaoz7ZwlyoF1zplNewZ/RSZhyV6ty22ZANxQ+u4uDYBRHzYqFh204wNzK
MkRfjdTztw/A72wRxM2pnby0NdDez5PrB6zv1wMK9BskMWNQ54Zqoz5OVsfaIlal
6yjcgsn0z+ff0H2RMfvSadIfS8aJQ7Mz32Z4lmGkZ3vE+xbMMmn4+TTA94Stnn7E
eaSFIw8zVQBMMlQHynmeImbE85VTwosxghE7m8nMVCgS6lrxD/2ovFAqpswZIn40
4Z4HMrSeh22tix/FHqL621a2GV7CUI5wmTV1k/nMq3RkTk4tvONdZsfs2zuH1TwM
MKjzF//8MBx3enBbLVjc99j0hhM1BbTg2I8bJH3BVZE8YpQjtVxkw/dua+5Vq7kR
8uWyQo8CmxXCT+DEBHt0palGwgYIZcDf+y2Dm8nMywehklTGueNbch0X22flYAt/
gdD74WUEMcgafb/NtxGcAsLZWZplVeezM0DQWRSXe2uRf6j8Ttpm+9lEaJ2N9g+J
LUy3FDJA2WC/CTm6ymSEMYNk/14k3j7v4rqS60i7Bo2YLQvz6m8zNZvJ+VPqvCcv
eWdjtQBMYdbWkb925iyg
=prM8
-----END PGP SIGNATURE-----

--=-sCHHU0qUjbQSQCx+CTzh--
