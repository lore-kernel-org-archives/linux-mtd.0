Message-ID: <1338980335.6875.44.camel@sauron.fi.intel.com>
Subject: RE: [PATCH v10 3/3] MTD: at91: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Wu, Josh" <Josh.wu@atmel.com>
Date: Wed, 06 Jun 2012 13:58:55 +0300
In-Reply-To: <94D61891A2E83846BC68FB50291DC2DD0F68A271@penmbx02>
References: <1338545594-18483-1-git-send-email-josh.wu@atmel.com>
 <1338545594-18483-4-git-send-email-josh.wu@atmel.com>
 <1338901457.2507.53.camel@sauron.fi.intel.com>
 <94D61891A2E83846BC68FB50291DC2DD0F68A271@penmbx02>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ln9cBxpQ/jd4pG97Tgys"
Mime-Version: 1.0
Cc: "hongxu.cn@gmail.com" <hongxu.cn@gmail.com>, "Ferre,
 Nicolas" <Nicolas.FERRE@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ln9cBxpQ/jd4pG97Tgys
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Wed, 2012-06-06 at 03:32 +0000, Wu, Josh wrote:
> > On Fri, 2012-06-01 at 18:13 +0800, Josh Wu wrote:
> >> +       end_time =3D jiffies +
> msecs_to_jiffies(PMECC_MAX_TIMEOUT_MS);
> >> +       while ((pmecc_readl_relaxed(host->ecc, SR) &
> PMECC_SR_BUSY)) {
> >> +               if (unlikely(time_after(jiffies, end_time))) {
> >> +                       dev_err(host->dev, "PMECC: Timeout to get
> ECC
> >> value.\n");
> >> +                       BUG();
> >> +               }
> >> +               cpu_relax();
> >> +       }=20
>=20
> > Sorry, but crashing the kernel is the worst thing to do. You should
> make
> > '->write_page()' allow to return an error code, just like
> > '->read_page()' does.
>=20
> > --=20
> > Best Regards,
> > Artem Bityutskiy
>=20
> I understand crashing kernel here is not good. but I think it makes a
> little sense because if the PMECC status reading is time out (I set a
> very long time duration here), that only means the PMECC configuration
> is not correct.

.. or that means that the hardware has issues, which happens sometimes,
or the driver has bugs, or whatever - there may be a lot of reasons, if
you do not foresee all of them, it does not mean they do not exist. Your
driver should be resilient to that. It should not crash the system but
should return an error.

> In other word, user needs set the PMECC correctly, then the PMECC
> status reading will not meet time out error. Otherwise they will get a
> Time out error.

Is BUG() a time-out error? It is more like "crash the kernel".

> Yes, If the '->write_page()' can return an error code then it should
> be better. But in the 'struct nand_ecc_ctrl', the '->write_page()'
> defined as void function, shows in following,
>         void (*write_page)(struct mtd_info *mtd, struct nand_chip
> *chip, const uint8_t *buf);

I alluded that you should just change this.
>=20
> So change the above definition of '->write_page()' to return a error
> code will impact all other nand ecc code. Such change is out of the
> scope of this patch series. And maybe it also need another discussion.

But this is how opensource works. You are plugging a new driver to the
MTD infrastructure, and the infrastructure is not good enough for you,
probably because previously drivers never failed in '->write_page()'.
And it is your call to first change the infrastructure to fulfill your
needs, and then add the driver.

This happens to many people very often, and you should not get
frustrated, you just need to do a bit more work than you originally
planned.

--=20
Best Regards,
Artem Bityutskiy

--=-ln9cBxpQ/jd4pG97Tgys
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzzfvAAoJECmIfjd9wqK0E+cP/05jq5kOoDHCMQlMlG1lfTB+
rhmveoGonktW5sCJxb8Tz223MGkhaTr02kWwISCKNEwnT3OVqwDe0k5lEkHQhXNU
b9XyU/WxZtBfzK+fUSyU0ejuL4mg/X6hlUgUHXBy+OSRlNP2gHczAdUILe3riM8+
lmtptt+cQcBysdK4HEWG1w1GsNCtYgrkDrFiwla32+hrwkLcoVCqktHMwG9O7frM
4T19qjsPtX28V1JpQoDXesvAiyFVkyLtO4+QHsjE7Y4Mp2tLR7uAP1Nw7HdpFXIB
7M7vAgddJOKwKAn/zrMiXXxV7WqbUi8hfgcZchzLJC6Cw7+SW/x2VfMJl8flDmyR
obWJvq5FD8OMljEPwSvqerUyyrHSBL44H23zh2BP23wcsPujBNteAhhSNdiwELHw
Jn/tyOcIisjfAGw9nu1K3R+XYh62J9QpjKhpFT/DIoOo98OUX2KUugHiLSY8Glka
2Fu7XscXkPE59fHrsReZAOaapLJe32vMjeKN5udKYhGMztAm7N6Lgj18Iouqaai8
3eMDgb9fDDcvrV6l2xpJT4k3QxG237BwXx3nWX01J77NJbur+cyOmPeDXfVg3llp
ibjJ/cxitDdPLpd/Q8V0zzU0+1p4YBlx6UEP9wE5Ndieoeu4QYXm1y+zfdwL3gqA
H4xcI4u4YWd1tTbE3dG7
=7WF2
-----END PGP SIGNATURE-----

--=-ln9cBxpQ/jd4pG97Tgys--
