Received: from natsmtp00.rzone.de ([81.169.145.165])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9mDO-0003Dg-9L
	for linux-mtd@lists.infradead.org; Tue, 21 Sep 2004 11:06:04 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Torben Mathiasen <torben.mathiasen@hp.com>
Date: Tue, 21 Sep 2004 17:03:46 +0200
References: <C50AB9511EE59B49B2A503CB7AE1ABD108F82153@cceexc19.americas.cpqcorp.net>
	<1095580254.5065.172.camel@localhost.localdomain>
	<20040921092356.GD4055@linux>
In-Reply-To: <20040921092356.GD4055@linux>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_TLEUBF5F515ZQer";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200409211703.47188.arnd@arndb.de>
Cc: Andrew Morton <akpm@osdl.org>,
	Christian Borntraeger <linux-kernel@borntraeger.net>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Torben Mathiasen <device@lanana.org>,
	David Woodhouse <dwmw2@infradead.org>, "Cagle, John" <john.cagle@hp.com>
Subject: Re: [Patch][RFC] conflicting device major numbers in devices.txt
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-02=_TLEUBF5F515ZQer
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Dienstag, 21. September 2004 11:23, Torben Mathiasen wrote:
> s/390 dasd moved to major 94.
> s/390 VM/ESA moved to major 95.
> INFTL moved to major 96.

Actually, major 95 has never been used for VM minidisks or any other
s390 block device in any 2.4 or 2.6 based distribution, because that
driver was integrated into the dasd driver (it just uses a different
access method on the same devices). You might want to document that
this number is currently unused, even if it doesn't get assigned to
any other driver.

	Arnd <><

--Boundary-02=_TLEUBF5F515ZQer
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBUELT5t5GS2LDRf4RAscdAJ9oPSOir2My40I5vIgrpaA/ffMmzACff7Rp
rX/b6IL5Exd6VtjfjrkJml0=
=oa36
-----END PGP SIGNATURE-----

--Boundary-02=_TLEUBF5F515ZQer--
