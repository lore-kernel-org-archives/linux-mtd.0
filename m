Received: from acsinet15.oracle.com ([141.146.126.227])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTWam-000065-HW
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 10:31:45 +0000
Date: Thu, 24 Nov 2011 13:31:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
Message-ID: <20111124103147.GF3195@mwanda>
References: <20111124072117.GC14122@elgon.mountain>
 <87pqghygbv.fsf@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline
In-Reply-To: <87pqghygbv.fsf@free.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 11:17:56AM +0100, Robert Jarzmik wrote:
> >  	if (!found)
> > @@ -1138,9 +1141,11 @@ notfound:
> >  	ret =3D -ENODEV;
> >  	dev_info(dev, "No supported DiskOnChip found\n");
> >  err_probe:
> > -	for (floor =3D 0; floor < DOC_MAX_NBFLOORS; floor++)
> > +	for (floor =3D 0; floor < DOC_MAX_NBFLOORS; floor++) {
> >  		if (docg3_floors[floor])
> >  			doc_release_device(docg3_floors[floor]);
> > +	}
> > +	kfree(docg3_floors);
> This is in conflict. Could you drop that hunk and wait for the other patc=
h to go
> upstream ? Or alternatively use the whole serie in [2] as your base ?
> I think some patches of the serie didn't make it in the tree you're
> using.
>=20

I'm on linux-next.  They're all going to hit linux next soon right?
I can redo the patch later in that case.

regards,
dan carpenter


--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOzh0SAAoJEOnZkXI/YHqRvSwQAKTZx5D9YlOcu5o29ZzfaBaN
vyHKY4PesVGUzLvaFr1LXpn3HgtRlMWoVHlXE0lHUklDmNp//HF+XvDU/UKnpPVs
EPw5ALPS9ZSxN7KzEtEF8LviHiYBsOjPYmFPgrAutz/S/WxnBCneyyqtzo/TAyVK
xad4RwFn9hZ74sfEQOEMlm7sFlbNluGNRAVFSZrvcDV2vLeBkJCBjAieMzO6Xzru
zkWWHpWylUIYPiJO5Nxw/5teWsivJjOFRchnn6ExzGwoobMR0q9KYW3JbonXHpyF
/2ND/EoB/4KbS60oyabWLSa3WSNeMDkbZdjGAW49TtfN7WwpsCD7eTcj2iHGf1Ix
VcSqQTOH10UGkckkJsa6Gb8sygFlzeMKyxCfyNA591MvVCnZeKsThI1OpC634Lq4
N2Oc1yvwmhtO9nNaLIUqvorZFHz0RJHFgKsLljS9UzXQDKjo8WmJnHwubdPokKf1
rqDIhFDA6aXqGWYnnDFeuprjabPsIZQ6/6s9caM8Jwql60pqVwWDdRhPB+3azQoP
TKdMLKHXHkMLB/8dSBp6/CvvucjxzrDNEZxCDFAlTtNmv06djJ8ME4Sfe6Xj4k7V
MG6oRMgIhP6U5obOPUIs5Y9KEZh3kQRaJLby+oQBkhfezEoYyL/37Lv6J1QBYGJY
aiX/szXA4i6hS3uC/NVa
=E5ZY
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--
