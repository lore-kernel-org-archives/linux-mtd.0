Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV0wr-00081r-R0
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 16:54:34 +0000
Date: Mon, 9 Mar 2015 11:52:42 -0500
From: Felipe Balbi <balbi@ti.com>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: [PATCH v2] Remove deprecated IRQF_DISABLED flag entirely
Message-ID: <20150309165242.GK3739@saruman.tx.rr.com>
Reply-To: <balbi@ti.com>
References: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
 <1425565425-12604-1-git-send-email-valentinrothberg@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="GeONROBiaq1zPAtT"
Content-Disposition: inline
In-Reply-To: <1425565425-12604-1-git-send-email-valentinrothberg@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, linux-mips@linux-mips.org,
 Jiri Kosina <jkosina@suse.cz>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Huacai Chen <chenhc@lemote.com>, Christoph Hellwig <hch@lst.de>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 Quentin Lambert <lambert.quentin@gmail.com>, Ewan Milne <emilne@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Felipe Balbi <balbi@ti.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Afzal Mohammed <afzal@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Eyal Perry <eyalpe@mellanox.com>, Hannes Reinecke <hare@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Bolle <pebolle@tiscali.nl>,
 Keerthy <j-keerthy@ti.com>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, akpm@linux-foundation.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--GeONROBiaq1zPAtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 05, 2015 at 03:23:08PM +0100, Valentin Rothberg wrote:
> The IRQF_DISABLED is a NOOP and has been scheduled for removal since
> Linux v2.6.36 by commit 6932bf37bed4 ("genirq: Remove IRQF_DISABLED from
> core code").
>=20
> According to commit e58aa3d2d0cc ("genirq: Run irq handlers with
> interrupts disabled") running IRQ handlers with interrupts enabled can
> cause stack overflows when the interrupt line of the issuing device is
> still active.
>=20
> This patch ends the grace period for IRQF_DISABLED (i.e., SA_INTERRUPT
> in older versions of Linux) and removes the definition and all remaining
> usages of this flag.
>=20
> Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>
> ---
> The bigger hunk in Documentation/scsi/ncr53c8xx.txt is removed entirely
> as IRQF_DISABLED is gone now; the usage in older kernel versions
> (including the old SA_INTERRUPT flag) should be discouraged.  The
> trouble of using IRQF_SHARED is a general problem and not specific to
> any driver.
>=20
> I left the reference in Documentation/PCI/MSI-HOWTO.txt untouched since
> it has already been removed in linux-next by commit b0e1ee8e1405
> ("MSI-HOWTO.txt: remove reference on IRQF_DISABLED").
>=20
> All remaining references are changelogs that I suggest to keep.
>=20
> Changelog
>=20
> v2: Correct previous change to drivers/mtd/nand/hisi504_nand.c that
> broke compilation.  Reported by Dan Carpenter.
> ---
>  drivers/usb/isp1760/isp1760-core.c   |  3 +--
>  drivers/usb/isp1760/isp1760-udc.c    |  4 ++--

I have a commit in my tree for isp1760:

https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=3Dtest=
ing/fixes&id=3D80b4a0f8feeb6ee7fa4430a2b4ae1155ed923bd2

--=20
balbi

--GeONROBiaq1zPAtT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/c/aAAoJEIaOsuA1yqRE1ZgQAJaOk/fZlreUft6tbD48x3FY
Q6TS7GLTuHQ5F0CUAevUXllXQ5z/cB4tI8F4sZbF4G8rJaAGPtaF6ehBtumXY63o
b9ti3QlAmBGP/cf6HU0SULcgLTJ5ghhNcgaGCdel7iq9jEZOVF4s/jXP4GSB0TME
Ma05sczk7VOzRmPEOsVhGBYLJr4NNZQKOhxk9fYzp6PdeE2Rjq5de/gyKyenrCcX
ly1L4poMqfUC9H1R0SayLnz+4a/4KbhoATZrt5C/+UWaoF13ycsRUP9uZ8Z4DCRG
6MOi3pXUVrnmIoCB3b2SySGDFcX0RgYuB/m5wmBXn4FyxjhBPimIsxa7Z+EWjUXW
G1KflmXYDgw7aXcFy2s5CymnzLkJgAzTg68qpkJoGK45aq5iTxMuuNMU24bOlkZz
7VJSOFQgaQmq0EuilLQNvpJmXz5m6vDsJzhO5B/oEN8vL4uAJFohqEQii/oj2ro9
xC/9GFeFYJWFAXQCi6wo8tkr52TCqoykeoCI2C7jtQvLpXrMt1BHMXEvY56/QEDU
ij22tExXr7r3HUxfHZahzus3G2auAARoBbwreutV2wykO8maXSEJf44jRqSL6fYm
+sPmKuFn0KcNL7EHg3dTXkOi7NTeFgPxMHpm63hm0ZP3wFiZRxIW9FzobBnPoOHS
b+5RKJz0meOSuRiagNlq
=4Qmw
-----END PGP SIGNATURE-----

--GeONROBiaq1zPAtT--
