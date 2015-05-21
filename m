Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvNiz-00027Q-LG
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 10:29:14 +0000
Date: Thu, 21 May 2015 11:28:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Message-ID: <20150521102802.GS21577@sirena.org.uk>
References: <cover.1430403750.git.hramrach@gmail.com>
 <50c40ef17ab6566f35ef5a4426bf23567f896db7.1430403750.git.hramrach@gmail.com>
 <20150520233835.GX11598@ld-irv-0074>
 <CAOMqctTYqDWL51twOuGi+oXONXQ4B2-2BkdJNSpzZAXshZUN6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oJFDFiWc3BlD0xT/"
Content-Disposition: inline
In-Reply-To: <CAOMqctTYqDWL51twOuGi+oXONXQ4B2-2BkdJNSpzZAXshZUN6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] MTD: spi-nor: check for short writes in spi_nor_write.
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 devicetree <devicetree@vger.kernel.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--oJFDFiWc3BlD0xT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2015 at 10:39:13AM +0200, Michal Suchanek wrote:
> On 21 May 2015 at 01:38, Brian Norris <computersforpeace@gmail.com> wrote:

Why is this thread about SPI error handling CCed to quite so many
people?

> >> Check the amount of data actually written by the driver.

> > I'm not sure if we should just reactively use the retlen, or if we
> > should be communicating such a limitation via the SPI API. Thoughts?

> Is there any driver that would break if the SPI master truncated
> writes when the message is too long rather than returning an error an
> refusing the transfer?

Any such driver is buggy, the actual length transferred has always been
a part of the SPI API.  We should probably expose limitations so clients
can query in advance (we don't at the minute) but it'd be a while before
clients could rely on that information being useful and it's still
possible things can be truncated by error.

With modern drivers using transfer_one() where we have control of the
chip select we do also have the ability to add support to the core for
chopping large transfers up into smaller ones that the hardware can
handle transparently.  That won't for everything though since it depends
on us being able to manually control the chip select which not all
hardware can do.

--oJFDFiWc3BlD0xT/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXbMxAAoJECTWi3JdVIfQckgH/3UcOz8dIAPvrx7v+/sValdq
GzoPHmzNZdEr1GfUxMUXcQwlzMSfw1SkuCqMfWn0N8Y/iaZ2RKqiDLRHGiZlqRVi
P/W6wQuBj3eJ/OC8ykC3fLlqrh0F/L4WaJDFtqYMv4wNlrf2gwhJnGbNi9CkDrWY
t07hORcvdoRWUtizOminZpx3cm4wIS1jbMiD7RD5YhMwS0ZAnci9PYaPf8/uJzvb
LPkB/CU8KiBvAPmrRNdWg+U7lDepMsaPZg+KhdXd5Qgzx++TdviJWG4fC0HFG50O
9z2RgJ9Q9JuEYLrPcwLpyWguwukzZ2W5NfXMX16C55oMBnNRlvxyrVvVoKlZL8c=
=bbmv
-----END PGP SIGNATURE-----

--oJFDFiWc3BlD0xT/--
