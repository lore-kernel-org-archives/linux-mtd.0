Received: from mail.sf-mail.de ([62.27.20.61])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GPZTu-00027P-9S
	for linux-mtd@lists.infradead.org; Tue, 19 Sep 2006 07:53:23 +0100
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [PATCH 4/4] pmc551 pci cleanup
Date: Tue, 19 Sep 2006 08:50:15 +0200
References: <91292449121291221@karneval.cz>
In-Reply-To: <91292449121291221@karneval.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2135272.YWNQ9TQiSA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200609190850.20778.eike-kernel@sf-tec.de>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mark Ferrell <mferrell@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2135272.YWNQ9TQiSA
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Dienstag, 19. September 2006 00:47 schrieb Jiri Slaby:
> pmc551 pci cleanup
>
> use pci_get_device -- refcounting, release it by pci_dev_put. Use
> pci_resource_start for getting start of regions.
>
> Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
>
> ---
> commit 6fe18c54c93d38eec34ca0776da60fc355968f6b
> tree 5bf3cf8fe213de770c7c7a1279eafb3937f4c386
> parent 912ff3e53f760cb166988fcd46fc173f8e4c22e7
> author Jiri Slaby <xslaby@anemoi.localdomain> Tue, 19 Sep 2006 00:39:08
> +0200 committer Jiri Slaby <xslaby@anemoi.localdomain> Tue, 19 Sep 2006
> 00:39:08 +0200

You should change your .git/config and add a user section to get the mail=20
address correct I think.

>  drivers/mtd/devices/pmc551.c |   21 +++++++++++++--------
>  1 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
> index 5f5de9c..d1ba4b9 100644
> --- a/drivers/mtd/devices/pmc551.c
> +++ b/drivers/mtd/devices/pmc551.c
> @@ -563,7 +563,7 @@ #ifdef CONFIG_MTD_PMC551_DEBUG
>  		size >> 10 : size >> 20,
>  		(size < 1024) ? 'B' : (size < 1048576) ? 'K' : 'M', size,
>  		((dcmd & (0x1 << 3)) =3D=3D 0) ? "non-" : "",
> -		(unsigned long long)((dev->resource[0].start) &
> +		(unsigned long long)(pci_resource_start(dev, 0) &
>  				    PCI_BASE_ADDRESS_MEM_MASK));
>
>  	/*

The last part is unneeded in both versions, when resource[n].start is set t=
he=20
PCI core already does the masking.

> @@ -755,14 +758,14 @@ static int __init init_pmc551(void)
>  				"size %dM\n", asize >> 20);
>  			priv->asize =3D asize;
>  		}
> -		priv->start =3D ioremap(((PCI_Device->resource[0].start)
> -					& PCI_BASE_ADDRESS_MEM_MASK),
> -				      priv->asize);
> +		priv->start =3D ioremap(pci_resource_start(PCI_Device, 0) &
> +				PCI_BASE_ADDRESS_MEM_MASK, priv->asize);

pci_iomap(PCI_Device, 0, priv->asize);

Eike

--nextPart2135272.YWNQ9TQiSA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBFD5MsXKSJPmm5/E4RAtNsAJ9Pq/lJ+fzcCDqZxlJWSf4PFLV67gCgidwZ
iF3+wiVTfv0cCmqrfLRIk/E=
=k4im
-----END PGP SIGNATURE-----

--nextPart2135272.YWNQ9TQiSA--
