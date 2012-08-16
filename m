Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1xlG-0000ob-4H
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 10:57:11 +0000
Message-ID: <1345114912.3393.212.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/2] NAND and NAND-BBT improvements
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 16 Aug 2012 14:01:52 +0300
In-Reply-To: <CAN8TOE-so3kRVbuo6eab7k5YZvn8ifrHfak7-2f4BPGB+zhgHw@mail.gmail.com>
References: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
 <CAN8TOE-so3kRVbuo6eab7k5YZvn8ifrHfak7-2f4BPGB+zhgHw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QGVsIebw8Ea7bZ4jA++T"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QGVsIebw8Ea7bZ4jA++T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-07 at 10:42 -0700, Brian Norris wrote:
> Hello maintainers,
>=20
> On Mon, Jul 16, 2012 at 11:38 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > This is a v2 resubmit of part of a previous series. Some of the previou=
s
> > patches have already been accepted (and so are omitted here, of course)=
 and
> > others are still under discussion. I only include the reviewed,
> > ready-for-submission ones here.
> >
> > Only v2 changes: comment wording + "Reviewed-by" tags
>=20
> Can I get a response for these patches? They've been reviewed and
> waiting for several weeks now.

Sorry Brian. I did not want to upset you because you are doing good job
in MTD, but I simply do not have bandwidth to handle all the incoming
material quickly enough. This is not payed job for me.

Actually, David is supposed to handle that. But he has not enough time.
So at some point I stepped forward and created the l2 tree to help him,
just because I like MTD stuff. So this is basically my hobby, and I like
to feel that I am useful.

If someone wants to speed things up, he can always start reviewing
others's patches and send his/her Reviewed-by/Tested-by/etc. Then I'd
process the incoming patches faster.

Actually Shmulik is doing great job and he is very helpful.

BTW, I know how it feels when your patches are not getting attention for
long time. My ext4 changes missed 2 merge windows recently. And the
maintainer was taking other patches, which he considered more important.

I am trying to treat all the incoming patches the same, and simply
handle them in FIFO order, with occasional exceptions. I think it is
fair.

> > Of note: the first patch addresses a problem with mtd_read_oob() and th=
e recent
> > max_bitflips changes by Mike Dunn. If it is satisfactory, it may be wor=
th
> > merging it in the 3.5-rc cycle (along with its previously-accepted depe=
ndent
> > patch), as it would help avoid an API inconsistency that recently emerg=
ed.
>=20
> The 3.5-rc cycle has long passed now, and the important mtd_read_oob()
> fix will probably even miss 3.6 now. Is anybody listening?

Actually all the MTD changes missed 3.6. David did not send the pull
request early enough, and Linus closed the merge window 2 or 3 days
earlier than on wold expect.

--=20
Best Regards,
Artem Bityutskiy

--=-QGVsIebw8Ea7bZ4jA++T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLNMgAAoJECmIfjd9wqK0qjUP/3/g7BtASnTX7iVJyzmmR/lI
K3b7WoGvhahn6sF/EIKKO9OIkvgc2bTQlXZ5/PQ5cf+/UuRPXGGA4IHgmmjV1x0u
/QlT4tf2SCMAdRfWRcigqso0ZmPg9OnoU3aXiTo7nBsMzl+JrGRMyIuYfjxJHXHt
UO9g+heaWBtzM4rsVePKPnXqUyT/l2Pa1ogw6J9qV9akm83xh/dbGNQBrNxAB+Yw
3iW58o9x86m9Y/6u0NkEyHOWkLOhEivIBK65XANAydVEp6A6D69Qc5p+W70wJHRC
xfXDFTB3j+RyvLGBhTAl+yr11upiy1WmTzcZkC8TIfKlpg7HzQWFbe/oF2/9UbXI
AwL0xYFgBRfym51Zcdrei7fl4+xpZc6n1XOVU2mUnafWdAkKv3+DLP1aI1rH+T9I
uT6xuaFc/A7zDAn1n95Nh+u7H1tA5hEQEdSwf+S4iELStnbWr1TgQ7dRQ8BtyKzC
xp6tJa+m1mgIw1/7On7gNgf8zRUkpWo/t0u7WrQd/CWb84BCyTB54ghGQY5hMumc
aqNTGK63v0K73JCNWqr0UgGRpH7j1gANyh1LvyE826DuOd1gmTVvZiDSxKA17Alu
frAO8fOxWQRzSuzUYl+UCBAk/8yrg2TVMGrNwTsj8sJ8YeLlNXNAEeWGgGj429dk
B7FqfvHlf6OUVx7vj0Sw
=ywdM
-----END PGP SIGNATURE-----

--=-QGVsIebw8Ea7bZ4jA++T--
