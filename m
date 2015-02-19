Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOP9c-00049d-QP
 for linux-mtd@lists.infradead.org; Thu, 19 Feb 2015 11:20:25 +0000
Date: Thu, 19 Feb 2015 12:17:15 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] mtd: pxa3xx-nand: handle PIO in threaded interrupt
Message-ID: <20150219111715.GS25269@lukather>
References: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
 <20150218101646.GO25269@lukather> <87vbiz87j2.fsf@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ctZH5Gqgrl5HoVnD"
Content-Disposition: inline
In-Reply-To: <87vbiz87j2.fsf@free.fr>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ctZH5Gqgrl5HoVnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 06:16:17PM +0100, Robert Jarzmik wrote:
> >> @@ -1672,7 +1688,8 @@ static int alloc_nand_resource(struct platform_d=
evice *pdev)
> >>  	/* initialize all interrupts to be disabled */
> >>  	disable_int(info, NDSR_MASK);
> >> =20
> >> -	ret =3D request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
> >> +	ret =3D request_threaded_irq(irq, pxa3xx_nand_irq,
> >> +				   pxa3xx_nand_irq_thread, 0, pdev->name, info);
> >
> > Using IRQF_ONESHOT would allow you not to do the interrupt enable /
> > disable dance.
>
> Yes, that's a very good point. Would your Tested-by still hold with
> this change ?

Yep, I actually tested it before suggesting it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ctZH5Gqgrl5HoVnD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU5cY7AAoJEBx+YmzsjxAgsXUP/jk43vrBHLy8yKOC6H9HUTBr
TBJxoQYY10+3vzBwACsGQqQy4ETrFr58xaR5d2vtEVqHDl/lOzxp7ToAbox1jApb
khZisJ4vZLbZbxvkrlcnf9jTG6KY3M6kTRrH5hXSwgBHXl4JLR23ODUgfGHlkGyn
4gHENkQ/pSFsXSN8mxwbVIdkIunrz+FY4IRG/U2kDaeYN35ZL3ghStocKbsP+4cU
polcIAxigY5IvSn1+wpx9jNRG3VyA7pZT6yuNusmymV0kcWU6+gqNK35rrs6wp0L
0Vurs+eUPN64t3n8OGPetx0FHqeOTXMBm3eM2I+OqRfqFLQ/eovjPnFKT4GaFW8o
yZSYPj8WCnHSETsJjzXaiIaqkVgtak+1XWz3ib45LfZkGXqtkfYY6iOjIfqM1Q6n
/GjQNiDMmqut8c1SMi+wvo7+Wq2HNjTLPXuiDJOKVAcUqIJl5dbpY+SP7Fx7XoFk
qIQXVfkmYC6b1H8cOAfSb5eh6aw/iew6o4dyOXhZltN1wfQ0LmBBJiHIsHEYFNHa
4MpdDwW6YFxa8aEFjRlaBWydKtmM/9ceAwDqWycT+iJ2OEASBCe76mq0fqaUCPN+
iRevLsULwhHfj2aCCX1kFMiwgs47LfJQbpwcZaxXeAN9fdc6WpFp8tnPHOdh5FrN
ARTGYO+lVYA5dBMsR7/s
=U1Eh
-----END PGP SIGNATURE-----

--ctZH5Gqgrl5HoVnD--
