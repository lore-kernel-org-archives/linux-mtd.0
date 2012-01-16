Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmlh7-0003SZ-2r
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:29:49 +0000
Received: by iakl21 with SMTP id l21so10324854iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 04:29:48 -0800 (PST)
Message-ID: <1326717092.14299.74.camel@sauron.fi.intel.com>
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexandre Gambier <a.gambier@ftemaximal.fr>
Date: Mon, 16 Jan 2012 14:31:32 +0200
In-Reply-To: <4F141802.5080904@ftemaximal.fr>
References: <4F0C3339.6070909@ftemaximal.fr> <1326230599.2335.4.camel@koala>
 <4F0D4405.2060800@ftemaximal.fr>
 <1326554080.14299.2.camel@sauron.fi.intel.com>
 <4F13E424.7070104@ftemaximal.fr>
 <1326716672.14299.70.camel@sauron.fi.intel.com>
 <4F141802.5080904@ftemaximal.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-z6psNNyirboOuZPRvvNU"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-z6psNNyirboOuZPRvvNU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 13:28 +0100, Alexandre Gambier wrote:
> On 01/16/2012 01:24 PM, Artem Bityutskiy wrote:
> > On Mon, 2012-01-16 at 09:47 +0100, Alexandre Gambier wrote:
> >> For example, for my 128MiB partition I specified 120MiB which is 7%
> >> smaller than the total size.
> > You should be able to find the UBI overhead formulas on the MTD web
> > site. Try to specify less than that and see. You should leave enough
> > PEBs reserved for bad eraseblocks handling - it is 1% by default.
> >
> >> What size would you specify for a 128MiB partition ?
> >> thanks for your help.
> > I do not have time to calculate and I do not remember. But the easiest
> > is to use something small enough and put the auto-resize flag - it will
> > then make it to be the maximum size. E.g., use 100MiB, boot and see to
> > how much it resized.
>=20
> I already use the auto-resize flag...I will try to specify a smaller=20
> size and see if it fixes this warning.

You use it but it has no effect because the volumes are already very
large and there is no room to enlarge them further. When you make your
initial sizes small, then UBI will reserve 1% for bad blocks and the use
the rest for the auto-resize volume. And it will print a message which
you will see in your dmesg: something like "resizing from a to b".

--=20
Best Regards,
Artem Bityutskiy

--=-z6psNNyirboOuZPRvvNU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFBikAAoJECmIfjd9wqK0wpgQAKHN3bM0dKdiozk/Hv61XBQe
kM5PoK9lXOQh0kDVKNgh5VekiTugCFmrT+Do+OdsDcZJZtczlqhBzOBOOvP6Z4EG
oZ2BRvETq4Tqt6LeCGkEqJPqJ5WbWA2pmgvVPeXOqkRZ4IXA3923+Gkl4+Z3n6Rs
TjtZN7WrFMhsfLGLNcPcuNmAHvXsuUjF+wrVL57bPx+R89pFJLnkkq0fcfSWy6Cd
t2dnpr1ar74IPrHRTwQRZeUPJl/8q2yeUqKib+cSZHB55x6IZHliZnbnCqPJUCuB
TgFFOkFnL7OMPxH+frV5KpMPRGj29pshOtbN6PA/MohEuzQOaxVrmtA/HjYN+l0V
8hafyjYwtQQgnyRWig2i+4nH++BLnZ64KdeJFfvoD/QBQxWj/RtBRuv7Hvv2vZiq
h8LuMi/6J9QU/N/Vpoq1jeoAFmTweLvWs29/6pQa6Cz6ir1J0lEAROhOO0GoCDLc
lk3/+4wlW+eft6eTg9EGu2+FgSMa5ZINXOlCRKQIhF+EGZi6wwI6FYTiT5atAOdK
lKc3OlEcJjZHDBSn8Oq04Kq7q46Ym57OhGpI80gwP3LI92MLORSiVWBYLi4bUEAI
SEdye3rEtSRqOPooE+jQ33YMROgZx0r4mWOYTOsVvcpaE35COBvT8aleJP4XBxN/
CCD3L08mnJZHENJR7Q5A
=oDgS
-----END PGP SIGNATURE-----

--=-z6psNNyirboOuZPRvvNU--
