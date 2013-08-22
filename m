Date: Fri, 23 Aug 2013 00:36:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20130822233611.GA25263@sirena.org.uk>
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <20130822193453.GB10038@ld-irv-0074.broadcom.com>
 <20130822195559.GU26118@sirena.org.uk>
 <201308222229.01778.marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <201308222229.01778.marex@denx.de>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
Cc: devicetree@vger.kernel.org, shawn.guo@linaro.org, b44548@freescale.com,
 dedekind1@gmail.com, b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2013 at 10:29:01PM +0200, Marek Vasut wrote:
> > On Thu, Aug 22, 2013 at 12:34:53PM -0700, Brian Norris wrote:

> > This should be a generic property for all quad devices to use, though,
> > since the same thing applies everywhere.

> Full ACK, "m25p,dual-read" and "m25p,quad-read" sound like a good prop names?

I was actually thinking something more generic than that - putting the
property at the SPI generic bindings level.  Though if all flashes with
this dual/quad read functionality have the prefix m25p the above would
work also, at the minute this does seem to be mostly used by flash (I
bet someone's got some DSPs or something though).

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFqBoAAoJELSic+t+oim9RAYP/il4+prvyn3nlnxK8vhnNWnt
dVcsfMe9AuLey+5FT3Y98ZuChxo99umlfLZyaB0VZtdiruba6vGhF17ZTpk0rR/k
y59uhRHZyRycrUTuoCXdblEiBW2NhWZt+2pc3mhs21h4Uwji8OsY8N60ViAIhhsC
vaWdWhAgn0Dd55K6jIjGSI62qUjioTkQ3aVP+XLMcGRrA+8kFy3nxDzH75aUEc30
H8Ud3w9P2l/3nWx/sdjpz23FvOnMjG+CuJvRMbl8BtMinvOH6/Fus4q2na6oaxSD
pH7kicCpMljNu/alawUzxdJnqO8RVAChfL2GAZq6v31k1CnNxzDXfg0yM1ry+NLH
0URGYZjDXj9Um6i22SdIy7Tw6Vg35p3sg5KQ/zqClqpWiFywQVAZq6FAJZUVFYrM
g6QLrPV22jORdOwQGoRnal6EURLhovel1Gmz+YUfReUWqeNUwqebil7Mvn6jbPca
39RXztERrG8XamzQoIB6isBp95y+mi8ImJSEMCiEkEhVVRL+y3++LE9+wPmF+gn9
Ym+hR4Frqwean6o9+6PmkBpUnxThL1sIZybXgTDaFal0GfWQwgHiJRXqPGugoJu7
Uf6hyHlIziSruJ5/t9BHBhcruoJOloNLjUsVnyMpIoaKe7Hr5TbxRwYE9KQq+Grb
5/w8ZtqWc/FsYMaeSLWY
=9RD7
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
