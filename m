Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7R7k-0005qh-DF
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:46:44 +0000
Message-ID: <1331642936.3595.39.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 13 Mar 2012 14:48:56 +0200
In-Reply-To: <OF75BE5BF1.29391153-ONC12579C0.002D7F3D-C12579C0.002E7828@transmode.se>
References: <OF56C9B29B.F0D0442B-ONC12579B5.00450ADB-C12579B5.00458326@transmode.se>
 <1330697193.91058.YahooMailClassic@web29016.mail.ird.yahoo.com>
 <OF3BA4765E.16024E23-ONC12579B5.004E96D5-C12579B5.004FAAF8@transmode.se>
 <1331289909.22872.65.camel@sauron.fi.intel.com>
 <OF75BE5BF1.29391153-ONC12579C0.002D7F3D-C12579C0.002E7828@transmode.se>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iC4VIVT10+ZoyqwZ8aEQ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com,
 Paul Parsons <lost.distance@yahoo.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iC4VIVT10+ZoyqwZ8aEQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 09:27 +0100, Joakim Tjernlund wrote:
> >
> > On Fri, 2012-03-02 at 15:30 +0100, Joakim Tjernlund wrote:
> > > yes, UBI probably has some different use. One seems that it keeps
> > > erasing the
> > > same block over and over again if the erase fails. JFFS2 doesn't do
> > > that since
> > > you can't trust a block that is failing erase(how can you be sure tha=
t
> > > write will work?)
> > > So, IMHO, UBIFS should reconsider this policy.
> >
> > The thread is very long and I would like save my time by not going
> > through it. But if you could start a new thread and formulate the
> > problem with UBI, I could think about it a bit. I am open to change
> > policies if it is not too much work.  Otherwise I am open to give hints
> > and suggestions and accept patches which change the policy. :-)
>=20
> I just noted from one of the logs Paul sent, it LOOKED like UBI tried
> to erase the same sector several times if erase failed, gave me the impre=
ssion
> that UBI would try erasing a failing sector over and over again.
> I think Paul will have to provide details if this is the case or not.

Correct, UBI does retry erasing several times, see function
'do_sync_erase()' in drivers/mtd/ubi/io.c. Why would this be a problem?

--=20
Best Regards,
Artem Bityutskiy

--=-iC4VIVT10+ZoyqwZ8aEQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPX0I4AAoJECmIfjd9wqK0dnQQAJLTV246SHZtvrZf0yvq3yNJ
PdiVbuTj8XrbBfUCXZSz05c+0PgiSWghzElYb+aM36MJl2rcQYgRtcnBtxrD3xFe
r2X4D7i3cmyBKXZAZFaMu0iSes0Vxhi6xqSgUp9yO0ZY1yqoTDgolscl4Os6/SBi
kFqtKXki4AWHnPJTIechJdBUaVw4qKNMjmy11AZjPXjwTtqGEUWY5AOtpG/o/FLO
SOVip5w7Jg1XDme2OYIv/RpHyzn4T/vQhXxo+iVPVSNK+PF2qMvieZz4H9sfRmCw
Hwyl+vPVLZNTSHlHem0mDtmSOeX0kA45fROicczu2DqKDQ0H58Yfss2D0p79ACg4
SFPPV14Mn4vf5iSCP71nqKzGdTnjeDNqQ3ANRx9Gd2CMcPSVUb4BQe+rvRQw5NN2
HUUHO+H+uW1/zUc9Ys7TTo75wYjgGHeuG8TbvshWq5JLsPqJHbhvWMQMQe38Ze79
7IJiBRrN5Trmo3nFTSNFQKdgYCm7JzHMtnyEujeGVPROSgxSqUeJz5wC7Ao+93ZE
ROXirBvQmCcLxTBQuc/76yUGRHsK/+iPej9g3kXi5mrmU8ntQ2oNDIX7C7Vcz6lr
9ABUUsAv9ANWnbgr7JDWtEMIa5BDbpNtJhT76oNuKf4WyOac2B6f9o7C4oQ9+J+L
Nmd3HZH1FW2N6lvTOpcx
=jJ2s
-----END PGP SIGNATURE-----

--=-iC4VIVT10+ZoyqwZ8aEQ--
