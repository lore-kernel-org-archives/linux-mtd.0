Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SYtfp-0002HZ-CB
 for linux-mtd@lists.infradead.org; Mon, 28 May 2012 06:43:25 +0000
Message-ID: <1338187619.2480.9.camel@sauron.fi.intel.com>
Subject: Re: [RFC v7] UBI: Fastmap support (aka checkpointing)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 28 May 2012 09:46:59 +0300
In-Reply-To: <20120528093625.050badc6@pixies.home.jungo.com>
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1338036094.2525.7.camel@koala>
 <20120528093625.050badc6@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-m3vkeQASIyXhV9Ycnf2V"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-m3vkeQASIyXhV9Ycnf2V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-28 at 09:36 +0300, Shmulik Ladkani wrote:
> Hi Artem,
> Fine with me, I'm flexible ;)
>=20
> What's your plan for merging to the master branch?

Once it the review is finished, and we test it, verify power-cut
robusteness and resilience (we can discuss how separately), we merge it
to the master branch (by squeezing the history I guess).

> BTW, I know you formerly disliked the idea, but I'm in favor of having a
> CONFIG for the fastmap feature; with the config disabled, UBI must
> behave exactly as it was. The config can be later removed.

This makes maintaining difficult - I'll need to have another
compile-test.

We should have an ubiattach option instead (and add this feature to the
attach ioctl - thankfully we have unused bytes there).

--=20
Best Regards,
Artem Bityutskiy

--=-m3vkeQASIyXhV9Ycnf2V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwx9jAAoJECmIfjd9wqK0yUIQANBfkIxShVEAe4xuIvVsFKvA
zC/kiXxGGZNoXD4KNUfDcdUa3Ctk0OD61Qpb0XsekoSpkW4oQux79BOAi+HKqlef
dLYqGN/IbN/BZTjSyhyk/K7v2E44+LvhjFsf+MuC0eYUgRGd1r1vAmwg1eresPRZ
6EmBVf6Wpes+WjiYwK2Vw8I6XOebr9wmlsalqnHCGgp6IQSPsoFPK4Ciejth6jbk
hjybO3iaq5F9YS5q6+TlhJe1eg/1C5okwPbnxN9TpXud18GJmU6RnbSMhRfkHTl8
GghigWgkcJOAn4hbwH8as4JI7oWjtvFWjdofkidGMd36LUs1+MrMTQOAmZ7ixrKR
RK9PsjRHkmNRvXppN9J+TAwQl60CWtR1iQZESj1y5EuiOTsJoxTGCfV4bxOi3zWL
sUsTPBxdLvDVH6NDpP2ICaOXcmWx8ywMyDvPWTftI1I45iqKCvVeE9Ce9eXlXG9e
B26ly46A0ywtRonu7IHwXccWUNUbndSy4AbUIsJfZuNiopEWi0TzghFrbbR6xzb6
NlLMB40EZhZPE9+DdusFL9efxC6/yu++1XViWkhW5GnWSbsRK4JYm+oyoll+m6ci
S45sICCD4JrWd5ofgVdVpgpN/mXPCUXPI+3vfZFL2tX9UVFE81eR7Eo01YC74woc
3UMkAQVfYNgIhSpObwZt
=x0pq
-----END PGP SIGNATURE-----

--=-m3vkeQASIyXhV9Ycnf2V--
