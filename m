Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4w91-0002jq-HC
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 15:49:59 +0000
Message-ID: <1345823689.2848.329.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtdpart: break it as soon as we parse out the
 partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 24 Aug 2012 18:54:49 +0300
In-Reply-To: <1345309236-25806-1-git-send-email-shijie8@gmail.com>
References: <1345309236-25806-1-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pRwu/BhiTsiTsY0v+t38"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pRwu/BhiTsiTsY0v+t38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-08-18 at 13:00 -0400, Huang Shijie wrote:
> We may cause a memory leak when the @types has more then one parser.
>=20
> Take the `default_mtd_part_types` for example. The default_mtd_part_types=
 has
> two parsers now: `cmdlinepart` and `ofpart`.
>=20
> Assume the following case:
> The kernel command line sets the partitions like:
> 	#gpmi-nand:20m(boot),20m(kernel),1g(rootfs),-(user)
> But the devicetree file(such as arch/arm/boot/dts/imx28-evk.dts) also set=
s
> the same partitions as the kernel command line does.
>=20
> In the current code, the partitions parsed out by the `ofpart` will
> overwrite the @pparts which has already set by the `cmdlinepart` parser,
> and the the partitions parsed out by the `cmdlinepart` is missed.
> A memory leak occurs.
>=20
> So we should break the code as soon as we parse out the partitions,
> In actually, this patch makes a priority order between the parsers.
> If one parser has already parsed out the partitions successfully,
> it's no need to use another parser anymore.
>=20
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Pushed to l2-mtd.git with "Cc: stable@vger.kernel.org" - do you agree
with that?

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-pRwu/BhiTsiTsY0v+t38
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN6PJAAoJECmIfjd9wqK0iAgQAIeLQqpRVAFIndBs0PK4WlUN
pg4Ytf5aR2iklQS3Y5f5z66TVeSPO+sN5dW+VZU/4LuMECdFE978gvkeduqz8avT
aIs4uU2Xk4Dux2+MX5Ma6LaPtYf0v1Vb0O50OjgKkLaIWMYA+du0of4VBIqC7Kt9
M19tGF5792z4Q8mfoGQwn/iTL0W6N7sR6WvdYvm37PmzJ7zqSlOsRsLbwMXyZRLj
pAsXo3cipPYnHHxb5SB2gJ+QBjAuzJaptp3t5oW/h+tbw5xsSJtns10L7fA7/Lde
ehNIlFEYKaIsNa9/aIdAMSterBbrPX1s+QKkd8yvKRbgFLJVbe3qfEBhzmMRt6gR
mzaWk4kn4Lk9As+AKnw0LtFF36rjE60KPCDP0w2/Nk/646s+2wLjO8rMjZPWSgwL
VQpIcKx0wYQCyjLSFU7GejT06kNq3ByYS78UZ9f6zvrcQoNQcu4h+xvKAo+mtdlM
nWevZrm7qFrc5KwC24wIjizOMw1DoPf5tMhYzs844XcUkajuPNaMvt7jMzSmvwVi
a0++Tofq2bPdeVCmurjxdNiQUo8O2eI5PFadahw7b0uWNGEMQBfaLzFHzw40mgZw
8B5p6IHRu1DFeyHF4WfOtlxTinkwZzphPRFRIVEtpntW/GPvRbTgbE5gw2Wl0IH+
/AQs+gkCXclfjOv4R1u3
=BFG4
-----END PGP SIGNATURE-----

--=-pRwu/BhiTsiTsY0v+t38--
