Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLYTc-0007dO-66
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 11:59:57 +0000
Message-ID: <1349784006.1992.114.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Tue, 09 Oct 2012 15:00:06 +0300
In-Reply-To: <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <1346413469.9709.44.camel@sauron.fi.intel.com>
 <CAP+RiCBRopbShAGf_fWCvK2R=uPPR1j4Pz12JfJxdEMUjwofNw@mail.gmail.com>
 <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uProBgMlFD1AW2b70h96"
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


--=-uProBgMlFD1AW2b70h96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-17 at 08:34 -0500, Brent Taylor wrote:
> Artem,
>    I was finally able to capture the issue again with linux version
> 3.5.1, and I now have a 64MB mtd image for you to look at.  The issue
> occurred in the root filesystem this time.  Let me know what's the
> best way to get this image to you.  The image was retrieved from a NOR
> flash chip instead of a NAND flash chip, but I've seen the error on
> both which leads me to believe it's not a flash driver issue and it's
> something in the UBIFS subsystem.  If there is more data you need from
> me to help track this down, just let me know.

I've took a look. So far I do not understand what is going on. There
seems to be some bug in UBIFS. I'll try to dig deeper.

But what I've noticed that if you do this:

echo 1 > /sys/kernel/debug/ubifs/chk_lprops

before mounting UBIFS, then it mounts fine. If this issue is a blocker
for you, you may use this as a workaround.

Note, this enables lprops checks in UBIFS which slow it down. So you can
use this trick only to mount, and then you can write 0 to that file to
disable the checks.

--=20
Best Regards,
Artem Bityutskiy

--=-uProBgMlFD1AW2b70h96
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdBHGAAoJECmIfjd9wqK0/9UP+QExGhv8Dywl6znXSe0PJD1j
h3E0cl/ejjfCLviSlbIgeFKzat5UbldtpcBHYrYXnpTkxRSnLbe9T5wnMR+kskLS
1ars+awsS8zOMX4PWrRikOHTbjxWRO+hTc9zlExThQjQ5qkPgl3o0nLqkJOuoBLs
ks2lLyYmmWCSLpkIWtdEKuDK85VHXBGDNl41Ac1xrYTd3oXhM/4Z/3YhNb8KZkoc
psHoL0W6b5I6bb9o+XQRfFFmjw5XQugiN7YblB52HQd2rOsg7XOzhVp4i0kyeXnf
RX+yw1NPySMMN3QRvnh/KoNvuhIz6kAAL3S0xgG6JG3WCTNtLkTQQdwona8FtjsD
m/v2OF2ifAJ8PvVLnYOnFPDQim7ZLI39hR0FfAL3z0+UjAAATPmnatjbRtpvYJcB
NSLuR8z0yP6RhK/PdxkHAo3zPOBIkbFYT3Z6gFkxxkomqaVOk9fach90Cov5Pdgs
uoJiAt+azisLb/tHwXTpXvRyGyrdOQUhOxH/RePK7ZqIhTtwiX8UrrqpZn/PGXxj
ydPBd5XDlyMdSabDvp87oOh+vV01+4w237ZJjBUjqGI9JHYn2mWmS9qg/m/5mpY6
3lTn4xh/HOId6A28UBHihiKuBWB9iv26on99wkX4HWKLaKQELRIAkOPF/UrQggtd
HH5V+PV8B7ugbod5IhvN
=ptl0
-----END PGP SIGNATURE-----

--=-uProBgMlFD1AW2b70h96--
