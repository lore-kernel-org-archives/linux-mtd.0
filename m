Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T49OH-0000YY-Bq
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:46:30 +0000
Message-ID: <1345636258.2848.156.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 14:50:58 +0300
In-Reply-To: <CACQ1gAithQd0RMk16atkaaSWZs1CoLnXDe801BP6SvAdVCSKwg@mail.gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
 <1345635197.2848.152.camel@sauron.fi.intel.com>
 <CACQ1gAithQd0RMk16atkaaSWZs1CoLnXDe801BP6SvAdVCSKwg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aITgbu9eOUarBAb/rFIx"
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


--=-aITgbu9eOUarBAb/rFIx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 13:38 +0200, Richard Genoud wrote:
> > I guess I prefer the second option, though. What do you think?
> Well, for this one, we can go with the 2nd option, and if one day
> there's another parameter, then we could implement the 'get device
> property ioctl' for max_beb_per1024 and the new parameter.
> How's that sound ?

Good. But please, implement this double 'attach' invocation inside
'ubi_attach_mtd()'. Please, introduce a special return code to indicate
the 'attached but max_beb_per1024 was ignored' case (say, 1). Add
comments explaining the trick.

--=20
Best Regards,
Artem Bityutskiy

--=-aITgbu9eOUarBAb/rFIx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNMeiAAoJECmIfjd9wqK0Z5QP/0fJRFPZtuu20fCUQOtLep7m
RHWBpzoog8ZSGSG7AVWm1VUl78SYVyQ4Q9V15Whlj2f8Y+92P8VQBbpPE9deNvod
CZT+2cORXeN2fUqa56C9o6/qThMpfvfhGTSHh55kiu5bNBgj1UAHfTU4VfBO/MLb
F3KTtSW3oIJSLgUfBcA0rcsuq6FTFRdXKqUXlxJVdwcSgZdv+brPjU5B3DJ7dN8n
npx8M3r0DV4V6JKb2KMIeL632AWlCdMVNdqBv1sB1XOuz6wm3oiO6oSej0vNhYNh
FudQwp1QwqPhAJuBjap0RUvFIB59ZC/SjP6NdV6xzzM0VPVr/bKbwYsuAinoyAyh
516coThIE8A9MgIHNasG1sHzfBTN3qw7hXFw5I0Gukq2vmn9+RvDdcJL9KUDqqWf
1zkBIUlt8mO8erk6+RYSVm+LX6ju4xRatYiqZE8T6dp9I1elPnWP6ypoWJGP2bOl
RqqJXFG5rNmvB+D6pxTntfzGpUQnobuWuMR/nfMYOxsjFIVQXG6a1fC4HO+sKXgk
YdR7DKEwr5BOcYzGQThv9T8KnHNHLgeCaOBnzKIkD4vNcvxSpL2u3e0z7WKs3zB+
huPvDxQIEiittMWD9F7t8b+NOZ+AW7YdhKfdTSX0lnGnkSR1jpMtzJmjy/CXM1jf
RqzCIUxJkLCNVuGpASt4
=4uDj
-----END PGP SIGNATURE-----

--=-aITgbu9eOUarBAb/rFIx--
