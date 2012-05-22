Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWmDw-0001OS-0O
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 10:21:52 +0000
Message-ID: <1337682328.2483.144.camel@sauron.fi.intel.com>
Subject: RE: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Johan Gunnarsson <johan.gunnarsson@axis.com>
Date: Tue, 22 May 2012 13:25:28 +0300
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
 <1337673190.2483.115.camel@sauron.fi.intel.com>
 <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ntpuHouMTvAyHkxLQvA7"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jesper Nilsson <jespern@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ntpuHouMTvAyHkxLQvA7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 10:52 +0200, Johan Gunnarsson wrote:
> Not an expert on the MTD framework -- but I believe the 400 comes from
> the comment above nand_wait(): "Wait for command done. This applies to
> erase and program only. Erase can take up to 400ms and program up to
> 20ms according to general NAND and SmartMedia specs."

Most probably this legacy can be killed along with the IPAQ h1910 driver
you pointed. But could you please start with cleaning these functions up
and turning the "!chip->dev_ready()" case into a simple msleep() or
mdelay() for the panic case?

Then I may get some ideas how to get rid of the jiffies without using
hrtimer.

--=20
Best Regards,
Artem Bityutskiy

--=-ntpuHouMTvAyHkxLQvA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu2mYAAoJECmIfjd9wqK0ZJoP/1AZXJbaVQ5oUk4UIXCAJP9J
auWgwpNWpOFM75r12UkH3dgK9Nm5srdZD+u6Y8nYLElxUhmgN/eGotg23PPyl6Vg
XiZAGYD9nJNvE3LJrKfIWR585hH+vLdy/keF4gzWhE3j6rdEff/73Fzb+AOQ6EiK
j63OB4cZJtBf2PoSNGgs2nzWVQxEX9pPlH/xVC1HXYSHMecfwhNH3JwYR5O04Qbc
DUxBgIT1R6Lyeuwyl1pJc/ZQIURdK6IsWI4psDmDiDuOxiGsu1jekkb6ZHUeUNxA
e6cXFUlnO9XWSUrgALXngeWPteMlVQ1NwAefTIpoEDLByYAJC6c6pJJciqCX4+Er
F2C7ABDOqipoXaJ6M4ztU1jCd4FtujXumZv2wvIxdnp5D5K85+bzqQjV55gmYSfT
U2qy7aIU3NE6dFJXRgKeOEnW5n2cOPDrv9K1pGQ/GhnhMfusFCSYrufR5pbKO43e
oVoSz6Xr90pA25U0bA+uk1p1ifYnG/hMeoHkrA6GA8ILdLxWuU8/cFqViXPmNuSp
uaM/hbh2AAyB/Qd7K6sWR3kfJ98lO4YiPxYZVzCGZ106AJ6c6yRuztUWGYC1dJT3
U0+Ms9UW8Xxgl6TSYoM1IqjeS0AFbA1GHF4/j183bMdMqlvLqtnqxlCbrtg8RmU0
0s27O51zkIWBMpg7kmre
=RAbB
-----END PGP SIGNATURE-----

--=-ntpuHouMTvAyHkxLQvA7--
