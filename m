Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LsspV-0000lS-V2
	for linux-mtd@lists.infradead.org; Sun, 12 Apr 2009 06:06:17 +0000
Received: by yx-out-1718.google.com with SMTP id 34so1079654yxf.72
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Apr 2009 23:06:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1239093583-12201-1-git-send-email-sr@denx.de>
References: <1239093583-12201-1-git-send-email-sr@denx.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sun, 12 Apr 2009 00:05:53 -0600
Message-ID: <fa686aa40904112305s4bb77501nf53f201ef3bb6d15@mail.gmail.com>
Subject: Re: [PATCH 4/4 v2] mtd/powerpc: Describe multiple "reg" tuples usage
To: Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 7, 2009 at 2:39 AM, Stefan Roese <sr@denx.de> wrote:
> Signed-off-by: Stefan Roese <sr@denx.de>
> CC: Grant Likely <grant.likely@secretlab.ca>
> ---
> =A0Documentation/powerpc/dts-bindings/mtd-physmap.txt | =A0 20 ++++++++++=
+++++++++-
> =A01 files changed, 19 insertions(+), 1 deletions(-)
>
> diff --git a/Documentation/powerpc/dts-bindings/mtd-physmap.txt b/Documen=
tation/powerpc/dts-bindings/mtd-physmap.txt
> index ab1115e..a3fa9e0 100644
> --- a/Documentation/powerpc/dts-bindings/mtd-physmap.txt
> +++ b/Documentation/powerpc/dts-bindings/mtd-physmap.txt
> @@ -5,7 +5,10 @@ file systems on embedded devices.
>
> =A0- compatible : should contain the specific model of flash chip(s)
> =A0 =A0used, if known, followed by either "cfi-flash" or "jedec-flash"
> - - reg : Address range of the flash chip
> + - reg : Address range(s) of the flash chip(s)
> + =A0 It's possible to (optionally) define multiple "reg" tuples so that =
the
> + =A0 Intel P30 48F4400 chip which consists internally of 2 non-identical
> + =A0 NOR chips on one die can also be supported.

This isn't a P30 48F4400 specific feature, even if it is the only
current user.  This description works for any arrangement of multiple
NOR chips.  I isn't really appropriate to mention the P30 in this way
and it should be more generic.

> =A0- bank-width : Width (in bytes) of the flash bank. =A0Equal to the
> =A0 =A0device width times the number of interleaved chips.
> =A0- #address-cells, #size-cells : Must be present if the flash has
> @@ -58,3 +61,18 @@ Example:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0read-only;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> +
> +Here an example with multiple "reg" tuples (e.g. Intel P30):

However, it is completely appropriate to mention P30 here because it
is in the context of an example.

> +
> + =A0 =A0 =A0 flash@f0000000,0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cfi-flash";

For best practice, compatible should also specify the exact chip in this ca=
se.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
