Received: from mail-gx0-f216.google.com ([209.85.217.216])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCybY-0001T2-EI
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 16:18:57 +0000
Received: by gxk12 with SMTP id 12so3869gxk.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 06 Jun 2009 09:18:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sat, 6 Jun 2009 10:05:41 -0600
Message-ID: <fa686aa40906060905y1d39dce1j87d993ceb94273be@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: devicetree-discuss@ozlabs.org, albrecht.dress@arcor.de,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ben Dooks <ben-linux@fluff.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 5, 2009 at 6:05 AM, Wolfram Sang<w.sang@pengutronix.de> wrote:
> diff --git a/Documentation/powerpc/dts-bindings/mtd-ram.txt b/Documentati=
on/powerpc/dts-bindings/mtd-ram.txt
> new file mode 100644
> index 0000000..a2e9932
> --- /dev/null
> +++ b/Documentation/powerpc/dts-bindings/mtd-ram.txt
> @@ -0,0 +1,18 @@
> +RAM emulating an MTD
> +
> +An external RAM like SRAM or FRAM can also be treated as an MTD.
> +
> + - compatible : should contain the specific model of the RAM chip
> + =A0 used, if known, followed by "mtd-ram".
> + - reg : Address range of the RAM chip
> + - bank-width : Width (in bytes) of the RAM bank.

Question: why is bank-width even relevant for a RAM device?

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
