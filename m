Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckn0u-0000T9-OT
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 07:25:03 +0000
Date: Mon, 6 Mar 2017 09:24:54 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Marcel Selhorst <tpmdd@selhorst.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Olof Johansson <olof@lixom.net>, Doug Ledford <dledford@redhat.com>,
 Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Haggai Eran <haggaie@mellanox.com>,
 Parav Pandit <pandit.parav@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alexandre.bounine@idt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Boaz Harrosh <ooo@electrozaur.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, rtc-linux@googlegroups.com,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/16] IB/ucm: utilize new cdev_device_add helper
 function
Message-ID: <20170306072454.GO14379@mtr-leonro.local>
References: <1488783873-2614-1-git-send-email-logang@deltatee.com>
 <1488783873-2614-9-git-send-email-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zl+NncWK+U5aSfTo"
Content-Disposition: inline
In-Reply-To: <1488783873-2614-9-git-send-email-logang@deltatee.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Zl+NncWK+U5aSfTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 06, 2017 at 12:04:24AM -0700, Logan Gunthorpe wrote:
> From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
>
> The use after free is not triggerable here because the cdev holds
> the module lock and the only device_unregister is only triggered by
> module unload, however make the change for consistency.
>
> To make this work the cdev_del needs to move out of the struct device
> release function.
>
> This cleans up the error path significantly and thus also fixes a minor
> bug where the devnum would not be released if cdev_add failed.
>
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>

--Zl+NncWK+U5aSfTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAli9DsUACgkQ5GN7iDZy
WKfeDA/+LWy91DyEkMjdR+KX3aTKX/G4GD0Db7Md9hfiApMfYgs799aMb8HDklRv
63PSzGFLFG8xxUDl10DgzDj9xK2+6e7m4X9E6G6fISQlQuRhuKmKk4YO0Dtl0H+Z
Mh7jEAWxQkwwyl1DM2R9BA5ObKDC0LENpGYfFnWZRYCQaQt5GE+bulio8YLprVTM
qb30tmhpUVRTcAvLfJsvGo7V6qO7GZGi2WlaXiCjBuZFcv5yXUND1z2LeTSZAkrn
hmqZslp/akY0zbqoo98/W3tBa3qtKC2TrYQtqWZOyD7VlrcZ/5HL4kGg+hF1tKEJ
6i8UXtRGL7/IiXDN+C1GEq1IApRSG/2lxbrNWNlCJrYPGfH3jgMSSkGbqesLtazR
d3cjUTVRAHtyMcCn2jhlBx7d36Lz86X3+7U8j8k/pQ7txOPFb4U/f1PK2WStf/Kt
2MtsHSQwUddwPlngEAfiUMz1TyUUnYdunoN7kEMx78QOTh7lJs80GRpWkuyadS+p
U275++T5UELgev2l6GLEqNbaAsaS94ES2BRMS5zxZEV+XOTQraqkv/Xir1Cp+LB9
Q6nqcjVFyH2xyywBm5mOfQZzbWStqiOLWvT6SrDKkYtYAJD0yXgHsaNrLo2e67sL
5BFyBpa5YoCqAelTgeVLFx+xFLyH3wYC+qChrDNbrwOE+8Fm7vY=
=O0p7
-----END PGP SIGNATURE-----

--Zl+NncWK+U5aSfTo--
