Date: Fri, 31 Jul 2015 19:17:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@arm.linux.org.uk>,
 Huang Shijie <b32955@freescale.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Message-ID: <20150731181745.GM20873@sirena.org.uk>
References: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
 <1438072876-16338-2-git-send-email-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="00sTfE/IIAT5d2r5"
Content-Disposition: inline
In-Reply-To: <1438072876-16338-2-git-send-email-vigneshr@ti.com>
Subject: Re: [RFC PATCH 1/5] spi: introduce flag for memory mapped read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--00sTfE/IIAT5d2r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2015 at 02:11:12PM +0530, Vignesh R wrote:

> Introduce use_mmap_read field in spi_message struct. This can be set by
> mtd devices (m25p80) to indicate to spi-master (ti-qspi) to perform
> memory mapped read. This helps to distinguish whether the spi-message is
> from mtd layer(hence mmap read is possible) or by other spi devices.

Based on this description and...

> + * @use_mmap_mode: Indicate to spi master to perform memory mapped
> + *	read if possible.

...the internal documentation I unable to tell what is meant by "perform
a memory mapped read", at least to the extent where it is visible
outside of the driver.  This means we can't really use this as a generic
API since other people won't be able to tell what it does.

--00sTfE/IIAT5d2r5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVu7vIAAoJECTWi3JdVIfQfrcH/0pJFX98izm/xHRxCwsEfEd3
J1YH0uS6BbvZ4CEpe6XuitCyh6Fl7YRTq1LRSQ1Gy7drdZSrajyJcgdTNI8CO81L
qDZ2xasU9Fuqo4r/oOozKS1WG8op3jRtpVxAnajm2A0vMqA6YQLdK28F46dggDWQ
opCortabqzzgp/3/fgNSxpPmIeEW+IwO4yGeIvr3Sz05krSdYcTZTmgFSCgfdKVP
m/K4bURA0/J483komR39SeYaVccYkeyvz8jfvlPSK+sIGDc3hMQ4Q7dQqhNIU4ol
Yo+xShyIgcyUTVM3NRTxgYfAWCDgXgPlfCvDUTo3oxsVERcjQBQ8WkuKDLHqatk=
=x6wY
-----END PGP SIGNATURE-----

--00sTfE/IIAT5d2r5--
