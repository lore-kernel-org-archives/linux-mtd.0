Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSnJP-0007TE-IH
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 10:43:18 +0000
Message-ID: <1336733182.2625.17.camel@sauron.fi.intel.com>
Subject: Re: [RFC v2] UBI: UBIVIS (aka checkpointing) support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Fri, 11 May 2012 13:46:22 +0300
In-Reply-To: <4FAB7D70.1040704@nod.at>
References: <1336585125-127220-1-git-send-email-richard@nod.at>
 <1336624000.1936.22.camel@brekeke> <4FAB7D70.1040704@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wO4nxHjMt1KbcQl/AVtt"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wO4nxHjMt1KbcQl/AVtt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-10 at 10:33 +0200, Richard Weinberger wrote:
> First of all, yes it's fully backward-compatible. It uses two new interna=
l volume IDs
> with compat =3D UBI_COMPAT_DELETE.
> Old UBI implementations will delete the checkpoint and continue with scan=
ning...

OK. BTW, these patches do not compile when the fastmap is disabled. I
hope you'll just kill the ifdefs in the next revision and this problem
will go away.

> Regarding design, ubi_wl_get_peb() currently offers three types of data t=
ypes.
> UBI_LONGTERM, UBI_SHORTTERM and UBI_UNKNOWN. Do we really need them?
> Checkpointing has a pool of unknown PEBs. This PEBs have to be scanned wh=
ile attaching.
> For now I had to create three pools (for UBI_LONGTERM, UBI_SHORTTERM and =
UBI_UNKNOWN).
> This makes the whole thing complexer than needed.
> It introduces also some nasty corner cases.

But AFAIR we already agreed that we kill these, no? I thought you'll
send a separate patch for this. We do not need this feature and to our
shame it even was not working and there was a bug found very recently.

> To make the review easier for you:
> The most critical code path is scan_pool() -> process_pool_seb() -> updat=
e_vol().
> It searches within a pool for PEBs which are no longer empty and scans th=
em.
> After that it updates the corresponding volume.

OK, thanks.

> ubi_update_checkpoint() is also very important because it has to find
> unused PEBs at the beginning of the MTD to place the super block.

OK.

> Okay, got your point.
> I think "fastmap" is a good name because I can also use it within the cod=
e.
> So, while reviewing the code please keep s/checkpoint/fastmap/g and s/cp/=
fm/g in mind. ;-)

OK.

--=20
Best Regards,
Artem Bityutskiy

--=-wO4nxHjMt1KbcQl/AVtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrO3+AAoJECmIfjd9wqK0xWoQAJ1a2Tphq4drTrYHB8ZU6ZdC
H8LvJG2J4m0O3f6+fqLYyzB3VBj7OJ42z5sqU0dCYFqpM4pUzDSzzJfRep95Fa18
mqfdkYUlCubKa0HRi2GCPkhO3GCoRXnGkmDcanHogK0uymlWAUmWR70fP5Y0T9S1
Mr4OFniIZ0TkZXBKQa/A5WONAoUCO6OKx/5t3UU9hmtabW95y4yBUMSyrhOpXiVP
hxyRVJ9efuu+nqSJvz40W8h9bMRBAyL5Q1N6dwX6IYnC+IQTWm1W7Ukof8eFxEP8
8jOjbDfXdB++iuvAiIyCKgv9KC7lmMrKNChVFOHDVDzcPsI6BkZO9DiCLScPaWvK
wkjFB+QTNh/Qh6Yy6J1X0s+96NISkWzdEQ88u/N6FsFCaEKAJ3WeWFrSVRIFOFDb
aL6Y4VELXj10kvpUr0dJ48YevqVA7wfwikiD/CVCIPO1CEHBxxo3tcIG/TFrMadB
dZDHI1GIn1CXLLimyRRPxIwVQYGTYV0maOkbLUAgC9b8hgGv/5rzC/4D800EEl8V
PaS7wpE7TPBjg83hG56YuvmGBFc1VxapzMxDEy1X5DcB/fVMbfWxtJEvk3SHj3Wg
MEWZAtNeJWxRFYOs5YsX6VtzIOizQeXcX9VcmOZ8Imes1BXjcydvWIiEcq4RPW+j
KLzEDqyLu88Xhtze0pkr
=bdT2
-----END PGP SIGNATURE-----

--=-wO4nxHjMt1KbcQl/AVtt--
