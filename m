Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8RVa-0006g0-QF
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 07:55:47 +0000
Message-ID: <1346659239.3061.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 03 Sep 2012 11:00:39 +0300
In-Reply-To: <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
 <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-51GXVYiZqTXsREkNNyPN"
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


--=-51GXVYiZqTXsREkNNyPN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-31 at 16:46 +0200, Richard Genoud wrote:
> BUT, I ran into a bug, I don't know if it's my kernel (as I've got
> quite a lot of patches ahead of 3.6 to get my board run), but it's
> kind of nasty.

What is your kernel? Why don't you just pull the corresponding ubifs
backport tree?

> It's not related to this patch serie, I could trigger it with a
> 3.6-rc1 kernel (and my board-patches).
> I get some memory crashing when I do :
> flash_erase /dev/mtd2 0 160 (it's a whole mtd partition)
> ubiattach -m 2

Would you please be able to reproduce this with linux-ubi tree and also
send be the full oops?

> After that, I can have a OOPS right away, but sometimes not.
> but if I run someting (top for exemple) I get an oops then.
> So, the memory is beeing corrupted somewhere, but I couldn't find out
> exactly where.

If you could somehow reproduce this with nandsim, it would make it easy
for me to find the bug.

> But I found that if I comment out the lines :
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -346,8 +346,8 @@ retry:
>          */
>         err =3D ubi_scan_add_used(ubi, si, new_seb->pnum, new_seb->ec,
>                                 vid_hdr, 0);

We renamed all scan functions recently, so AFAICS you are not using the
latest UBI code-base. How about picking the latest back-port tree?

> +//     kfree(new_seb);
> +//     ubi_free_vid_hdr(ubi, vid_hdr);

This is strange, I think these 2 frees are all-right, I think the
root-cause is somewhere else.


> Does someone can reproduce that ?

It is difficult to say because you did not send the full oops.

--=20
Best Regards,
Artem Bityutskiy

--=-51GXVYiZqTXsREkNNyPN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRGOnAAoJECmIfjd9wqK0RqQQALLRo8pZ148TnioGfC/hsnTK
gdmngypWTGwQPiYcxM2skVtPu3+eMoGT9MNlDQqckhNeU/HhLDLzatbbKb8b1P6a
OHsSgjeyPk633yzFeImOG0smB4wClU53eDd71JCpcj9dV44bkXC/oHlv3zNHkQRb
7lV299XcCOG4gZlnzS9cMv65/jriL/1CdD/aGd2fFxdF0dSUbCpDXBL+kBXxQLfJ
dbbrLTY0Mb/zW4di3hTAsb2gMDitBg7N8Lhya9N+YT0g3uETberrXGqOQLXlrOyL
q7FskfBIC6KiLboSDHGXAHoWGIYFTX51KrRn7ZBUBHn73hb4SbxkXQLk+f6Yxv4/
eFfIQiGnTYzgnl5B3Vc1A+CrhIVFmzWHn6jDwoJHdXtM6PTMpCtUtxEWqN4rZkfU
4wYs6IY3vpn9btD46l4yyxkg+keb62WsZlsIVxcGqzzq/LxZrjQiwnyqgzGA7rwh
OOi4EDsAxCPSJxs+xHuuSXvcM4P4SVw4Ma+h3hX5VadD6d1Cq32bXwm9t9gruKcG
vIHwJ3ubEeK3UO3iGQrYtoLTYRJxVstS5sPcvxvTJfPvSyuDkiEmjZGmHKcQU8iV
IeR57iuPiSHdKjdayXJxCOQXDVBBjMvC6GpwctxRo9HuRAnLxJV89Pl6zAL+B2mL
69mC8Otp+bl5EcJgyDw2
=Vt4r
-----END PGP SIGNATURE-----

--=-51GXVYiZqTXsREkNNyPN--
